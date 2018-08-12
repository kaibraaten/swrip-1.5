#include "character.hpp"
#include "mud.hpp"
#include "clan.hpp"
#include "room.hpp"

static void SaveStoreroomForOwnerClan(const Clan *clan, Character *ch);

void do_drop( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Object *obj = nullptr;
  Object *obj_next = nullptr;
  bool found = false;
  int number = 0;

  argument = OneArgument( argument, arg );

  if ( IsNumber(arg) )
    {
      number = atoi(arg);

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
  
  if ( IsNullOrEmpty( arg ) )
    {
      ch->Echo( "Drop what?\r\n" );
      return;
    }

  if ( HasMentalStateToFindObject(ch) )
    return;

  if ( IsBitSet( ch->InRoom->Flags, ROOM_NODROP )
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

          for ( obj = ch->InRoom->FirstContent; obj; obj = obj_next )
            {
              obj_next = obj->NextContent;

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

          if ( IsBitSet( SysData.SaveFlags, SV_DROP ) )
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

  if ( number <= 1 && StrCmp( arg, "all" ) && StringPrefix( "all.", arg ) )
    {
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
      if ( IsBitSet(ch->InRoom->Flags, ROOM_CLANSTOREROOM) )
        {
          for(const Clan *clan : Clans->Entities())
            {
              SaveStoreroomForOwnerClan(clan, ch);
            }
        }
    }
  else
    {
      int cnt = 0;
      char *chk = nullptr;
      bool fAll = false;

      if ( !StrCmp(arg, "all") )
        fAll = true;
      else
	fAll = false;
      if ( number > 1 )
        chk = arg;
      else
        chk = &arg[4];

      /* 'drop all' or 'drop all.obj' */
      if ( IsBitSet( ch->InRoom->Flags, ROOM_NODROPALL ) )
        {
          ch->Echo( "You can't seem to do that here...\r\n" );
          return;
        }

      found = false;

      for ( obj = ch->FirstCarrying; obj; obj = obj_next )
        {
          obj_next = obj->NextContent;

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

                  if ( !obj_next )
                    obj_next = ch->FirstCarrying;
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

      if ( IsBitSet(ch->InRoom->Flags, ROOM_CLANSTOREROOM) )
        {
          for(const Clan *clan : Clans->Entities())
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
                 ch, NULL, chk, TO_CHAR );
        }
    }
  if ( IsBitSet( SysData.SaveFlags, SV_DROP ) )
    {
      SaveCharacter( ch );
      if( IsBitSet( ch->InRoom->Flags, ROOM_PLR_HOME ) )
        SaveHome (ch );
      if ( IsBitSet( ch->InRoom->Flags, ROOM_CLANSTOREROOM ) )
        SaveStoreroom( ch->InRoom );
    } /* duping protector */
}

static void SaveStoreroomForOwnerClan(const Clan *clan, Character *ch)
{
  if ( clan->Storeroom == ch->InRoom->Vnum )
    {
      SaveClanStoreroom(ch, clan);
    }
}

