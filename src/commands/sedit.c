#include "character.h"
#include "mud.h"
#include "social.h"

/*
 * Social editor/displayer/save/delete                          -Thoric
 */
void do_sedit( Character *ch, char *argument )
{
  Social *social;
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];

  SmashTilde( argument );
  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  SetCharacterColor( AT_SOCIAL, ch );

  if ( IsNullOrEmpty( arg1 ) )
    {
      SendToCharacter( "Syntax: sedit <social> [field]\r\n", ch );
      SendToCharacter( "Syntax: sedit <social> create\r\n", ch );

      if ( GetTrustLevel(ch) > LEVEL_GREATER )
        SendToCharacter( "Syntax: sedit <social> delete\r\n", ch );

      if ( GetTrustLevel(ch) > LEVEL_CREATOR )
        SendToCharacter( "Syntax: sedit <save>\r\n", ch );

      SendToCharacter( "\r\nField being one of:\r\n", ch );
      SendToCharacter( "  cnoarg onoarg cfound ofound vfound cauto oauto\r\n", ch );
      return;
    }

  if ( GetTrustLevel(ch) > LEVEL_CREATOR && !StrCmp( arg1, "save" ) )
    {
      SaveSocials();
      SendToCharacter( "Saved.\r\n", ch );
      return;
    }

  social = GetSocial( arg1 );

  if ( !StrCmp( arg2, "create" ) )
    {
      if ( social )
        {
          SendToCharacter( "That social already exists!\r\n", ch );
          return;
        }

      AllocateMemory( social, Social, 1 );
      social->Name = CopyString( arg1 );
      sprintf( arg2, "You %s.", arg1 );
      social->CharNoArg = CopyString( arg2 );
      AddSocial( social );
      SendToCharacter( "Social added.\r\n", ch );
      return;
    }

  if ( !social )
    {
      SendToCharacter( "Social not found.\r\n", ch );
      return;
    }

  if ( IsNullOrEmpty( arg2 ) || !StrCmp( arg2, "show" ) )
    {
      Echo( ch, "Social: %s\r\n\r\nCNoArg: %s\r\n",
	    social->Name,  social->CharNoArg );
      Echo( ch, "ONoArg: %s\r\nCFound: %s\r\nOFound: %s\r\n",
	    social->OthersNoArg ? social->OthersNoArg : "(not set)",
	    social->CharFound   ? social->CharFound   : "(not set)",
	    social->OthersFound ? social->OthersFound : "(not set)" );
      Echo( ch, "VFound: %s\r\nCAuto : %s\r\nOAuto : %s\r\n",
	    social->VictimFound ? social->VictimFound : "(not set)",
	    social->CharAuto    ? social->CharAuto    : "(not set)",
	    social->OthersAuto  ? social->OthersAuto  : "(not set)" );
      return;
    }

  if ( GetTrustLevel(ch) > LEVEL_GREATER && !StrCmp( arg2, "delete" ) )
    {
      UnlinkSocial( social );
      FreeSocial( social );
      SendToCharacter( "Deleted.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "cnoarg" ) )
    {
      if ( IsNullOrEmpty( argument ) || !StrCmp( argument, "clear" ) )
        {
          SendToCharacter( "You cannot clear this field. It must have a message.\r\n", ch );
          return;
        }

      if ( social->CharNoArg )
        FreeMemory( social->CharNoArg );

      social->CharNoArg = CopyString( argument );
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "onoarg" ) )
    {
      if ( social->OthersNoArg )
        FreeMemory( social->OthersNoArg );

      if ( !IsNullOrEmpty( argument ) && StrCmp( argument, "clear" ) )
        social->OthersNoArg = CopyString( argument );

      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "cfound" ) )
    {
      if ( social->CharFound )
        FreeMemory( social->CharFound );

      if ( !IsNullOrEmpty( argument ) && StrCmp( argument, "clear" ) )
        social->CharFound = CopyString( argument );

      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "ofound" ) )
    {
      if ( social->OthersFound )
        FreeMemory( social->OthersFound );

      if ( !IsNullOrEmpty( argument ) && StrCmp( argument, "clear" ) )
        social->OthersFound = CopyString( argument );

      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "vfound" ) )
    {
      if ( social->VictimFound )
        FreeMemory( social->VictimFound );

      if ( !IsNullOrEmpty( argument ) && StrCmp( argument, "clear" ) )
        social->VictimFound = CopyString( argument );

      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "cauto" ) )
    {
      if ( social->CharAuto )
        FreeMemory( social->CharAuto );

      if ( !IsNullOrEmpty( argument ) && StrCmp( argument, "clear" ) )
        social->CharAuto = CopyString( argument );

      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "oauto" ) )
    {
      if ( social->OthersAuto )
        FreeMemory( social->OthersAuto );

      if ( !IsNullOrEmpty( argument ) && StrCmp( argument, "clear" ) )
        social->OthersAuto = CopyString( argument );

      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( GetTrustLevel(ch) > LEVEL_GREATER && !StrCmp( arg2, "name" ) )
    {
      bool relocate = false;

      OneArgument( argument, arg1 );

      if ( IsNullOrEmpty( arg1 ) )
        {
	  SendToCharacter( "Cannot clear name field!\r\n", ch );
          return;
        }

      if ( arg1[0] != social->Name[0] )
        {
          UnlinkSocial( social );
          relocate = true;
        }

      if ( social->Name )
        FreeMemory( social->Name );

      social->Name = CopyString( arg1 );

      if ( relocate )
        AddSocial( social );

      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  /* display usage message */
  do_sedit( ch, "" );
}
