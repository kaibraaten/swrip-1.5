#include "mud.h"

ch_ret spell_create_water( int sn, int level, Character *ch, void *vo )
{
  OBJ_DATA *obj = (OBJ_DATA *) vo;
  int water;

  if ( obj->item_type != ITEM_DRINK_CON )
    {
      send_to_char( "It is unable to hold water.\r\n", ch );
      return rSPELL_FAILED;
    }

  if ( obj->value[2] != LIQ_WATER && obj->value[1] != 0 )
    {
      send_to_char( "It contains some other liquid.\r\n", ch );
      return rSPELL_FAILED;
    }

  water = UMIN(
               level * (weather_info.sky >= SKY_RAINING ? 4 : 2),
               obj->value[0] - obj->value[1]
               );

  if ( water > 0 )
    {
      separate_obj(obj);
      obj->value[2] = LIQ_WATER;
      obj->value[1] += water;
      if ( !is_name( "water", obj->name ) )
        {
          char buf[MAX_STRING_LENGTH];

          sprintf( buf, "%s water", obj->name );
          STRFREE( obj->name );
          obj->name = STRALLOC( buf );
        }
      act( AT_MAGIC, "$p is filled.", ch, obj, NULL, TO_CHAR );
    }

  return rNONE;
}
