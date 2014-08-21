#include "mud.h"
#include "character.h"

void do_open( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Object *obj = NULL;
  Exit *pexit = NULL;
  int door = 0;

  OneArgument( argument, arg );

  if ( arg[0] == '\0' )
    {
      do_openhatch( ch , "" );
      return;
    }

  if ( ( pexit = FindDoor( ch, arg, true ) ) != NULL )
    {
      Exit *pexit_rev = NULL;

      if ( !IsBitSet(pexit->exit_info, EX_ISDOOR) )
        {
	  SendToCharacter( "You can't do that.\r\n", ch );
	  return;
	}

      if ( !IsBitSet(pexit->exit_info, EX_CLOSED) )
        {
	  SendToCharacter( "It's already open.\r\n", ch );
	  return;
	}

      if (  IsBitSet(pexit->exit_info, EX_LOCKED) )
        {
	  SendToCharacter( "It's locked.\r\n", ch );
	  return;
	}

      if ( !IsBitSet(pexit->exit_info, EX_SECRET)
           || (pexit->keyword && NiftyIsName( arg, pexit->keyword )) )
        {
          Act( AT_ACTION, "$n opens the $d.",
	       ch, NULL, pexit->keyword, TO_ROOM );
          Act( AT_ACTION, "You open the $d.",
	       ch, NULL, pexit->keyword, TO_CHAR );

          if ( (pexit_rev = pexit->rexit) != NULL
               && pexit_rev->to_room == ch->in_room )
            {
              Character *rch = NULL;

              for ( rch = pexit->to_room->first_person; rch; rch = rch->next_in_room )
		{
		  Act( AT_ACTION, "The $d opens.",
		       rch, NULL, pexit_rev->keyword, TO_CHAR );
		}
            }

          RemoveBExitFlag( pexit, EX_CLOSED );
	  door = pexit->vdir;

          if ( door >= TRAP_N && door <= TRAP_SW )
	    {
	      CheckRoomForTraps( ch, trap_door[door]);
	    }

          return;
        }
    }

  if ( ( obj = GetObjectHere( ch, arg ) ) != NULL )
    {
      if ( obj->item_type != ITEM_CONTAINER )
        {
          if( CAN_WEAR(obj, ITEM_WEAR_OVER) )
            {
              obj->value[2] = 0;
              Act( AT_ACTION, "You open $p.", ch, obj, NULL, TO_CHAR );
              Act( AT_ACTION, "$n opens $p.", ch, obj, NULL, TO_ROOM );
              CheckObjectForTrap( ch, obj, TRAP_OPEN );
              return;

            }

          Echo( ch, "%s isn't a container.\r\n",
		     Capitalize( obj->short_descr ) );
          return;
        }

      if ( !IsBitSet(obj->value[1], CONT_CLOSED) )
        {
	  Echo( ch, "%s is already open.\r\n",
		     Capitalize( obj->short_descr ) );
          return;
        }

      if ( !IsBitSet(obj->value[1], CONT_CLOSEABLE) )
        {
          Echo( ch, "%s cannot be opened or closed.\r\n",
		     Capitalize( obj->short_descr ) );
          return;
        }

      if ( IsBitSet(obj->value[1], CONT_LOCKED) )
        {
          Echo( ch, "%s is locked.\r\n", Capitalize( obj->short_descr ) );
          return;
        }

      RemoveBit(obj->value[1], CONT_CLOSED);
      Act( AT_ACTION, "You open $p.", ch, obj, NULL, TO_CHAR );
      Act( AT_ACTION, "$n opens $p.", ch, obj, NULL, TO_ROOM );
      CheckObjectForTrap( ch, obj, TRAP_OPEN );
      return;
    }

  if ( !StrCmp(arg , "hatch") )
    {
      do_openhatch( ch , argument );
      return;
    }

  do_openhatch( ch , arg );
}
