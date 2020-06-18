#include "character.hpp"
#include "mud.hpp"
#include "social.hpp"
#include "repos/socialrepository.hpp"

/*
 * Social editor/displayer/save/delete                          -Thoric
 */
void do_sedit( std::shared_ptr<Character> ch, std::string argument )
{
  std::shared_ptr<Social> social;
  std::string arg1;
  std::string arg2;

  SmashTilde( argument );
  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  SetCharacterColor( AT_SOCIAL, ch );

  if ( arg1.empty() )
    {
      ch->Echo("Syntax: sedit <social> [field]\r\n");
      ch->Echo("Syntax: sedit <social> create\r\n");

      if ( GetTrustLevel(ch) > LEVEL_GREATER )
        ch->Echo("Syntax: sedit <social> delete\r\n");

      if ( GetTrustLevel(ch) > LEVEL_CREATOR )
        ch->Echo("Syntax: sedit <save>\r\n");

      ch->Echo("\r\nField being one of:\r\n");
      ch->Echo("  cnoarg onoarg cfound ofound vfound cauto oauto\r\n");
      return;
    }

  if ( GetTrustLevel(ch) > LEVEL_CREATOR && !StrCmp( arg1, "save" ) )
    {
      Socials->Save();
      ch->Echo("Saved.\r\n");
      return;
    }

  social = Socials->FindByName( arg1 );

  if ( !StrCmp( arg2, "create" ) )
    {
      if ( social )
        {
          ch->Echo("That social already exists!\r\n");
          return;
        }

      social = std::make_shared<Social>();
      social->Name = arg1;
      social->CharNoArg = "You " + arg1 + ".";
      Socials->Add(social);
      ch->Echo("Social added.\r\n");
      return;
    }

  if ( !social )
    {
      ch->Echo("Social not found.\r\n");
      return;
    }

  if ( arg2.empty() || !StrCmp( arg2, "show" ) )
    {
      ch->Echo("Social: %s\r\n\r\nCNoArg: %s\r\n",
               social->Name.c_str(), social->CharNoArg.c_str() );
      ch->Echo("ONoArg: %s\r\nCFound: %s\r\nOFound: %s\r\n",
               !social->OthersNoArg.empty() ? social->OthersNoArg.c_str() : "(not set)",
               !social->CharFound.empty()   ? social->CharFound.c_str()   : "(not set)",
               !social->OthersFound.empty() ? social->OthersFound.c_str() : "(not set)" );
      ch->Echo("VFound: %s\r\nCAuto : %s\r\nOAuto : %s\r\n",
               !social->VictimFound.empty() ? social->VictimFound.c_str() : "(not set)",
               !social->CharAuto.empty()    ? social->CharAuto.c_str()    : "(not set)",
               !social->OthersAuto.empty()  ? social->OthersAuto.c_str()  : "(not set)" );
      return;
    }

  if ( GetTrustLevel(ch) > LEVEL_GREATER && !StrCmp( arg2, "delete" ) )
    {
      Socials->Remove(social);
      ch->Echo("Deleted.\r\n");
      return;
    }

  if ( !StrCmp( arg2, "cnoarg" ) )
    {
      if ( argument.empty() || !StrCmp( argument, "clear" ) )
        {
          ch->Echo("You cannot clear this field. It must have a message.\r\n");
          return;
        }

      social->CharNoArg = argument;
      ch->Echo("Done.\r\n");
      return;
    }

  if ( !StrCmp( arg2, "onoarg" ) )
    {
      if( argument.empty() || !StrCmp( argument, "clear" ) )
        social->OthersNoArg.erase();
      else
        social->OthersNoArg = argument;

      ch->Echo("Done.\r\n");
      return;
    }

  if ( !StrCmp( arg2, "cfound" ) )
    {
      if ( argument.empty() || !StrCmp( argument, "clear" ) )
        social->CharFound.erase();
      else
        social->CharFound = argument;

      ch->Echo("Done.\r\n");
      return;
    }

  if ( !StrCmp( arg2, "ofound" ) )
    {
      if ( argument.empty() || !StrCmp( argument, "clear" ) )
        social->OthersFound.erase();
      else
        social->OthersFound = argument;

      ch->Echo("Done.\r\n");
      return;
    }

  if ( !StrCmp( arg2, "vfound" ) )
    {
      if ( argument.empty() || !StrCmp( argument, "clear" ) )
        social->VictimFound.erase();
      else
        social->VictimFound = argument;

      ch->Echo("Done.\r\n");
      return;
    }

  if ( !StrCmp( arg2, "cauto" ) )
    {
      if ( argument.empty() || !StrCmp( argument, "clear" ) )
        social->CharAuto.erase();
      else
        social->CharAuto = argument;

      ch->Echo("Done.\r\n");
      return;
    }

  if ( !StrCmp( arg2, "oauto" ) )
    {
      if ( argument.empty() || !StrCmp( argument, "clear" ) )
        social->OthersAuto.erase();
      else
        social->OthersAuto = argument;

      ch->Echo("Done.\r\n");
      return;
    }

  if ( GetTrustLevel(ch) > LEVEL_GREATER && !StrCmp( arg2, "name" ) )
    {
      OneArgument( argument, arg1 );

      if ( arg1.empty() )
        {
          ch->Echo("Cannot clear name field!\r\n");
          return;
        }

      Socials->Remove(social);
      social->Name = arg1;
      Socials->Add(social);

      ch->Echo("Done.\r\n");
      return;
    }

  /* display usage message */
  do_sedit( ch, "" );
}
