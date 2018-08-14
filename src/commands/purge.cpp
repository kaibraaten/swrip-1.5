#include "mud.hpp"
#include "character.hpp"
#include "room.hpp"
#include "object.hpp"

void do_purge( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      std::list<Character*> charactersToExtract = Filter(ch->InRoom->Characters(),
                                                         [ch](const auto victim)
                                                         {
                                                           return IsNpc(victim)
                                                             && victim != ch
                                                             && !IsBitSet(victim->Flags, ACT_POLYMORPHED);
                                                         });
      for(Character *victim : charactersToExtract)
        {
          ExtractCharacter( victim, true );
        }

      std::list<Object*> objectsToExtract = Filter(ch->InRoom->Objects(),
                                                   [](const auto obj)
                                                   {
                                                     return obj->ItemType != ITEM_SPACECRAFT;
                                                   });
      for(Object *obj : objectsToExtract)
        {
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

