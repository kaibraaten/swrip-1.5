#include "mud.hpp"
#include "character.hpp"
#include "room.hpp"

void do_purge( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      std::list<Character*> copyOfCharactersInRoom(ch->InRoom->Characters());
      
      for(Character *victim : copyOfCharactersInRoom)
        {
          if ( IsNpc(victim) && victim != ch && !IsBitSet(victim->Flags, ACT_POLYMORPHED))
            ExtractCharacter( victim, true );
        }

      for ( Object *obj = ch->InRoom->FirstContent, *obj_next = nullptr; obj; obj = obj_next )
        {
          obj_next = obj->NextContent;

	  if ( obj->ItemType == ITEM_SPACECRAFT )
            continue;

	  ExtractObject( obj );
        }

      Act( AT_IMMORT, "$n purges the room!", ch, NULL, NULL, TO_ROOM);
      ch->Echo("Ok.\r\n");
      return;
    }

  Character *victim = NULL;
  Object *obj = NULL;

  /* fixed to get things in room first -- i.e., purge portal (obj),
   * no more purging mobs with that keyword in another room first
   * -- Tri */
  if ( ( victim = GetCharacterInRoom( ch, arg ) ) == NULL
       && ( obj = GetObjectHere( ch, arg ) ) == NULL )
    {
      if ( ( victim = GetCharacterAnywhere( ch, arg ) ) == NULL
           &&   ( obj = GetObjectAnywhere( ch, arg ) ) == NULL )  /* no get_obj_room */
        {
          ch->Echo("They aren't here.\r\n");
          return;
        }
    }

  /* Single object purge in room for high level purge - Scryn 8/12*/
  if ( obj )
    {
      SeparateOneObjectFromGroup( obj );
      Act( AT_IMMORT, "$n purges $p.", ch, obj, NULL, TO_ROOM);
      Act( AT_IMMORT, "You make $p disappear in a puff of smoke!", ch, obj, NULL, TO_CHAR);
      ExtractObject( obj );
      return;
    }


  if ( !IsNpc(victim) )
    {
      ch->Echo("Not on PC's.\r\n");
      return;
    }

  if ( victim == ch )
    {
      ch->Echo("You cannot purge yourself!\r\n");
      return;
    }

  if (IsBitSet(victim->Flags, ACT_POLYMORPHED))
    {
      ch->Echo("You cannot purge a polymorphed player.\r\n");
      return;
    }

  Act( AT_IMMORT, "$n purges $N.", ch, NULL, victim, TO_NOTVICT );
  ExtractCharacter( victim, true );
}

