#include <string.h>
#include "mud.h"
#include "character.h"
#include "skill.h"

void do_dig( Character *ch, char *argument )
{
  char arg [MAX_INPUT_LENGTH];
  Object *obj;
  Object *startobj;
  bool found, shovel;
  Exit *pexit;

  switch( ch->SubState )
    {
    default:
      if ( IsNpc(ch)  && IsAffectedBy( ch, AFF_CHARM ) )
        {
          SendToCharacter( "You can't concentrate enough for that.\r\n", ch );
          return;
        }

      if ( ch->Mount )
        {
          SendToCharacter( "You can't do that while mounted.\r\n", ch );
          return;
        }

      OneArgument( argument, arg );

      if ( !IsNullOrEmpty( arg ) )
        {
	  if ( ( pexit = FindDoor( ch, arg, true ) ) == NULL
               &&     GetDirection(arg) == -1 )
            {
              SendToCharacter( "What direction is that?\r\n", ch );
              return;
            }
          if ( pexit )
            {
              if ( !IsBitSet(pexit->Flags, EX_DIG)
                   &&   !IsBitSet(pexit->Flags, EX_CLOSED) )
                {
                  SendToCharacter( "There is no need to dig out that exit.\r\n", ch );
                  return;
                }
            }
        }
      else
        {
          switch( ch->InRoom->Sector )
            {
            case SECT_CITY:
            case SECT_INSIDE:
              SendToCharacter( "The floor is too hard to dig through.\r\n", ch );
              return;

            case SECT_WATER_SWIM:
            case SECT_WATER_NOSWIM:
            case SECT_UNDERWATER:
              SendToCharacter( "You cannot dig here.\r\n", ch );
              return;

            case SECT_AIR:
              SendToCharacter( "What?  In the air?!\r\n", ch );
              return;

	    default:
	      break;
            }
        }
      AddTimerToCharacter( ch, TIMER_CMD_FUN, umin(SkillTable[gsn_dig]->Beats / 10, 3), do_dig, SUB_PAUSE);
      ch->dest_buf = CopyString( arg );
      SendToCharacter( "You begin digging...\r\n", ch );
      Act( AT_PLAIN, "$n begins digging...", ch, NULL, NULL, TO_ROOM );
      return;

    case SUB_PAUSE:
      if ( !ch->dest_buf )
        {
          SendToCharacter( "Your digging was interrupted!\r\n", ch );
	  Act( AT_PLAIN, "$n's digging was interrupted!", ch, NULL, NULL, TO_ROOM );
          Bug( "do_dig: dest_buf NULL", 0 );
          return;
        }
      strcpy( arg, (const char*)ch->dest_buf );
      FreeMemory( ch->dest_buf );
      break;

    case SUB_TIMER_DO_ABORT:
      FreeMemory( ch->dest_buf );
      ch->SubState = SUB_NONE;
      SendToCharacter( "You stop digging...\r\n", ch );
      Act( AT_PLAIN, "$n stops digging...", ch, NULL, NULL, TO_ROOM );
      return;
    }

  ch->SubState = SUB_NONE;

  /* not having a shovel makes it harder to succeed */
  shovel = false;
  for ( obj = ch->FirstCarrying; obj; obj = obj->NextContent )
    if ( obj->item_type == ITEM_SHOVEL )
      {
        shovel = true;
        break;
      }

  /* dig out an EX_DIG exit... */
  if ( !IsNullOrEmpty( arg ) )
    {
      if ( ( pexit = FindDoor( ch, arg, true ) ) != NULL
           &&     IsBitSet( pexit->Flags, EX_DIG )
           &&     IsBitSet( pexit->Flags, EX_CLOSED ) )
        {
          /* 4 times harder to dig open a passage without a shovel */
          if ( (GetRandomPercent() * (shovel ? 1 : 4)) <
               (IsNpc(ch) ? 80 : ch->PCData->Learned[gsn_dig]) )
            {
              RemoveBit( pexit->Flags, EX_CLOSED );
              SendToCharacter( "You dig open a passageway!\r\n", ch );
              Act( AT_PLAIN, "$n digs open a passageway!", ch, NULL, NULL, TO_ROOM );
              LearnFromSuccess( ch, gsn_dig );
              return;
            }
        }
      LearnFromFailure( ch, gsn_dig );
      SendToCharacter( "Your dig did not discover any exit...\r\n", ch );
      Act( AT_PLAIN, "$n's dig did not discover any exit...", ch, NULL, NULL, TO_ROOM );
      return;
    }

  startobj = ch->InRoom->FirstContent;
  found = false;

  for ( obj = startobj; obj; obj = obj->NextContent )
    {
      /* twice as hard to find something without a shovel */
      if ( IS_OBJ_STAT( obj, ITEM_BURRIED )
           &&  (GetRandomPercent() * (shovel ? 1 : 2)) <
           (IsNpc(ch) ? 80 : ch->PCData->Learned[gsn_dig]) )
        {
          found = true;
          break;
        }
    }

  if ( !found )
    {
      SendToCharacter( "Your dig uncovered nothing.\r\n", ch );
      Act( AT_PLAIN, "$n's dig uncovered nothing.", ch, NULL, NULL, TO_ROOM );
      LearnFromFailure( ch, gsn_dig );
      return;
    }

  SeparateOneObjectFromGroup(obj);
  RemoveBit( obj->Flags, ITEM_BURRIED );
  Act( AT_SKILL, "Your dig uncovered $p!", ch, obj, NULL, TO_CHAR );
  Act( AT_SKILL, "$n's dig uncovered $p!", ch, obj, NULL, TO_ROOM );
  LearnFromSuccess( ch, gsn_dig );
}
