#include "mud.h"

void do_unlock( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Object *obj = NULL;
  Exit *pexit = NULL;

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      SendToCharacter( "Unlock what?\r\n", ch );
      return;
    }

  if ( ( pexit = FindDoor( ch, arg, true ) ) != NULL )
    {
      if ( !IsBitSet(pexit->Flags, EX_ISDOOR) )
        {
	  SendToCharacter( "You can't do that.\r\n", ch );
	  return;
	}

      if ( !IsBitSet(pexit->Flags, EX_CLOSED) )
        {
	  SendToCharacter( "It's not closed.\r\n", ch );
	  return;
	}

      if ( pexit->key < 0 )
        {
	  SendToCharacter( "It can't be unlocked.\r\n", ch );
	  return;
	}

      if ( !HasKey( ch, pexit->key) )
        {
	  SendToCharacter( "You lack the key.\r\n", ch );
	  return;
	}

      if ( !IsBitSet(pexit->Flags, EX_LOCKED) )
        {
	  SendToCharacter( "It's already unlocked.\r\n", ch );
	  return;
	}

      if ( !IsBitSet(pexit->Flags, EX_SECRET)
           ||   (pexit->keyword && NiftyIsName( arg, pexit->keyword )) )
        {
          SendToCharacter( "*Click*\r\n", ch );
          Act( AT_ACTION, "$n unlocks the $d.",
	       ch, NULL, pexit->keyword, TO_ROOM );
	  RemoveBExitFlag( pexit, EX_LOCKED );
          return;
        }
    }

  if ( ( obj = GetObjectHere( ch, arg ) ) != NULL )
    {
      /* 'unlock object' */
      if ( obj->item_type != ITEM_CONTAINER )
        {
	  SendToCharacter( "That's not a container.\r\n", ch );
	  return;
	}

      if ( !IsBitSet(obj->value[1], CONT_CLOSED) )
        {
	  SendToCharacter( "It's not closed.\r\n", ch );
	  return;
	}

      if ( obj->value[2] < 0 )
        {
	  SendToCharacter( "It can't be unlocked.\r\n", ch );
	  return;
	}

      if ( !HasKey( ch, obj->value[2] ) )
        {
	  SendToCharacter( "You lack the key.\r\n", ch );
	  return;
	}

      if ( !IsBitSet(obj->value[1], CONT_LOCKED) )
        {
	  SendToCharacter( "It's already unlocked.\r\n", ch );
	  return;
	}

      RemoveBit(obj->value[1], CONT_LOCKED);
      SendToCharacter( "*Click*\r\n", ch );
      Act( AT_ACTION, "$n unlocks $p.", ch, obj, NULL, TO_ROOM );
      return;
    }

  Echo( ch, "You see no %s here.\r\n", arg );
}
