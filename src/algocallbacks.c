#include "algocallbacks.h"
#include "character.h"
#include "mud.h"

void SendSoundToPlayerCharacter( void *element, void *userData )
{
  Character *victim = (Character*) element;
  const char *message = (const char*) userData;

  if( !is_npc( victim ) && IS_SET( victim->act, PLR_SOUND ) )
    {
      ch_printf( victim, message );
    }
}
