#include <string.h>
#include "mud.hpp"
#include "character.hpp"
#include "editor.hpp"
#include "skill.hpp"
#include "pcdata.hpp"

void do_oset( Character *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char arg3[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];
  char outbuf[MAX_STRING_LENGTH];
  Object *obj = NULL, *tmpobj = NULL;
  ExtraDescription *ed = NULL;
  bool lockobj = false;
  char *origarg = argument;

  int value, tmp;

  if ( IsNpc( ch ) )
    {
      SendToCharacter( "Mob's can't oset\r\n", ch );
      return;
    }

  if ( !ch->Desc )
    {
      SendToCharacter( "You have no descriptor\r\n", ch );
      return;
    }

  switch( ch->SubState )
    {
    default:
      break;

    case SUB_OBJ_EXTRA:
      if ( !ch->dest_buf )
        {
	  SendToCharacter( "Fatal error: report to Thoric.\r\n", ch );
          Bug( "do_oset: sub_obj_extra: NULL ch->dest_buf", 0 );
          ch->SubState = SUB_NONE;
          return;
        }
      /*
       * hopefully the object didn't get extracted...
       * if you're REALLY paranoid, you could always go through
       * the object and index-object lists, searching through the
       * extra_descr lists for a matching pointer...
       */
      ed  = (ExtraDescription*)ch->dest_buf;
      FreeMemory( ed->Description );
      ed->Description = CopyBuffer( ch );
      tmpobj = (Object*)ch->spare_ptr;
      StopEditing( ch );
      ch->dest_buf = tmpobj;
      ch->SubState = (CharacterSubState)ch->tempnum;
      return;

    case SUB_OBJ_LONG:
      if ( !ch->dest_buf )
        {
          SendToCharacter( "Fatal error: report to Thoric.\r\n", ch );
          Bug( "do_oset: sub_obj_long: NULL ch->dest_buf", 0 );
          ch->SubState = SUB_NONE;
          return;
        }

      obj = (Object*)ch->dest_buf;

      if ( obj && IsObjectExtracted(obj) )
        {
          SendToCharacter( "Your object was extracted!\r\n", ch );
          StopEditing( ch );
          return;
        }

      FreeMemory( obj->Description );
      obj->Description = CopyBuffer( ch );

      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
        {
          FreeMemory( obj->Prototype->Description );
          obj->Prototype->Description = CopyString( obj->Description );
	}

      tmpobj = (Object*)ch->spare_ptr;
      StopEditing( ch );
      ch->SubState = (CharacterSubState)ch->tempnum;
      ch->dest_buf = tmpobj;
      return;
    }

  obj = NULL;
  SmashTilde( argument );

  if ( ch->SubState == SUB_REPEATCMD )
    {
      obj = (Object*)ch->dest_buf;

      if ( obj && IsObjectExtracted(obj) )
        {
          SendToCharacter( "Your object was extracted!\r\n", ch );
          obj = NULL;
          argument = "done";
        }
      if ( IsNullOrEmpty( argument ) || !StrCmp( argument, " " )
           ||   !StrCmp( argument, "stat" ) )
        {
          if ( obj )
            do_ostat( ch, obj->Name );
          else
            SendToCharacter( "No object selected.  Type '?' for help.\r\n", ch );
          return;
        }
      if ( !StrCmp( argument, "done" ) || !StrCmp( argument, "off" ) )
        {
          SendToCharacter( "Oset mode off.\r\n", ch );
          ch->SubState = SUB_NONE;
          FreeMemory(ch->dest_buf);
	  
          if ( ch->PCData && ch->PCData->SubPrompt )
            FreeMemory( ch->PCData->SubPrompt );

	  return;
        }
    }
  if ( obj )
    {
      lockobj = true;
      strcpy( arg1, obj->Name );
      argument = OneArgument( argument, arg2 );
      strcpy( arg3, argument );
    }
  else
    {
      lockobj = false;
      argument = OneArgument( argument, arg1 );
      argument = OneArgument( argument, arg2 );
      strcpy( arg3, argument );
    }

  if ( IsNullOrEmpty( arg1 ) || IsNullOrEmpty( arg2 ) || !StrCmp( arg1, "?" ) )
    {
      if ( ch->SubState == SUB_REPEATCMD )
        {
          if ( obj )
            SendToCharacter( "Syntax: <field>  <value>\r\n",               ch );
          else
            SendToCharacter( "Syntax: <object> <field>  <value>\r\n",      ch );
        }
      else
        SendToCharacter( "Syntax: oset <object> <field>  <value>\r\n",     ch );
      SendToCharacter( "\r\n",                                             ch );
      SendToCharacter( "Field being one of:\r\n",                  ch );
      SendToCharacter( "  flags wear level weight cost rent timer\r\n",    ch );
      SendToCharacter( "  name short long desc ed rmed actiondesc\r\n",    ch );
      SendToCharacter( "  type value0 value1 value2 value3 value4 value5\r\n",     ch );
      SendToCharacter( "  affect rmaffect layers\r\n",                             ch );
      SendToCharacter( "For weapons:             For armor:\r\n",  ch );
      SendToCharacter( "  weapontype condition     ac condition\r\n",      ch );
      SendToCharacter( "  numdamdie sizedamdie                  \r\n",   ch );
      SendToCharacter( "  charges   maxcharges                  \r\n",   ch );
      SendToCharacter( "For potions, pills:\r\n",          ch );
      SendToCharacter( "  slevel spell1 spell2 spell3\r\n",                ch );
      SendToCharacter( "For devices:\r\n",                 ch );
      SendToCharacter( "  slevel spell maxcharges charges\r\n",            ch );
      SendToCharacter( "For salves:\r\n",                  ch );
      SendToCharacter( "  slevel spell1 spell2 maxdoses delay (keep low - delay is anoying)\r\n", ch);
      SendToCharacter( "For containers:          For levers and switches:\r\n", ch );
      SendToCharacter( "  cflags key capacity      tflags\r\n",            ch );
      SendToCharacter( "For rawspice:            For ammo and batteries:\r\n",             ch );
      SendToCharacter( "  spicetype  grade         charges (at least 1000 for ammo)\r\n", ch );
      SendToCharacter( "For crystals:\r\n",                ch );
      SendToCharacter( "  gemtype\r\n",            ch );
      return;
    }

  if ( !obj && GetTrustLevel(ch) <= LEVEL_IMMORTAL )
    {
      if ( ( obj = GetObjectHere( ch, arg1 ) ) == NULL )
        {
          SendToCharacter( "You can't find that here.\r\n", ch );
          return;
        }
    }
  else
    if ( !obj )
      {
        if ( ( obj = GetObjectAnywhere( ch, arg1 ) ) == NULL )
          {
            SendToCharacter( "There is nothing like that in all the realms.\r\n", ch );
            return;
          }
      }
  if ( lockobj )
    ch->dest_buf = obj;
  else
    FreeMemory(ch->dest_buf);

  SeparateOneObjectFromGroup( obj );
  value = atoi( arg3 );

  if ( !StrCmp( arg2, "value0" ) || !StrCmp( arg2, "v0" ) )
    {
      if ( !CanModifyObject( ch, obj ) )
        return;
      obj->Value[0] = value;
      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
        obj->Prototype->Value[0] = value;
      return;
    }

  if ( !StrCmp( arg2, "value1" ) || !StrCmp( arg2, "v1" ) )
    {
      if ( !CanModifyObject( ch, obj ) )
        return;
      obj->Value[1] = value;
      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
	obj->Prototype->Value[1] = value;
      return;
    }

  if ( !StrCmp( arg2, "value2" ) || !StrCmp( arg2, "v2" ) )
    {
      if ( !CanModifyObject( ch, obj ) )
        return;
      obj->Value[2] = value;
      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
        {
          obj->Prototype->Value[2] = value;
          if ( obj->ItemType == ITEM_WEAPON && value != 0 )
            obj->Value[2] = obj->Prototype->Value[1] * obj->Prototype->Value[2];
        }
      return;
    }

  if ( !StrCmp( arg2, "value3" ) || !StrCmp( arg2, "v3" ) )
    {
      if ( !CanModifyObject( ch, obj ) )
        return;
      obj->Value[3] = value;
      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
        obj->Prototype->Value[3] = value;
      return;
    }

  if ( !StrCmp( arg2, "value4" ) || !StrCmp( arg2, "v4" ) )
    {
      if ( !CanModifyObject( ch, obj ) )
        return;
      obj->Value[4] = value;
      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
        obj->Prototype->Value[4] = value;
      return;
    }

  if ( !StrCmp( arg2, "value5" ) || !StrCmp( arg2, "v5" ) )
    {
      if ( !CanModifyObject( ch, obj ) )
        return;
      obj->Value[5] = value;
      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
        obj->Prototype->Value[5] = value;
      return;
    }

  if ( !StrCmp( arg2, "type" ) )
    {
      if ( !CanModifyObject( ch, obj ) )
        return;
      
      if ( IsNullOrEmpty( argument ) )
        {
          SendToCharacter( "Usage: oset <object> type <type>\r\n", ch );
          SendToCharacter( "Possible Types:\r\n", ch );
          SendToCharacter( "None        Light\r\n", ch );
          SendToCharacter( "Treasure    Armor      Comlink    Fabric      Grenade\r\n", ch );
          SendToCharacter( "Furniture   Trash      Container  Drink_con   Landmine\r\n", ch );
          SendToCharacter( "Key         Food       Money      Pen         Fuel\r\n", ch );
          SendToCharacter( "Fountain    Pill       Weapon     Medpac      Missile\r\n", ch );
          SendToCharacter( "Fire        Book       Superconductor         Rare_metal\r\n", ch );
          SendToCharacter( "Switch      Lever      Button     Dial        Government\r\n", ch );
          SendToCharacter( "Trap        Map        Portal     Paper       Magnet\r\n", ch );
          SendToCharacter( "Lockpick    Shovel     Thread     Smut        Ammo\r\n", ch );
          SendToCharacter( "Rawspice    Lens       Crystal    Duraplast   Battery\r\n", ch );
          SendToCharacter( "Toolkit     Durasteel  Oven       Mirror      Circuit\r\n", ch );
          SendToCharacter( "Potion      Salve      Pill       Device      Spacecraft\r\n", ch );
          SendToCharacter( "Bolt        Chemical\r\n", ch );
          return;
        }
      value = GetObjectType( argument );
      if ( value < 1 )
        {
          Echo( ch, "Unknown type: %s\r\n", arg3 );
          return;
        }
      obj->ItemType = (ItemTypes) value;

      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
        obj->Prototype->ItemType = obj->ItemType;

      return;
    }

  if ( !StrCmp( arg2, "flags" ) )
    {
      if ( !CanModifyObject( ch, obj ) )
        return;
      
      if ( IsNullOrEmpty( argument ) )
        {
          SendToCharacter( "Usage: oset <object> flags <flag> [flag]...\r\n", ch );
	  SendToCharacter( "glow, dark, magic, bless, antievil, noremove, antisith, antisoldier,\r\n",
			ch );
          SendToCharacter( "donation, covering, hum, invis, nodrop, antigood, antipilot, anticitizen\r\n", ch );
          SendToCharacter( "antineutral, inventory, antithief, antijedi, clanobject, antihunter\r\n",
			ch );
          SendToCharacter( "small_size, human_size, large_size, hutt_size, contraband\r\n", ch );
          return;
        }

      while ( !IsNullOrEmpty( argument ) )
        {
          argument = OneArgument( argument, arg3 );
          value = GetObjectFlag( arg3 );
	  
          if ( value < 0 || value > 31 )
            Echo( ch, "Unknown flag: %s\r\n", arg3 );
          else
            {
              ToggleBit(obj->Flags, 1 << value);

	      if ( 1 << value == ITEM_PROTOTYPE )
                obj->Prototype->Flags = obj->Flags;
            }
        }
      
      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
        obj->Prototype->Flags = obj->Flags;

      return;
    }

  if ( !StrCmp( arg2, "wear" ) )
    {
      if ( !CanModifyObject( ch, obj ) )
        return;
      if ( IsNullOrEmpty( argument ))
        {
          SendToCharacter( "Usage: oset <object> wear <flag> [flag]...\r\n", ch );
          SendToCharacter( "Possible locations:\r\n", ch );
          SendToCharacter( "take   finger   neck    body    head   legs\r\n", ch );
          SendToCharacter( "feet   hands    arms    shield  about  waist\r\n", ch );
          SendToCharacter( "wrist  wield    hold    ears    eyes   floating\r\n", ch );
          SendToCharacter( "over\r\n", ch );
          return;
        }
      
      while ( !IsNullOrEmpty( argument ) )
        {
          argument = OneArgument( argument, arg3 );
          value = GetWearFlag( arg3 );

	  if ( value < 0 || static_cast<size_t>(value) >= MAX_BIT )
            Echo( ch, "Unknown flag: %s\r\n", arg3 );
          else
            ToggleBit( obj->WearFlags, 1 << value );
        }

      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
        obj->Prototype->WearFlags = obj->WearFlags;
      return;
    }

  if ( !StrCmp( arg2, "level" ) )
    {
      if ( !CanModifyObject( ch, obj ) )
        return;
      obj->Level = value;
      return;
    }

  if ( !StrCmp( arg2, "weight" ) )
    {
      if ( !CanModifyObject( ch, obj ) )
        return;
      obj->Weight = value;
      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
        obj->Prototype->Weight = value;
      return;
    }

  if ( !StrCmp( arg2, "cost" ) )
    {
      if ( !CanModifyObject( ch, obj ) )
        return;
      obj->Cost = value;
      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
        obj->Prototype->Cost = value;
      return;
    }

  if ( !StrCmp( arg2, "rent" ) )
    {
      if ( !CanModifyObject( ch, obj ) )
        return;
      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
        obj->Prototype->Rent = value;
      else
        SendToCharacter( "Item must have prototype flag to set this value.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "layers" ) )
    {
      if ( !CanModifyObject( ch, obj ) )
        return;
      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
        obj->Prototype->Layers = value;
      else
        SendToCharacter( "Item must have prototype flag to set this value.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "timer" ) )
    {
      if ( !CanModifyObject( ch, obj ) )
        return;
      obj->Timer = value;
      return;
    }

  if ( !StrCmp( arg2, "name" ) )
    {
      if ( !CanModifyObject( ch, obj ) )
        return;
      FreeMemory( obj->Name );
      obj->Name = CopyString( arg3 );
      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
        {
          FreeMemory(obj->Prototype->Name );
          obj->Prototype->Name = CopyString( obj->Name );
        }
      return;
    }

  if ( !StrCmp( arg2, "short" ) )
    {
      FreeMemory( obj->ShortDescr );
      obj->ShortDescr = CopyString( arg3 );
      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
        {
          FreeMemory(obj->Prototype->ShortDescr );
	  obj->Prototype->ShortDescr = CopyString( obj->ShortDescr );
        }
      else
        /* Feature added by Narn, Apr/96
         * If the item is not proto, add the word 'rename' to the keywords
         * if it is not already there.
         */
        {
          if ( StringInfix( "rename", obj->Name ) )
            {
              sprintf( buf, "%s %s", obj->Name, "rename" );
              FreeMemory( obj->Name );
              obj->Name = CopyString( buf );
            }
        }
      return;
    }

  if ( !StrCmp( arg2, "actiondesc" ) )
    {
      if ( strstr( arg3, "%n" )
           ||   strstr( arg3, "%d" )
           ||   strstr( arg3, "%l" ) )
        {
          SendToCharacter( "Illegal characters!\r\n", ch );
          return;
        }
      FreeMemory( obj->ActionDescription );
      obj->ActionDescription = CopyString( arg3 );
      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
        {
          FreeMemory(obj->Prototype->ActionDescription );
          obj->Prototype->ActionDescription = CopyString( obj->ActionDescription );
        }
      return;
    }

  if ( !StrCmp( arg2, "long" ) )
    {
      if ( arg3[0] )
        {
          FreeMemory( obj->Description );
          obj->Description = CopyString( arg3 );
          if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
            {
	      FreeMemory(obj->Prototype->Description );
              obj->Prototype->Description = CopyString( obj->Description );
            }
          return;
        }
      CHECK_SUBRESTRICTED( ch );
      if ( ch->SubState == SUB_REPEATCMD )
        ch->tempnum = SUB_REPEATCMD;
      else
        ch->tempnum = SUB_NONE;
      if ( lockobj )
        ch->spare_ptr = obj;
      else
        ch->spare_ptr = NULL;
      ch->SubState = SUB_OBJ_LONG;
      ch->dest_buf = obj;
      StartEditing( ch, obj->Description );
      SetEditorDescription( ch, "Object %d (%s) long description",
			    obj->Prototype->Vnum, obj->Name );
      return;
    }

  if ( !StrCmp( arg2, "affect" ) )
    {
      Affect *paf;
      short loc;
      int bitv;

      argument = OneArgument( argument, arg2 );
      
      if ( IsNullOrEmpty( arg2 ) || IsNullOrEmpty( argument ) )
        {
          SendToCharacter( "Usage: oset <object> affect <field> <value>\r\n", ch );
          SendToCharacter( "Affect Fields:\r\n", ch );
          SendToCharacter( "none        strength    dexterity   intelligence  wisdom       constitution\r\n", ch );
          SendToCharacter( "sex         level       age         height        weight       force\r\n",
			ch );
          SendToCharacter( "hit         move        credits     experience    armor        hitroll\r\n", ch );
          SendToCharacter( "damroll     save_para   save_rod    save_poison   save_breath  save_power\r\n", ch );
          SendToCharacter( "charisma    resistant   immune      susceptible   affected     luck\r\n",
			ch );
          SendToCharacter( "backstab    pick        track       steal         sneak        hide\r\n",
			ch );
          SendToCharacter( "detrap      dodge       peek        scan          gouge        search\r\n", ch );
	  SendToCharacter( "mount       disarm      kick        parry         bash         stun\r\n",
			ch );
          SendToCharacter( "punch       climb       grip        scribe        brew\r\n", ch );
          return;
        }
      loc = GetAffectType( arg2 );
      if ( loc < 1 )
        {
          Echo( ch, "Unknown field: %s\r\n", arg2 );
          return;
        }
      if ( loc >= APPLY_AFFECT && loc < APPLY_WEAPONSPELL )
        {
          bitv = 0;
	  
          while ( !IsNullOrEmpty( argument ) )
            {
              argument = OneArgument( argument, arg3 );
              if ( loc == APPLY_AFFECT )
                value = GetAffectFlag( arg3 );
              else
                value = GetResistanceFlag( arg3 );
              if ( value < 0 || value > 31 )
                Echo( ch, "Unknown flag: %s\r\n", arg3 );
              else
                SetBit( bitv, 1 << value );
            }
          if ( !bitv )
            return;
          value = bitv;
        }
      else
        {
          argument = OneArgument( argument, arg3 );
          value = atoi( arg3 );
        }
      AllocateMemory( paf, Affect, 1 );
      paf->Type         = -1;
      paf->Duration             = -1;
      paf->Location             = loc;
      paf->Modifier             = value;

      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
        LINK( paf, obj->Prototype->FirstAffect,
              obj->Prototype->LastAffect, Next, Previous );
      else
        LINK( paf, obj->FirstAffect, obj->LastAffect, Next, Previous );

      ++top_affect;
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "rmaffect" ) )
    {
      Affect *paf;
      short loc, count;

      if ( IsNullOrEmpty( argument ) )
        {
          SendToCharacter( "Usage: oset <object> rmaffect <affect#>\r\n", ch );
          return;
        }
      loc = atoi( argument );
      if ( loc < 1 )
        {
          SendToCharacter( "Invalid number.\r\n", ch );
          return;
        }

      count = 0;

      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
        {
          ProtoObject *pObjIndex;

          pObjIndex = obj->Prototype;
          for ( paf = pObjIndex->FirstAffect; paf; paf = paf->Next )
            {
              if ( ++count == loc )
                {
                  UNLINK( paf, pObjIndex->FirstAffect, pObjIndex->LastAffect, Next, Previous );
                  FreeMemory( paf );
                  SendToCharacter( "Removed.\r\n", ch );
                  --top_affect;
                  return;
                }
            }
          SendToCharacter( "Not found.\r\n", ch );
          return;
        }
      else
        {
          for ( paf = obj->FirstAffect; paf; paf = paf->Next )
            {
              if ( ++count == loc )
                {
                  UNLINK( paf, obj->FirstAffect, obj->LastAffect, Next, Previous );
                  FreeMemory( paf );
                  SendToCharacter( "Removed.\r\n", ch );
                  --top_affect;
                  return;
                }
            }
          SendToCharacter( "Not found.\r\n", ch );
          return;
        }
    }

  if ( !StrCmp( arg2, "ed" ) )
    {
      if ( IsNullOrEmpty( arg3 ) )
        {
          SendToCharacter( "Syntax: oset <object> ed <keywords>\r\n",
                        ch );
          return;
        }
      CHECK_SUBRESTRICTED( ch );
      if ( obj->Timer )
        {
          SendToCharacter("It's not safe to edit an extra description on an object with a timer.\r\nTurn it off first.\r\n", ch );
          return;
        }
      if ( obj->ItemType == ITEM_PAPER )
        {
          SendToCharacter("You can not add an extra description to a note paper at the moment.\r\n", ch);
          return;
        }
      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
        ed = SetOExtraProto( obj->Prototype, arg3 );
      else
        ed = SetOExtra( obj, arg3 );
      if ( ch->SubState == SUB_REPEATCMD )
        ch->tempnum = SUB_REPEATCMD;
      else
        ch->tempnum = SUB_NONE;
      if ( lockobj )
        ch->spare_ptr = obj;
      else
        ch->spare_ptr = NULL;
      ch->SubState = SUB_OBJ_EXTRA;
      ch->dest_buf = ed;
      StartEditing( ch, ed->Description );
      SetEditorDescription( ch, "Object %d (%s) extra description: %s",
			    obj->Prototype->Vnum, obj->Name, arg3 );
      return;
    }

  if ( !StrCmp( arg2, "desc" ) )
    {
      CHECK_SUBRESTRICTED( ch );
      if ( obj->Timer )
        {
          SendToCharacter("It's not safe to edit a description on an object with a timer.\r\nTurn it off first.\r\n", ch );
          return;
        }
      if ( obj->ItemType == ITEM_PAPER )
        {
          SendToCharacter("You can not add a description to a note paper at the moment.\r\n", ch);
          return;
        }
      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
        ed = SetOExtraProto( obj->Prototype, obj->Name );
      else
        ed = SetOExtra( obj, obj->Name );
      if ( ch->SubState == SUB_REPEATCMD )
        ch->tempnum = SUB_REPEATCMD;
      else
        ch->tempnum = SUB_NONE;
      if ( lockobj )
        ch->spare_ptr = obj;
      else
        ch->spare_ptr = NULL;
      ch->SubState = SUB_OBJ_EXTRA;
      ch->dest_buf = ed;
      StartEditing( ch, ed->Description );
      SetEditorDescription( ch, "Object %d (%s) description",
                            obj->Prototype->Vnum, obj->Name );
      return;
    }

  if ( !StrCmp( arg2, "rmed" ) )
    {
      if ( IsNullOrEmpty( arg3 ) )
        {
          SendToCharacter( "Syntax: oset <object> rmed <keywords>\r\n", ch );
          return;
        }
      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
        {
          if ( DelOExtraProto( obj->Prototype, arg3 ) )
            SendToCharacter( "Deleted.\r\n", ch );
          else
            SendToCharacter( "Not found.\r\n", ch );
          return;
        }
      if ( DelOExtra( obj, arg3 ) )
        SendToCharacter( "Deleted.\r\n", ch );
      else
        SendToCharacter( "Not found.\r\n", ch );
      return;
    }
  /*
   * save some finger-leather
   */
  if ( !StrCmp( arg2, "ris" ) )
    {
      sprintf(outbuf, "%s affect resistant %s", arg1, arg3);
      do_oset( ch, outbuf );
      sprintf(outbuf, "%s affect immune %s", arg1, arg3);
      do_oset( ch, outbuf );
      sprintf(outbuf, "%s affect susceptible %s", arg1, arg3);
      do_oset( ch, outbuf );
      return;
    }

  if ( !StrCmp( arg2, "r" ) )
    {
      sprintf(outbuf, "%s affect resistant %s", arg1, arg3);
      do_oset( ch, outbuf );
      return;
    }

  if ( !StrCmp( arg2, "i" ) )
    {
      sprintf(outbuf, "%s affect immune %s", arg1, arg3);
      do_oset( ch, outbuf );
      return;
    }
  if ( !StrCmp( arg2, "s" ) )
    {
      sprintf(outbuf, "%s affect susceptible %s", arg1, arg3);
      do_oset( ch, outbuf );
      return;
    }

  if ( !StrCmp( arg2, "ri" ) )
    {
      sprintf(outbuf, "%s affect resistant %s", arg1, arg3);
      do_oset( ch, outbuf );
      sprintf(outbuf, "%s affect immune %s", arg1, arg3);
      do_oset( ch, outbuf );
      return;
    }

  if ( !StrCmp( arg2, "rs" ) )
    {
      sprintf(outbuf, "%s affect resistant %s", arg1, arg3);
      do_oset( ch, outbuf );
      sprintf(outbuf, "%s affect susceptible %s", arg1, arg3);
      do_oset( ch, outbuf );
      return;
    }

  if ( !StrCmp( arg2, "is" ) )
    {
      sprintf(outbuf, "%s affect immune %s", arg1, arg3);
      do_oset( ch, outbuf );
      sprintf(outbuf, "%s affect susceptible %s", arg1, arg3);
      do_oset( ch, outbuf );
      return;
    }

  /*
   * Make it easier to set special object values by name than number
   *                                            -Thoric
   */
  tmp = -1;
  switch( obj->ItemType )
    {
    case ITEM_WEAPON:
      if ( !StrCmp( arg2, "weapontype" ) )
        {
          value = GetWeaponType( arg3 );

          if ( value < 0 )
            {
              size_t x = 0;

              SendToCharacter( "Unknown weapon type.\r\n", ch );
              SendToCharacter( "\r\nChoices:\r\n", ch );
              SendToCharacter( "   ", ch );

              for( x = 0; x < GetWeaponTableSize(); ++x )
                {
                  SendToCharacter( GetWeaponTypeName( x ), ch );
                }

              SendToCharacter( "\r\n", ch );

              return;
            }
          tmp = 3;
          break;
        }
      if ( !StrCmp( arg2, "condition" ) )      tmp = 0;
      if ( !StrCmp( arg2, "numdamdie" ) )        tmp = 1;
      if ( !StrCmp( arg2, "sizedamdie" ) )       tmp = 2;
      if ( !StrCmp( arg2, "charges" ) )          tmp = 4;
      if ( !StrCmp( arg2, "maxcharges" ) )       tmp = 5;
      if ( !StrCmp( arg2, "charge" ) )          tmp = 4;
      if ( !StrCmp( arg2, "maxcharge" ) )       tmp = 5;
      break;
    case ITEM_BOLT:
    case ITEM_AMMO:
      if ( !StrCmp( arg2, "charges" ) )          tmp = 0;
      if ( !StrCmp( arg2, "charge" ) )          tmp = 0;
      break;
    case ITEM_BATTERY:
      if ( !StrCmp( arg2, "charges" ) )          tmp = 0;
      if ( !StrCmp( arg2, "charge" ) )          tmp = 0;
      break;
    case ITEM_RAWSPICE:
    case ITEM_SPICE:
      if ( !StrCmp( arg2, "grade" ) )          tmp = 1;
      if ( !StrCmp( arg2, "spicetype" ) )
        {
          value = GetSpiceType( arg3 );

          if ( value < 0 )
            {
              size_t x = 0;

              SendToCharacter( "Unknown spice type.\r\n", ch );
              SendToCharacter( "\r\nChoices:\r\n", ch );
              SendToCharacter( "   ", ch );

              for( x = 0; x < GetSpiceTableSize(); ++x )
                {
                  SendToCharacter( GetSpiceTypeName( x ), ch );
                }

              SendToCharacter( "\r\n", ch );
              return;
            }
          tmp = 0;
          break;
        }
      break;
    case ITEM_CRYSTAL:
      if ( !StrCmp( arg2, "gemtype" ) )
        {
          value = GetCrystalType( arg3 );

          if ( value < 0 )
            {
              size_t x = 0;

              SendToCharacter( "Unknown gem type.\r\n", ch );
              SendToCharacter( "\r\nChoices:\r\n", ch );
              SendToCharacter( "   ", ch );

              for( x = 0; x < GetCrystalTableSize(); ++x )
                {
                  SendToCharacter( GetCrystalTypeName( x ), ch );
                }

              SendToCharacter( "\r\n", ch );
              return;
            }
	  tmp = 0;
          break;
        }
      break;
    case ITEM_ARMOR:
      if ( !StrCmp( arg2, "condition" ) )      tmp = 0;
      if ( !StrCmp( arg2, "ac" )       )               tmp = 1;
      break;
    case ITEM_SALVE:
      if ( !StrCmp( arg2, "slevel"   ) )               tmp = 0;
      if ( !StrCmp( arg2, "maxdoses" ) )               tmp = 1;
      if ( !StrCmp( arg2, "doses"    ) )               tmp = 2;
      if ( !StrCmp( arg2, "delay"    ) )               tmp = 3;
      if ( !StrCmp( arg2, "spell1"   ) )               tmp = 4;
      if ( !StrCmp( arg2, "spell2"   ) )               tmp = 5;
      if ( tmp >=4 && tmp <= 5 )                        value = LookupSkill(arg3);
      break;
    case ITEM_POTION:
    case ITEM_PILL:
      if ( !StrCmp( arg2, "slevel" ) )         tmp = 0;
      if ( !StrCmp( arg2, "spell1" ) )         tmp = 1;
      if ( !StrCmp( arg2, "spell2" ) )         tmp = 2;
      if ( !StrCmp( arg2, "spell3" ) )         tmp = 3;
      if ( tmp >=1 && tmp <= 3 )                        value = LookupSkill(arg3);
      break;
    case ITEM_DEVICE:
      if ( !StrCmp( arg2, "slevel" ) )         tmp = 0;
      if ( !StrCmp( arg2, "spell" ) )
        {
          tmp = 3;
          value = LookupSkill(arg3);
        }
      if ( !StrCmp( arg2, "maxcharges" )       )       tmp = 1;
      if ( !StrCmp( arg2, "charges" ) )                tmp = 2;
      break;
    case ITEM_CONTAINER:
      if ( !StrCmp( arg2, "capacity" ) )               tmp = 0;
      if ( !StrCmp( arg2, "cflags" ) )         tmp = 1;
      if ( !StrCmp( arg2, "key" ) )            tmp = 2;
      break;
    case ITEM_SWITCH:
    case ITEM_LEVER:
    case ITEM_BUTTON:
      if ( !StrCmp( arg2, "tflags" ) )
        {
	  tmp = 0;
          value = GetTrapTriggerFlag(arg3);
        }
      break;

    default:
      break;
    }
  if ( tmp >= 0 && tmp <= 5 )
    {
      if ( !CanModifyObject( ch, obj ) )
        return;
      obj->Value[tmp] = value;
      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
        obj->Prototype->Value[tmp] = value;
      return;
    }

  /*
   * Generate usage message.
   */
  if ( ch->SubState == SUB_REPEATCMD )
    {
      ch->SubState = SUB_RESTRICTED;
      Interpret( ch, origarg );
      ch->SubState = SUB_REPEATCMD;
      ch->LastCommand = do_oset;
    }
  else
    do_oset( ch, "" );
  return;
}
