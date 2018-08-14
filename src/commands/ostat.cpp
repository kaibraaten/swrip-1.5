#include <string.h>
#include "mud.hpp"
#include "character.hpp"
#include "room.hpp"
#include "object.hpp"

void do_ostat( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Affect *paf = NULL;
  Object *obj = NULL;
  const char *pdesc = NULL;

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      ch->Echo("Ostat what?\r\n");
      return;
    }
  if ( arg[0] != '\'' && arg[0] != '"' && strlen(argument) > strlen(arg) )
    strcpy( arg, argument );

  if ( ( obj = GetObjectAnywhere( ch, arg ) ) == NULL )
    {
      ch->Echo("Nothing like that in hell, earth, or heaven.\r\n");
      return;
    }

  ch->Echo("Name: %s.\r\n", obj->Name );

  pdesc=GetExtraDescription(arg, obj->FirstExtraDescription);

  if ( !pdesc )
    pdesc=GetExtraDescription(arg, obj->Prototype->FirstExtraDescription);
  if ( !pdesc )
    pdesc = GetExtraDescription( obj->Name, obj->FirstExtraDescription );
  if ( !pdesc )
    pdesc = GetExtraDescription( obj->Name, obj->Prototype->FirstExtraDescription );
  if ( pdesc )
    ch->Echo(pdesc);


  ch->Echo("Vnum: %d.  Type: %s.  Count: %d  Gcount: %d\r\n",
             obj->Prototype->Vnum, GetItemTypeName( obj ), obj->Prototype->Count,
             obj->Count );

  ch->Echo("Serial#: %d  TopIdxSerial#: %d  TopSerial#: %d\r\n",
             obj->Serial, obj->Prototype->Serial, cur_obj_serial );

  ch->Echo("Short description: %s.\r\nLong description: %s\r\n",
             obj->ShortDescr, obj->Description );

  if ( !IsNullOrEmpty( obj->ActionDescription ) )
    ch->Echo("Action description: %s.\r\n", obj->ActionDescription );

  ch->Echo("Wear flags : %s\r\n", FlagString(obj->WearFlags, WearFlags).c_str() );
  ch->Echo("Extra flags: %s\r\n", FlagString(obj->Flags, ObjectFlags).c_str() );

  ch->Echo("Number: %d/%d.  Weight: %d/%d.  Layers: %d\r\n",
             1,           GetObjectCount( obj ),
             obj->Weight, GetObjectWeight( obj ), obj->Prototype->Layers );

  ch->Echo("Cost: %d.  Rent: %d.  Timer: %d.  Level: %d.\r\n",
             obj->Cost, obj->Prototype->Rent, obj->Timer, obj->Level );

  ch->Echo("In room: %d.  In object: %s.  Carried by: %s.  Wear_loc: %d.\r\n",
           obj->InRoom    == NULL    ?        0 : obj->InRoom->Vnum,
           obj->InObject     == NULL    ? "(none)" : obj->InObject->ShortDescr,
           obj->CarriedBy == NULL    ? "(none)" : obj->CarriedBy->Name,
           obj->WearLoc );

  ch->Echo("Index Values : %d %d %d %d %d %d.\r\n",
             obj->Prototype->Value[0], obj->Prototype->Value[1],
             obj->Prototype->Value[2], obj->Prototype->Value[3],
             obj->Prototype->Value[4], obj->Prototype->Value[5] );
  ch->Echo("Object Values: %d %d %d %d %d %d.\r\n",
             obj->Value[0], obj->Value[1], obj->Value[2], obj->Value[3], obj->Value[4], obj->Value[5] );

  if ( obj->Prototype->FirstExtraDescription )
    {
      ExtraDescription *ed;

      ch->Echo("Primary description keywords:   '");

      for ( ed = obj->Prototype->FirstExtraDescription; ed; ed = ed->Next )
        {
          ch->Echo(ed->Keyword);

          if ( ed->Next )
            ch->Echo(" ");
        }

      ch->Echo("'.\r\n");
    }

  if ( obj->FirstExtraDescription )
    {
      ExtraDescription *ed;

      ch->Echo("Secondary description keywords: '");

      for ( ed = obj->FirstExtraDescription; ed; ed = ed->Next )
        {
          ch->Echo(ed->Keyword);

          if ( ed->Next )
            ch->Echo(" ");
        }

      ch->Echo("'.\r\n");
    }

  for ( paf = obj->FirstAffect; paf; paf = paf->Next )
    ch->Echo("Affects %s by %d. (extra)\r\n",
               GetAffectLocationName( paf->Location ), paf->Modifier );

  for ( paf = obj->Prototype->FirstAffect; paf; paf = paf->Next )
    ch->Echo("Affects %s by %d.\r\n",
               GetAffectLocationName( paf->Location ), paf->Modifier );
}

