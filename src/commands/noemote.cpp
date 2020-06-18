#include "mud.hpp"
#include "character.hpp"
#include "room.hpp"

void do_noemote( std::shared_ptr<Character> ch, std::string arg )
{
    Character *victim = nullptr;

    if ( arg.empty() )
    {
        ch->Echo("Noemote whom?\r\n");
        return;
    }

    if ( ( victim = GetCharacterAnywhere( ch, arg ) ) == NULL )
    {
        ch->Echo("They aren't here.\r\n");
        return;
    }

    if ( IsNpc(victim) )
    {
        ch->Echo("Not on NPC's.\r\n");
        return;
    }

    if ( GetTrustLevel( victim ) >= GetTrustLevel( ch ) )
    {
        ch->Echo("You failed.\r\n");
        return;
    }

    if (victim->Flags.test(Flag::Plr::NoEmote))
    {
        victim->Flags.reset(Flag::Plr::NoEmote);
        victim->Echo("You can emote again.\r\n");
        ch->Echo("NO_EMOTE removed.\r\n");
    }
    else
    {
        victim->Flags.set(Flag::Plr::NoEmote);
        victim->Echo("You can't emote!\r\n");
        ch->Echo("NO_EMOTE set.\r\n");
    }
}
