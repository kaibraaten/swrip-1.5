#include <string.h>
#include "mud.h"
#include "character.h"

void do_detrap( Character *ch, char *argument )
{
  char arg  [MAX_INPUT_LENGTH];
  OBJ_DATA *obj;
  OBJ_DATA *trap;
  int percent;
  bool found;

  switch( ch->substate )
    {
    default:
      if ( is_npc(ch) && is_affected_by( ch, AFF_CHARM ) )
        {
          send_to_char( "You can't concentrate enough for that.\r\n", ch );
          return;
        }
      argument = one_argument( argument, arg );
      if ( !is_npc(ch) && !ch->pcdata->learned[gsn_detrap] )
        {
          send_to_char("You do not yet know of this skill.\r\n", ch );
          return;
        }
      if ( arg[0] == '\0' )
        {
	  send_to_char( "Detrap what?\r\n", ch );
          return;
        }
      if ( ms_find_obj(ch) )
        return;
      found = FALSE;
      if ( ch->mount )
        {
          send_to_char( "You can't do that while mounted.\r\n", ch );
          return;
        }
      if ( !ch->in_room->first_content )
        {
          send_to_char( "You can't find that here.\r\n", ch );
          return;
        }
      for ( obj = ch->in_room->first_content; obj; obj = obj->next_content )
        {
          if ( can_see_obj( ch, obj ) && nifty_is_name( arg, obj->name ) )
            {
              found = TRUE;
              break;
            }
        }
      if ( !found )
        {
          send_to_char( "You can't find that here.\r\n", ch );
          return;
        }
      act( AT_ACTION, "You carefully begin your attempt to remove a trap from $p...", ch, obj, NULL, TO_CHAR );
      act( AT_ACTION, "$n carefully attempts to remove a trap from $p...", ch, obj, NULL, TO_ROOM );
      ch->dest_buf = str_dup( obj->name );
      add_timer( ch, TIMER_DO_FUN, 3, do_detrap, 1 );
      /*            set_wait_state( ch, skill_table[gsn_detrap]->beats ); */
      return;
    case SUB_PAUSE:
      if ( !ch->dest_buf )
        {
          send_to_char( "Your detrapping was interrupted!\r\n", ch );
          bug( "do_detrap: ch->dest_buf NULL!", 0 );
          return;
        }
      strcpy( arg, (const char*)ch->dest_buf );
      DISPOSE( ch->dest_buf );
      DISPOSE(ch->dest_buf);
      ch->substate = SUB_NONE;
      break;
    case SUB_TIMER_DO_ABORT:
      DISPOSE(ch->dest_buf);
      ch->substate = SUB_NONE;
      send_to_char( "You carefully stop what you were doing.\r\n", ch );
      return;
    }

  if ( !ch->in_room->first_content )
    {
      send_to_char( "You can't find that here.\r\n", ch );
      return;
    }
  for ( obj = ch->in_room->first_content; obj; obj = obj->next_content )
    {
      if ( can_see_obj( ch, obj ) && nifty_is_name( arg, obj->name ) )
        {
          found = TRUE;
          break;
        }
    }
  if ( !found )
    {
      send_to_char( "You can't find that here.\r\n", ch );
      return;
    }
  if ( (trap = get_trap( obj )) == NULL )
    {
      send_to_char( "You find no trap on that.\r\n", ch );
      return;
    }

  percent  = number_percent() - ( get_level( ch, SMUGGLING_ABILITY ) / 20 )
    - (get_curr_lck(ch) - 16);

  separate_obj(obj);

  if ( !is_npc(ch) || percent > ch->pcdata->learned[gsn_detrap] )
    {
      send_to_char( "Ooops!\r\n", ch );
      spring_trap( ch, trap );
      learn_from_failure( ch, gsn_detrap );
      return;
    }
  extract_obj( trap );

  send_to_char( "You successfully remove a trap.\r\n", ch );
  learn_from_success( ch, gsn_detrap );
}
