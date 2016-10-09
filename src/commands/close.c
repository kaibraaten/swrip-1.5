#include "character.h"
#include "mud.h"

void do_close( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Object *obj = NULL;
  Exit *pexit = NULL;
  int door = 0;

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      do_closehatch(  ch , "" );
      return;
    }

  if ( ( pexit = FindDoor( ch, arg, true ) ) != NULL )
    {
      /* 'close door' */
      Exit *pexit_rev = NULL;

      if ( !IsBitSet(pexit->exit_info, EX_ISDOOR) )
        {
	  SendToCharacter( "You can't do that.\r\n", ch );
	  return;
	}

      if ( IsBitSet(pexit->exit_info, EX_CLOSED) )
        {
	  SendToCharacter( "It's already closed.\r\n", ch );
	  return;
	}

      Act( AT_ACTION, "$n closes the $d.", ch, NULL, pexit->keyword, TO_ROOM );
      Act( AT_ACTION, "You close the $d.", ch, NULL, pexit->keyword, TO_CHAR );

      /* close the other side */
      if ( ( pexit_rev = pexit->rexit ) != NULL
           && pexit_rev->to_room == ch->in_room )
        {
          Character *rch = NULL;

          SetBit( pexit_rev->exit_info, EX_CLOSED );

          for ( rch = pexit->to_room->first_person; rch; rch = rch->next_in_room )
	    {
	      Act( AT_ACTION, "The $d closes.",
		   rch, NULL, pexit_rev->keyword, TO_CHAR );
	    }
        }

      SetBExitFlag( pexit, EX_CLOSED );

      if ( (door=pexit->vdir) >= 0 && door < 10 )
	{
	  CheckRoomForTraps( ch, trap_door[door]);
	}

      return;
    }

  if ( ( obj = GetObjectHere( ch, arg ) ) != NULL )
    {
      if ( obj->item_type != ITEM_CONTAINER )
        {
          if( CAN_WEAR(obj, ITEM_WEAR_OVER))
            {
              obj->value[2] = 1;
              Act( AT_ACTION, "You closes $p.", ch, obj, NULL, TO_CHAR );
              Act( AT_ACTION, "$n closes $p.", ch, obj, NULL, TO_ROOM );
              CheckObjectForTrap( ch, obj, TRAP_OPEN );
              return;

            }

          Echo( ch, "%s isn't a container.\r\n",
		     Capitalize( obj->short_descr ) );
          return;
        }

      if ( IsBitSet(obj->value[1], CONT_CLOSED) )
        {
          Echo( ch, "%s is already closed.\r\n",
		     Capitalize( obj->short_descr ) );
          return;
        }

      if ( !IsBitSet(obj->value[1], CONT_CLOSEABLE) )
        {
          Echo( ch, "%s cannot be opened or closed.\r\n",
		     Capitalize( obj->short_descr ) );
	  return;
        }

      SetBit(obj->value[1], CONT_CLOSED);
      Act( AT_ACTION, "You close $p.", ch, obj, NULL, TO_CHAR );
      Act( AT_ACTION, "$n closes $p.", ch, obj, NULL, TO_ROOM );
      CheckObjectForTrap( ch, obj, TRAP_CLOSE );
      return;
    }

  if ( !StrCmp( arg , "hatch" ) )
    {
      do_closehatch( ch , argument );
      return;
    }

  do_closehatch( ch , arg );
}
