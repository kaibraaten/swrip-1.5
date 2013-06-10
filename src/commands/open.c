#include "mud.h"
#include "character.h"
#include "algocallbacks.h"

void do_open( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  OBJ_DATA *obj = NULL;
  EXIT_DATA *pexit = NULL;
  int door = 0;

  one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      do_openhatch( ch , "" );
      return;
    }

  if ( ( pexit = find_door( ch, arg, TRUE ) ) != NULL )
    {
      EXIT_DATA *pexit_rev = NULL;

      if ( !IS_SET(pexit->exit_info, EX_ISDOOR) )
        {
	  send_to_char( "You can't do that.\r\n", ch );
	  return;
	}

      if ( !IS_SET(pexit->exit_info, EX_CLOSED) )
        {
	  send_to_char( "It's already open.\r\n", ch );
	  return;
	}

      if (  IS_SET(pexit->exit_info, EX_LOCKED) )
        {
	  send_to_char( "It's locked.\r\n", ch );
	  return;
	}

      if ( !IS_SET(pexit->exit_info, EX_SECRET)
           || (pexit->keyword && nifty_is_name( arg, pexit->keyword )) )
        {
          act( AT_ACTION, "$n opens the $d.",
	       ch, NULL, pexit->keyword, TO_ROOM );
          act( AT_ACTION, "You open the $d.",
	       ch, NULL, pexit->keyword, TO_CHAR );

          if ( (pexit_rev = pexit->rexit) != NULL
               && pexit_rev->to_room == ch->in_room )
            {
	      List_ForEach( pexit->to_room->People, ShowOpenDoorMessageToCharacter, pexit_rev->keyword );
              sound_to_room( pexit->to_room , "!!SOUND(door)" );
            }

          remove_bexit_flag( pexit, EX_CLOSED );
	  door = pexit->vdir;

          if ( door >= TRAP_N && door <= TRAP_SW )
	    {
	      check_room_for_traps( ch, trap_door[door]);
	    }

          sound_to_room( ch->in_room , "!!SOUND(door)" );
          return;
        }
    }

  if ( ( obj = get_obj_here( ch, arg ) ) != NULL )
    {
      if ( obj->item_type != ITEM_CONTAINER )
        {
          if( CAN_WEAR(obj, ITEM_WEAR_OVER) )
            {
              obj->value[2] = 0;
              act( AT_ACTION, "You open $p.", ch, obj, NULL, TO_CHAR );
              act( AT_ACTION, "$n opens $p.", ch, obj, NULL, TO_ROOM );
              check_for_trap( ch, obj, TRAP_OPEN );
              return;

            }

          ch_printf( ch, "%s isn't a container.\r\n",
		     capitalize( obj->short_descr ) );
          return;
        }

      if ( !IS_SET(obj->value[1], CONT_CLOSED) )
        {
	  ch_printf( ch, "%s is already open.\r\n",
		     capitalize( obj->short_descr ) );
          return;
        }

      if ( !IS_SET(obj->value[1], CONT_CLOSEABLE) )
        {
          ch_printf( ch, "%s cannot be opened or closed.\r\n",
		     capitalize( obj->short_descr ) );
          return;
        }

      if ( IS_SET(obj->value[1], CONT_LOCKED) )
        {
          ch_printf( ch, "%s is locked.\r\n", capitalize( obj->short_descr ) );
          return;
        }

      REMOVE_BIT(obj->value[1], CONT_CLOSED);
      act( AT_ACTION, "You open $p.", ch, obj, NULL, TO_CHAR );
      act( AT_ACTION, "$n opens $p.", ch, obj, NULL, TO_ROOM );
      check_for_trap( ch, obj, TRAP_OPEN );
      return;
    }

  if ( !str_cmp(arg , "hatch") )
    {
      do_openhatch( ch , argument );
      return;
    }

  do_openhatch( ch , arg );
}
