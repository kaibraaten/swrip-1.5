#include "character.h"
#include "mud.h"

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

  if ( arg1[0] == '\0' )
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
      save_socials();
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
      social->name = CopyString( arg1 );
      sprintf( arg2, "You %s.", arg1 );
      social->char_no_arg = CopyString( arg2 );
      AddSocial( social );
      SendToCharacter( "Social added.\r\n", ch );
      return;
    }

  if ( !social )
    {
      SendToCharacter( "Social not found.\r\n", ch );
      return;
    }

  if ( arg2[0] == '\0' || !StrCmp( arg2, "show" ) )
    {
      ChPrintf( ch, "Social: %s\r\n\r\nCNoArg: %s\r\n",
                 social->name,  social->char_no_arg );
      ChPrintf( ch, "ONoArg: %s\r\nCFound: %s\r\nOFound: %s\r\n",
                 social->others_no_arg  ? social->others_no_arg : "(not set)",
                 social->char_found             ? social->char_found    : "(not set)",
                 social->others_found   ? social->others_found  : "(not set)" );
      ChPrintf( ch, "VFound: %s\r\nCAuto : %s\r\nOAuto : %s\r\n",
                 social->vict_found     ? social->vict_found    : "(not set)",
                 social->char_auto      ? social->char_auto     : "(not set)",
                 social->others_auto    ? social->others_auto   : "(not set)" );
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
      if ( argument[0] == '\0' || !StrCmp( argument, "clear" ) )
        {
          SendToCharacter( "You cannot clear this field.  It must have a message.\r\n", ch );
          return;
        }
      if ( social->char_no_arg )
        FreeMemory( social->char_no_arg );
      social->char_no_arg = CopyString( argument );
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "onoarg" ) )
    {
      if ( social->others_no_arg )
        FreeMemory( social->others_no_arg );
      if ( argument[0] != '\0' && StrCmp( argument, "clear" ) )
        social->others_no_arg = CopyString( argument );
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "cfound" ) )
    {
      if ( social->char_found )
        FreeMemory( social->char_found );
      if ( argument[0] != '\0' && StrCmp( argument, "clear" ) )
        social->char_found = CopyString( argument );
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "ofound" ) )
    {
      if ( social->others_found )
        FreeMemory( social->others_found );
      if ( argument[0] != '\0' && StrCmp( argument, "clear" ) )
        social->others_found = CopyString( argument );
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "vfound" ) )
    {
      if ( social->vict_found )
        FreeMemory( social->vict_found );
      if ( argument[0] != '\0' && StrCmp( argument, "clear" ) )
        social->vict_found = CopyString( argument );
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "cauto" ) )
    {
      if ( social->char_auto )
        FreeMemory( social->char_auto );
      if ( argument[0] != '\0' && StrCmp( argument, "clear" ) )
        social->char_auto = CopyString( argument );
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "oauto" ) )
    {
      if ( social->others_auto )
        FreeMemory( social->others_auto );
      if ( argument[0] != '\0' && StrCmp( argument, "clear" ) )
        social->others_auto = CopyString( argument );
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( GetTrustLevel(ch) > LEVEL_GREATER && !StrCmp( arg2, "name" ) )
    {
      bool relocate;

      OneArgument( argument, arg1 );
      if ( arg1[0] == '\0' )
        {
	  SendToCharacter( "Cannot clear name field!\r\n", ch );
          return;
        }
      if ( arg1[0] != social->name[0] )
        {
          UnlinkSocial( social );
          relocate = true;
        }
      else
        relocate = false;
      if ( social->name )
        FreeMemory( social->name );
      social->name = CopyString( arg1 );
      if ( relocate )
        AddSocial( social );
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  /* display usage message */
  do_sedit( ch, "" );
}
