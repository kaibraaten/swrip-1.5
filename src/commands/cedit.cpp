#include "mud.hpp"
#include "character.hpp"
#include "command.hpp"

/*
 * Command editor/displayer/save/delete                         -Thoric
 */
void do_cedit( Character *ch, char *argument )
{
  Command *command;
  char commandName[1024];
  char arg2[MAX_INPUT_LENGTH];

  SmashTilde( argument );
  argument = OneArgument( argument, commandName );
  argument = OneArgument( argument, arg2 );

  SetCharacterColor( AT_IMMORT, ch );

  if ( IsNullOrEmpty( commandName ) )
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

  command = GetCommand( commandName );

  if ( GetTrustLevel(ch) > LEVEL_SUB_IMPLEM && !StrCmp( arg2, "create" ) )
    {
      if ( command )
        {
          ch->Echo( "That command already exists!\r\n" );
          return;
        }

      command = AllocateCommand();
      command->Name = CopyString( commandName );
      command->Level = GetTrustLevel(ch);

      if ( *argument )
        OneArgument(argument, arg2);
      else
        sprintf( arg2, "do_%s", ToLower(commandName).c_str() );

      command->Function = GetSkillFunction( arg2 );
      AddCommand( command );
      ch->Echo( "Command added.\r\n" );

      if ( command->Function == skill_notfound )
        {
          ch->Echo( "Code %s not found. Set to no code.\r\n", arg2 );
          command->FunctionName = CopyString( "" );
        }
      else
        {
          command->FunctionName = CopyString( arg2 );
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

  if ( IsNullOrEmpty(arg2) || !StrCmp( arg2, "show" ) )
    {
      ch->Echo( "Command:  %s\r\nLevel:    %d\r\nPosition: %s\r\nLog:      %s\r\nCode:     %s\r\n",
                command->Name, command->Level,
                PositionName[command->Position], CmdLogName[command->Log],
                command->FunctionName);

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
      CmdFun *fun = GetSkillFunction( argument );

      if ( StringPrefix( "do_", argument ) || fun == skill_notfound )
        {
	  ch->Echo( "Code not found.\r\n" );
          return;
        }

      command->Function = fun;
      FreeMemory( command->FunctionName );
      command->FunctionName = CopyString( argument );
      ch->Echo( "Done.\r\n" );
      return;
    }

  if ( !StrCmp( arg2, "level" ) )
    {
      int level = atoi( argument );

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
      int log_type = 0;

      if( IsNullOrEmpty( argument ) )
	{
	  int i = 0;
	  ch->Echo( "Supply a log type from the following list:\r\n" );

	  for( i = 0; i < MAX_LOG; ++i )
	    {
	      ch->Echo( "  %s\r\n", CmdLogName[i] );
	    }

	  return;
	}

      log_type = GetCmdLog( argument );

      if ( log_type < 0 )
        {
          ch->Echo( "Unknown log type.\r\n" );
          return;
        }

      ch->Echo( "Log type for %s changed from %s",
                command->Name, CmdLogName[command->Log] );
      command->Log = log_type;
      ch->Echo( " to %s.\r\n", CmdLogName[command->Log] );
      ch->Echo( "Done.\r\n" );
      return;
    }

  if ( !StrCmp( arg2, "position" ) )
    {
      PositionType position = 0;

      if( IsNullOrEmpty( argument ) )
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
                command->Name, PositionName[command->Position] );
      command->Position = position;
      ch->Echo( " to %s.\r\n", PositionName[command->Position] );
      ch->Echo( "Done.\r\n" );
      return;
    }

  if ( !StrCmp( arg2, "name" ) )
    {
      OneArgument( argument, commandName );

      if ( IsNullOrEmpty( commandName ) )
        {
          ch->Echo( "Cannot clear name field!\r\n" );
          return;
        }

      if ( command->Name != NULL )
        FreeMemory( command->Name );

      command->Name = CopyString( commandName );

      ch->Echo( "Done.\r\n" );
      return;
    }

  /* display usage message */
  do_cedit( ch, "" );
}

