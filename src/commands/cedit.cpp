#include "mud.hpp"
#include "character.hpp"
#include "command.hpp"

/*
 * Command editor/displayer/save/delete                         -Thoric
 */
void do_cedit( std::shared_ptr<Character> ch, std::string argument )
{
    Command *command = nullptr;
    std::string commandName;
    std::string arg2;

    SmashTilde( argument );
    argument = OneArgument( argument, commandName );
    argument = OneArgument( argument, arg2 );

    SetCharacterColor( AT_IMMORT, ch );

    if ( commandName.empty() )
    {
        ch->Echo( "Syntax: cedit save\r\n" );

        if ( GetTrustLevel(ch) > LEVEL_SUB_IMPLEM )
        {
            ch->Echo( "Syntax: cedit <command> create [code]\r\n" );
            ch->Echo( "Syntax: cedit <command> delete\r\n" );
            ch->Echo( "Syntax: cedit <command> show\r\n" );
            ch->Echo( "Syntax: cedit <command> [field]\r\n" );
            ch->Echo( "\r\nField being one of:\r\n" );
            ch->Echo( "  level position log code\r\n" );
        }

        return;
    }

    if ( GetTrustLevel(ch) > LEVEL_GREATER && !StrCmp( commandName, "save" ) )
    {
        SaveCommands();
        ch->Echo( "Saved.\r\n" );
        return;
    }

    command = GetCommand(commandName, false);

    if ( GetTrustLevel(ch) > LEVEL_SUB_IMPLEM && !StrCmp( arg2, "create" ) )
    {
        if ( command )
        {
            ch->Echo( "That command already exists!\r\n" );
            return;
        }

        command = AllocateCommand();
        command->Name = commandName;
        command->Level = GetTrustLevel(ch);

        if ( !argument.empty() )
            OneArgument(argument, arg2);
        else
            arg2 = "do_" + ToLower(commandName);

        command->Function = GetSkillFunction( arg2 );
        AddCommand( command );
        ch->Echo( "Command added.\r\n" );

        const auto funptr = command->Function.target<void(*)(std::shared_ptr<Character>, std::string)>();
        
        if (funptr == nullptr || *funptr == skill_notfound )
        {
            ch->Echo( "Code %s not found. Set to no code.\r\n", arg2.c_str() );
            command->FunctionName.erase();
        }
        else
        {
            command->FunctionName = arg2;
        }

        return;
    }

    if ( !command )
    {
        ch->Echo( "Command not found.\r\n" );
        return;
    }
    else if ( command->Level > GetTrustLevel(ch) )
    {
        ch->Echo( "You cannot touch this command.\r\n" );
        return;
    }

    if ( arg2.empty() || !StrCmp( arg2, "show" ) )
    {
        ch->Echo( "Command:  %s\r\nLevel:    %d\r\nPosition: %s\r\nLog:      %s\r\nCode:     %s\r\n",
                  command->Name.c_str(), command->Level,
                  PositionName[command->Position], CmdLogName[(int)command->Log],
                  command->FunctionName.c_str());

        if ( command->UseRec->NumberOfTimesUsed )
            SendTimer(command->UseRec, ch);

        return;
    }

    if ( GetTrustLevel(ch) <= LEVEL_SUB_IMPLEM )
    {
        do_cedit( ch, "" );
        return;
    }

    if ( !StrCmp( arg2, "delete" ) )
    {
        RemoveCommand( command );
        FreeCommand( command );
        ch->Echo( "Deleted.\r\n" );
        return;
    }

    if ( !StrCmp( arg2, "code" ) )
    {
        auto fun = GetSkillFunction( argument );
        const auto funptr = fun.target<void(*)(std::shared_ptr<Character>, std::string)>();
        
        if ( StringPrefix( "do_", argument )
             || funptr == nullptr || *funptr == skill_notfound )
        {
            ch->Echo( "Code not found.\r\n" );
            return;
        }

        command->Function = fun;
        command->FunctionName = argument;
        ch->Echo( "Done.\r\n" );
        return;
    }

    if ( !StrCmp( arg2, "level" ) )
    {
        int level = strtol( argument.c_str(), nullptr, 10 );

        if ( level < 0 || level > GetTrustLevel(ch) )
        {
            ch->Echo( "Level out of range.\r\n" );
            return;
        }

        command->Level = level;
        ch->Echo( "Done.\r\n" );
        return;
    }

    if ( !StrCmp( arg2, "log" ) )
    {
        LogType log_type = LogType::Normal;

        if( argument.empty() )
        {
            ch->Echo( "Supply a log type from the following list:\r\n" );

            for(int i = 0; i < (int)LogType::Max; ++i)
            {
                ch->Echo( "  %s\r\n", CmdLogName[i] );
            }

            return;
        }

        log_type = GetCmdLog( argument );

        if ( log_type == LogType::Max)
        {
            ch->Echo( "Unknown log type.\r\n" );
            return;
        }

        ch->Echo( "Log type for %s changed from %s",
                  command->Name.c_str(), CmdLogName[(int)command->Log] );
        command->Log = log_type;
        ch->Echo( " to %s.\r\n", CmdLogName[(int)command->Log] );
        ch->Echo( "Done.\r\n" );
        return;
    }

    if ( !StrCmp( arg2, "position" ) )
    {
        PositionType position = 0;

        if( argument.empty() )
        {
            ch->Echo( "Supply a position from the following list:\r\n" );

            for( int i = 0; i < MAX_POSITION; ++i )
            {
                ch->Echo( "  %s\r\n", PositionName[i] );
            }

            return;
        }

        position = GetPosition( argument );

        if ( position < 0 )
        {
            ch->Echo( "Unknown position.\r\n" );
            return;
        }

        ch->Echo( "Minimum position for %s changed from %s",
                  command->Name.c_str(), PositionName[command->Position] );
        command->Position = position;
        ch->Echo( " to %s.\r\n", PositionName[command->Position] );
        ch->Echo( "Done.\r\n" );
        return;
    }

    if ( !StrCmp( arg2, "name" ) )
    {
        OneArgument( argument, commandName );

        if ( commandName.empty() )
        {
            ch->Echo( "Cannot clear name field!\r\n" );
            return;
        }

        command->Name = commandName;

        ch->Echo( "Done.\r\n" );
        return;
    }

    /* display usage message */
    do_cedit( ch, "" );
}
