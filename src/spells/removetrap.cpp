#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "room.hpp"

extern char *spell_target_name;

ch_ret spell_remove_trap( int sn, int level, Character *ch, void *vo )
{
  Object *obj = nullptr;
  Object *trap = nullptr;
  bool found = false;
  int retcode = rNONE;
  Skill *skill = GetSkill(sn);

  if ( IsNullOrEmpty( spell_target_name ) )
    {
      ch->Echo("Remove trap on what?\r\n");
      return rSPELL_FAILED;
    }

  found = false;

  if ( !ch->InRoom->FirstContent )
    {
      ch->Echo("You can't find that here.\r\n");
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
      ch->Echo("You can't find that here.\r\n");
      return rSPELL_FAILED;
    }

  if ( (trap = GetTrap( obj )) == NULL )
    {
      FailedCasting( skill, ch, NULL, NULL );
      return rSPELL_FAILED;
    }


  if ( Chance(ch, 70 + GetCurrentWisdom(ch)) )
    {
      ch->Echo("Ooops!\r\n");
      retcode = SpringTrap(ch, trap);
      if ( retcode == rNONE )
        retcode = rSPELL_FAILED;
      return retcode;
    }

  ExtractObject( trap );

  SuccessfulCasting( skill, ch, NULL, NULL );
  return rNONE;
}

