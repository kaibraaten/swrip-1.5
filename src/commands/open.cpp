#include "mud.hpp"
#include "character.hpp"
#include "room.hpp"
#include "object.hpp"

void do_open( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Object *obj = NULL;
  Exit *pexit = NULL;
  int door = 0;

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      do_openhatch( ch , "" );
      return;
    }

  if ( ( pexit = FindDoor( ch, arg, true ) ) != NULL )
    {
      Exit *pexit_rev = NULL;

      if ( !IsBitSet(pexit->Flags, EX_ISDOOR) )
        {
   ch->Echo("You can't do that.\r\n");
	  return;
	}

      if ( !IsBitSet(pexit->Flags, EX_CLOSED) )
        {
   ch->Echo("It's already open.\r\n");
	  return;
	}

      if (  IsBitSet(pexit->Flags, EX_LOCKED) )
        {
   ch->Echo("It's locked.\r\n");
	  return;
	}

      if ( !IsBitSet(pexit->Flags, EX_SECRET)
           || (pexit->Keyword && NiftyIsName( arg, pexit->Keyword )) )
        {
          Act( AT_ACTION, "$n opens the $d.",
	       ch, NULL, pexit->Keyword, TO_ROOM );
          Act( AT_ACTION, "You open the $d.",
	       ch, NULL, pexit->Keyword, TO_CHAR );

          if ( (pexit_rev = pexit->ReverseExit) != NULL
               && pexit_rev->ToRoom == ch->InRoom )
            {
              for(Character *rch : pexit->ToRoom->Characters())
		{
		  Act( AT_ACTION, "The $d opens.",
		       rch, NULL, pexit_rev->Keyword, TO_CHAR );
		}
            }

          RemoveBExitFlag( pexit, EX_CLOSED );
	  door = pexit->Direction;

          if ( door >= TRAP_N && door <= TRAP_SW )
	    {
	      CheckRoomForTraps( ch, TrapDoor[door]);
	    }

          return;
        }
    }

  if ( ( obj = GetObjectHere( ch, arg ) ) != NULL )
    {
      if ( obj->ItemType != ITEM_CONTAINER )
        {
          if( CAN_WEAR(obj, ITEM_WEAR_OVER) )
            {
              obj->Value[2] = 0;
              Act( AT_ACTION, "You open $p.", ch, obj, NULL, TO_CHAR );
              Act( AT_ACTION, "$n opens $p.", ch, obj, NULL, TO_ROOM );
              CheckObjectForTrap( ch, obj, TRAP_OPEN );
              return;

            }

          ch->Echo("%s isn't a container.\r\n",
		     Capitalize( obj->ShortDescr ) );
          return;
        }

      if ( !IsBitSet(obj->Value[1], CONT_CLOSED) )
        {
   ch->Echo("%s is already open.\r\n",
		     Capitalize( obj->ShortDescr ) );
          return;
        }

      if ( !IsBitSet(obj->Value[1], CONT_CLOSEABLE) )
        {
          ch->Echo("%s cannot be opened or closed.\r\n",
		     Capitalize( obj->ShortDescr ) );
          return;
        }

      if ( IsBitSet(obj->Value[1], CONT_LOCKED) )
        {
          ch->Echo("%s is locked.\r\n", Capitalize( obj->ShortDescr ) );
          return;
        }

      RemoveBit(obj->Value[1], CONT_CLOSED);
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

