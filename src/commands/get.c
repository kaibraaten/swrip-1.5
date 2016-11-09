#include "character.hpp"
#include "mud.h"
#include "clan.h"

static void get_obj( Character *ch, Object *obj, Object *container );

void do_get( Character *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  Object *obj = NULL;
  Object *obj_next = NULL;
  Object *container = NULL;
  short number = 0;
  bool found = false;
  bool foundowner = false;
  Character *p = NULL, *p_prev = NULL;

  argument = OneArgument( argument, arg1 );

  if ( IsNumber(arg1) )
    {
      number = atoi(arg1);

      if ( number < 1 )
        {
          SendToCharacter( "That was easy...\r\n", ch );
          return;
        }

      if ( (ch->CarryNumber + number) > GetCarryCapacityNumber(ch) )
        {
          SendToCharacter( "You can't carry that many.\r\n", ch );
          return;
        }

      argument = OneArgument( argument, arg1 );
    }
  else
    {
      number = 0;
    }

  argument = OneArgument( argument, arg2 );

  /* munch optional words */
  if ( !StrCmp( arg2, "from" ) && !IsNullOrEmpty( argument ) )
    {
      argument = OneArgument( argument, arg2 );
    }

  /* Get type. */
  if ( IsNullOrEmpty( arg1 ) )
    {
      SendToCharacter( "Get what?\r\n", ch );
      return;
    }

  if ( HasMentalStateToFindObject(ch) )
    {
      return;
    }

  if ( ch->InRoom && IsBitSet(ch->InRoom->Flags, ROOM_PLR_HOME)
       && GetTrustLevel(ch) < LEVEL_SUB_IMPLEM )
    {
      if ( !ch->PlayerHome || ch->PlayerHome->Vnum != ch->InRoom->Vnum )
        {
          for (p = LastCharacter; p ; p = p_prev )
            {
              p_prev = p->Previous;

              if ( p->PlayerHome && p->PlayerHome->Vnum == ch->InRoom->Vnum )
		{
		  foundowner = true;
		}
            }

          if ( !foundowner )
            {
              SendToCharacter( "You can not do that here.\r\n", ch );
              return;
            }
        }
    }

  if ( IsNullOrEmpty( arg2 ) )
    {
      if ( number <= 1 && StrCmp( arg1, "all" )
	   && StringPrefix( "all.", arg1 ) )
        {
          /* 'get obj' */
          obj = GetObjectInList( ch, arg1, ch->InRoom->FirstContent );

          if ( !obj )
            {
              Act( AT_PLAIN, "I see no $T here.", ch, NULL, arg1, TO_CHAR );
              return;
            }

          SeparateOneObjectFromGroup(obj);
          get_obj( ch, obj, NULL );

          if ( CharacterDiedRecently(ch) )
            return;

          if ( IsBitSet( SysData.SaveFlags, SV_GET ) )
            {
              SaveCharacter( ch );

              if( IsBitSet( ch->InRoom->Flags, ROOM_PLR_HOME ) )
                SaveHome (ch );

              if ( IsBitSet( ch->InRoom->Flags, ROOM_CLANSTOREROOM ) )
                SaveStoreroom( ch->InRoom );
	    }
        }
      else
        {
          short cnt = 0;
          bool fAll = false;
          const char *chk = NULL;

          if ( !StrCmp(arg1, "all") )
            fAll = true;
          else
            fAll = false;

          if ( number > 1 )
            chk = arg1;
          else
            chk = &arg1[4];

          /* 'get all' or 'get all.obj' */
          for ( obj = ch->InRoom->FirstContent; obj; obj = obj_next )
            {
              obj_next = obj->NextContent;

              if ( ( fAll || NiftyIsName( chk, obj->Name ) )
                   && CanSeeObject( ch, obj ) )
                {
                  found = true;

                  if ( number && (cnt + obj->Count) > number )
                    SplitGroupedObject( obj, number - cnt );

                  cnt += obj->Count;
                  get_obj( ch, obj, NULL );

                  if ( CharacterDiedRecently(ch)
                       || ch->CarryNumber >= GetCarryCapacityNumber( ch )
                       || ch->CarryWeight >= GetCarryCapacityWeight( ch )
                       || (number && cnt >= number) )
                    {
                      if ( IsBitSet(SysData.SaveFlags, SV_GET)
                           &&  !CharacterDiedRecently(ch) )
                        {
                          SaveCharacter( ch );

                          if( IsBitSet( ch->InRoom->Flags, ROOM_PLR_HOME ) )
                            SaveHome (ch );

			  if ( IsBitSet( ch->InRoom->Flags, ROOM_CLANSTOREROOM ) )
                            SaveStoreroom( ch->InRoom );
                        }

                      return;
                    }
                }
            }

          if ( !found )
            {
              if ( fAll )
                SendToCharacter( "I see nothing here.\r\n", ch );
              else
                Act( AT_PLAIN, "I see no $T here.", ch, NULL, chk, TO_CHAR );
            }
          else if ( IsBitSet( SysData.SaveFlags, SV_GET ) )
	    {
	      SaveCharacter( ch );

	      if( IsBitSet( ch->InRoom->Flags, ROOM_PLR_HOME ) )
		SaveHome (ch );

	      if ( IsBitSet( ch->InRoom->Flags, ROOM_CLANSTOREROOM ) )
		SaveStoreroom( ch->InRoom );
	    }
        }
    }
  else
    {
      /* 'get ... container' */
      if ( !StrCmp( arg2, "all" ) || !StringPrefix( "all.", arg2 ) )
        {
          SendToCharacter( "You can't do that.\r\n", ch );
          return;
        }

      if ( ( container = GetObjectHere( ch, arg2 ) ) == NULL )
        {
          Act( AT_PLAIN, "I see no $T here.", ch, NULL, arg2, TO_CHAR );
          return;
        }

      switch ( container->ItemType )
        {
        default:
          if ( !IS_OBJ_STAT( container, ITEM_COVERING ) )
	    {
              SendToCharacter( "That's not a container.\r\n", ch );
              return;
            }

          if ( ch->CarryWeight + container->Weight > GetCarryCapacityWeight( ch ) )
            {
              SendToCharacter( "It's too heavy for you to lift.\r\n", ch );
              return;
            }

          break;

        case ITEM_CONTAINER:
        case ITEM_DROID_CORPSE:
        case ITEM_CORPSE_PC:
        case ITEM_CORPSE_NPC:
          break;
        }

      if ( !IS_OBJ_STAT(container, ITEM_COVERING )
           &&    IsBitSet(container->Value[1], CONT_CLOSED) )
        {
          Act( AT_PLAIN, "The $d is closed.", ch, NULL, container->Name, TO_CHAR );
          return;
        }

      if ( number <= 1 && StrCmp( arg1, "all" )
	   && StringPrefix( "all.", arg1 ) )
        {
          /* 'get obj container' */
          obj = GetObjectInList( ch, arg1, container->FirstContent );
          if ( !obj )
            {
              Act( AT_PLAIN, IS_OBJ_STAT(container, ITEM_COVERING) ?
                   "I see nothing like that beneath the $T." :
                   "I see nothing like that in the $T.",
                   ch, NULL, arg2, TO_CHAR );
              return;
            }
          SeparateOneObjectFromGroup(obj);
          get_obj( ch, obj, container );

          CheckObjectForTrap( ch, container, TRAP_GET );
          if ( CharacterDiedRecently(ch) )
            return;
          if ( IsBitSet( SysData.SaveFlags, SV_GET ) )
            {
	      SaveCharacter( ch );
              if( IsBitSet( ch->InRoom->Flags, ROOM_PLR_HOME ) )
                SaveHome (ch );
              if ( IsBitSet( ch->InRoom->Flags, ROOM_CLANSTOREROOM ) )
                SaveStoreroom( ch->InRoom );
            }
        }
      else
        {
          int cnt = 0;
          bool fAll;
          char *chk;

          if ( !StrCmp(arg1, "all") )
            fAll = true;
          else
            fAll = false;

          if ( number > 1 )
            chk = arg1;
          else
            chk = &arg1[4];

          found = false;

          for ( obj = container->FirstContent; obj; obj = obj_next )
            {
              obj_next = obj->NextContent;
              if ( ( fAll || NiftyIsName( chk, obj->Name ) )
                   &&   CanSeeObject( ch, obj ) )
                {
                  found = true;
                  if ( number && (cnt + obj->Count) > number )
                    SplitGroupedObject( obj, number - cnt );
                  cnt += obj->Count;
                  get_obj( ch, obj, container );
                  if ( CharacterDiedRecently(ch)
                       ||   ch->CarryNumber >= GetCarryCapacityNumber( ch )
                       ||   ch->CarryWeight >= GetCarryCapacityWeight( ch )
                       ||   (number && cnt >= number) )
                    return;
                }
	    }

          if ( !found )
            {
              if ( fAll )
                Act( AT_PLAIN, IS_OBJ_STAT(container, ITEM_COVERING) ?
                     "I see nothing beneath the $T." :
                     "I see nothing in the $T.",
                     ch, NULL, arg2, TO_CHAR );
              else
                Act( AT_PLAIN, IS_OBJ_STAT(container, ITEM_COVERING) ?
                     "I see nothing like that beneath the $T." :
                     "I see nothing like that in the $T.",
                     ch, NULL, arg2, TO_CHAR );
            }
          else
            CheckObjectForTrap( ch, container, TRAP_GET );
          if ( CharacterDiedRecently(ch) )
            return;
          if ( found && IsBitSet( SysData.SaveFlags, SV_GET ) )
            {
              SaveCharacter( ch );
              if( IsBitSet( ch->InRoom->Flags, ROOM_PLR_HOME ) )
                SaveHome (ch );
              if ( IsBitSet( ch->InRoom->Flags, ROOM_CLANSTOREROOM ) )
                SaveStoreroom( ch->InRoom );
            }
        }
    }
}

