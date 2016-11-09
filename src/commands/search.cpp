#include <string.h>
#include "mud.hpp"
#include "character.hpp"
#include "skill.hpp"

void do_search( Character *ch, std::string argument )
{
  char arg  [MAX_INPUT_LENGTH];
  Object *obj;
  Object *container;
  Object *startobj;
  int percent;
  DirectionType door = DIR_INVALID;
  bool found;

  switch( ch->SubState )
    {
    default:
      if ( IsNpc(ch) && IsAffectedBy( ch, AFF_CHARM ) )
        {
          SendToCharacter( "You can't concentrate enough for that.\r\n", ch );
          return;
        }

      if ( ch->Mount )
        {
          SendToCharacter( "You can't do that while mounted.\r\n", ch );
          return;
        }

      argument = OneArgument( argument, arg );

      if ( !IsNullOrEmpty( arg ) && (door = GetDirection( arg )) == -1 )
        {
          container = GetObjectHere( ch, arg );
          if ( !container )
            {
              SendToCharacter( "You can't find that here.\r\n", ch );
              return;
            }
          if ( container->ItemType != ITEM_CONTAINER )
            {
              SendToCharacter( "You can't search in that!\r\n", ch );
              return;
            }
          if ( IsBitSet(container->Value[1], CONT_CLOSED) )
            {
              SendToCharacter( "It is closed.\r\n", ch );
              return;
            }
        }
      AddTimerToCharacter( ch, TIMER_CMD_FUN, umin(SkillTable[gsn_search]->Beats / 10, 3), do_search, SUB_PAUSE );
      SendToCharacter( "You begin your search...\r\n", ch );
      ch->dest_buf = CopyString( arg );
      return;

    case SUB_PAUSE:
      if ( !ch->dest_buf )
        {
          SendToCharacter( "Your search was interrupted!\r\n", ch );
          Bug( "do_search: dest_buf NULL", 0 );
          return;
        }
      strcpy( arg, (const char*)ch->dest_buf );
      FreeMemory( ch->dest_buf );
      break;

    case SUB_TIMER_DO_ABORT:
      FreeMemory( ch->dest_buf );
      ch->SubState = SUB_NONE;
      SendToCharacter( "You stop your search...\r\n", ch );
      return;
    }
  ch->SubState = SUB_NONE;

  if ( IsNullOrEmpty( arg ) )
    {
      startobj = ch->InRoom->FirstContent;
    }
  else
    {
      if ( (door = GetDirection( arg )) != -1 )
        startobj = NULL;
      else
        {
          container = GetObjectHere( ch, arg );
          if ( !container )
            {
              SendToCharacter( "You can't find that here.\r\n", ch );
              return;
            }
          startobj = container->FirstContent;
        }
    }

  found = false;

  if ( (!startobj && door == -1) || IsNpc(ch) )
    {
      SendToCharacter( "You find nothing.\r\n", ch );
      LearnFromFailure( ch, gsn_search );
      return;
    }

  percent  = GetRandomPercent();

  if ( door != -1 )
    {
      Exit *pexit;

      if ( (pexit = GetExit( ch->InRoom, door )) != NULL
           &&   IsBitSet( pexit->Flags, EX_SECRET )
           &&   IsBitSet( pexit->Flags, EX_xSEARCHABLE )
           &&   percent < (IsNpc(ch) ? 80 : ch->PCData->Learned[gsn_search]) )
        {
          Act( AT_SKILL, "Your search reveals the $d!", ch, NULL, pexit->Keyword, TO_CHAR );
          Act( AT_SKILL, "$n finds the $d!", ch, NULL, pexit->Keyword, TO_ROOM );
          RemoveBit( pexit->Flags, EX_SECRET );
          LearnFromSuccess( ch, gsn_search );
          return;
        }
    }
  else
    for ( obj = startobj; obj; obj = obj->NextContent )
      {
        if ( IS_OBJ_STAT( obj, ITEM_HIDDEN )
             &&   percent < ch->PCData->Learned[gsn_search] )
          {
            found = true;
            break;
          }
      }

  if ( !found )
    {
      SendToCharacter( "You find nothing.\r\n", ch );
      LearnFromFailure( ch, gsn_search );
      return;
    }

  SeparateOneObjectFromGroup(obj);
  RemoveBit( obj->Flags, ITEM_HIDDEN );
  Act( AT_SKILL, "Your search reveals $p!", ch, obj, NULL, TO_CHAR );
  Act( AT_SKILL, "$n finds $p!", ch, obj, NULL, TO_ROOM );
  LearnFromSuccess( ch, gsn_search );
}
