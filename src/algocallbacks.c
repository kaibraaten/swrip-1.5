#include "algocallbacks.h"
#include "character.h"
#include "mud.h"

void SendSoundToPlayerCharacter( void *element, void *userData )
{
  Character *victim = (Character*) element;
  const char *message = (const char*) userData;

  if( !IsNpc( victim ) && IS_SET( victim->act, PLR_SOUND ) )
    {
      ch_printf( victim, message );
    }
}

void ShowOpenDoorMessageToCharacter( void *element, void *userData )
{
  Character *rch = (Character*) element;
  const char *keyword = (const char*) userData;

  act( AT_ACTION, "The $d opens.", rch, NULL, keyword, TO_CHAR );
}

void ShowCloseDoorMessageToCharacter( void *element, void *userData )
{
  Character *rch = (Character*) element;
  const char *keyword = (const char*) userData;

  act( AT_ACTION, "The $d closes.", rch, NULL, keyword, TO_CHAR );
}

void AttackBasher( void *element, void *userData )
{
  Character *attacker = (Character*) element;
  Character *basher = (Character*) userData;

  if ( is_awake( attacker )
       && !attacker->fighting
       && IsNpc( attacker )
       && !is_affected_by( attacker, AFF_CHARM )
       && ( basher->top_level - attacker->top_level <= 4 )
       && number_bits( 2 ) == 0 )
    {
      multi_hit( attacker, basher, TYPE_UNDEFINED );
    }
}
