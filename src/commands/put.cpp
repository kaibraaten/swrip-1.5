#include "character.hpp"
#include "mud.hpp"
#include "clan.hpp"
#include "room.hpp"
#include "object.hpp"
#include "systemdata.hpp"
#include "repos/clanrepository.hpp"
#include "repos/playerrepository.hpp"

static void SaveStoreroomForOwnerClan(const Clan *clan, Character *ch);

void do_put( Character *ch, std::string argument )
{
  std::string arg1;
  std::string arg2;
  int number = 0;

  argument = OneArgument( argument, arg1 );

  if ( IsNumber(arg1) )
    {
      number = ToLong(arg1);

      if ( number < 1 )
        {
          ch->Echo("That was easy...\r\n");
          return;
        }

      argument = OneArgument( argument, arg1 );
    }

  argument = OneArgument( argument, arg2 );

  /* munch optional words */
  if ( (!StrCmp(arg2, "into") || !StrCmp(arg2, "inside") || !StrCmp(arg2, "in"))
       && !argument.empty() )
    argument = OneArgument( argument, arg2 );

  if ( arg1.empty() || arg2.empty() )
    {
      ch->Echo("Put what in what?\r\n");
      return;
    }

  if ( HasMentalStateToFindObject(ch) )
    return;

  if ( !StrCmp( arg2, "all" ) || !StringPrefix( "all.", arg2 ) )
    {
      ch->Echo("You can't do that.\r\n");
      return;
    }

  Object *container = GetObjectHere(ch, arg2);
  
  if ( container == nullptr )
    {
      Act( AT_PLAIN, "I see no $T here.",
           ch, NULL, arg2.c_str(), TO_CHAR );
      return;
    }

  bool save_char = false;
  
  if ( !container->CarriedBy && IsBitSet( SysData.SaveFlags, SV_PUT ) )
    save_char = true;

  if ( IS_OBJ_STAT(container, ITEM_COVERING) )
    {
      if ( ch->CarryWeight + container->Weight > GetCarryCapacityWeight( ch ) )
        {
          ch->Echo("It's too heavy for you to lift.\r\n");
          return;
        }
    }
  else
    {
      if ( container->ItemType != ITEM_CONTAINER )
        {
          ch->Echo("That's not a container.\r\n");
          return;
        }

      if ( IsBitSet(container->Value[OVAL_CONTAINER_FLAGS], CONT_CLOSED) )
        {
          Act( AT_PLAIN, "The $d is closed.", ch, NULL, container->Name.c_str(), TO_CHAR );
          return;
        }
    }

  if ( number <= 1 && StrCmp( arg1, "all" ) && StringPrefix( "all.", arg1 ) )
    {
      Object *obj = GetCarriedObject(ch, arg1);
      
      /* 'put obj container' */
      if ( obj == nullptr )
        {
          ch->Echo("You do not have that item.\r\n");
          return;
	}

      if ( obj == container )
        {
          ch->Echo("You can't fold it into itself.\r\n");
          return;
        }

      if ( !CanDropObject( ch, obj ) )
        {
          ch->Echo("You can't let go of it.\r\n");
          return;
        }

      if ( (IS_OBJ_STAT(container, ITEM_COVERING)
            &&   (GetObjectWeight( obj ) / obj->Count)
            > ((GetObjectWeight( container ) / container->Count)
               -   container->Weight)) )
        {
          ch->Echo("It won't fit under there.\r\n");
          return;
        }

      if ( (GetObjectWeight( obj ) / obj->Count)
           + (GetObjectWeight( container ) / container->Count)
           >  container->Value[OVAL_CONTAINER_CAPACITY] )
        {
          ch->Echo("It won't fit.\r\n");
          return;
        }

      SeparateOneObjectFromGroup(obj);
      SeparateOneObjectFromGroup(container);
      ObjectFromCharacter( obj );
      obj = ObjectToObject( obj, container );
      CheckObjectForTrap ( ch, container, TRAP_PUT );

      if ( CharacterDiedRecently(ch) )
        return;

      int count = obj->Count;
      obj->Count = 1;
      Act( AT_ACTION, IS_OBJ_STAT( container, ITEM_COVERING )
           ? "$n hides $p beneath $P." : "$n puts $p in $P.",
           ch, obj, container, TO_ROOM );
      Act( AT_ACTION, IS_OBJ_STAT( container, ITEM_COVERING )
           ? "You hide $p beneath $P." : "You put $p in $P.",
	   ch, obj, container, TO_CHAR );
      obj->Count = count;

      if ( save_char )
        {
          PlayerCharacters->Save( ch );

          if( IsBitSet( ch->InRoom->Flags, ROOM_PLR_HOME ) )
            SaveHome (ch );

          if ( IsBitSet( ch->InRoom->Flags, ROOM_CLANSTOREROOM ) )
            SaveStoreroom( ch->InRoom );
        }

      if ( IsBitSet(ch->InRoom->Flags, ROOM_CLANSTOREROOM)
           && container->CarriedBy == NULL)
        {
          for(const Clan *clan : Clans->Entities())
            {
              SaveStoreroomForOwnerClan(clan, ch);
            }
        }
    }
  else
    {
      bool found = false;
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
        chk = arg1.substr(4);

      SeparateOneObjectFromGroup(container);

      /* 'put all container' or 'put all.obj container' */
      std::list<Object*> carriedObjects(ch->Objects());

      for(Object *obj : carriedObjects)
        {
          if ( ( fAll || NiftyIsName( chk, obj->Name ) )
               && CanSeeObject( ch, obj )
               && obj->WearLoc == WEAR_NONE
               && obj != container
               && CanDropObject( ch, obj )
	       && GetObjectWeight( obj ) + GetObjectWeight( container )
               <= container->Value[OVAL_CONTAINER_CAPACITY] )
            {
              if ( number && (cnt + obj->Count) > number )
                SplitGroupedObject( obj, number - cnt );

              cnt += obj->Count;
              ObjectFromCharacter( obj );
              Act( AT_ACTION, "$n puts $p in $P.", ch, obj, container, TO_ROOM );
              Act( AT_ACTION, "You put $p in $P.", ch, obj, container, TO_CHAR );
              obj = ObjectToObject( obj, container );
              found = true;

              CheckObjectForTrap( ch, container, TRAP_PUT );

              if ( CharacterDiedRecently(ch) )
                return;

              if ( number && cnt >= number )
                break;
            }
        }

      /*
       * Don't bother to save anything if nothing was dropped   -Thoric
       */
      if ( !found )
        {
          if ( fAll )
            Act( AT_PLAIN, "You are not carrying anything.",
                 ch, NULL, NULL, TO_CHAR );
          else
            Act( AT_PLAIN, "You are not carrying any $T.",
                 ch, NULL, chk.c_str(), TO_CHAR );
          return;
        }

      if ( save_char )
        {
          PlayerCharacters->Save( ch );

          if( IsBitSet( ch->InRoom->Flags, ROOM_PLR_HOME ) )
            SaveHome (ch );

          if ( IsBitSet( ch->InRoom->Flags, ROOM_CLANSTOREROOM ) )
            SaveStoreroom( ch->InRoom );
        }

      if ( IsBitSet(ch->InRoom->Flags, ROOM_CLANSTOREROOM)
           && container->CarriedBy == NULL)
        {
          for(const Clan *clan : Clans->Entities())
            {
              SaveStoreroomForOwnerClan(clan, ch);
            }
        }
    }
}

static void SaveStoreroomForOwnerClan(const Clan *clan, Character *ch)
{
  if ( clan->Storeroom == ch->InRoom->Vnum )
    {
      SaveClanStoreroom(ch, clan);
    }
}
