#include <string.h>
#include "mud.hpp"
#include "character.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "log.hpp"
#include "room.hpp"

void do_dig( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Object *obj = NULL;
  Object *startobj = NULL;
  bool found = false, shovel = false;
  Exit *pexit = NULL;

  switch( ch->SubState )
    {
    default:
      if ( IsNpc(ch)  && IsAffectedBy( ch, AFF_CHARM ) )
        {
          ch->Echo( "You can't concentrate enough for that.\r\n" );
          return;
        }

      if ( ch->Mount )
        {
          ch->Echo( "You can't do that while mounted.\r\n" );
          return;
        }

      OneArgument( argument, arg );

      if ( !IsNullOrEmpty( arg ) )
        {
	  if ( ( pexit = FindDoor( ch, arg, true ) ) == NULL
               && GetDirection(arg) == -1 )
            {
              ch->Echo( "What direction is that?\r\n" );
              return;
            }

          if ( pexit )
            {
              if ( !IsBitSet(pexit->Flags, EX_DIG)
                   &&   !IsBitSet(pexit->Flags, EX_CLOSED) )
                {
                  ch->Echo( "There is no need to dig out that exit.\r\n" );
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
              ch->Echo( "The floor is too hard to dig through.\r\n" );
              return;

            case SECT_WATER_SWIM:
            case SECT_WATER_NOSWIM:
            case SECT_UNDERWATER:
              ch->Echo( "You cannot dig here.\r\n" );
              return;

            case SECT_AIR:
              ch->Echo( "What? In the air?!\r\n", ch );
              return;

	    default:
	      break;
            }
        }

      AddTimerToCharacter( ch, TIMER_CMD_FUN, umin(SkillTable[gsn_dig]->Beats / 10, 3), do_dig, SUB_PAUSE);
      ch->dest_buf = CopyString( arg );
      ch->Echo( "You begin digging...\r\n" );
      Act( AT_PLAIN, "$n begins digging...", ch, NULL, NULL, TO_ROOM );
      return;

    case SUB_PAUSE:
      if ( !ch->dest_buf )
        {
          ch->Echo( "Your digging was interrupted!\r\n" );
	  Act( AT_PLAIN, "$n's digging was interrupted!", ch, NULL, NULL, TO_ROOM );
          Log->Bug( "do_dig: dest_buf NULL" );
          return;
        }

      strcpy( arg, (const char*)ch->dest_buf );
      FreeMemory( ch->dest_buf );
      break;

    case SUB_TIMER_DO_ABORT:
      FreeMemory( ch->dest_buf );
      ch->SubState = SUB_NONE;
      ch->Echo( "You stop digging...\r\n" );
      Act( AT_PLAIN, "$n stops digging...", ch, NULL, NULL, TO_ROOM );
      return;
    }

  ch->SubState = SUB_NONE;

  /* not having a shovel makes it harder to succeed */
  shovel = false;
  for ( obj = ch->FirstCarrying; obj; obj = obj->NextContent )
    if ( obj->ItemType == ITEM_SHOVEL )
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
              ch->Echo( "You dig open a passageway!\r\n" );
              Act( AT_PLAIN, "$n digs open a passageway!", ch, NULL, NULL, TO_ROOM );
              LearnFromSuccess( ch, gsn_dig );
              return;
            }
        }

      LearnFromFailure( ch, gsn_dig );
      ch->Echo( "Your dig did not discover any exit...\r\n" );
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
      ch->Echo( "Your dig uncovered nothing.\r\n" );
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

