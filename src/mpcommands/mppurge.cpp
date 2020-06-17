#include <utility/algorithms.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "room.hpp"
#include "object.hpp"
#include "protomob.hpp"

/* lets the mobile purge all objects and other npcs in the room,
   or purge a specified object or mob in the room.  It can purge
   itself, but this had best be the last command in the MUDprogram
   otherwise ugly stuff will happen */

void do_mppurge(Character *ch, std::string arg)
{
    Character *victim = nullptr;

    if(IsAffectedBy(ch, Flag::Affect::Charm))
        return;

    if(!IsNpc(ch))
    {
        ch->Echo("Huh?\r\n");
        return;
    }

    if(arg.empty())
    {
        auto npcsToPurge = Filter(ch->InRoom->Characters(),
                                  [ch](auto npc)
                                  {
                                      return IsNpc(npc) && npc != ch;
                                  });

        for(auto npc : npcsToPurge)
        {
            ExtractCharacter(npc, true);
        }

        auto objectsToPurge = ch->InRoom->Objects();

        for(auto obj : objectsToPurge)
        {
            ExtractObject(obj);
        }

        return;
    }

    if((victim = GetCharacterInRoom(ch, arg)) == NULL)
    {
        auto obj = GetObjectHere(ch, arg);

        if(obj != nullptr)
        {
            ExtractObject(obj);
        }
        else
        {
            ProgBug("Mppurge - Bad argument", ch);
        }

        return;
    }

    if(!IsNpc(victim))
    {
        ProgBug("Mppurge - Trying to purge a PC", ch);
        return;
    }

    if(victim == ch)
    {
        ProgBug("Mppurge - Trying to purge oneself", ch);
        return;
    }

    if(IsNpc(victim) && victim->Prototype->Vnum == MOB_VNUM_SUPERMOB)
    {
        ProgBug("Mppurge: trying to purge supermob", ch);
        return;
    }

    ExtractCharacter(victim, true);
}
