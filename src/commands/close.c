#include "character.h"
#include "mud.h"

void do_close( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  OBJ_DATA *obj = NULL;
  Exit *pexit = NULL;
  int door = 0;

  OneArgument( argument, arg );

  if ( arg[0] == '\0' )
    {
      do_closehatch(  ch , "" );
      return;
    }

  if ( ( pexit = find_door( ch, arg, true ) ) != NULL )
    {
      /* 'close door' */
      Exit *pexit_rev = NULL;

      if ( !IsBitSet(pexit->exit_info, EX_ISDOOR) )
        {
	  send_to_char( "You can't do that.\r\n", ch );
	  return;
	}

      if ( IsBitSet(pexit->exit_info, EX_CLOSED) )
        {
	  send_to_char( "It's already closed.\r\n", ch );
	  return;
	}

      act( AT_ACTION, "$n closes the $d.", ch, NULL, pexit->keyword, TO_ROOM );
      act( AT_ACTION, "You close the $d.", ch, NULL, pexit->keyword, TO_CHAR );

      /* close the other side */
      if ( ( pexit_rev = pexit->rexit ) != NULL
           && pexit_rev->to_room == ch->in_room )
        {
          Character *rch = NULL;

          SetBit( pexit_rev->exit_info, EX_CLOSED );

          for ( rch = pexit->to_room->first_person; rch; rch = rch->next_in_room )
	    {
	      act( AT_ACTION, "The $d closes.",
		   rch, NULL, pexit_rev->keyword, TO_CHAR );
	    }
        }

      set_bexit_flag( pexit, EX_CLOSED );

      if ( (door=pexit->vdir) >= 0 && door < 10 )
	{
	  check_room_for_traps( ch, trap_door[door]);
	}

      return;
    }

  if ( ( obj = get_obj_here( ch, arg ) ) != NULL )
    {
      if ( obj->item_type != ITEM_CONTAINER )
        {
          if( CAN_WEAR(obj, ITEM_WEAR_OVER))
            {
              obj->value[2] = 1;
              act( AT_ACTION, "You closes $p.", ch, obj, NULL, TO_CHAR );
              act( AT_ACTION, "$n closes $p.", ch, obj, NULL, TO_ROOM );
              check_for_trap( ch, obj, TRAP_OPEN );
              return;

            }

          ch_printf( ch, "%s isn't a container.\r\n",
		     Capitalize( obj->short_descr ) );
          return;
        }

      if ( IsBitSet(obj->value[1], CONT_CLOSED) )
        {
          ch_printf( ch, "%s is already closed.\r\n",
		     Capitalize( obj->short_descr ) );
          return;
        }

      if ( !IsBitSet(obj->value[1], CONT_CLOSEABLE) )
        {
          ch_printf( ch, "%s cannot be opened or closed.\r\n",
		     Capitalize( obj->short_descr ) );
	  return;
        }

      SetBit(obj->value[1], CONT_CLOSED);
      act( AT_ACTION, "You close $p.", ch, obj, NULL, TO_CHAR );
      act( AT_ACTION, "$n closes $p.", ch, obj, NULL, TO_ROOM );
      check_for_trap( ch, obj, TRAP_CLOSE );
      return;
    }

  if ( !StrCmp( arg , "hatch" ) )
    {
      do_closehatch( ch , argument );
      return;
    }

  do_closehatch( ch , arg );
}
