#include "character.h"
#include "mud.h"

extern char *spell_target_name;

ch_ret spell_remove_trap( int sn, int level, Character *ch, void *vo )
{
  Object *obj;
  Object *trap;
  bool found;
  int retcode;
  Skill *skill = get_skilltype(sn);

  if ( !spell_target_name || spell_target_name[0] == '\0' )
    {
      SendToCharacter( "Remove trap on what?\r\n", ch );
      return rSPELL_FAILED;
    }

  found = false;

  if ( !ch->in_room->first_content )
    {
      SendToCharacter( "You can't find that here.\r\n", ch );
      return rNONE;
    }

  for ( obj = ch->in_room->first_content; obj; obj = obj->next_content )
    if ( CanSeeObject( ch, obj ) && NiftyIsName( spell_target_name, obj->name ) )
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
