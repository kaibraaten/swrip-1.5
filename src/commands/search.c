#include <string.h>
#include "mud.h"
#include "character.h"
#include "skill.h"

void do_search( Character *ch, char *argument )
{
  char arg  [MAX_INPUT_LENGTH];
  Object *obj;
  Object *container;
  Object *startobj;
  int percent, door;
  bool found;

  door = -1;
  switch( ch->substate )
    {
    default:
      if ( IsNpc(ch) && IsAffectedBy( ch, AFF_CHARM ) )
        {
          SendToCharacter( "You can't concentrate enough for that.\r\n", ch );
          return;
        }
      if ( ch->mount )
        {
          SendToCharacter( "You can't do that while mounted.\r\n", ch );
          return;
        }

      argument = OneArgument( argument, arg );

      if ( arg[0] != '\0' && (door = GetDirection( arg )) == -1 )
        {
          container = GetObjectHere( ch, arg );
          if ( !container )
            {
              SendToCharacter( "You can't find that here.\r\n", ch );
              return;
            }
          if ( container->item_type != ITEM_CONTAINER )
            {
              SendToCharacter( "You can't search in that!\r\n", ch );
              return;
            }
          if ( IsBitSet(container->value[1], CONT_CLOSED) )
            {
              SendToCharacter( "It is closed.\r\n", ch );
              return;
            }
        }
      AddTimerToCharacter( ch, TIMER_CMD_FUN, umin(SkillTable[gsn_search]->beats / 10, 3), do_search, SUB_PAUSE );
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
      ch->substate = SUB_NONE;
      SendToCharacter( "You stop your search...\r\n", ch );
      return;
    }
  ch->substate = SUB_NONE;
  if ( arg[0] == '\0' )
    {
      startobj = ch->in_room->first_content;
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
          startobj = container->first_content;
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

      if ( (pexit = GetExit( ch->in_room, door )) != NULL
           &&   IsBitSet( pexit->exit_info, EX_SECRET )
           &&   IsBitSet( pexit->exit_info, EX_xSEARCHABLE )
           &&   percent < (IsNpc(ch) ? 80 : ch->pcdata->learned[gsn_search]) )
        {
          Act( AT_SKILL, "Your search reveals the $d!", ch, NULL, pexit->keyword, TO_CHAR );
          Act( AT_SKILL, "$n finds the $d!", ch, NULL, pexit->keyword, TO_ROOM );
          RemoveBit( pexit->exit_info, EX_SECRET );
          LearnFromSuccess( ch, gsn_search );
          return;
        }
    }
  else
    for ( obj = startobj; obj; obj = obj->next_content )
      {
        if ( IS_OBJ_STAT( obj, ITEM_HIDDEN )
             &&   percent < ch->pcdata->learned[gsn_search] )
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
  RemoveBit( obj->extra_flags, ITEM_HIDDEN );
  Act( AT_SKILL, "Your search reveals $p!", ch, obj, NULL, TO_CHAR );
  Act( AT_SKILL, "$n finds $p!", ch, obj, NULL, TO_ROOM );
  LearnFromSuccess( ch, gsn_search );
}
