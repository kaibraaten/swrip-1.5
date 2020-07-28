#include "character.hpp"
#include "mud.hpp"
#include "protomob.hpp"

/* A trivial rehack of do_mstat.  This doesnt show all the data, but just
 * enough to identify the mob and give its basic condition.  It does however,
 * show the MUDprograms which are set.
 */
void do_mpstat(std::shared_ptr<Character> ch, std::string arg)
{
    if(arg.empty())
    {
        ch->Echo("MProg stat whom?\r\n");
        return;
    }

    auto victim = GetCharacterAnywhere(ch, arg);

    if(victim == nullptr)
    {
        ch->Echo("They aren't here.\r\n");
        return;
    }

    if(!IsNpc(victim))
    {
        ch->Echo("Only Mobiles can have MobPrograms!\r\n");
        return;
    }

    if(victim->Prototype->mprog.MudProgs().empty())
    {
        ch->Echo("That Mobile has no Programs set.\r\n");
        return;
    }

    ch->Echo("Name: %s.  Vnum: %ld.\r\n",
             victim->Name.c_str(), victim->Prototype->Vnum);

    ch->Echo("Short description: %s.\r\nLong  description: %s",
             victim->ShortDescr.c_str(),
             !victim->LongDescr.empty()
             ? victim->LongDescr.c_str() : "(none).\r\n");

    ch->Echo("Hp: %d/%d.  Mana: %d/%d.  Move: %d/%d. \r\n",
             victim->HitPoints.Current, victim->HitPoints.Max,
             victim->Mana.Current, victim->Mana.Max,
             victim->Fatigue.Current, victim->Fatigue.Max);

    ch->Echo("Lv: %d.  Align: %d.  AC: %d.  Credits: %d.\r\n",
             victim->TopLevel(), victim->Alignment,
             GetArmorClass(victim), victim->Gold);

    for(auto mprg : victim->Prototype->mprog.MudProgs())
    {
        ch->Echo(">%s %s\r\n%s\r\n",
                 MobProgTypeToName(mprg->type),
                 mprg->arglist.c_str(),
                 mprg->comlist.c_str());
    }
}

