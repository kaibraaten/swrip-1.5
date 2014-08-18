#include "character.h"
#include "mud.h"

extern char *spell_target_name;

ch_ret spell_remove_trap( int sn, int level, Character *ch, void *vo )
{
  Object *obj;
  Object *trap;
  bool found;
  int retcode;
  SKILLTYPE *skill = get_skilltype(sn);

  if ( !spell_target_name || spell_target_name[0] == '\0' )
    {
      send_to_char( "Remove trap on what?\r\n", ch );
      return rSPELL_FAILED;
    }

  found = false;

  if ( !ch->in_room->first_content )
    {
      send_to_char( "You can't find that here.\r\n", ch );
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
      send_to_char( "You can't find that here.\r\n", ch );
      return rSPELL_FAILED;
    }

  if ( (trap = get_trap( obj )) == NULL )
    {
      failed_casting( skill, ch, NULL, NULL );
      return rSPELL_FAILED;
    }


  if ( chance(ch, 70 + GetCurrentWisdom(ch)) )
    {
      send_to_char( "Ooops!\r\n", ch );
      retcode = spring_trap(ch, trap);
      if ( retcode == rNONE )
        retcode = rSPELL_FAILED;
      return retcode;
    }

  extract_obj( trap );

  successful_casting( skill, ch, NULL, NULL );
  return rNONE;
}
