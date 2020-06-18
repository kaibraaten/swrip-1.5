#include <utility/algorithms.hpp>
#include "mud.hpp"
#include "character.hpp"
#include "room.hpp"
#include "object.hpp"
#include "act.hpp"

void do_purge(std::shared_ptr<Character> ch, std::string arg)
{
    if(arg.empty())
    {
        auto charactersToExtract = Filter(ch->InRoom->Characters(),
                                          [ch](const auto victim)
                                          {
                                              return IsNpc(victim)
                                                  && victim != ch
                                                  && !victim->Flags.test(Flag::Mob::Polymorphed);
                                          });
        for(auto victim : charactersToExtract)
        {
            ExtractCharacter(victim, true);
        }

        auto objectsToExtract = Filter(ch->InRoom->Objects(),
                                       [](const auto obj)
                                       {
                                           return obj->ItemType != ITEM_SPACECRAFT;
                                       });
        for(auto obj : objectsToExtract)
        {
            ExtractObject(obj);
        }

        Act(AT_IMMORT, "$n purges the room!", ch, NULL, NULL, ActTarget::Room);
        ch->Echo("Ok.\r\n");
        return;
    }

    std::shared_ptr<Character> victim;
    std::shared_ptr<Object> obj;

    /* fixed to get things in room first -- i.e., purge portal (obj),
     * no more purging mobs with that keyword in another room first
     * -- Tri */
    if((victim = GetCharacterInRoom(ch, arg)) == NULL
       && (obj = GetObjectHere(ch, arg)) == NULL)
    {
        if((victim = GetCharacterAnywhere(ch, arg)) == NULL
           && (obj = GetObjectAnywhere(ch, arg)) == NULL)  /* no get_obj_room */
        {
            ch->Echo("They aren't here.\r\n");
            return;
        }
    }

    /* Single object purge in room for high level purge - Scryn 8/12*/
    if(obj)
    {
        SeparateOneObjectFromGroup(obj);
        Act(AT_IMMORT, "$n purges $p.", ch, obj, NULL, ActTarget::Room);
        Act(AT_IMMORT, "You make $p disappear in a puff of smoke!", ch, obj, NULL, ActTarget::Char);
        ExtractObject(obj);
        return;
    }


    if(!IsNpc(victim))
    {
        ch->Echo("Not on PC's.\r\n");
        return;
    }

    if(victim == ch)
    {
        ch->Echo("You cannot purge yourself!\r\n");
        return;
    }

    if(victim->Flags.test(Flag::Mob::Polymorphed))
    {
        ch->Echo("You cannot purge a polymorphed player.\r\n");
        return;
    }

    Act(AT_IMMORT, "$n purges $N.", ch, NULL, victim, ActTarget::NotVict);
    ExtractCharacter(victim, true);
}
