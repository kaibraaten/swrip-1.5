#include "character.hpp"
#include "mud.hpp"
#include "clan.hpp"
#include "room.hpp"
#include "object.hpp"
#include "protoobject.hpp"
#include "systemdata.hpp"
#include "repos/clanrepository.hpp"
#include "repos/playerrepository.hpp"

static void SaveStoreroomForOwnerClan(const std::shared_ptr<Clan> &clan, Character *ch);

void do_drop( Character *ch, std::string argument )
{
  std::string arg;
  bool found = false;
  int number = 0;

  argument = OneArgument( argument, arg );

  if ( IsNumber(arg) )
    {
      number = ToLong(arg);

      if ( number < 1 )
        {
          ch->Echo( "That was easy...\r\n" );
          return;
        }

      argument = OneArgument( argument, arg );
    }
  else
    {
      number = 0;
    }
  
  if ( arg.empty() )
    {
      ch->Echo( "Drop what?\r\n" );
      return;
    }

  if ( HasMentalStateToFindObject(ch) )
    return;

  if ( ch->InRoom->Flags.test( Flag::Room::NoDrop )
       || ( !IsNpc(ch) && IsBitSet( ch->Flags, PLR_LITTERBUG )) )
    {
      SetCharacterColor( AT_MAGIC, ch );
      ch->Echo( "A magical force stops you!\r\n" );
      SetCharacterColor( AT_TELL, ch );
      ch->Echo( "Someone tells you, 'No littering here!'\r\n" );
      return;
    }

  if ( number > 0 )
    {
      /* 'drop NNNN coins' */
      if ( !StrCmp( arg, "credits" ) || !StrCmp( arg, "credit" ) )
        {
          if ( ch->Gold < number )
            {
              ch->Echo( "You haven't got that many credits.\r\n" );
              return;
            }

          ch->Gold -= number;

          std::list<Object*> objectsToExtract(ch->InRoom->Objects());

          for(Object *obj : objectsToExtract)
            {
              switch ( obj->Prototype->Vnum )
                {
                case OBJ_VNUM_MONEY_ONE:
                  number += 1;
                  ExtractObject( obj );
                  break;

                case OBJ_VNUM_MONEY_SOME:
                  number += obj->Value[OVAL_MONEY_AMOUNT];
                  ExtractObject( obj );
                  break;
                }
            }

          Act( AT_ACTION, "$n drops some credits.", ch, NULL, NULL, TO_ROOM );
          ObjectToRoom( CreateMoney( number ), ch->InRoom );
          ch->Echo( "OK.\r\n" );

          if ( SysData.SaveFlags.test( Flag::AutoSave::Drop ) )
            {
              PlayerCharacters->Save( ch );

              if( ch->InRoom->Flags.test( Flag::Room::PlayerHome ) )
                {
                  SaveHome (ch );
                }
              
              if ( ch->InRoom->Flags.test( Flag::Room::ClanStoreroom ) )
                {
                  SaveStoreroom( ch->InRoom );
                }
            }

	  return;
        }
    }

  if ( number <= 1 && StrCmp( arg, "all" ) && StringPrefix( "all.", arg ) )
    {
      Object *obj = nullptr;
      
      /* 'drop obj' */
      if ( ( obj = GetCarriedObject( ch, arg ) ) == NULL )
        {
          ch->Echo( "You do not have that item.\r\n" );
          return;
        }

      if ( !CanDropObject( ch, obj ) )
        {
          ch->Echo( "You can't let go of it.\r\n" );
          return;
        }

      SeparateOneObjectFromGroup( obj );
      Act( AT_ACTION, "$n drops $p.", ch, obj, NULL, TO_ROOM );
      Act( AT_ACTION, "You drop $p.", ch, obj, NULL, TO_CHAR );

      ObjectFromCharacter( obj );
      obj = ObjectToRoom( obj, ch->InRoom );
      ObjProgDropTrigger ( ch, obj );   /* mudprogs */

      if( CharacterDiedRecently(ch) || IsObjectExtracted(obj) )
        return;

      /* Clan storeroom saving */
      if ( ch->InRoom->Flags.test( Flag::Room::ClanStoreroom ) )
        {
          for(const auto &clan : Clans)
            {
              SaveStoreroomForOwnerClan(clan, ch);
            }
        }
    }
  else
    {
      int cnt = 0;
      std::string chk;
      bool fAll = false;

      if ( !StrCmp(arg, "all") )
        fAll = true;
      else
	fAll = false;

      if ( number > 1 )
        chk = arg;
      else
        chk = arg.size() > 4 ? arg.substr(4) : "";

      /* 'drop all' or 'drop all.obj' */
      if ( ch->InRoom->Flags.test( Flag::Room::NoDropAll ) )
        {
          ch->Echo( "You can't seem to do that here...\r\n" );
          return;
        }

      found = false;

      std::list<Object*> carriedObjects(ch->Objects());

      for(Object *obj : carriedObjects)
        {
          if ( (fAll || NiftyIsName( chk, obj->Name ) )
               && CanSeeObject( ch, obj )
               && obj->WearLoc == WEAR_NONE
               && CanDropObject( ch, obj ) )
            {
              found = true;

              if ( obj->Prototype->mprog.progtypes & DROP_PROG && obj->Count > 1 )
                {
                  ++cnt;
                  SeparateOneObjectFromGroup( obj );
                  ObjectFromCharacter( obj );
                }
              else
                {
                  if ( number && (cnt + obj->Count) > number )
                    SplitGroupedObject( obj, number - cnt );

                  cnt += obj->Count;
                  ObjectFromCharacter( obj );
                }

              Act( AT_ACTION, "$n drops $p.", ch, obj, NULL, TO_ROOM );
              Act( AT_ACTION, "You drop $p.", ch, obj, NULL, TO_CHAR );
              obj = ObjectToRoom( obj, ch->InRoom );
              ObjProgDropTrigger( ch, obj );            /* mudprogs */

              if ( CharacterDiedRecently(ch) )
                return;

              if ( number && cnt >= number )
                break;
	    }
        }

      if ( ch->InRoom->Flags.test( Flag::Room::ClanStoreroom ) )
        {
          for(const auto &clan : Clans)
            {
              SaveStoreroomForOwnerClan(clan, ch);
            }
        }

      if ( !found )
        {
          if ( fAll )
            Act( AT_PLAIN, "You are not carrying anything.",
                 ch, NULL, NULL, TO_CHAR );
          else
            Act( AT_PLAIN, "You are not carrying any $T.",
                 ch, NULL, chk.c_str(), TO_CHAR );
        }
    }

  if ( SysData.SaveFlags.test( Flag::AutoSave::Drop ) )
    {
      PlayerCharacters->Save( ch );

      if( ch->InRoom->Flags.test( Flag::Room::PlayerHome ) )
        {
          SaveHome (ch );
        }
      
      if ( ch->InRoom->Flags.test( Flag::Room::ClanStoreroom ) )
        {
          SaveStoreroom( ch->InRoom );
        }
    } /* duping protector */
}

static void SaveStoreroomForOwnerClan(const std::shared_ptr<Clan> &clan, Character *ch)
{
  if ( clan->Storeroom == ch->InRoom->Vnum )
    {
      SaveClanStoreroom(ch, clan);
    }
}
