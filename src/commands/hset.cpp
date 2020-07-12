#include "mud.hpp"
#include "help.hpp"
#include "log.hpp"
#include "character.hpp"
#include "repos/helprepository.hpp"

void do_hset( std::shared_ptr<Character> ch, std::string argument )
{
    std::shared_ptr<HelpFile> pHelp;
    std::string arg1;
    std::string arg2;

    SmashTilde( argument );
    argument = OneArgument( argument, arg1 );

    if ( arg1.empty() )
    {
        ch->Echo("Syntax: hset <field> [value] [help page]\r\n");
        ch->Echo("\r\n");
        ch->Echo("Field being one of:\r\n");
        ch->Echo("  level keyword remove save\r\n");
        return;
    }

    if ( !StrCmp( arg1, "save" ) )
    {
        Log->LogStringPlus( "Saving help files.", LogType::Normal, LEVEL_GREATER );
        HelpFiles->Save();
        ch->Echo("Saved.\r\n");
        return;
    }

    if ( StrCmp( arg1, "remove" ) )
    {
        argument = OneArgument( argument, arg2 );
    }

    pHelp = GetHelpFile( ch, argument );

    if ( !pHelp )
    {
        ch->Echo("Cannot find help on that subject.\r\n");
        return;
    }

    if ( !StrCmp( arg1, "remove" ) )
    {
        HelpFiles->Remove(pHelp);
        ch->Echo("Removed.\r\n");
        return;
    }

    if ( !StrCmp( arg1, "level" ) )
    {
        SetHelpFileLevel( pHelp, ToLong( arg2 ) );
        ch->Echo("Done.\r\n");
        return;
    }

    if ( !StrCmp( arg1, "keyword" ) )
    {
        SetHelpFileKeyword( pHelp, arg2 );
        ch->Echo("Done.\r\n");
        return;
    }

    do_hset( ch, "" );
}
