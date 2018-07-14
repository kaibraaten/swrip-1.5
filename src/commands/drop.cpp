#include "character.hpp"
#include "mud.hpp"
#include "clan.hpp"

static void SaveStoreroomForOwnerClan(Clan *clan, Character *ch);

void do_drop( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Object *obj;
  Object *obj_next;
  bool found;
  int number;

  argument = OneArgument( argument, arg );
  if ( IsNumber(arg) )
    {
      number = atoi(arg);
      if ( number < 1 )
        {
          SendToCharacter( "That was easy...\r\n", ch );
          return;
        }
      argument = OneArgument( argument, arg );
    }
  else
    number = 0;

  if ( IsNullOrEmpty( arg ) )
    {
      SendToCharacter( "Drop what?\r\n", ch );
      return;
    }

  if ( HasMentalStateToFindObject(ch) )
    return;

  if ( IsBitSet( ch->InRoom->Flags, ROOM_NODROP )
       ||   ( !IsNpc(ch) && IsBitSet( ch->Flags, PLR_LITTERBUG )) )
    {
      SetCharacterColor( AT_MAGIC, ch );
      SendToCharacter( "A magical force stops you!\r\n", ch );
      SetCharacterColor( AT_TELL, ch );
      SendToCharacter( "Someone tells you, 'No littering here!'\r\n", ch );
      return;
    }

  if ( number > 0 )
    {
      /* 'drop NNNN coins' */

      if ( !StrCmp( arg, "credits" ) || !StrCmp( arg, "credit" ) )
        {
          if ( ch->Gold < number )
            {
              SendToCharacter( "You haven't got that many credits.\r\n", ch );
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
          SendToCharacter( "OK.\r\n", ch );
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
          SendToCharacter( "You do not have that item.\r\n", ch );
          return;
        }

      if ( !CanDropObject( ch, obj ) )
        {
          SendToCharacter( "You can't let go of it.\r\n", ch );
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
          const List *clans = GetEntities(ClanRepository);
          ForEachInList(clans, (ForEachFunc*)SaveStoreroomForOwnerClan, ch);
        }
    }
  else
    {
      int cnt = 0;
      char *chk;
      bool fAll;

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
          SendToCharacter( "You can't seem to do that here...\r\n", ch );
          return;
        }
      found = false;
      for ( obj = ch->FirstCarrying; obj; obj = obj_next )
        {
          obj_next = obj->NextContent;

          if ( (fAll || NiftyIsName( chk, obj->Name ) )
               &&   CanSeeObject( ch, obj )
               &&   obj->WearLoc == WEAR_NONE
               &&   CanDropObject( ch, obj ) )
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
          const List *clans = GetEntities(ClanRepository);
          ForEachInList(clans, (ForEachFunc*)SaveStoreroomForOwnerClan, ch);
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

static void SaveStoreroomForOwnerClan(Clan *clan, Character *ch)
{
  if ( clan->Storeroom == ch->InRoom->Vnum )
    {
      SaveClanStoreroom(ch, clan);
    }
}