static void get_obj( Character *ch, Object *obj, Object *container )
{
  Clan *clan;
  int weight;

  if ( !CAN_WEAR(obj, ITEM_TAKE)
       && (ch->TopLevel < SysData.LevelToGetObjectsWithoutTakeFlag )  )
    {
      SendToCharacter( "You can't take that.\r\n", ch );
      return;
    }

  if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE )
       &&  !CharacterCanTakePrototype( ch ) )
    {
      SendToCharacter( "A godly force prevents you from getting close to it.\r\n", ch );
      return;
    }

  if ( ch->CarryNumber + GetObjectCount( obj ) > GetCarryCapacityNumber( ch ) )
    {
      Act( AT_PLAIN, "$d: you can't carry that many items.",
           ch, NULL, obj->Name, TO_CHAR );
      return;
    }

  if ( IS_OBJ_STAT( obj, ITEM_COVERING ) )
    weight = obj->Weight;
  else
    weight = GetObjectWeight( obj );

  if ( ch->CarryWeight + weight > GetCarryCapacityWeight( ch ) )
    {
      Act( AT_PLAIN, "$d: you can't carry that much weight.",
           ch, NULL, obj->Name, TO_CHAR );
      return;
    }

  if ( container )
    {
      Act( AT_ACTION, IS_OBJ_STAT(container, ITEM_COVERING) ?
           "You get $p from beneath $P." : "You get $p from $P",
           ch, obj, container, TO_CHAR );
      Act( AT_ACTION, IS_OBJ_STAT(container, ITEM_COVERING) ?
           "$n gets $p from beneath $P." : "$n gets $p from $P",
           ch, obj, container, TO_ROOM );
      ObjectFromObject( obj );
    }
  else
    {
      Act( AT_ACTION, "You get $p.", ch, obj, container, TO_CHAR );
      Act( AT_ACTION, "$n gets $p.", ch, obj, container, TO_ROOM );
      ObjectFromRoom( obj );
    }

  /* Clan storeroom checks */
  if ( IsBitSet(ch->InRoom->Flags, ROOM_CLANSTOREROOM)
       && (!container || container->CarriedBy == NULL) )
    for ( clan = FirstClan; clan; clan = clan->Next )
      if ( clan->Storeroom == ch->InRoom->Vnum )
        SaveClanStoreroom(ch, clan);

  if ( obj->ItemType != ITEM_CONTAINER )
    CheckObjectForTrap( ch, obj, TRAP_GET );

  if ( CharacterDiedRecently(ch) )
    return;

  if ( obj->ItemType == ITEM_MONEY )
    {
      ch->Gold += obj->Value[0];
      ExtractObject( obj );
    }
  else
    {
      obj = ObjectToCharacter( obj, ch );
    }

  if ( CharacterDiedRecently(ch) || IsObjectExtracted(obj) )
    return;

  ObjProgGetTrigger(ch, obj);
}
