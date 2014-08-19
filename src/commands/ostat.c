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
      SendToCharacter( "Ostat what?\r\n", ch );
      return;
    }
  if ( arg[0] != '\'' && arg[0] != '"' && strlen(argument) > strlen(arg) )
    strcpy( arg, argument );

  if ( ( obj = GetObjectAnywhere( ch, arg ) ) == NULL )
    {
      SendToCharacter( "Nothing like that in hell, earth, or heaven.\r\n", ch );
      return;
    }

  ChPrintf( ch, "Name: %s.\r\n",
             obj->name );

  pdesc=GetExtraDescription(arg, obj->first_extradesc);
  if ( !pdesc )
    pdesc=GetExtraDescription(arg, obj->Prototype->first_extradesc);
  if ( !pdesc )
    pdesc = GetExtraDescription( obj->name, obj->first_extradesc );
  if ( !pdesc )
    pdesc = GetExtraDescription( obj->name, obj->Prototype->first_extradesc );
  if ( pdesc )
    SendToCharacter( pdesc, ch );


  ChPrintf( ch, "Vnum: %d.  Type: %s.  Count: %d  Gcount: %d\r\n",
             obj->Prototype->vnum, GetItemTypeName( obj ), obj->Prototype->count,
             obj->count );

  ChPrintf( ch, "Serial#: %d  TopIdxSerial#: %d  TopSerial#: %d\r\n",
             obj->serial, obj->Prototype->serial, cur_obj_serial );

  ChPrintf( ch, "Short description: %s.\r\nLong description: %s\r\n",
             obj->short_descr, obj->description );

  if ( obj->action_desc[0] != '\0' )
    ChPrintf( ch, "Action description: %s.\r\n", obj->action_desc );

  ChPrintf( ch, "Wear flags : %s\r\n", FlagString(obj->wear_flags, wear_flags) );
  ChPrintf( ch, "Extra flags: %s\r\n", FlagString(obj->extra_flags, object_flags) );

  ChPrintf( ch, "Number: %d/%d.  Weight: %d/%d.  Layers: %d\r\n",
             1,           GetObjectCount( obj ),
             obj->weight, GetObjectWeight( obj ), obj->Prototype->layers );

  ChPrintf( ch, "Cost: %d.  Rent: %d.  Timer: %d.  Level: %d.\r\n",
             obj->cost, obj->Prototype->rent, obj->timer, obj->level );

  ChPrintf( ch,
             "In room: %d.  In object: %s.  Carried by: %s.  Wear_loc: %d.\r\n",
             obj->in_room    == NULL    ?        0 : obj->in_room->vnum,
             obj->in_obj     == NULL    ? "(none)" : obj->in_obj->short_descr,
             obj->carried_by == NULL    ? "(none)" : obj->carried_by->name,
             obj->wear_loc );

  ChPrintf( ch, "Index Values : %d %d %d %d %d %d.\r\n",
             obj->Prototype->value[0], obj->Prototype->value[1],
             obj->Prototype->value[2], obj->Prototype->value[3],
             obj->Prototype->value[4], obj->Prototype->value[5] );
  ChPrintf( ch, "Object Values: %d %d %d %d %d %d.\r\n",
             obj->value[0], obj->value[1], obj->value[2], obj->value[3], obj->value[4], obj->value[5] );

  if ( obj->Prototype->first_extradesc )
    {
      ExtraDescription *ed;

      SendToCharacter( "Primary description keywords:   '", ch );

      for ( ed = obj->Prototype->first_extradesc; ed; ed = ed->next )
        {
          SendToCharacter( ed->keyword, ch );

          if ( ed->next )
            SendToCharacter( " ", ch );
        }

      SendToCharacter( "'.\r\n", ch );
    }

  if ( obj->first_extradesc )
    {
      ExtraDescription *ed;

      SendToCharacter( "Secondary description keywords: '", ch );

      for ( ed = obj->first_extradesc; ed; ed = ed->next )
        {
          SendToCharacter( ed->keyword, ch );

          if ( ed->next )
            SendToCharacter( " ", ch );
        }

      SendToCharacter( "'.\r\n", ch );
    }

  for ( paf = obj->first_affect; paf; paf = paf->next )
    ChPrintf( ch, "Affects %s by %d. (extra)\r\n",
               GetAffectLocationName( paf->location ), paf->modifier );

  for ( paf = obj->Prototype->first_affect; paf; paf = paf->next )
    ChPrintf( ch, "Affects %s by %d.\r\n",
               GetAffectLocationName( paf->location ), paf->modifier );
}
