#include <ctype.h>
#include "mud.h"
#include "character.h"

extern char *spell_target_name;

ch_ret spell_locate_object( int sn, int level, CHAR_DATA *ch, void *vo )
{
  char buf[MAX_INPUT_LENGTH];
  OBJ_DATA *obj;
  OBJ_DATA *in_obj;
  bool found;
  int cnt;

  found = FALSE;
  for ( obj = first_object; obj; obj = obj->next )
    {
      if ( !can_see_obj( ch, obj ) || !nifty_is_name( spell_target_name, obj->name ) )
        continue;
      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) && !IS_IMMORTAL(ch) )
        continue;

      found = TRUE;

      for ( cnt = 0, in_obj = obj;
            in_obj->in_obj && cnt < 100;
            in_obj = in_obj->in_obj, ++cnt )
        ;
      if ( cnt >= MAX_NEST )
        {
          sprintf( buf, "spell_locate_obj: object [%d] %s is nested more than %d times!",
                   obj->pIndexData->vnum, obj->short_descr, MAX_NEST );
          bug( buf, 0 );
          continue;
        }

      if ( in_obj->carried_by )
        {
          if ( IS_IMMORTAL( in_obj->carried_by )
               && !IS_NPC( in_obj->carried_by )
               && ( get_trust( ch ) < in_obj->carried_by->pcdata->wizinvis )
	       && IS_SET( in_obj->carried_by->act, PLR_WIZINVIS ) )
            continue;

          sprintf( buf, "%s carried by %s.\r\n",
                   obj_short(obj), PERS(in_obj->carried_by, ch) );
        }
      else
        {
          sprintf( buf, "%s in %s.\r\n",
                   obj_short(obj), in_obj->in_room == NULL
                   ? "somewhere" : in_obj->in_room->name );
        }

      buf[0] = UPPER(buf[0]);
      set_char_color( AT_MAGIC, ch );
      send_to_char( buf, ch );
    }

  if ( !found )
    {
      send_to_char( "Nothing like that exists.\r\n", ch );
      return rSPELL_FAILED;
    }
  return rNONE;
}
