#include "mud.hpp"
#include "character.hpp"

void do_purge( Character *ch, std::string argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim;
  Object *obj;

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      /* 'purge' */
      Character *vnext;
      Object  *obj_next;

      for ( victim = ch->InRoom->FirstPerson; victim; victim = vnext )
        {
          vnext = victim->NextInRoom;

          if ( IsNpc(victim) && victim != ch && !IsBitSet(victim->Flags, ACT_POLYMORPHED))
            ExtractCharacter( victim, true );
        }

      for ( obj = ch->InRoom->FirstContent; obj; obj = obj_next )
        {
          obj_next = obj->NextContent;

	  if ( obj->ItemType == ITEM_SPACECRAFT )
            continue;

	  ExtractObject( obj );
        }

      Act( AT_IMMORT, "$n purges the room!", ch, NULL, NULL, TO_ROOM);
      SendToCharacter( "Ok.\r\n", ch );
      return;
    }

  victim = NULL;
  obj = NULL;

  /* fixed to get things in room first -- i.e., purge portal (obj),
   * no more purging mobs with that keyword in another room first
   * -- Tri */
  if ( ( victim = GetCharacterInRoom( ch, arg ) ) == NULL
       && ( obj = GetObjectHere( ch, arg ) ) == NULL )
    {
      if ( ( victim = GetCharacterAnywhere( ch, arg ) ) == NULL
           &&   ( obj = GetObjectAnywhere( ch, arg ) ) == NULL )  /* no get_obj_room */
        {
          SendToCharacter( "They aren't here.\r\n", ch );
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
      SendToCharacter( "Not on PC's.\r\n", ch );
      return;
    }

  if ( victim == ch )
    {
      SendToCharacter( "You cannot purge yourself!\r\n", ch );
      return;
    }

  if (IsBitSet(victim->Flags, ACT_POLYMORPHED))
    {
      SendToCharacter("You cannot purge a polymorphed player.\r\n", ch);
      return;
    }

  Act( AT_IMMORT, "$n purges $N.", ch, NULL, victim, TO_NOTVICT );
  ExtractCharacter( victim, true );
}
