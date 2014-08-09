#include <string.h>
#include "mud.h"
#include "character.h"

void do_dig( Character *ch, char *argument )
{
  char arg [MAX_INPUT_LENGTH];
  OBJ_DATA *obj;
  OBJ_DATA *startobj;
  bool found, shovel;
  Exit *pexit;

  switch( ch->substate )
    {
    default:
      if ( is_npc(ch)  && is_affected_by( ch, AFF_CHARM ) )
        {
          send_to_char( "You can't concentrate enough for that.\r\n", ch );
          return;
        }
      if ( ch->mount )
        {
          send_to_char( "You can't do that while mounted.\r\n", ch );
          return;
        }
      one_argument( argument, arg );
      if ( arg[0] != '\0' )
        {
	  if ( ( pexit = find_door( ch, arg, true ) ) == NULL
               &&     get_dir(arg) == -1 )
            {
              send_to_char( "What direction is that?\r\n", ch );
              return;
            }
          if ( pexit )
            {
              if ( !IS_SET(pexit->exit_info, EX_DIG)
                   &&   !IS_SET(pexit->exit_info, EX_CLOSED) )
                {
                  send_to_char( "There is no need to dig out that exit.\r\n", ch );
                  return;
                }
            }
        }
      else
        {
          switch( ch->in_room->sector_type )
            {
            case SECT_CITY:
            case SECT_INSIDE:
              send_to_char( "The floor is too hard to dig through.\r\n", ch );
              return;
            case SECT_WATER_SWIM:
            case SECT_WATER_NOSWIM:
            case SECT_UNDERWATER:
              send_to_char( "You cannot dig here.\r\n", ch );
              return;
            case SECT_AIR:
              send_to_char( "What?  In the air?!\r\n", ch );
              return;
            }
        }
      add_timer( ch, TIMER_DO_FUN, UMIN(skill_table[gsn_dig]->beats / 10, 3), do_dig, SUB_PAUSE);
      ch->dest_buf = str_dup( arg );
      send_to_char( "You begin digging...\r\n", ch );
      act( AT_PLAIN, "$n begins digging...", ch, NULL, NULL, TO_ROOM );
      return;

    case SUB_PAUSE:
      if ( !ch->dest_buf )
        {
          send_to_char( "Your digging was interrupted!\r\n", ch );
	  act( AT_PLAIN, "$n's digging was interrupted!", ch, NULL, NULL, TO_ROOM );
          bug( "do_dig: dest_buf NULL", 0 );
          return;
        }
      strcpy( arg, (const char*)ch->dest_buf );
      DISPOSE( ch->dest_buf );
      break;

    case SUB_TIMER_DO_ABORT:
      DISPOSE( ch->dest_buf );
      ch->substate = SUB_NONE;
      send_to_char( "You stop digging...\r\n", ch );
      act( AT_PLAIN, "$n stops digging...", ch, NULL, NULL, TO_ROOM );
      return;
    }

  ch->substate = SUB_NONE;

  /* not having a shovel makes it harder to succeed */
  shovel = false;
  for ( obj = ch->first_carrying; obj; obj = obj->next_content )
    if ( obj->item_type == ITEM_SHOVEL )
      {
        shovel = true;
        break;
      }

  /* dig out an EX_DIG exit... */
  if ( arg[0] != '\0' )
    {
      if ( ( pexit = find_door( ch, arg, true ) ) != NULL
           &&     IS_SET( pexit->exit_info, EX_DIG )
           &&     IS_SET( pexit->exit_info, EX_CLOSED ) )
        {
          /* 4 times harder to dig open a passage without a shovel */
          if ( (number_percent() * (shovel ? 1 : 4)) <
               (is_npc(ch) ? 80 : ch->pcdata->learned[gsn_dig]) )
            {
              REMOVE_BIT( pexit->exit_info, EX_CLOSED );
              send_to_char( "You dig open a passageway!\r\n", ch );
              act( AT_PLAIN, "$n digs open a passageway!", ch, NULL, NULL, TO_ROOM );
              learn_from_success( ch, gsn_dig );
              return;
            }
        }
      learn_from_failure( ch, gsn_dig );
      send_to_char( "Your dig did not discover any exit...\r\n", ch );
      act( AT_PLAIN, "$n's dig did not discover any exit...", ch, NULL, NULL, TO_ROOM );
      return;
    }

  startobj = ch->in_room->first_content;
  found = false;

  for ( obj = startobj; obj; obj = obj->next_content )
    {
      /* twice as hard to find something without a shovel */
      if ( IS_OBJ_STAT( obj, ITEM_BURRIED )
           &&  (number_percent() * (shovel ? 1 : 2)) <
           (is_npc(ch) ? 80 : ch->pcdata->learned[gsn_dig]) )
        {
          found = true;
          break;
        }
    }

  if ( !found )
    {
      send_to_char( "Your dig uncovered nothing.\r\n", ch );
      act( AT_PLAIN, "$n's dig uncovered nothing.", ch, NULL, NULL, TO_ROOM );
      learn_from_failure( ch, gsn_dig );
      return;
    }

  separate_obj(obj);
  REMOVE_BIT( obj->extra_flags, ITEM_BURRIED );
  act( AT_SKILL, "Your dig uncovered $p!", ch, obj, NULL, TO_CHAR );
  act( AT_SKILL, "$n's dig uncovered $p!", ch, obj, NULL, TO_ROOM );
  learn_from_success( ch, gsn_dig );
}
