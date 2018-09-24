#include <cstring>
#include <utility/random.hpp>
#include "mud.hpp"
#include "character.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "log.hpp"
#include "room.hpp"
#include "object.hpp"
#include "exit.hpp"

void do_search( Character *ch, std::string arg )
{
  Object *obj = NULL;
  Object *container = NULL;
  std::list<Object*> searchList;
  int percent = 0;
  DirectionType door = DIR_INVALID;
  bool found = false;

  switch( ch->SubState )
    {
    default:
      if ( IsNpc(ch) && IsAffectedBy( ch, AFF_CHARM ) )
        {
          ch->Echo("You can't concentrate enough for that.\r\n");
          return;
        }

      if ( ch->Mount )
        {
          ch->Echo("You can't do that while mounted.\r\n");
          return;
        }

      if ( !arg.empty() && (door = GetDirection( arg )) == -1 )
        {
          container = GetObjectHere( ch, arg );

          if ( !container )
            {
              ch->Echo("You can't find that here.\r\n");
              return;
            }

          if ( container->ItemType != ITEM_CONTAINER )
            {
              ch->Echo("You can't search in that!\r\n");
              return;
            }

          if ( IsBitSet(container->Value[1], CONT_CLOSED) )
            {
              ch->Echo("It is closed.\r\n");
              return;
            }
        }
      
      AddTimerToCharacter( ch, TIMER_CMD_FUN, umin(SkillTable[gsn_search]->Beats / 10, 3), do_search, SUB_PAUSE );
      ch->Echo("You begin your search...\r\n");
      ch->dest_buf = CopyString( arg );
      return;

    case SUB_PAUSE:
      if ( !ch->dest_buf )
        {
          ch->Echo("Your search was interrupted!\r\n");
          Log->Bug( "do_search: dest_buf NULL" );
          return;
        }

      arg = static_cast<const char*>( ch->dest_buf );
      FreeMemory( ch->dest_buf );
      break;

    case SUB_TIMER_DO_ABORT:
      FreeMemory( ch->dest_buf );
      ch->SubState = SUB_NONE;
      ch->Echo("You stop your search...\r\n");
      return;
    }

  ch->SubState = SUB_NONE;

  if ( arg.empty() )
    {
      searchList = ch->InRoom->Objects();
    }
  else
    {
      door = GetDirection( arg );
      
      if ( door == DIR_INVALID )
        {
          container = GetObjectHere( ch, arg );

          if ( container == nullptr )
            {
              ch->Echo("You can't find that here.\r\n");
              return;
            }

          searchList = container->Objects();
        }
    }

  found = false;

  if ( (searchList.empty() && door == DIR_INVALID) || IsNpc(ch) )
    {
      ch->Echo("You find nothing.\r\n");
      LearnFromFailure( ch, gsn_search );
      return;
    }

  percent = GetRandomPercent();

  if ( door != -1 )
    {
      Exit *pexit = nullptr;

      if ( (pexit = GetExit( ch->InRoom, door )) != NULL
           && IsBitSet( pexit->Flags, EX_SECRET )
           && IsBitSet( pexit->Flags, EX_xSEARCHABLE )
           && percent < (IsNpc(ch) ? 80 : ch->PCData->Learned[gsn_search]) )
        {
          Act( AT_SKILL, "Your search reveals the $d!",
               ch, nullptr, pexit->Keyword.c_str(), TO_CHAR );
          Act( AT_SKILL, "$n finds the $d!", ch, nullptr, pexit->Keyword.c_str(), TO_ROOM );
          RemoveBit( pexit->Flags, EX_SECRET );
          LearnFromSuccess( ch, gsn_search );
          return;
        }
    }
  else
    {
      for( Object *hiddenObject : searchList )
        {
          if ( IsBitSet( obj->Flags, ITEM_HIDDEN )
               && percent < ch->PCData->Learned[gsn_search] )
            {
              obj = hiddenObject;
              found = true;
              break;
            }
        }
    }
  
  if ( !found )
    {
      ch->Echo("You find nothing.\r\n");
      LearnFromFailure( ch, gsn_search );
      return;
    }

  SeparateOneObjectFromGroup(obj);
  RemoveBit( obj->Flags, ITEM_HIDDEN );
  Act( AT_SKILL, "Your search reveals $p!", ch, obj, NULL, TO_CHAR );
  Act( AT_SKILL, "$n finds $p!", ch, obj, NULL, TO_ROOM );
  LearnFromSuccess( ch, gsn_search );
}
