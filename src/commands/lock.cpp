#include "mud.hpp"
#include "character.hpp"

void do_lock( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Object *obj;
  Exit *pexit;

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      ch->Echo("Lock what?\r\n");
      return;
    }

  if ( ( pexit = FindDoor( ch, arg, true ) ) != NULL )
    {
      if ( !IsBitSet(pexit->Flags, EX_ISDOOR) )
        {
   ch->Echo("You can't do that.\r\n");
	  return;
	}

      if ( !IsBitSet(pexit->Flags, EX_CLOSED) )
        {
   ch->Echo("It's not closed.\r\n");
	  return;
	}

      if ( pexit->Key < 0 )
        {
   ch->Echo("It can't be locked.\r\n");
	  return;
	}

      if ( !HasKey( ch, pexit->Key) )
        {
   ch->Echo("You lack the key.\r\n");
	  return;
	}

      if ( IsBitSet(pexit->Flags, EX_LOCKED) )
        {
   ch->Echo("It's already locked.\r\n");
	  return;
	}

      if ( !IsBitSet(pexit->Flags, EX_SECRET)
           || ( !IsNullOrEmpty( pexit->Keyword ) && NiftyIsName( arg, pexit->Keyword )) )
        {
          ch->Echo("*Click*\r\n");
	  Act( AT_ACTION, "$n locks the $d.",
	       ch, NULL, pexit->Keyword, TO_ROOM );
          SetBExitFlag( pexit, EX_LOCKED );
          return;
        }
    }

  if ( ( obj = GetObjectHere( ch, arg ) ) != NULL )
    {
      /* 'lock object' */
      if ( obj->ItemType != ITEM_CONTAINER )
        {
   ch->Echo("That's not a container.\r\n");
	  return;
	}

      if ( !IsBitSet(obj->Value[1], CONT_CLOSED) )
        {
   ch->Echo("It's not closed.\r\n");
	  return;
	}

      if ( obj->Value[2] < 0 )
        {
   ch->Echo("It can't be locked.\r\n");
	  return;
	}

      if ( !HasKey( ch, obj->Value[2] ) )
        {
   ch->Echo("You lack the key.\r\n");
	  return;
	}

      if ( IsBitSet(obj->Value[1], CONT_LOCKED) )
        {
   ch->Echo("It's already locked.\r\n");
	  return;
	}

      SetBit(obj->Value[1], CONT_LOCKED);
      ch->Echo("*Click*\r\n");
      Act( AT_ACTION, "$n locks $p.", ch, obj, NULL, TO_ROOM );
      return;
    }

  ch->Echo("You see no %s here.\r\n", arg );
}


