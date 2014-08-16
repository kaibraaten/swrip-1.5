#include <string.h>
#include "mud.h"
#include "character.h"
#include "editor.h"

void do_oset( Character *ch, char *argument )
{
  char arg1 [MAX_INPUT_LENGTH];
  char arg2 [MAX_INPUT_LENGTH];
  char arg3 [MAX_INPUT_LENGTH];
  char buf  [MAX_STRING_LENGTH];
  char outbuf  [MAX_STRING_LENGTH];
  OBJ_DATA *obj, *tmpobj;
  ExtraDescription *ed;
  bool lockobj;
  char *origarg = argument;

  int value, tmp;

  if ( IsNpc( ch ) )
    {
      send_to_char( "Mob's can't oset\r\n", ch );
      return;
    }

  if ( !ch->desc )
    {
      send_to_char( "You have no descriptor\r\n", ch );
      return;
    }

  switch( ch->substate )
    {
    default:
      break;

    case SUB_OBJ_EXTRA:
      if ( !ch->dest_buf )
        {
	  send_to_char( "Fatal error: report to Thoric.\r\n", ch );
          bug( "do_oset: sub_obj_extra: NULL ch->dest_buf", 0 );
          ch->substate = SUB_NONE;
          return;
        }
      /*
       * hopefully the object didn't get extracted...
       * if you're REALLY paranoid, you could always go through
       * the object and index-object lists, searching through the
       * extra_descr lists for a matching pointer...
       */
      ed  = (ExtraDescription*)ch->dest_buf;
      STRFREE( ed->description );
      ed->description = copy_buffer( ch );
      tmpobj = (OBJ_DATA*)ch->spare_ptr;
      stop_editing( ch );
      ch->dest_buf = tmpobj;
      ch->substate = ch->tempnum;
      return;

    case SUB_OBJ_LONG:
      if ( !ch->dest_buf )
        {
          send_to_char( "Fatal error: report to Thoric.\r\n", ch );
          bug( "do_oset: sub_obj_long: NULL ch->dest_buf", 0 );
          ch->substate = SUB_NONE;
          return;
        }

      obj = (OBJ_DATA*)ch->dest_buf;

      if ( obj && obj_extracted(obj) )
        {
          send_to_char( "Your object was extracted!\r\n", ch );
          stop_editing( ch );
          return;
        }

      STRFREE( obj->description );
      obj->description = copy_buffer( ch );

      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
        {
          STRFREE( obj->pIndexData->description );
          obj->pIndexData->description = QUICKLINK( obj->description );
	}

      tmpobj = (OBJ_DATA*)ch->spare_ptr;
      stop_editing( ch );
      ch->substate = ch->tempnum;
      ch->dest_buf = tmpobj;
      return;
    }

  obj = NULL;
  smash_tilde( argument );

  if ( ch->substate == SUB_REPEATCMD )
    {
      obj = (OBJ_DATA*)ch->dest_buf;

      if ( obj && obj_extracted(obj) )
        {
          send_to_char( "Your object was extracted!\r\n", ch );
          obj = NULL;
          argument = "done";
        }
      if ( argument[0] == '\0' || !str_cmp( argument, " " )
           ||   !str_cmp( argument, "stat" ) )
        {
          if ( obj )
            do_ostat( ch, obj->name );
          else
            send_to_char( "No object selected.  Type '?' for help.\r\n", ch );
          return;
        }
      if ( !str_cmp( argument, "done" ) || !str_cmp( argument, "off" ) )
        {
          send_to_char( "Oset mode off.\r\n", ch );
          ch->substate = SUB_NONE;
          DISPOSE(ch->dest_buf);
          if ( ch->pcdata && ch->pcdata->subprompt )
            STRFREE( ch->pcdata->subprompt );
          return;
        }
    }
  if ( obj )
    {
      lockobj = true;
      strcpy( arg1, obj->name );
      argument = one_argument( argument, arg2 );
      strcpy( arg3, argument );
    }
  else
    {
      lockobj = false;
      argument = one_argument( argument, arg1 );
      argument = one_argument( argument, arg2 );
      strcpy( arg3, argument );
    }

  if ( arg1[0] == '\0' || arg2[0] == '\0' || !str_cmp( arg1, "?" ) )
    {
      if ( ch->substate == SUB_REPEATCMD )
        {
          if ( obj )
            send_to_char( "Syntax: <field>  <value>\r\n",               ch );
          else
            send_to_char( "Syntax: <object> <field>  <value>\r\n",      ch );
        }
      else
        send_to_char( "Syntax: oset <object> <field>  <value>\r\n",     ch );
      send_to_char( "\r\n",                                             ch );
      send_to_char( "Field being one of:\r\n",                  ch );
      send_to_char( "  flags wear level weight cost rent timer\r\n",    ch );
      send_to_char( "  name short long desc ed rmed actiondesc\r\n",    ch );
      send_to_char( "  type value0 value1 value2 value3 value4 value5\r\n",     ch );
      send_to_char( "  affect rmaffect layers\r\n",                             ch );
      send_to_char( "For weapons:             For armor:\r\n",  ch );
      send_to_char( "  weapontype condition     ac condition\r\n",      ch );
      send_to_char( "  numdamdie sizedamdie                  \r\n",   ch );
      send_to_char( "  charges   maxcharges                  \r\n",   ch );
      send_to_char( "For potions, pills:\r\n",          ch );
      send_to_char( "  slevel spell1 spell2 spell3\r\n",                ch );
      send_to_char( "For devices:\r\n",                 ch );
      send_to_char( "  slevel spell maxcharges charges\r\n",            ch );
      send_to_char( "For salves:\r\n",                  ch );
      send_to_char( "  slevel spell1 spell2 maxdoses delay (keep low - delay is anoying)\r\n", ch);
      send_to_char( "For containers:          For levers and switches:\r\n", ch );
      send_to_char( "  cflags key capacity      tflags\r\n",            ch );
      send_to_char( "For rawspice:            For ammo and batteries:\r\n",             ch );
      send_to_char( "  spicetype  grade         charges (at least 1000 for ammo)\r\n", ch );
      send_to_char( "For crystals:\r\n",                ch );
      send_to_char( "  gemtype\r\n",            ch );
      return;
    }

  if ( !obj && GetTrustLevel(ch) <= LEVEL_IMMORTAL )
    {
      if ( ( obj = get_obj_here( ch, arg1 ) ) == NULL )
        {
          send_to_char( "You can't find that here.\r\n", ch );
          return;
        }
    }
  else
    if ( !obj )
      {
        if ( ( obj = get_obj_world( ch, arg1 ) ) == NULL )
          {
            send_to_char( "There is nothing like that in all the realms.\r\n", ch );
            return;
          }
      }
  if ( lockobj )
    ch->dest_buf = obj;
  else
    DISPOSE(ch->dest_buf);

  separate_obj( obj );
  value = atoi( arg3 );

  if ( !str_cmp( arg2, "value0" ) || !str_cmp( arg2, "v0" ) )
    {
      if ( !can_omodify( ch, obj ) )
        return;
      obj->value[0] = value;
      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
        obj->pIndexData->value[0] = value;
      return;
    }

  if ( !str_cmp( arg2, "value1" ) || !str_cmp( arg2, "v1" ) )
    {
      if ( !can_omodify( ch, obj ) )
        return;
      obj->value[1] = value;
      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
	obj->pIndexData->value[1] = value;
      return;
    }

  if ( !str_cmp( arg2, "value2" ) || !str_cmp( arg2, "v2" ) )
    {
      if ( !can_omodify( ch, obj ) )
        return;
      obj->value[2] = value;
      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
        {
          obj->pIndexData->value[2] = value;
          if ( obj->item_type == ITEM_WEAPON && value != 0 )
            obj->value[2] = obj->pIndexData->value[1] * obj->pIndexData->value[2];
        }
      return;
    }

  if ( !str_cmp( arg2, "value3" ) || !str_cmp( arg2, "v3" ) )
    {
      if ( !can_omodify( ch, obj ) )
        return;
      obj->value[3] = value;
      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
        obj->pIndexData->value[3] = value;
      return;
    }

  if ( !str_cmp( arg2, "value4" ) || !str_cmp( arg2, "v4" ) )
    {
      if ( !can_omodify( ch, obj ) )
        return;
      obj->value[4] = value;
      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
        obj->pIndexData->value[4] = value;
      return;
    }

  if ( !str_cmp( arg2, "value5" ) || !str_cmp( arg2, "v5" ) )
    {
      if ( !can_omodify( ch, obj ) )
        return;
      obj->value[5] = value;
      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
        obj->pIndexData->value[5] = value;
      return;
    }

  if ( !str_cmp( arg2, "type" ) )
    {
      if ( !can_omodify( ch, obj ) )
        return;
      if ( !argument || argument[0] == '\0' )
        {
          send_to_char( "Usage: oset <object> type <type>\r\n", ch );
          send_to_char( "Possible Types:\r\n", ch );
          send_to_char( "None        Light\r\n", ch );
          send_to_char( "Treasure    Armor      Comlink    Fabric      Grenade\r\n", ch );
          send_to_char( "Furniture   Trash      Container  Drink_con   Landmine\r\n", ch );
          send_to_char( "Key         Food       Money      Pen         Fuel\r\n", ch );
          send_to_char( "Fountain    Pill       Weapon     Medpac      Missile\r\n", ch );
          send_to_char( "Fire        Book       Superconductor         Rare_metal\r\n", ch );
          send_to_char( "Switch      Lever      Button     Dial        Government\r\n", ch );
          send_to_char( "Trap        Map        Portal     Paper       Magnet\r\n", ch );
          send_to_char( "Lockpick    Shovel     Thread     Smut        Ammo\r\n", ch );
          send_to_char( "Rawspice    Lens       Crystal    Duraplast   Battery\r\n", ch );
          send_to_char( "Toolkit     Durasteel  Oven       Mirror      Circuit\r\n", ch );
          send_to_char( "Potion      Salve      Pill       Device      Spacecraft\r\n", ch );
          send_to_char( "Bolt        Chemical\r\n", ch );
          return;
        }
      value = get_objecttype( argument );
      if ( value < 1 )
        {
          ch_printf( ch, "Unknown type: %s\r\n", arg3 );
          return;
        }
      obj->item_type = (short) value;
      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
        obj->pIndexData->item_type = obj->item_type;
      return;
    }

  if ( !str_cmp( arg2, "flags" ) )
    {
      if ( !can_omodify( ch, obj ) )
        return;
      if ( !argument || argument[0] == '\0' )
        {
          send_to_char( "Usage: oset <object> flags <flag> [flag]...\r\n", ch );
	  send_to_char( "glow, dark, magic, bless, antievil, noremove, antisith, antisoldier,\r\n",
			ch );
          send_to_char( "donation, covering, hum, invis, nodrop, antigood, antipilot, anticitizen\r\n", ch );
          send_to_char( "antineutral, inventory, antithief, antijedi, clanobject, antihunter\r\n",
			ch );
          send_to_char( "small_size, human_size, large_size, hutt_size, contraband\r\n", ch );
          return;
        }

      while ( argument[0] != '\0' )
        {
          argument = one_argument( argument, arg3 );
          value = get_objectflag( arg3 );
          if ( value < 0 || value > 31 )
            ch_printf( ch, "Unknown flag: %s\r\n", arg3 );
          else
            {
              TOGGLE_BIT(obj->extra_flags, 1 << value);
              if ( 1 << value == ITEM_PROTOTYPE )
                obj->pIndexData->extra_flags = obj->extra_flags;
            }
        }
      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
        obj->pIndexData->extra_flags = obj->extra_flags;
      return;
    }

  if ( !str_cmp( arg2, "wear" ) )
    {
      if ( !can_omodify( ch, obj ) )
        return;
      if ( !argument || argument[0] == '\0' )
        {
          send_to_char( "Usage: oset <object> wear <flag> [flag]...\r\n", ch );
          send_to_char( "Possible locations:\r\n", ch );
          send_to_char( "take   finger   neck    body    head   legs\r\n", ch );
          send_to_char( "feet   hands    arms    shield  about  waist\r\n", ch );
          send_to_char( "wrist  wield    hold    ears    eyes   floating\r\n", ch );
          send_to_char( "over\r\n", ch );
          return;
        }
      while ( argument[0] != '\0' )
        {
          argument = one_argument( argument, arg3 );
          value = get_wearflag( arg3 );

	  if ( value < 0 || value > 31 )
            ch_printf( ch, "Unknown flag: %s\r\n", arg3 );
          else
            TOGGLE_BIT( obj->wear_flags, 1 << value );
        }

      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
        obj->pIndexData->wear_flags = obj->wear_flags;
      return;
    }

  if ( !str_cmp( arg2, "level" ) )
    {
      if ( !can_omodify( ch, obj ) )
        return;
      obj->level = value;
      return;
    }

  if ( !str_cmp( arg2, "weight" ) )
    {
      if ( !can_omodify( ch, obj ) )
        return;
      obj->weight = value;
      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
        obj->pIndexData->weight = value;
      return;
    }

  if ( !str_cmp( arg2, "cost" ) )
    {
      if ( !can_omodify( ch, obj ) )
        return;
      obj->cost = value;
      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
        obj->pIndexData->cost = value;
      return;
    }

  if ( !str_cmp( arg2, "rent" ) )
    {
      if ( !can_omodify( ch, obj ) )
        return;
      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
        obj->pIndexData->rent = value;
      else
        send_to_char( "Item must have prototype flag to set this value.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "layers" ) )
    {
      if ( !can_omodify( ch, obj ) )
        return;
      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
        obj->pIndexData->layers = value;
      else
        send_to_char( "Item must have prototype flag to set this value.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "timer" ) )
    {
      if ( !can_omodify( ch, obj ) )
        return;
      obj->timer = value;
      return;
    }

  if ( !str_cmp( arg2, "name" ) )
    {
      if ( !can_omodify( ch, obj ) )
        return;
      STRFREE( obj->name );
      obj->name = STRALLOC( arg3 );
      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
        {
          STRFREE(obj->pIndexData->name );
          obj->pIndexData->name = QUICKLINK( obj->name );
        }
      return;
    }

  if ( !str_cmp( arg2, "short" ) )
    {
      STRFREE( obj->short_descr );
      obj->short_descr = STRALLOC( arg3 );
      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
        {
          STRFREE(obj->pIndexData->short_descr );
	  obj->pIndexData->short_descr = QUICKLINK( obj->short_descr );
        }
      else
        /* Feature added by Narn, Apr/96
         * If the item is not proto, add the word 'rename' to the keywords
         * if it is not already there.
         */
        {
          if ( str_infix( "rename", obj->name ) )
            {
              sprintf( buf, "%s %s", obj->name, "rename" );
              STRFREE( obj->name );
              obj->name = STRALLOC( buf );
            }
        }
      return;
    }

  if ( !str_cmp( arg2, "actiondesc" ) )
    {
      if ( strstr( arg3, "%n" )
           ||   strstr( arg3, "%d" )
           ||   strstr( arg3, "%l" ) )
        {
          send_to_char( "Illegal characters!\r\n", ch );
          return;
        }
      STRFREE( obj->action_desc );
      obj->action_desc = STRALLOC( arg3 );
      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
        {
          STRFREE(obj->pIndexData->action_desc );
          obj->pIndexData->action_desc = QUICKLINK( obj->action_desc );
        }
      return;
    }

  if ( !str_cmp( arg2, "long" ) )
    {
      if ( arg3[0] )
        {
          STRFREE( obj->description );
          obj->description = STRALLOC( arg3 );
          if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
            {
	      STRFREE(obj->pIndexData->description );
              obj->pIndexData->description = QUICKLINK( obj->description );
            }
          return;
        }
      CHECK_SUBRESTRICTED( ch );
      if ( ch->substate == SUB_REPEATCMD )
        ch->tempnum = SUB_REPEATCMD;
      else
        ch->tempnum = SUB_NONE;
      if ( lockobj )
        ch->spare_ptr = obj;
      else
        ch->spare_ptr = NULL;
      ch->substate = SUB_OBJ_LONG;
      ch->dest_buf = obj;
      start_editing( ch, obj->description );
      return;
    }

  if ( !str_cmp( arg2, "affect" ) )
    {
      Affect *paf;
      short loc;
      int bitv;

      argument = one_argument( argument, arg2 );
      if ( arg2[0] == '\0' || !argument || argument[0] == 0 )
        {
          send_to_char( "Usage: oset <object> affect <field> <value>\r\n", ch );
          send_to_char( "Affect Fields:\r\n", ch );
          send_to_char( "none        strength    dexterity   intelligence  wisdom       constitution\r\n", ch );
          send_to_char( "sex         level       age         height        weight       force\r\n",
			ch );
          send_to_char( "hit         move        credits     experience    armor        hitroll\r\n", ch );
          send_to_char( "damroll     save_para   save_rod    save_poison   save_breath  save_power\r\n", ch );
          send_to_char( "charisma    resistant   immune      susceptible   affected     luck\r\n",
			ch );
          send_to_char( "backstab    pick        track       steal         sneak        hide\r\n",
			ch );
          send_to_char( "detrap      dodge       peek        scan          gouge        search\r\n", ch );
	  send_to_char( "mount       disarm      kick        parry         bash         stun\r\n",
			ch );
          send_to_char( "punch       climb       grip        scribe        brew\r\n", ch );
          return;
        }
      loc = get_affecttype( arg2 );
      if ( loc < 1 )
        {
          ch_printf( ch, "Unknown field: %s\r\n", arg2 );
          return;
        }
      if ( loc >= APPLY_AFFECT && loc < APPLY_WEAPONSPELL )
        {
          bitv = 0;
          while ( argument[0] != '\0' )
            {
              argument = one_argument( argument, arg3 );
              if ( loc == APPLY_AFFECT )
                value = get_affectedflag( arg3 );
              else
                value = get_risflag( arg3 );
              if ( value < 0 || value > 31 )
                ch_printf( ch, "Unknown flag: %s\r\n", arg3 );
              else
                SET_BIT( bitv, 1 << value );
            }
          if ( !bitv )
            return;
          value = bitv;
        }
      else
        {
          argument = one_argument( argument, arg3 );
          value = atoi( arg3 );
        }
      CREATE( paf, Affect, 1 );
      paf->type         = -1;
      paf->duration             = -1;
      paf->location             = loc;
      paf->modifier             = value;
      paf->bitvector            = 0;
      paf->next         = NULL;
      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
        LINK( paf, obj->pIndexData->first_affect,
              obj->pIndexData->last_affect, next, prev );
      else
        LINK( paf, obj->first_affect, obj->last_affect, next, prev );
      ++top_affect;
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "rmaffect" ) )
    {
      Affect *paf;
      short loc, count;

      if ( !argument || argument[0] == '\0' )
        {
          send_to_char( "Usage: oset <object> rmaffect <affect#>\r\n", ch );
          return;
        }
      loc = atoi( argument );
      if ( loc < 1 )
        {
          send_to_char( "Invalid number.\r\n", ch );
          return;
        }

      count = 0;

      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
        {
          OBJ_INDEX_DATA *pObjIndex;

          pObjIndex = obj->pIndexData;
          for ( paf = pObjIndex->first_affect; paf; paf = paf->next )
            {
              if ( ++count == loc )
                {
                  UNLINK( paf, pObjIndex->first_affect, pObjIndex->last_affect, next, prev );
                  DISPOSE( paf );
                  send_to_char( "Removed.\r\n", ch );
                  --top_affect;
                  return;
                }
            }
          send_to_char( "Not found.\r\n", ch );
          return;
        }
      else
        {
          for ( paf = obj->first_affect; paf; paf = paf->next )
            {
              if ( ++count == loc )
                {
                  UNLINK( paf, obj->first_affect, obj->last_affect, next, prev );
                  DISPOSE( paf );
                  send_to_char( "Removed.\r\n", ch );
                  --top_affect;
                  return;
                }
            }
          send_to_char( "Not found.\r\n", ch );
          return;
        }
    }

  if ( !str_cmp( arg2, "ed" ) )
    {
      if ( arg3[0] == '\0' )
        {
          send_to_char( "Syntax: oset <object> ed <keywords>\r\n",
                        ch );
          return;
        }
      CHECK_SUBRESTRICTED( ch );
      if ( obj->timer )
        {
          send_to_char("It's not safe to edit an extra description on an object with a timer.\r\nTurn it off first.\r\n", ch );
          return;
        }
      if ( obj->item_type == ITEM_PAPER )
        {
          send_to_char("You can not add an extra description to a note paper at the moment.\r\n", ch);
          return;
        }
      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
        ed = SetOExtraProto( obj->pIndexData, arg3 );
      else
        ed = SetOExtra( obj, arg3 );
      if ( ch->substate == SUB_REPEATCMD )
        ch->tempnum = SUB_REPEATCMD;
      else
        ch->tempnum = SUB_NONE;
      if ( lockobj )
        ch->spare_ptr = obj;
      else
        ch->spare_ptr = NULL;
      ch->substate = SUB_OBJ_EXTRA;
      ch->dest_buf = ed;
      start_editing( ch, ed->description );
      return;
    }

  if ( !str_cmp( arg2, "desc" ) )
    {
      CHECK_SUBRESTRICTED( ch );
      if ( obj->timer )
        {
          send_to_char("It's not safe to edit a description on an object with a timer.\r\nTurn it off first.\r\n", ch );
          return;
        }
      if ( obj->item_type == ITEM_PAPER )
        {
          send_to_char("You can not add a description to a note paper at the moment.\r\n", ch);
          return;
        }
      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
        ed = SetOExtraProto( obj->pIndexData, obj->name );
      else
        ed = SetOExtra( obj, obj->name );
      if ( ch->substate == SUB_REPEATCMD )
        ch->tempnum = SUB_REPEATCMD;
      else
        ch->tempnum = SUB_NONE;
      if ( lockobj )
        ch->spare_ptr = obj;
      else
        ch->spare_ptr = NULL;
      ch->substate = SUB_OBJ_EXTRA;
      ch->dest_buf = ed;
      start_editing( ch, ed->description );
      return;
    }

  if ( !str_cmp( arg2, "rmed" ) )
    {
      if ( arg3[0] == '\0' )
        {
          send_to_char( "Syntax: oset <object> rmed <keywords>\r\n", ch );
          return;
        }
      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
        {
          if ( DelOExtraProto( obj->pIndexData, arg3 ) )
            send_to_char( "Deleted.\r\n", ch );
          else
            send_to_char( "Not found.\r\n", ch );
          return;
        }
      if ( DelOExtra( obj, arg3 ) )
        send_to_char( "Deleted.\r\n", ch );
      else
        send_to_char( "Not found.\r\n", ch );
      return;
    }
  /*
   * save some finger-leather
   */
  if ( !str_cmp( arg2, "ris" ) )
    {
      sprintf(outbuf, "%s affect resistant %s", arg1, arg3);
      do_oset( ch, outbuf );
      sprintf(outbuf, "%s affect immune %s", arg1, arg3);
      do_oset( ch, outbuf );
      sprintf(outbuf, "%s affect susceptible %s", arg1, arg3);
      do_oset( ch, outbuf );
      return;
    }

  if ( !str_cmp( arg2, "r" ) )
    {
      sprintf(outbuf, "%s affect resistant %s", arg1, arg3);
      do_oset( ch, outbuf );
      return;
    }

  if ( !str_cmp( arg2, "i" ) )
    {
      sprintf(outbuf, "%s affect immune %s", arg1, arg3);
      do_oset( ch, outbuf );
      return;
    }
  if ( !str_cmp( arg2, "s" ) )
    {
      sprintf(outbuf, "%s affect susceptible %s", arg1, arg3);
      do_oset( ch, outbuf );
      return;
    }

  if ( !str_cmp( arg2, "ri" ) )
    {
      sprintf(outbuf, "%s affect resistant %s", arg1, arg3);
      do_oset( ch, outbuf );
      sprintf(outbuf, "%s affect immune %s", arg1, arg3);
      do_oset( ch, outbuf );
      return;
    }

  if ( !str_cmp( arg2, "rs" ) )
    {
      sprintf(outbuf, "%s affect resistant %s", arg1, arg3);
      do_oset( ch, outbuf );
      sprintf(outbuf, "%s affect susceptible %s", arg1, arg3);
      do_oset( ch, outbuf );
      return;
    }

  if ( !str_cmp( arg2, "is" ) )
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
  switch( obj->item_type )
    {
    case ITEM_WEAPON:
      if ( !str_cmp( arg2, "weapontype" ) )
        {
          value = get_weapontype( arg3 );

          if ( value < 0 )
            {
              size_t x = 0;

              send_to_char( "Unknown weapon type.\r\n", ch );
              send_to_char( "\r\nChoices:\r\n", ch );
              send_to_char( "   ", ch );

              for( x = 0; x < weapontable_size(); ++x )
                {
                  send_to_char( get_weapontype_name( x ), ch );
                }

              send_to_char( "\r\n", ch );

              return;
            }
          tmp = 3;
          break;
        }
      if ( !str_cmp( arg2, "condition" ) )      tmp = 0;
      if ( !str_cmp( arg2, "numdamdie" ) )        tmp = 1;
      if ( !str_cmp( arg2, "sizedamdie" ) )       tmp = 2;
      if ( !str_cmp( arg2, "charges" ) )          tmp = 4;
      if ( !str_cmp( arg2, "maxcharges" ) )       tmp = 5;
      if ( !str_cmp( arg2, "charge" ) )          tmp = 4;
      if ( !str_cmp( arg2, "maxcharge" ) )       tmp = 5;
      break;
    case ITEM_BOLT:
    case ITEM_AMMO:
      if ( !str_cmp( arg2, "charges" ) )          tmp = 0;
      if ( !str_cmp( arg2, "charge" ) )          tmp = 0;
      break;
    case ITEM_BATTERY:
      if ( !str_cmp( arg2, "charges" ) )          tmp = 0;
      if ( !str_cmp( arg2, "charge" ) )          tmp = 0;
      break;
    case ITEM_RAWSPICE:
    case ITEM_SPICE:
      if ( !str_cmp( arg2, "grade" ) )          tmp = 1;
      if ( !str_cmp( arg2, "spicetype" ) )
        {
          value = get_spicetype( arg3 );

          if ( value < 0 )
            {
              size_t x = 0;

              send_to_char( "Unknown spice type.\r\n", ch );
              send_to_char( "\r\nChoices:\r\n", ch );
              send_to_char( "   ", ch );

              for( x = 0; x < spicetable_size(); ++x )
                {
                  send_to_char( get_spicetype_name( x ), ch );
                }

              send_to_char( "\r\n", ch );
              return;
            }
          tmp = 0;
          break;
        }
      break;
    case ITEM_CRYSTAL:
      if ( !str_cmp( arg2, "gemtype" ) )
        {
          value = get_crystaltype( arg3 );

          if ( value < 0 )
            {
              size_t x = 0;

              send_to_char( "Unknown gem type.\r\n", ch );
              send_to_char( "\r\nChoices:\r\n", ch );
              send_to_char( "   ", ch );

              for( x = 0; x < crystaltable_size(); ++x )
                {
                  send_to_char( get_crystaltype_name( x ), ch );
                }

              send_to_char( "\r\n", ch );
              return;
            }
	  tmp = 0;
          break;
        }
      break;
    case ITEM_ARMOR:
      if ( !str_cmp( arg2, "condition" ) )      tmp = 0;
      if ( !str_cmp( arg2, "ac" )       )               tmp = 1;
      break;
    case ITEM_SALVE:
      if ( !str_cmp( arg2, "slevel"   ) )               tmp = 0;
      if ( !str_cmp( arg2, "maxdoses" ) )               tmp = 1;
      if ( !str_cmp( arg2, "doses"    ) )               tmp = 2;
      if ( !str_cmp( arg2, "delay"    ) )               tmp = 3;
      if ( !str_cmp( arg2, "spell1"   ) )               tmp = 4;
      if ( !str_cmp( arg2, "spell2"   ) )               tmp = 5;
      if ( tmp >=4 && tmp <= 5 )                        value = skill_lookup(arg3);
      break;
    case ITEM_POTION:
    case ITEM_PILL:
      if ( !str_cmp( arg2, "slevel" ) )         tmp = 0;
      if ( !str_cmp( arg2, "spell1" ) )         tmp = 1;
      if ( !str_cmp( arg2, "spell2" ) )         tmp = 2;
      if ( !str_cmp( arg2, "spell3" ) )         tmp = 3;
      if ( tmp >=1 && tmp <= 3 )                        value = skill_lookup(arg3);
      break;
    case ITEM_DEVICE:
      if ( !str_cmp( arg2, "slevel" ) )         tmp = 0;
      if ( !str_cmp( arg2, "spell" ) )
        {
          tmp = 3;
          value = skill_lookup(arg3);
        }
      if ( !str_cmp( arg2, "maxcharges" )       )       tmp = 1;
      if ( !str_cmp( arg2, "charges" ) )                tmp = 2;
      break;
    case ITEM_CONTAINER:
      if ( !str_cmp( arg2, "capacity" ) )               tmp = 0;
      if ( !str_cmp( arg2, "cflags" ) )         tmp = 1;
      if ( !str_cmp( arg2, "key" ) )            tmp = 2;
      break;
    case ITEM_SWITCH:
    case ITEM_LEVER:
    case ITEM_BUTTON:
      if ( !str_cmp( arg2, "tflags" ) )
        {
	  tmp = 0;
          value = get_trigflag(arg3);
        }
      break;
    }
  if ( tmp >= 0 && tmp <= 5 )
    {
      if ( !can_omodify( ch, obj ) )
        return;
      obj->value[tmp] = value;
      if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
        obj->pIndexData->value[tmp] = value;
      return;
    }

  /*
   * Generate usage message.
   */
  if ( ch->substate == SUB_REPEATCMD )
    {
      ch->substate = SUB_RESTRICTED;
      interpret( ch, origarg );
      ch->substate = SUB_REPEATCMD;
      ch->last_cmd = do_oset;
    }
  else
    do_oset( ch, "" );
  return;
}
