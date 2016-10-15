#include "character.h"
#include "mud.h"
#include "skill.h"

extern char *spell_target_name;

ch_ret spell_remove_trap( int sn, int level, Character *ch, void *vo )
{
  Object *obj;
  Object *trap;
  bool found;
  int retcode;
  Skill *skill = GetSkill(sn);

  if ( IsNullOrEmpty( spell_target_name ) )
    {
      SendToCharacter( "Remove trap on what?\r\n", ch );
      return rSPELL_FAILED;
    }

  found = false;

  if ( !ch->InRoom->FirstContent )
    {
      SendToCharacter( "You can't find that here.\r\n", ch );
      return rNONE;
    }

  for ( obj = ch->InRoom->FirstContent; obj; obj = obj->NextContent )
    if ( CanSeeObject( ch, obj ) && NiftyIsName( spell_target_name, obj->Name ) )
      {
        found = true;
        break;
      }

  if ( !found )
    {
      SendToCharacter( "You can't find that here.\r\n", ch );
      return rSPELL_FAILED;
    }

  if ( (trap = GetTrap( obj )) == NULL )
    {
      FailedCasting( skill, ch, NULL, NULL );
      return rSPELL_FAILED;
    }


  if ( Chance(ch, 70 + GetCurrentWisdom(ch)) )
    {
      SendToCharacter( "Ooops!\r\n", ch );
      retcode = SpringTrap(ch, trap);
      if ( retcode == rNONE )
        retcode = rSPELL_FAILED;
      return retcode;
    }

  ExtractObject( trap );

  SuccessfulCasting( skill, ch, NULL, NULL );
  return rNONE;
}
