#include "character.hpp"
#include "mud.hpp"
#include "social.hpp"

/*
 * Social editor/displayer/save/delete                          -Thoric
 */
void do_sedit( Character *ch, char *argument )
{
  Social *social;
  char arg1[MAX_INPUT_LENGTH - 10];
  char arg2[MAX_INPUT_LENGTH];

  SmashTilde( argument );
  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  SetCharacterColor( AT_SOCIAL, ch );

  if ( IsNullOrEmpty( arg1 ) )
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

      social = new Social();
      social->Name = CopyString( arg1 );
      sprintf( arg2, "You %s.", arg1 );
      social->CharNoArg = CopyString( arg2 );
      Socials->Add(social);
      ch->Echo("Social added.\r\n");
      return;
    }

  if ( !social )
    {
      ch->Echo("Social not found.\r\n");
      return;
    }

  if ( IsNullOrEmpty( arg2 ) || !StrCmp( arg2, "show" ) )
    {
      ch->Echo("Social: %s\r\n\r\nCNoArg: %s\r\n",
	    social->Name,  social->CharNoArg );
      ch->Echo("ONoArg: %s\r\nCFound: %s\r\nOFound: %s\r\n",
	    social->OthersNoArg ? social->OthersNoArg : "(not set)",
	    social->CharFound   ? social->CharFound   : "(not set)",
	    social->OthersFound ? social->OthersFound : "(not set)" );
      ch->Echo("VFound: %s\r\nCAuto : %s\r\nOAuto : %s\r\n",
	    social->VictimFound ? social->VictimFound : "(not set)",
	    social->CharAuto    ? social->CharAuto    : "(not set)",
	    social->OthersAuto  ? social->OthersAuto  : "(not set)" );
      return;
    }

  if ( GetTrustLevel(ch) > LEVEL_GREATER && !StrCmp( arg2, "delete" ) )
    {
      Socials->Remove(social);
      FreeSocial( social );
      ch->Echo("Deleted.\r\n");
      return;
    }

  if ( !StrCmp( arg2, "cnoarg" ) )
    {
      if ( IsNullOrEmpty( argument ) || !StrCmp( argument, "clear" ) )
        {
          ch->Echo("You cannot clear this field. It must have a message.\r\n");
          return;
        }

      if ( social->CharNoArg )
        FreeMemory( social->CharNoArg );

      social->CharNoArg = CopyString( argument );
      ch->Echo("Done.\r\n");
      return;
    }

  if ( !StrCmp( arg2, "onoarg" ) )
    {
      if ( social->OthersNoArg )
        FreeMemory( social->OthersNoArg );

      if ( !IsNullOrEmpty( argument ) && StrCmp( argument, "clear" ) )
        social->OthersNoArg = CopyString( argument );

      ch->Echo("Done.\r\n");
      return;
    }

  if ( !StrCmp( arg2, "cfound" ) )
    {
      if ( social->CharFound )
        FreeMemory( social->CharFound );

      if ( !IsNullOrEmpty( argument ) && StrCmp( argument, "clear" ) )
        social->CharFound = CopyString( argument );

      ch->Echo("Done.\r\n");
      return;
    }

  if ( !StrCmp( arg2, "ofound" ) )
    {
      if ( social->OthersFound )
        FreeMemory( social->OthersFound );

      if ( !IsNullOrEmpty( argument ) && StrCmp( argument, "clear" ) )
        social->OthersFound = CopyString( argument );

      ch->Echo("Done.\r\n");
      return;
    }

  if ( !StrCmp( arg2, "vfound" ) )
    {
      if ( social->VictimFound )
        FreeMemory( social->VictimFound );

      if ( !IsNullOrEmpty( argument ) && StrCmp( argument, "clear" ) )
        social->VictimFound = CopyString( argument );

      ch->Echo("Done.\r\n");
      return;
    }

  if ( !StrCmp( arg2, "cauto" ) )
    {
      if ( social->CharAuto )
        FreeMemory( social->CharAuto );

      if ( !IsNullOrEmpty( argument ) && StrCmp( argument, "clear" ) )
        social->CharAuto = CopyString( argument );

      ch->Echo("Done.\r\n");
      return;
    }

  if ( !StrCmp( arg2, "oauto" ) )
    {
      if ( social->OthersAuto )
        FreeMemory( social->OthersAuto );

      if ( !IsNullOrEmpty( argument ) && StrCmp( argument, "clear" ) )
        social->OthersAuto = CopyString( argument );

      ch->Echo("Done.\r\n");
      return;
    }

  if ( GetTrustLevel(ch) > LEVEL_GREATER && !StrCmp( arg2, "name" ) )
    {
      bool relocate = false;

      OneArgument( argument, arg1 );

      if ( IsNullOrEmpty( arg1 ) )
        {
   ch->Echo("Cannot clear name field!\r\n");
          return;
        }

      if ( arg1[0] != social->Name[0] )
        {
          Socials->Remove(social);
          relocate = true;
        }

      if ( social->Name )
        FreeMemory( social->Name );

      social->Name = CopyString( arg1 );

      if ( relocate )
        {
          Socials->Add(social);
        }

      ch->Echo("Done.\r\n");
      return;
    }

  /* display usage message */
  do_sedit( ch, "" );
}

