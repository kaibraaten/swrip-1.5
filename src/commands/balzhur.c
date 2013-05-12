#include <string.h>
#include "mud.h"

void do_balzhur( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];
  char buf2[MAX_STRING_LENGTH];
  CHAR_DATA *victim;
  int sn;

  argument = one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Who is deserving of such a fate?\r\n", ch );
      return;
    }

  if ( ( victim = get_char_world( ch, arg ) ) == NULL )
    {
      send_to_char( "They aren't playing.\r\n", ch);
      return;
    }

  if ( IS_NPC(victim) )
    {
      send_to_char( "Not on NPC's.\r\n", ch );
      return;
    }

  if ( get_trust( victim ) >= get_trust( ch ) )
    {
      send_to_char( "I wouldn't even think of that if I were you...\r\n", ch );
      return;
    }

  set_char_color( AT_WHITE, ch );
  send_to_char( "You summon the demon Balzhur to wreak your wrath!\r\n", ch );
  send_to_char( "Balzhur sneers at you evilly, then vanishes in a puff of smoke.\r\n", ch );
  set_char_color( AT_IMMORT, victim );
  send_to_char( "You hear an ungodly sound in the distance that makes your blood run cold!\r\n", victim );
  sprintf( buf, "Balzhur screams, 'You are MINE %s!!!'", victim->name );
  echo_to_all( AT_IMMORT, buf, ECHOTAR_ALL );
  victim->top_level =1;
  victim->trust  = 0;
  {
    int ability;

    for ( ability = 0 ; ability < MAX_ABILITY ; ability++ )
      {
        set_exp( victim, ability, 1 );
        victim->skill_level[ability] = 1;
      }
  }
  victim->max_hit  = 500;
  victim->max_mana = 0;
  victim->max_move = 1000;
  for ( sn = 0; sn < top_sn; sn++ )
    victim->pcdata->learned[sn] = 0;
  victim->hit      = victim->max_hit;
  victim->mana     = victim->max_mana;
  victim->move     = victim->max_move;


  sprintf( buf, "%s%s", GOD_DIR, capitalize(victim->name) );

  if ( !remove( buf ) )
    send_to_char( "Player's immortal data destroyed.\r\n", ch );
  else if ( errno != ENOENT )
    {
      ch_printf( ch, "Unknown error #%d - %s (immortal data).  Report to Thoric\r\n",
                 errno, strerror( errno ) );
      sprintf( buf2, "%s balzhuring %s", ch->name, buf );
      perror( buf2 );
    }

  sprintf( buf2, "%s.are", capitalize(arg) );
  make_wizlist();
  do_help(victim, "M_BALZHUR_" );
  set_char_color( AT_WHITE, victim );
  send_to_char( "You awake after a long period of time...\r\n", victim );

  while ( victim->first_carrying )
    extract_obj( victim->first_carrying );
}