#include "ship.h"
#include "mud.h"
#include "character.h"
#include "skill.h"

void do_pick( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *gch;
  Object *obj;
  Exit *pexit;
  Ship *ship;

  if ( IsNpc(ch) && IsAffectedBy( ch, AFF_CHARM ) )
    {
      SendToCharacter( "You can't concentrate enough for that.\r\n", ch );
      return;
    }

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      SendToCharacter( "Pick what?\r\n", ch );
      return;
    }

  if ( HasMentalStateToFindObject(ch) )
    return;

  if ( ch->Mount )
    {
      SendToCharacter( "You can't do that while mounted.\r\n", ch );
      return;
    }

  SetWaitState( ch, SkillTable[gsn_pick_lock]->Beats );

  /* look for guards */
  for ( gch = ch->InRoom->FirstPerson; gch; gch = gch->NextInRoom )
    {
      if ( IsNpc(gch) && IsAwake(gch) && GetAbilityLevel( ch, SMUGGLING_ABILITY ) < gch->TopLevel )
        {
          Act( AT_PLAIN, "$N is standing too close to the lock.",
               ch, NULL, gch, TO_CHAR );
          return;
        }
    }


  if ( ( pexit = FindDoor( ch, arg, true ) ) != NULL )
    {
      /* 'pick door' */
      /*        Room *to_room; */ /* Unused */
      Exit *pexit_rev;

      if ( !IsBitSet(pexit->Flags, EX_CLOSED) )
        { SendToCharacter( "It's not closed.\r\n",        ch ); return; }
      if ( pexit->Key < 0 )
        { SendToCharacter( "It can't be picked.\r\n",     ch ); return; }
      if ( !IsBitSet(pexit->Flags, EX_LOCKED) )
        { SendToCharacter( "It's already unlocked.\r\n",  ch ); return; }
      if ( IsBitSet(pexit->Flags, EX_PICKPROOF) )
        {
          SendToCharacter( "You failed.\r\n", ch );
          LearnFromFailure( ch, gsn_pick_lock );
          CheckRoomForTraps( ch, TRAP_PICK | TrapDoor[pexit->Direction] );
          return;
        }

      if ( !IsNpc(ch) && GetRandomPercent() > ch->PCData->Learned[gsn_pick_lock] )
        {
          SendToCharacter( "You failed.\r\n", ch);
          LearnFromFailure( ch, gsn_pick_lock );
	  return;
        }

      RemoveBit(pexit->Flags, EX_LOCKED);
      SendToCharacter( "*Click*\r\n", ch );
      Act( AT_ACTION, "$n picks the $d.", ch, NULL, pexit->Keyword, TO_ROOM );
      LearnFromSuccess( ch, gsn_pick_lock );
      /* pick the other side */
      if ( ( pexit_rev = pexit->rexit ) != NULL
           &&   pexit_rev->ToRoom == ch->InRoom )
        {
          RemoveBit( pexit_rev->Flags, EX_LOCKED );
        }
      CheckRoomForTraps( ch, TRAP_PICK | TrapDoor[pexit->Direction] );
      return;
    }

  if ( ( obj = GetObjectHere( ch, arg ) ) != NULL )
    {
      if ( obj->ItemType != ITEM_CONTAINER )
        { SendToCharacter( "You can't pick that.\r\n", ch ); return; }
      if ( !IsBitSet(obj->Value[1], CONT_CLOSED) )
        { SendToCharacter( "It's not closed.\r\n",        ch ); return; }
      if ( obj->Value[2] < 0 )
        { SendToCharacter( "It can't be unlocked.\r\n",   ch ); return; }
      if ( !IsBitSet(obj->Value[1], CONT_LOCKED) )
        { SendToCharacter( "It's already unlocked.\r\n",  ch ); return; }
      if ( IsBitSet(obj->Value[1], CONT_PICKPROOF) )
        {
          SendToCharacter( "You failed.\r\n", ch );
          LearnFromFailure( ch, gsn_pick_lock );
          CheckObjectForTrap( ch, obj, TRAP_PICK );
          return;
        }

      if ( !IsNpc(ch) && GetRandomPercent() > ch->PCData->Learned[gsn_pick_lock] )
        {
          SendToCharacter( "You failed.\r\n", ch);
          LearnFromFailure( ch, gsn_pick_lock );
          return;
        }

      SeparateOneObjectFromGroup( obj );
      RemoveBit(obj->Value[1], CONT_LOCKED);
      SendToCharacter( "*Click*\r\n", ch );
      Act( AT_ACTION, "$n picks $p.", ch, obj, NULL, TO_ROOM );
      LearnFromSuccess( ch, gsn_pick_lock );
      CheckObjectForTrap( ch, obj, TRAP_PICK );
      return;
    }

  if ( ( ship = GetShipInRoom(ch->InRoom, arg ) ) != NULL )
    {
      Descriptor *d;

      if ( CheckPilot( ch , ship ) )
        {
          SendToCharacter("&RWhat would be the point of that!\r\n",ch);
          return;
        }

      if ( ship->shipstate != SHIP_LANDED && !IsShipDisabled( ship ) )
        {
          SendToCharacter( "&RThat ship has already started to launch",ch);
          return;
        }

      SetWaitState( ch, SkillTable[gsn_pickshiplock]->Beats );

      if ( IsNpc(ch) || !ch->PCData || GetRandomPercent() > ch->PCData->Learned[gsn_pickshiplock] )
        {
          SendToCharacter( "You failed.\r\n", ch);
          LearnFromFailure( ch, gsn_pickshiplock );
          if ( ship->alarm == 0 )
            return;
          if ( !StrCmp("Public",ship->owner) )
            return;
          for ( d = FirstDescriptor; d; d = d->Next )
            {
              Character *victim = d->Original ? d->Original : d->Character;

              if ( d->ConnectionState != CON_PLAYING )
                continue;

              if ( !CheckPilot(victim,ship) )
                continue;

              if ( !HasComlink( victim ) )
                continue;

	      if ( !IsNpc( victim ) && victim->Switched
                   && !IsBitSet(victim->Switched->Flags, ACT_POLYMORPHED)
                   && !IsAffectedBy(victim->Switched, AFF_POSSESS) )
                continue;
              else if ( !IsNpc( victim ) && victim->Switched
                        && (IsBitSet(victim->Switched->Flags, ACT_POLYMORPHED)
                            || IsAffectedBy(victim->Switched, AFF_POSSESS) ) )
                victim = victim->Switched;

              if ( !IsAwake(victim) || IsBitSet(victim->InRoom->Flags,ROOM_SILENCE) )
                continue;

              if ( d->ConnectionState == CON_EDITING )
                continue;

              Echo(victim,"&R[alarm] Attempt to pick %s.\r\n",ship->Name);
            }
          return;
        }

      if ( !ship->hatchopen)
        {
          ship->hatchopen = true;
          Act( AT_PLAIN, "You pick the lock and open the hatch on $T.", ch, NULL, ship->Name, TO_CHAR );
          Act( AT_PLAIN, "$n picks open the hatch on $T.", ch, NULL, ship->Name, TO_ROOM );
          EchoToRoom( AT_YELLOW , GetRoom(ship->room.entrance) , "The hatch opens from the outside." );
          LearnFromSuccess( ch, gsn_pickshiplock );
          if ( ship->alarm == 0 )
            return;
          if ( !StrCmp("Public",ship->owner) )
            return;
          for ( d = FirstDescriptor; d; d = d->Next )
            {
              Character *victim = d->Original ? d->Original : d->Character;

              if ( d->ConnectionState != CON_PLAYING )
                continue;

              if ( !CheckPilot(victim,ship) )
                continue;

              if ( !HasComlink( victim ) )
                continue;

              if ( !IsNpc( victim ) && victim->Switched
		   && !IsBitSet(victim->Switched->Flags, ACT_POLYMORPHED)
                   && !IsAffectedBy(victim->Switched, AFF_POSSESS) )
                continue;
              else if ( !IsNpc( victim ) && victim->Switched
                        && (IsBitSet(victim->Switched->Flags, ACT_POLYMORPHED)
                            || IsAffectedBy(victim->Switched, AFF_POSSESS) ) )
                victim = victim->Switched;

              if ( !IsAwake(victim) || IsBitSet(victim->InRoom->Flags,ROOM_SILENCE) )
                continue;

              if ( d->ConnectionState == CON_EDITING )
                continue;

              Echo(victim,"&R[alarm] %s has been picked!\r\n",ship->Name);
            }
        }
      return;
    }

  Echo( ch, "You see no %s here.\r\n", arg );
}
