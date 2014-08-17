#include "mud.h"

void do_unlock( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  OBJ_DATA *obj = NULL;
  Exit *pexit = NULL;

  OneArgument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Unlock what?\r\n", ch );
      return;
    }

  if ( ( pexit = find_door( ch, arg, true ) ) != NULL )
    {
      if ( !IsBitSet(pexit->exit_info, EX_ISDOOR) )
        {
	  send_to_char( "You can't do that.\r\n", ch );
	  return;
	}

      if ( !IsBitSet(pexit->exit_info, EX_CLOSED) )
        {
	  send_to_char( "It's not closed.\r\n", ch );
	  return;
	}

      if ( pexit->key < 0 )
        {
	  send_to_char( "It can't be unlocked.\r\n", ch );
	  return;
	}

      if ( !has_key( ch, pexit->key) )
        {
	  send_to_char( "You lack the key.\r\n", ch );
	  return;
	}

      if ( !IsBitSet(pexit->exit_info, EX_LOCKED) )
        {
	  send_to_char( "It's already unlocked.\r\n", ch );
	  return;
	}

      if ( !IsBitSet(pexit->exit_info, EX_SECRET)
           ||   (pexit->keyword && NiftyIsName( arg, pexit->keyword )) )
        {
          send_to_char( "*Click*\r\n", ch );
          act( AT_ACTION, "$n unlocks the $d.",
	       ch, NULL, pexit->keyword, TO_ROOM );
	  remove_bexit_flag( pexit, EX_LOCKED );
          return;
        }
    }

  if ( ( obj = get_obj_here( ch, arg ) ) != NULL )
    {
      /* 'unlock object' */
      if ( obj->item_type != ITEM_CONTAINER )
        {
	  send_to_char( "That's not a container.\r\n", ch );
	  return;
	}

      if ( !IsBitSet(obj->value[1], CONT_CLOSED) )
        {
	  send_to_char( "It's not closed.\r\n", ch );
	  return;
	}

      if ( obj->value[2] < 0 )
        {
	  send_to_char( "It can't be unlocked.\r\n", ch );
	  return;
	}

      if ( !has_key( ch, obj->value[2] ) )
        {
	  send_to_char( "You lack the key.\r\n", ch );
	  return;
	}

      if ( !IsBitSet(obj->value[1], CONT_LOCKED) )
        {
	  send_to_char( "It's already unlocked.\r\n", ch );
	  return;
	}

      RemoveBit(obj->value[1], CONT_LOCKED);
      send_to_char( "*Click*\r\n", ch );
      act( AT_ACTION, "$n unlocks $p.", ch, obj, NULL, TO_ROOM );
      return;
    }

  ch_printf( ch, "You see no %s here.\r\n", arg );
}
