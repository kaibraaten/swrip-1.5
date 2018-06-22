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

  if ( IsNullOrEmpty( arg ) )
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

  Echo( ch, "Name: %s.\r\n", obj->Name );

  pdesc=GetExtraDescription(arg, obj->FirstExtraDescription);

  if ( !pdesc )
    pdesc=GetExtraDescription(arg, obj->Prototype->FirstExtraDescription);
  if ( !pdesc )
    pdesc = GetExtraDescription( obj->Name, obj->FirstExtraDescription );
  if ( !pdesc )
    pdesc = GetExtraDescription( obj->Name, obj->Prototype->FirstExtraDescription );
  if ( pdesc )
    SendToCharacter( pdesc, ch );


  Echo( ch, "Vnum: %d.  Type: %s.  Count: %d  Gcount: %d\r\n",
             obj->Prototype->Vnum, GetItemTypeName( obj ), obj->Prototype->Count,
             obj->Count );

  Echo( ch, "Serial#: %d  TopIdxSerial#: %d  TopSerial#: %d\r\n",
             obj->Serial, obj->Prototype->Serial, cur_obj_serial );

  Echo( ch, "Short description: %s.\r\nLong description: %s\r\n",
             obj->ShortDescr, obj->Description );

  if ( !IsNullOrEmpty( obj->ActionDescription ) )
    Echo( ch, "Action description: %s.\r\n", obj->ActionDescription );

  Echo( ch, "Wear flags : %s\r\n", FlagString(obj->WearFlags, WearFlags) );
  Echo( ch, "Extra flags: %s\r\n", FlagString(obj->Flags, ObjectFlags) );

  Echo( ch, "Number: %d/%d.  Weight: %d/%d.  Layers: %d\r\n",
             1,           GetObjectCount( obj ),
             obj->Weight, GetObjectWeight( obj ), obj->Prototype->Layers );

  Echo( ch, "Cost: %d.  Rent: %d.  Timer: %d.  Level: %d.\r\n",
             obj->Cost, obj->Prototype->Rent, obj->Timer, obj->Level );

  Echo( ch,
             "In room: %d.  In object: %s.  Carried by: %s.  Wear_loc: %d.\r\n",
             obj->InRoom    == NULL    ?        0 : obj->InRoom->Vnum,
             obj->InObject     == NULL    ? "(none)" : obj->InObject->ShortDescr,
             obj->CarriedBy == NULL    ? "(none)" : obj->CarriedBy->Name,
             obj->WearLoc );

  Echo( ch, "Index Values : %d %d %d %d %d %d.\r\n",
             obj->Prototype->Value[0], obj->Prototype->Value[1],
             obj->Prototype->Value[2], obj->Prototype->Value[3],
             obj->Prototype->Value[4], obj->Prototype->Value[5] );
  Echo( ch, "Object Values: %d %d %d %d %d %d.\r\n",
             obj->Value[0], obj->Value[1], obj->Value[2], obj->Value[3], obj->Value[4], obj->Value[5] );

  if ( obj->Prototype->FirstExtraDescription )
    {
      ExtraDescription *ed;

      SendToCharacter( "Primary description keywords:   '", ch );

      for ( ed = obj->Prototype->FirstExtraDescription; ed; ed = ed->Next )
        {
          SendToCharacter( ed->Keyword, ch );

          if ( ed->Next )
            SendToCharacter( " ", ch );
        }

      SendToCharacter( "'.\r\n", ch );
    }

  if ( obj->FirstExtraDescription )
    {
      ExtraDescription *ed;

      SendToCharacter( "Secondary description keywords: '", ch );

      for ( ed = obj->FirstExtraDescription; ed; ed = ed->Next )
        {
          SendToCharacter( ed->Keyword, ch );

          if ( ed->Next )
            SendToCharacter( " ", ch );
        }

      SendToCharacter( "'.\r\n", ch );
    }

  for ( paf = obj->FirstAffect; paf; paf = paf->Next )
    Echo( ch, "Affects %s by %d. (extra)\r\n",
               GetAffectLocationName( paf->Location ), paf->Modifier );

  for ( paf = obj->Prototype->FirstAffect; paf; paf = paf->Next )
    Echo( ch, "Affects %s by %d.\r\n",
               GetAffectLocationName( paf->Location ), paf->Modifier );
}
