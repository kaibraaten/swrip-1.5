#include "mud.hpp"
#include "character.hpp"
#include "object.hpp"

void do_unlock( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Object *obj = NULL;
  Exit *pexit = NULL;

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      ch->Echo("Unlock what?\r\n");
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
          ch->Echo("It can't be unlocked.\r\n");
	  return;
	}

      if ( !HasKey( ch, pexit->Key) )
        {
          ch->Echo("You lack the key.\r\n");
	  return;
	}

      if ( !IsBitSet(pexit->Flags, EX_LOCKED) )
        {
          ch->Echo("It's already unlocked.\r\n");
	  return;
	}

      if ( !IsBitSet(pexit->Flags, EX_SECRET)
           ||   (pexit->Keyword && NiftyIsName( arg, pexit->Keyword )) )
        {
          ch->Echo("*Click*\r\n");
          Act( AT_ACTION, "$n unlocks the $d.",
	       ch, NULL, pexit->Keyword, TO_ROOM );
	  RemoveBExitFlag( pexit, EX_LOCKED );
          return;
        }
    }

  if ( ( obj = GetObjectHere( ch, arg ) ) != NULL )
    {
      /* 'unlock object' */
      if ( obj->ItemType != ITEM_CONTAINER )
        {
          ch->Echo("That's not a container.\r\n");
	  return;
	}

      if ( !IsBitSet(obj->Value[OVAL_CONTAINER_FLAGS], CONT_CLOSED) )
        {
          ch->Echo("It's not closed.\r\n");
	  return;
	}

      if ( obj->Value[OVAL_CONTAINER_KEY] < 0 )
        {
          ch->Echo("It can't be unlocked.\r\n");
	  return;
	}

      if ( !HasKey( ch, obj->Value[OVAL_CONTAINER_KEY] ) )
        {
          ch->Echo("You lack the key.\r\n");
          return;
	}

      if ( !IsBitSet(obj->Value[OVAL_CONTAINER_FLAGS], CONT_LOCKED) )
        {
          ch->Echo("It's already unlocked.\r\n");
	  return;
	}

      RemoveBit(obj->Value[OVAL_CONTAINER_FLAGS], CONT_LOCKED);
      ch->Echo("*Click*\r\n");
      Act( AT_ACTION, "$n unlocks $p.", ch, obj, NULL, TO_ROOM );
      return;
    }

  ch->Echo("You see no %s here.\r\n", arg );
}

