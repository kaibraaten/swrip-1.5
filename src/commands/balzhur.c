#include <string.h>
#include "mud.h"
#include "character.h"

void do_balzhur( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];
  char buf2[MAX_STRING_LENGTH];
  Character *victim;
  int sn;

  argument = OneArgument( argument, arg );

  if ( arg[0] == '\0' )
    {
      SendToCharacter( "Who is deserving of such a fate?\r\n", ch );
      return;
    }

  if ( ( victim = GetCharacterAnywhere( ch, arg ) ) == NULL )
    {
      SendToCharacter( "They aren't playing.\r\n", ch);
      return;
    }

  if ( IsNpc(victim) )
    {
      SendToCharacter( "Not on NPC's.\r\n", ch );
      return;
    }

  if ( GetTrustLevel( victim ) >= GetTrustLevel( ch ) )
    {
      SendToCharacter( "I wouldn't even think of that if I were you...\r\n", ch );
      return;
    }

  SetCharacterColor( AT_WHITE, ch );
  SendToCharacter( "You summon the demon Balzhur to wreak your wrath!\r\n", ch );
  SendToCharacter( "Balzhur sneers at you evilly, then vanishes in a puff of smoke.\r\n", ch );
  SetCharacterColor( AT_IMMORT, victim );
  SendToCharacter( "You hear an ungodly sound in the distance that makes your blood run cold!\r\n", victim );
  sprintf( buf, "Balzhur screams, 'You are MINE %s!!!'", victim->name );
  EchoToAll( AT_IMMORT, buf, ECHOTAR_ALL );
  victim->top_level =1;
  victim->trust  = 0;
  {
    int ability;

    for ( ability = 0 ; ability < MAX_ABILITY ; ability++ )
      {
        SetAbilityXP( victim, ability, 1 );
        SetAbilityLevel( victim, ability, 1 );
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


  sprintf( buf, "%s%s", GOD_DIR, Capitalize(victim->name) );

  if ( !remove( buf ) )
    SendToCharacter( "Player's immortal data destroyed.\r\n", ch );
  else if ( errno != ENOENT )
    {
      Echo( ch, "Unknown error #%d - %s (immortal data).  Report to Thoric\r\n",
                 errno, strerror( errno ) );
      sprintf( buf2, "%s balzhuring %s", ch->name, buf );
      perror( buf2 );
    }

  sprintf( buf2, "%s.are", Capitalize(arg) );
  MakeWizlist();
  do_help(victim, "M_BALZHUR_" );
  SetCharacterColor( AT_WHITE, victim );
  SendToCharacter( "You awake after a long period of time...\r\n", victim );

  while ( victim->first_carrying )
    ExtractObject( victim->first_carrying );
}
