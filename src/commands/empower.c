#include "mud.h"

void do_empower ( CHAR_DATA *ch , char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  CHAR_DATA *victim;
  CLAN_DATA *clan;
  char buf[MAX_STRING_LENGTH];

  if ( IS_NPC( ch ) || !ch->pcdata->clan )
    {
      send_to_char( "Huh?\r\n", ch );
      return;
    }

  clan = ch->pcdata->clan;

  if ( (ch->pcdata && ch->pcdata->bestowments
        &&    is_name("empower", ch->pcdata->bestowments))
       || !str_cmp( ch->name, clan->leader  ) )
    ;
  else
    {
      send_to_char( "You clan hasn't seen fit to bestow that ability to you!\r\n", ch );
      return;
    }

  argument = one_argument( argument, arg );
  argument = one_argument( argument, arg2 );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Empower whom to do what?\r\n", ch );
      return;
    }

  if ( ( victim = get_char_world( ch, arg ) ) == NULL )
    {
      send_to_char( "That player is not here.\r\n", ch);
      return;
    }

  if ( IS_NPC(victim) )
    {
      send_to_char( "Not on NPC's.\r\n", ch );
      return;
    }

  if ( victim == ch )
    {
      send_to_char( "Nice try.\r\n", ch );
      return;
    }

  if ( victim->pcdata->clan != ch->pcdata->clan )
    {
      send_to_char( "This player does not belong to your clan!\r\n", ch );
      return;
    }

  if (!victim->pcdata->bestowments)
    victim->pcdata->bestowments = str_dup("");

  if ( arg2[0] == '\0' || !str_cmp( arg2, "list" ) )
    {
      ch_printf( ch, "Current bestowed commands on %s: %s.\r\n",
                 victim->name, victim->pcdata->bestowments );
      ch_printf( ch, "Current salary on %s: %d.\r\n",
                 victim->name, victim->pcdata->salary );

      return;
    }

  if ( (victim->pcdata && victim->pcdata->bestowments
        &&    is_name(arg2, victim->pcdata->bestowments)) )
    {
      send_to_char( "That player already has that power.\r\n", ch );
      return;
    }


  if ( !str_cmp( arg2, "none" ) )
    {
      DISPOSE( victim->pcdata->bestowments );
      victim->pcdata->bestowments = str_dup("");
      ch_printf( ch, "Bestowments removed from %s.\r\n", victim->name );
      ch_printf( victim, "%s has removed your bestowed clan abilities.\r\n", ch->name );
      return;
    }
  else if ( !str_cmp( arg2, "pilot" ) )
    {
      sprintf( buf, "%s %s", victim->pcdata->bestowments, arg2 );
      DISPOSE( victim->pcdata->bestowments );
      victim->pcdata->bestowments = str_dup( buf );
      ch_printf( victim, "%s has given you permission to fly clan ships.\r\n",
                 ch->name );
      send_to_char( "Ok, they now have the ability to fly clan ships.\r\n", ch );
    }
  else if ( !str_cmp( arg2, "withdraw" ) )
    {
      sprintf( buf, "%s %s", victim->pcdata->bestowments, arg2 );
      DISPOSE( victim->pcdata->bestowments );
      victim->pcdata->bestowments = str_dup( buf );
      ch_printf( victim, "%s has given you permission to withdraw clan funds.\r\n",
                 ch->name );
      send_to_char( "Ok, they now have the ablitity to withdraw clan funds.\r\n", ch );
    }
  else if ( !str_cmp( arg2, "clanbuyship" ) )
    {
      sprintf( buf, "%s %s", victim->pcdata->bestowments, arg2 );
      DISPOSE( victim->pcdata->bestowments );
      victim->pcdata->bestowments = str_dup( buf );
      ch_printf( victim, "%s has given you permission to buy clan ships.\r\n",
                 ch->name );
      send_to_char( "Ok, they now have the ablitity to use clanbuyship.\r\n", ch );
    }
  else if ( !str_cmp( arg2, "induct" ) )
    {
      sprintf( buf, "%s %s", victim->pcdata->bestowments, arg2 );
      DISPOSE( victim->pcdata->bestowments );
      victim->pcdata->bestowments = str_dup( buf );
      ch_printf( victim, "%s has given you permission to induct new members.\r\n",
                 ch->name );
      send_to_char( "Ok, they now have the ablitity to induct new members.\r\n", ch );
    }
  else if ( !str_cmp( arg2, "empower" ) )
    {
      sprintf( buf, "%s %s", victim->pcdata->bestowments, arg2 );
      DISPOSE( victim->pcdata->bestowments );
      victim->pcdata->bestowments = str_dup( buf );
      ch_printf( victim, "%s has given you permission to empower members.\r\n",
                 ch->name );
      send_to_char( "Ok, they now have the ablitity to empower members.\r\n", ch );
    }
  else if ( !str_cmp( arg2, "salary" ) )
    {
      sprintf( buf, "%s %s", victim->pcdata->bestowments, arg2 );
      DISPOSE( victim->pcdata->bestowments );
      victim->pcdata->bestowments = str_dup( buf );
      ch_printf( victim, "%s has given you permission to assign salaries.\r\n",
                 ch->name );
      send_to_char( "Ok, they now have the ablitity to assign salaries.\r\n", ch );
    }
  else if ( !str_cmp( arg2, "roster" ) )
    {
      sprintf( buf, "%s %s", victim->pcdata->bestowments, arg2 );
      DISPOSE( victim->pcdata->bestowments );
      victim->pcdata->bestowments = str_dup( buf );
      ch_printf( victim, "%s has given you permission to access the roster.\r\n",
                 ch->name );
      send_to_char( "Ok, they now have the ablitity to access the roster.\r\n", ch );
    }
  else
    {
      send_to_char( "Currently you may empower members with only the following:\r\n", ch );
      send_to_char( "\r\npilot:       ability to fly clan ships\r\n", ch );
      send_to_char(     "withdraw:    ability to withdraw clan funds\r\n", ch );
      send_to_char(     "clanbuyship: ability to buy clan ships\r\n", ch );
      send_to_char(     "induct:      ability to induct new members\r\n", ch );
      send_to_char(     "salary:      ability to assign salaries\r\n", ch );
      send_to_char(     "roster:      ability to see the full clan roster\r\n", ch );
      send_to_char(     "none:        removes bestowed abilities\r\n", ch );
    }

  save_char_obj( victim );      /* clan gets saved when pfile is saved */
}
