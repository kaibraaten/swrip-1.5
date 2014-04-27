#include "mud.h"

void do_lock( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  OBJ_DATA *obj;
  EXIT_DATA *pexit;

  one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Lock what?\r\n", ch );
      return;
    }

  if ( ( pexit = find_door( ch, arg, TRUE ) ) != NULL )
    {
      if ( !IS_SET(pexit->exit_info, EX_ISDOOR) )
        {
	  send_to_char( "You can't do that.\r\n", ch );
	  return;
	}

      if ( !IS_SET(pexit->exit_info, EX_CLOSED) )
        {
	  send_to_char( "It's not closed.\r\n", ch );
	  return;
	}

      if ( pexit->key < 0 )
        {
	  send_to_char( "It can't be locked.\r\n", ch );
	  return;
	}

      if ( !has_key( ch, pexit->key) )
        {
	  send_to_char( "You lack the key.\r\n", ch );
	  return;
	}

      if ( IS_SET(pexit->exit_info, EX_LOCKED) )
        {
	  send_to_char( "It's already locked.\r\n", ch );
	  return;
	}

      if ( !IS_SET(pexit->exit_info, EX_SECRET)
           || (pexit->keyword && nifty_is_name( arg, pexit->keyword )) )
        {
          send_to_char( "*Click*\r\n", ch );
	  act( AT_ACTION, "$n locks the $d.",
	       ch, NULL, pexit->keyword, TO_ROOM );
          set_bexit_flag( pexit, EX_LOCKED );
          return;
        }
    }

  if ( ( obj = get_obj_here( ch, arg ) ) != NULL )
    {
      /* 'lock object' */
      if ( obj->item_type != ITEM_CONTAINER )
        {
	  send_to_char( "That's not a container.\r\n", ch );
	  return;
	}

      if ( !IS_SET(obj->value[1], CONT_CLOSED) )
        {
	  send_to_char( "It's not closed.\r\n", ch );
	  return;
	}

      if ( obj->value[2] < 0 )
        {
	  send_to_char( "It can't be locked.\r\n", ch );
	  return;
	}

      if ( !has_key( ch, obj->value[2] ) )
        {
	  send_to_char( "You lack the key.\r\n", ch );
	  return;
	}

      if ( IS_SET(obj->value[1], CONT_LOCKED) )
        {
	  send_to_char( "It's already locked.\r\n", ch );
	  return;
	}

      SET_BIT(obj->value[1], CONT_LOCKED);
      send_to_char( "*Click*\r\n", ch );
      act( AT_ACTION, "$n locks $p.", ch, obj, NULL, TO_ROOM );
      return;
    }

  ch_printf( ch, "You see no %s here.\r\n", arg );
}
