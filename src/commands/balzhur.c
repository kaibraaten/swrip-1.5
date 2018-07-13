#include <string.h>
#include <errno.h>
#include "mud.h"
#include "character.h"
#include "skill.h"

void do_balzhur( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];
  char buf2[MAX_STRING_LENGTH];
  Character *victim;
  int sn;

  argument = OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
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
  sprintf( buf, "Balzhur screams, 'You are MINE %s!!!'", victim->Name );
  EchoToAll( AT_IMMORT, buf, ECHOTAR_ALL );
  victim->TopLevel =1;
  victim->Trust  = 0;
  {
    int ability;

    for ( ability = 0 ; ability < MAX_ABILITY ; ability++ )
      {
        SetAbilityXP( victim, ability, 1 );
        SetAbilityLevel( victim, ability, 1 );
      }
  }
  victim->MaxHit  = 500;
  victim->MaxMana = 0;
  victim->MaxMove = 1000;
  for ( sn = 0; sn < TopSN; sn++ )
    victim->PCData->Learned[sn] = 0;
  victim->Hit      = victim->MaxHit;
  victim->Mana     = victim->MaxMana;
  victim->Move     = victim->MaxMove;


  sprintf( buf, "%s%s", GOD_DIR, Capitalize(victim->Name) );

  if ( !remove( buf ) )
    SendToCharacter( "Player's immortal data destroyed.\r\n", ch );
  else if ( errno != ENOENT )
    {
      Echo( ch, "Unknown error #%d - %s (immortal data).  Report to Thoric\r\n",
                 errno, strerror( errno ) );
      sprintf( buf2, "%s balzhuring %s", ch->Name, buf );
      perror( buf2 );
    }

  sprintf( buf2, "%s.are", Capitalize(arg) );
  MakeWizlist();
  do_help(victim, "M_BALZHUR_" );
  SetCharacterColor( AT_WHITE, victim );
  SendToCharacter( "You awake after a long period of time...\r\n", victim );

  while ( victim->FirstCarrying )
    ExtractObject( victim->FirstCarrying );
}
