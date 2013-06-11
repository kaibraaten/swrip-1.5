#include "character.h"
#include "mud.h"

ch_ret spell_midas_touch( int sn, int level, Character *ch, void *vo )
{
  Character *victim;
  int val;
  OBJ_DATA *obj = (OBJ_DATA *) vo;

  separate_obj(obj);  /* nice, alty :) */

  if ( IS_OBJ_STAT( obj, ITEM_NODROP ) )
    {
      send_to_char( "You can't seem to let go of it.\r\n", ch );
      return rSPELL_FAILED;
    }

  if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE )
       &&   get_trust( ch ) < LEVEL_IMMORTAL )
    {
      send_to_char( "That item is not for mortal hands to touch!\r\n", ch );
      return rSPELL_FAILED;   /* Thoric */
    }

  if ( !CAN_WEAR(obj, ITEM_TAKE)
       || ( obj->item_type == ITEM_CORPSE_NPC)
       || ( obj->item_type == ITEM_DROID_CORPSE)
       || ( obj->item_type == ITEM_CORPSE_PC )
       )
    {
      send_to_char( "Your cannot seem to turn this item to gold!", ch);
      return rNONE;
    }

  val = obj->cost/2;
  val = UMAX(0, val);

  if(  obj->item_type==ITEM_WEAPON ){
    switch( number_bits(2) )
      {
      case 0: victim = get_char_world( ch, "shmalnoth");        break;
      case 1:
      case 2:
      case 3: victim = get_char_world( ch, "shmalnak" ); break;
      }
  } else if (  obj->item_type==ITEM_ARMOR ){
    switch( number_bits(2) )
      {
      case 0: victim = get_char_world( ch, "shmalnoth");        break;
      case 1:
      case 2:
      case 3: victim = get_char_world( ch, "crafter" ); break;
      }
  } else if (  obj->item_type==ITEM_SCROLL ){
    victim = get_char_world( ch, "tatorious" );
  } else if (  obj->item_type==ITEM_STAFF ){
    victim = get_char_world( ch, "tatorious" );
  } else if (  obj->item_type==ITEM_WAND ){
    victim = get_char_world( ch, "tatorious" );
  } else {
    victim = NULL;
  }

  if (  victim == NULL )
    {
      ch->gold += val;

      if ( obj_extracted(obj) )
        return rNONE;
      if ( cur_obj == obj->serial )
        global_objcode = rOBJ_SACCED;
      extract_obj( obj );
      send_to_char( "O.K.", ch);
      return rNONE;
    }


  if ( ( victim->carry_weight + get_obj_weight ( obj ) ) > can_carry_w(victim)
       ||       (IsNpc(victim) && IS_SET(victim->act, ACT_PROTOTYPE)))
    {
      ch->gold += val;

      if ( obj_extracted(obj) )
        return rNONE;
      if ( cur_obj == obj->serial )
        global_objcode = rOBJ_SACCED;
      extract_obj( obj );
      send_to_char( "O.K.", ch);
      return rNONE;
    }


  ch->gold += val;
  obj_from_char( obj );
  obj_to_char( obj, victim );

  send_to_char( "You transmogrify the item to gold!\r\n", ch );
  return rNONE;
}
