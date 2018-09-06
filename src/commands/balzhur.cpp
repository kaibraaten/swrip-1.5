#include <string.h>
#include <errno.h>
#include "mud.hpp"
#include "character.hpp"
#include "skill.hpp"
#include "pcdata.hpp"

void do_balzhur( Character *ch, std::string arg )
{
  char buf[MAX_STRING_LENGTH];
  char buf2[MAX_STRING_LENGTH];
  Character *victim = nullptr;

  if ( arg.empty() )
    {
      ch->Echo( "Who is deserving of such a fate?\r\n" );
      return;
    }

  if ( ( victim = GetCharacterAnywhere( ch, arg ) ) == NULL )
    {
      ch->Echo( "They aren't playing.\r\n" );
      return;
    }

  if ( IsNpc(victim) )
    {
      ch->Echo( "Not on NPC's.\r\n" );
      return;
    }

  if ( GetTrustLevel( victim ) >= GetTrustLevel( ch ) )
    {
      ch->Echo( "I wouldn't even think of that if I were you...\r\n" );
      return;
    }

  SetCharacterColor( AT_WHITE, ch );
  ch->Echo( "You summon the demon Balzhur to wreak your wrath!\r\n" );
  ch->Echo( "Balzhur sneers at you evilly, then vanishes in a puff of smoke.\r\n" );
  SetCharacterColor( AT_IMMORT, victim );
  victim->Echo( "You hear an ungodly sound in the distance that makes your blood run cold!\r\n" );
  sprintf( buf, "Balzhur screams, 'You are MINE %s!!!'", victim->Name.c_str() );
  EchoToAll( AT_IMMORT, buf, ECHOTAR_ALL );
  victim->TopLevel = 1;
  victim->Trust = 0;

  for (int ability = 0 ; ability < MAX_ABILITY ; ability++ )
    {
      SetAbilityXP( victim, ability, 1 );
      SetAbilityLevel( victim, ability, 1 );
    }

  victim->MaxHit  = 500;
  victim->MaxMana = 0;
  victim->MaxMove = 1000;

  victim->PCData->Learned.fill(0);

  victim->Hit      = victim->MaxHit;
  victim->Mana     = victim->MaxMana;
  victim->Move     = victim->MaxMove;

  char victimImmortalFilename[1024];
  
  sprintf( victimImmortalFilename, "%s%s", GOD_DIR, Capitalize(victim->Name).c_str() );

  if ( !remove( victimImmortalFilename ) )
    {
      ch->Echo( "Player's immortal data destroyed.\r\n" );
    }
  else if ( errno != ENOENT )
    {
      ch->Echo( "Unknown error #%d - %s (immortal data).  Report to Thoric\r\n",
                errno, strerror( errno ) );
      sprintf( buf2, "%s balzhuring %s", ch->Name.c_str(), victimImmortalFilename );
      perror( buf2 );
    }

  sprintf( buf2, "%s.are", Capitalize(arg).c_str() );
  MakeWizlist();
  do_help(victim, "M_BALZHUR_" );
  SetCharacterColor( AT_WHITE, victim );
  victim->Echo( "You awake after a long period of time...\r\n" );

  while( !victim->Objects().empty() )
    {
      ExtractObject( victim->Objects().front() );
    }
}
