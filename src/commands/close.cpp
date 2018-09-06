#include "character.hpp"
#include "mud.hpp"
#include "room.hpp"
#include "object.hpp"

void do_close( Character *ch, std::string argument )
{
  std::string arg;
  Object *obj = NULL;
  Exit *pexit = NULL;
  int door = 0;

  OneArgument( argument, arg );

  if ( arg.empty() )
    {
      do_closehatch( ch, "" );
      return;
    }

  if ( ( pexit = FindDoor( ch, arg, true ) ) != NULL )
    {
      /* 'close door' */
      Exit *pexit_rev = NULL;

      if ( !IsBitSet(pexit->Flags, EX_ISDOOR) )
        {
	  ch->Echo( "You can't do that.\r\n" );
	  return;
	}

      if ( IsBitSet(pexit->Flags, EX_CLOSED) )
        {
	  ch->Echo( "It's already closed.\r\n" );
	  return;
	}

      Act( AT_ACTION, "$n closes the $d.", ch, NULL, pexit->Keyword.c_str(), TO_ROOM );
      Act( AT_ACTION, "You close the $d.", ch, NULL, pexit->Keyword.c_str(), TO_CHAR );

      /* close the other side */
      if ( ( pexit_rev = pexit->ReverseExit ) != NULL
           && pexit_rev->ToRoom == ch->InRoom )
        {
          SetBit( pexit_rev->Flags, EX_CLOSED );

          for(Character *rch : pexit->ToRoom->Characters())
	    {
	      Act( AT_ACTION, "The $d closes.",
		   rch, NULL, pexit_rev->Keyword.c_str(), TO_CHAR );
	    }
        }

      SetBExitFlag( pexit, EX_CLOSED );

      if ( (door=pexit->Direction) > DIR_INVALID && door < DIR_SOMEWHERE )
	{
	  CheckRoomForTraps( ch, TrapDoor[door]);
	}

      return;
    }

  if ( ( obj = GetObjectHere( ch, arg ) ) != NULL )
    {
      if ( obj->ItemType != ITEM_CONTAINER )
        {
          if( CAN_WEAR(obj, ITEM_WEAR_OVER))
            {
              obj->Value[2] = 1;
              Act( AT_ACTION, "You closes $p.", ch, obj, NULL, TO_CHAR );
              Act( AT_ACTION, "$n closes $p.", ch, obj, NULL, TO_ROOM );
              CheckObjectForTrap( ch, obj, TRAP_OPEN );
              return;

            }

          ch->Echo( "%s isn't a container.\r\n",
                    Capitalize( obj->ShortDescr ).c_str() );
          return;
        }

      if ( IsBitSet(obj->Value[OVAL_CONTAINER_FLAGS], CONT_CLOSED) )
        {
          ch->Echo( "%s is already closed.\r\n",
                    Capitalize( obj->ShortDescr ).c_str() );
          return;
        }

      if ( !IsBitSet(obj->Value[OVAL_CONTAINER_FLAGS], CONT_CLOSEABLE) )
        {
          ch->Echo( "%s cannot be opened or closed.\r\n",
		     Capitalize( obj->ShortDescr ).c_str() );
	  return;
        }

      SetBit(obj->Value[OVAL_CONTAINER_FLAGS], CONT_CLOSED);
      Act( AT_ACTION, "You close $p.", ch, obj, NULL, TO_CHAR );
      Act( AT_ACTION, "$n closes $p.", ch, obj, NULL, TO_ROOM );
      CheckObjectForTrap( ch, obj, TRAP_CLOSE );
      return;
    }

  if ( !StrCmp( arg , "hatch" ) )
    {
      do_closehatch( ch, argument );
      return;
    }

  do_closehatch( ch, arg );
}

