#include <string.h>
#include "mud.h"
#include "character.h"

void do_search( Character *ch, char *argument )
{
  char arg  [MAX_INPUT_LENGTH];
  OBJ_DATA *obj;
  OBJ_DATA *container;
  OBJ_DATA *startobj;
  int percent, door;
  bool found;

  door = -1;
  switch( ch->substate )
    {
    default:
      if ( is_npc(ch) && is_affected_by( ch, AFF_CHARM ) )
        {
          send_to_char( "You can't concentrate enough for that.\r\n", ch );
          return;
        }
      if ( ch->mount )
        {
          send_to_char( "You can't do that while mounted.\r\n", ch );
          return;
        }

      argument = one_argument( argument, arg );

      if ( arg[0] != '\0' && (door = get_dir( arg )) == -1 )
        {
          container = get_obj_here( ch, arg );
          if ( !container )
            {
              send_to_char( "You can't find that here.\r\n", ch );
              return;
            }
          if ( container->item_type != ITEM_CONTAINER )
            {
              send_to_char( "You can't search in that!\r\n", ch );
              return;
            }
          if ( IS_SET(container->value[1], CONT_CLOSED) )
            {
              send_to_char( "It is closed.\r\n", ch );
              return;
            }
        }
      add_timer( ch, TIMER_DO_FUN, UMIN(skill_table[gsn_search]->beats / 10, 3),
                 do_search, 1 );
      send_to_char( "You begin your search...\r\n", ch );
      ch->dest_buf = str_dup( arg );
      return;

    case SUB_PAUSE:
      if ( !ch->dest_buf )
        {
          send_to_char( "Your search was interrupted!\r\n", ch );
          bug( "do_search: dest_buf NULL", 0 );
          return;
        }
      strcpy( arg, (const char*)ch->dest_buf );
      DISPOSE( ch->dest_buf );
      break;
    case SUB_TIMER_DO_ABORT:
      DISPOSE( ch->dest_buf );
      ch->substate = SUB_NONE;
      send_to_char( "You stop your search...\r\n", ch );
      return;
    }
  ch->substate = SUB_NONE;
  if ( arg[0] == '\0' )
    {
      startobj = ch->in_room->first_content;
    }
  else
    {
      if ( (door = get_dir( arg )) != -1 )
        startobj = NULL;
      else
        {
          container = get_obj_here( ch, arg );
          if ( !container )
            {
              send_to_char( "You can't find that here.\r\n", ch );
              return;
            }
          startobj = container->first_content;
        }
    }

  found = FALSE;

  if ( (!startobj && door == -1) || is_npc(ch) )
    {
      send_to_char( "You find nothing.\r\n", ch );
      learn_from_failure( ch, gsn_search );
      return;
    }

  percent  = number_percent( );

  if ( door != -1 )
    {
      EXIT_DATA *pexit;

      if ( (pexit = get_exit( ch->in_room, door )) != NULL
           &&   IS_SET( pexit->exit_info, EX_SECRET )
           &&   IS_SET( pexit->exit_info, EX_xSEARCHABLE )
           &&   percent < (is_npc(ch) ? 80 : ch->pcdata->learned[gsn_search]) )
        {
          act( AT_SKILL, "Your search reveals the $d!", ch, NULL, pexit->keyword, TO_CHAR );
          act( AT_SKILL, "$n finds the $d!", ch, NULL, pexit->keyword, TO_ROOM );
          REMOVE_BIT( pexit->exit_info, EX_SECRET );
          learn_from_success( ch, gsn_search );
          return;
        }
    }
  else
    for ( obj = startobj; obj; obj = obj->next_content )
      {
        if ( IS_OBJ_STAT( obj, ITEM_HIDDEN )
             &&   percent < ch->pcdata->learned[gsn_search] )
          {
            found = TRUE;
            break;
          }
      }

  if ( !found )
    {
      send_to_char( "You find nothing.\r\n", ch );
      learn_from_failure( ch, gsn_search );
      return;
    }

  separate_obj(obj);
  REMOVE_BIT( obj->extra_flags, ITEM_HIDDEN );
  act( AT_SKILL, "Your search reveals $p!", ch, obj, NULL, TO_CHAR );
  act( AT_SKILL, "$n finds $p!", ch, obj, NULL, TO_ROOM );
  learn_from_success( ch, gsn_search );
}
