#include "character.hpp"
#include "mud.hpp"
#include "clan.hpp"
#include "room.hpp"
#include "object.hpp"
#include "systemdata.hpp"
#include "repos/clanrepository.hpp"
#include "repos/playerrepository.hpp"

static void SaveStoreroomForOwnerClan(const Clan *clan, Character *ch);
static void get_obj( Character *ch, Object *obj, Object *container );

void do_get( Character *ch, std::string argument )
{
  std::string arg1;
  std::string arg2;
  Object *container = NULL;
  short number = 0;
  bool found = false;
  bool foundowner = false;
  Character *p = NULL, *p_prev = NULL;

  argument = OneArgument( argument, arg1 );

  if ( IsNumber(arg1) )
    {
      number = std::stoi(arg1);

      if ( number < 1 )
        {
          ch->Echo( "That was easy...\r\n" );
          return;
        }

      if ( (ch->CarryNumber + number) > GetCarryCapacityNumber(ch) )
        {
          ch->Echo( "You can't carry that many.\r\n" );
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
  if ( !StrCmp( arg2, "from" ) && !argument.empty() )
    {
      argument = OneArgument( argument, arg2 );
    }

  /* Get type. */
  if ( arg1.empty() )
    {
      ch->Echo( "Get what?\r\n" );
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
              ch->Echo( "You can not do that here.\r\n" );
              return;
            }
        }
    }

  if ( arg2.empty() )
    {
      if ( number <= 1 && StrCmp( arg1, "all" )
	   && StringPrefix( "all.", arg1 ) )
        {
          /* 'get obj' */
          Object *obj = GetObjectInList( ch, arg1, ch->InRoom->Objects() );

          if ( !obj )
            {
              Act( AT_PLAIN, "I see no $T here.", ch, NULL, arg1.c_str(), TO_CHAR );
              return;
            }

          SeparateOneObjectFromGroup(obj);
          get_obj( ch, obj, NULL );

          if ( CharacterDiedRecently(ch) )
            return;

          if ( IsBitSet( SysData.SaveFlags, SV_GET ) )
            {
              PlayerCharacters->Save( ch );

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
          std::string chk;

          if ( !StrCmp(arg1, "all") )
            fAll = true;
          else
            fAll = false;

          if ( number > 1 )
            chk = arg1;
          else
            chk = arg1.size() > 4 ? arg1.substr(4) : "";

          /* 'get all' or 'get all.obj' */
          std::list<Object*> objectsOnGround(ch->InRoom->Objects());

          for(Object *obj : objectsOnGround)
            {
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
                          PlayerCharacters->Save( ch );

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
                ch->Echo( "I see nothing here.\r\n" );
              else
                Act( AT_PLAIN, "I see no $T here.", ch, NULL, chk.c_str(), TO_CHAR );
            }
          else if ( IsBitSet( SysData.SaveFlags, SV_GET ) )
	    {
	      PlayerCharacters->Save( ch );

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
          ch->Echo( "You can't do that.\r\n" );
          return;
        }

      if ( ( container = GetObjectHere( ch, arg2 ) ) == NULL )
        {
          Act( AT_PLAIN, "I see no $T here.", ch, NULL, arg2.c_str(), TO_CHAR );
          return;
        }

      switch ( container->ItemType )
        {
        default:
          if ( !IS_OBJ_STAT( container, ITEM_COVERING ) )
	    {
              ch->Echo( "That's not a container.\r\n" );
              return;
            }

          if ( ch->CarryWeight + container->Weight > GetCarryCapacityWeight( ch ) )
            {
              ch->Echo( "It's too heavy for you to lift.\r\n" );
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
           && IsBitSet(container->Value[OVAL_CONTAINER_FLAGS], CONT_CLOSED) )
        {
          Act( AT_PLAIN, "The $d is closed.",
               ch, NULL, container->Name.c_str(), TO_CHAR );
          return;
        }

      if ( number <= 1 && StrCmp( arg1, "all" )
	   && StringPrefix( "all.", arg1 ) )
        {
          /* 'get obj container' */
          Object *obj = GetObjectInList( ch, arg1, container->Objects() );

          if ( obj == nullptr )
            {
              Act( AT_PLAIN, IS_OBJ_STAT(container, ITEM_COVERING) ?
                   "I see nothing like that beneath the $T." :
                   "I see nothing like that in the $T.",
                   ch, NULL, arg2.c_str(), TO_CHAR );
              return;
            }

          SeparateOneObjectFromGroup(obj);
          get_obj( ch, obj, container );

          CheckObjectForTrap( ch, container, TRAP_GET );

          if ( CharacterDiedRecently(ch) )
            return;

          if ( IsBitSet( SysData.SaveFlags, SV_GET ) )
            {
	      PlayerCharacters->Save( ch );

              if( IsBitSet( ch->InRoom->Flags, ROOM_PLR_HOME ) )
                SaveHome (ch );

              if ( IsBitSet( ch->InRoom->Flags, ROOM_CLANSTOREROOM ) )
                SaveStoreroom( ch->InRoom );
            }
        }
      else
        {
          int cnt = 0;
          bool fAll = false;
          std::string chk;

          if ( !StrCmp(arg1, "all") )
            fAll = true;
          else
            fAll = false;

          if ( number > 1 )
            chk = arg1;
          else
            chk = arg1.size() > 4 ? arg1.substr(4) : "";

          found = false;

          std::list<Object*> contents(container->Objects());
          
          for( Object *obj : contents )
            {
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
                     ch, NULL, arg2.c_str(), TO_CHAR );
              else
                Act( AT_PLAIN, IS_OBJ_STAT(container, ITEM_COVERING) ?
                     "I see nothing like that beneath the $T." :
                     "I see nothing like that in the $T.",
                     ch, NULL, arg2.c_str(), TO_CHAR );
            }
          else
            {
              CheckObjectForTrap( ch, container, TRAP_GET );
            }

          if ( CharacterDiedRecently(ch) )
            {
              return;
            }

          if ( found && IsBitSet( SysData.SaveFlags, SV_GET ) )
            {
              PlayerCharacters->Save( ch );

              if( IsBitSet( ch->InRoom->Flags, ROOM_PLR_HOME ) )
                {
                  SaveHome( ch );
                }

              if ( IsBitSet( ch->InRoom->Flags, ROOM_CLANSTOREROOM ) )
                {
                  SaveStoreroom( ch->InRoom );
                }
            }
        }
    }
}

static void get_obj( Character *ch, Object *obj, Object *container )
{
  int weight = 0;

  if ( !CAN_WEAR(obj, ITEM_TAKE)
       && (ch->TopLevel < SysData.LevelToGetObjectsWithoutTakeFlag )  )
    {
      ch->Echo( "You can't take that.\r\n" );
      return;
    }

  if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE )
       &&  !CharacterCanTakePrototype( ch ) )
    {
      ch->Echo( "A godly force prevents you from getting close to it.\r\n" );
      return;
    }

  if ( ch->CarryNumber + GetObjectCount( obj ) > GetCarryCapacityNumber( ch ) )
    {
      Act( AT_PLAIN, "$d: you can't carry that many items.",
           ch, NULL, obj->Name.c_str(), TO_CHAR );
      return;
    }

  if ( IS_OBJ_STAT( obj, ITEM_COVERING ) )
    weight = obj->Weight;
  else
    weight = GetObjectWeight( obj );

  if ( ch->CarryWeight + weight > GetCarryCapacityWeight( ch ) )
    {
      Act( AT_PLAIN, "$d: you can't carry that much weight.",
           ch, NULL, obj->Name.c_str(), TO_CHAR );
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

  
  if ( IsBitSet(ch->InRoom->Flags, ROOM_CLANSTOREROOM)
       && (container == NULL || container->CarriedBy == NULL) )
    {
      for(const Clan *clan : Clans->Entities())
        {
          SaveStoreroomForOwnerClan(clan, ch);
        }
    }

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

static void SaveStoreroomForOwnerClan(const Clan *clan, Character *ch)
{
  if ( clan->Storeroom == ch->InRoom->Vnum )
    {
      SaveClanStoreroom(ch, clan);
    }
}
