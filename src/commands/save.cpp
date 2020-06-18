#include "character.hpp"
#include "mud.hpp"
#include "room.hpp"
#include "race.hpp"
#include "repos/playerrepository.hpp"

static void SetMissingBits(std::bitset<Flag::MAX> &bits, long missing)
{
    for(int i = 0; i < bits.size(); ++i)
    {
        if(IsBitSet(missing, (1 << i)))
        {
            bits.set(i);
        }
    }
}

void do_save( std::shared_ptr<Character> ch, std::string argument )
{
    if ( IsNpc(ch) && ch->Flags.test(Flag::Mob::Polymorphed))
    {
        ch->Echo("You can't save while polymorphed.\r\n");
        return;
    }

    if ( IsNpc(ch) )
        return;

    SetMissingBits(ch->AffectedBy, RaceTable[ch->Race].Affected);
    SetMissingBits(ch->Resistant, RaceTable[ch->Race].Resistant);
    SetMissingBits(ch->Susceptible, RaceTable[ch->Race].Susceptible);

    if ( !IsAuthed(ch) )
    {
        ch->Echo("You can't save until after you've graduated from the academy.\r\n");
        return;
    }

    PlayerCharacters->Save( ch );
    SaveHome(ch);
    
    if ( ch->InRoom->Flags.test( Flag::Room::ClanStoreroom ) )
    {
        SaveStoreroom( ch->InRoom );
    }

    saving_char = NULL;
    ch->Echo("Ok.\r\n");
}
