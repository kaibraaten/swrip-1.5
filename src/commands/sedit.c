#include "character.h"
#include "mud.h"

/*
 * Social editor/displayer/save/delete                          -Thoric
 */
void do_sedit( Character *ch, char *argument )
{
  SOCIALTYPE *social;
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];

  smash_tilde( argument );
  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );

  set_char_color( AT_SOCIAL, ch );

  if ( arg1[0] == '\0' )
    {
      send_to_char( "Syntax: sedit <social> [field]\r\n", ch );
      send_to_char( "Syntax: sedit <social> create\r\n", ch );
      if ( get_trust(ch) > LEVEL_GREATER )
        send_to_char( "Syntax: sedit <social> delete\r\n", ch );
      if ( get_trust(ch) > LEVEL_CREATOR )
        send_to_char( "Syntax: sedit <save>\r\n", ch );
      send_to_char( "\r\nField being one of:\r\n", ch );
      send_to_char( "  cnoarg onoarg cfound ofound vfound cauto oauto\r\n", ch );
      return;
    }

  if ( get_trust(ch) > LEVEL_CREATOR && !str_cmp( arg1, "save" ) )
    {
      save_socials();
      send_to_char( "Saved.\r\n", ch );
      return;
    }

  social = find_social( arg1 );

  if ( !str_cmp( arg2, "create" ) )
    {
      if ( social )
        {
          send_to_char( "That social already exists!\r\n", ch );
          return;
        }
      CREATE( social, SOCIALTYPE, 1 );
      social->name = str_dup( arg1 );
      sprintf( arg2, "You %s.", arg1 );
      social->char_no_arg = str_dup( arg2 );
      add_social( social );
      send_to_char( "Social added.\r\n", ch );
      return;
    }

  if ( !social )
    {
      send_to_char( "Social not found.\r\n", ch );
      return;
    }

  if ( arg2[0] == '\0' || !str_cmp( arg2, "show" ) )
    {
      ch_printf( ch, "Social: %s\r\n\r\nCNoArg: %s\r\n",
                 social->name,  social->char_no_arg );
      ch_printf( ch, "ONoArg: %s\r\nCFound: %s\r\nOFound: %s\r\n",
                 social->others_no_arg  ? social->others_no_arg : "(not set)",
                 social->char_found             ? social->char_found    : "(not set)",
                 social->others_found   ? social->others_found  : "(not set)" );
      ch_printf( ch, "VFound: %s\r\nCAuto : %s\r\nOAuto : %s\r\n",
                 social->vict_found     ? social->vict_found    : "(not set)",
                 social->char_auto      ? social->char_auto     : "(not set)",
                 social->others_auto    ? social->others_auto   : "(not set)" );
      return;
    }

  if ( get_trust(ch) > LEVEL_GREATER && !str_cmp( arg2, "delete" ) )
    {
      unlink_social( social );
      free_social( social );
      send_to_char( "Deleted.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "cnoarg" ) )
    {
      if ( argument[0] == '\0' || !str_cmp( argument, "clear" ) )
        {
          send_to_char( "You cannot clear this field.  It must have a message.\r\n", ch );
          return;
        }
      if ( social->char_no_arg )
        DISPOSE( social->char_no_arg );
      social->char_no_arg = str_dup( argument );
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "onoarg" ) )
    {
      if ( social->others_no_arg )
        DISPOSE( social->others_no_arg );
      if ( argument[0] != '\0' && str_cmp( argument, "clear" ) )
        social->others_no_arg = str_dup( argument );
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "cfound" ) )
    {
      if ( social->char_found )
        DISPOSE( social->char_found );
      if ( argument[0] != '\0' && str_cmp( argument, "clear" ) )
        social->char_found = str_dup( argument );
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "ofound" ) )
    {
      if ( social->others_found )
        DISPOSE( social->others_found );
      if ( argument[0] != '\0' && str_cmp( argument, "clear" ) )
        social->others_found = str_dup( argument );
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "vfound" ) )
    {
      if ( social->vict_found )
        DISPOSE( social->vict_found );
      if ( argument[0] != '\0' && str_cmp( argument, "clear" ) )
        social->vict_found = str_dup( argument );
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "cauto" ) )
    {
      if ( social->char_auto )
        DISPOSE( social->char_auto );
      if ( argument[0] != '\0' && str_cmp( argument, "clear" ) )
        social->char_auto = str_dup( argument );
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "oauto" ) )
    {
      if ( social->others_auto )
        DISPOSE( social->others_auto );
      if ( argument[0] != '\0' && str_cmp( argument, "clear" ) )
        social->others_auto = str_dup( argument );
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( get_trust(ch) > LEVEL_GREATER && !str_cmp( arg2, "name" ) )
    {
      bool relocate;

      one_argument( argument, arg1 );
      if ( arg1[0] == '\0' )
        {
	  send_to_char( "Cannot clear name field!\r\n", ch );
          return;
        }
      if ( arg1[0] != social->name[0] )
        {
          unlink_social( social );
          relocate = TRUE;
        }
      else
        relocate = FALSE;
      if ( social->name )
        DISPOSE( social->name );
      social->name = str_dup( arg1 );
      if ( relocate )
        add_social( social );
      send_to_char( "Done.\r\n", ch );
      return;
    }

  /* display usage message */
  do_sedit( ch, "" );
}
