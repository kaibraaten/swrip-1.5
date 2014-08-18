#include <string.h>
#include "mud.h"
#include "character.h"

void do_ostat( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Affect *paf = NULL;
  Object *obj = NULL;
  const char *pdesc = NULL;

  OneArgument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Ostat what?\r\n", ch );
      return;
    }
  if ( arg[0] != '\'' && arg[0] != '"' && strlen(argument) > strlen(arg) )
    strcpy( arg, argument );

  if ( ( obj = get_obj_world( ch, arg ) ) == NULL )
    {
      send_to_char( "Nothing like that in hell, earth, or heaven.\r\n", ch );
      return;
    }

  ch_printf( ch, "Name: %s.\r\n",
             obj->name );

  pdesc=get_extra_descr(arg, obj->first_extradesc);
  if ( !pdesc )
    pdesc=get_extra_descr(arg, obj->pIndexData->first_extradesc);
  if ( !pdesc )
    pdesc = get_extra_descr( obj->name, obj->first_extradesc );
  if ( !pdesc )
    pdesc = get_extra_descr( obj->name, obj->pIndexData->first_extradesc );
  if ( pdesc )
    send_to_char( pdesc, ch );


  ch_printf( ch, "Vnum: %d.  Type: %s.  Count: %d  Gcount: %d\r\n",
             obj->pIndexData->vnum, item_type_name( obj ), obj->pIndexData->count,
             obj->count );

  ch_printf( ch, "Serial#: %d  TopIdxSerial#: %d  TopSerial#: %d\r\n",
             obj->serial, obj->pIndexData->serial, cur_obj_serial );

  ch_printf( ch, "Short description: %s.\r\nLong description: %s\r\n",
             obj->short_descr, obj->description );

  if ( obj->action_desc[0] != '\0' )
    ch_printf( ch, "Action description: %s.\r\n", obj->action_desc );

  ch_printf( ch, "Wear flags : %s\r\n", FlagString(obj->wear_flags, wear_flags) );
  ch_printf( ch, "Extra flags: %s\r\n", FlagString(obj->extra_flags, object_flags) );

  ch_printf( ch, "Number: %d/%d.  Weight: %d/%d.  Layers: %d\r\n",
             1,           get_obj_number( obj ),
             obj->weight, get_obj_weight( obj ), obj->pIndexData->layers );

  ch_printf( ch, "Cost: %d.  Rent: %d.  Timer: %d.  Level: %d.\r\n",
             obj->cost, obj->pIndexData->rent, obj->timer, obj->level );

  ch_printf( ch,
             "In room: %d.  In object: %s.  Carried by: %s.  Wear_loc: %d.\r\n",
             obj->in_room    == NULL    ?        0 : obj->in_room->vnum,
             obj->in_obj     == NULL    ? "(none)" : obj->in_obj->short_descr,
             obj->carried_by == NULL    ? "(none)" : obj->carried_by->name,
             obj->wear_loc );

  ch_printf( ch, "Index Values : %d %d %d %d %d %d.\r\n",
             obj->pIndexData->value[0], obj->pIndexData->value[1],
             obj->pIndexData->value[2], obj->pIndexData->value[3],
             obj->pIndexData->value[4], obj->pIndexData->value[5] );
  ch_printf( ch, "Object Values: %d %d %d %d %d %d.\r\n",
             obj->value[0], obj->value[1], obj->value[2], obj->value[3], obj->value[4], obj->value[5] );

  if ( obj->pIndexData->first_extradesc )
    {
      ExtraDescription *ed;

      send_to_char( "Primary description keywords:   '", ch );

      for ( ed = obj->pIndexData->first_extradesc; ed; ed = ed->next )
        {
          send_to_char( ed->keyword, ch );

          if ( ed->next )
            send_to_char( " ", ch );
        }

      send_to_char( "'.\r\n", ch );
    }

  if ( obj->first_extradesc )
    {
      ExtraDescription *ed;

      send_to_char( "Secondary description keywords: '", ch );

      for ( ed = obj->first_extradesc; ed; ed = ed->next )
        {
          send_to_char( ed->keyword, ch );

          if ( ed->next )
            send_to_char( " ", ch );
        }

      send_to_char( "'.\r\n", ch );
    }

  for ( paf = obj->first_affect; paf; paf = paf->next )
    ch_printf( ch, "Affects %s by %d. (extra)\r\n",
               affect_loc_name( paf->location ), paf->modifier );

  for ( paf = obj->pIndexData->first_affect; paf; paf = paf->next )
    ch_printf( ch, "Affects %s by %d.\r\n",
               affect_loc_name( paf->location ), paf->modifier );
}
