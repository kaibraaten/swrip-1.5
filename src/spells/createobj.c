#include "character.h"
#include "mud.h"

extern char *spell_target_name;

/*
 * Generic object creating spell                                -Thoric
 */
ch_ret spell_create_obj( int sn, int level, Character *ch, void *vo )
{
  SKILLTYPE *skill = get_skilltype(sn);
  int lvl;
  int vnum = skill->value;
  OBJ_DATA *obj;
  OBJ_INDEX_DATA *oi;

  switch( SPELL_POWER(skill) )
    {
    default:
    case SP_NONE:        lvl = 10;      break;
    case SP_MINOR:       lvl = 0;       break;
    case SP_GREATER: lvl = level/2; break;
    case SP_MAJOR:       lvl = level;   break;
    }

  /*
   * Add predetermined objects here
   */
  if ( vnum == 0 )
    {
      if ( !str_cmp( spell_target_name, "sword" ) )
        vnum = OBJ_VNUM_SCHOOL_SWORD;
      if ( !str_cmp( spell_target_name, "shield" ) )
        vnum = OBJ_VNUM_SCHOOL_SHIELD;
    }

  if ( (oi=get_obj_index(vnum)) == NULL
       ||   (obj=create_object(oi, lvl)) == NULL )
    {
      failed_casting( skill, ch, NULL, NULL );
      return rNONE;
    }
  obj->timer = skill->dice ? dice_parse( ch, level, skill->dice ) : 0;
  successful_casting( skill, ch, NULL, obj );
  if ( CAN_WEAR(obj, ITEM_TAKE) )
    obj_to_char( obj, ch );
  else
    obj_to_room( obj, ch->in_room );
  return rNONE;
}
