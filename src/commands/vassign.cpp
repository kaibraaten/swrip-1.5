#include <cassert>
#include "repos/arearepository.hpp"
#include "character.hpp"
#include "mud.hpp"
#include "area.hpp"
#include "pcdata.hpp"
#include "vnumconverter.hpp"

void do_vassign(std::shared_ptr<Character> ch, std::string argument)
{
    std::string arg1;
    std::string arg2;
    std::string arg3;

    argument = OneArgument(argument, arg1);
    argument = OneArgument(argument, arg2);
    argument = OneArgument(argument, arg3);

    vnum_t r_lo = ToLong(arg2);
    vnum_t r_hi = ToLong(arg3);

    if(arg1.empty() || r_lo < 0 || r_hi < 0)
    {
        ch->Echo("Syntax: vassign <who> <low> <high>\r\n");
        return;
    }

    auto victim = GetCharacterAnywhere(ch, arg1);

    if(victim == nullptr)
    {
        ch->Echo("They don't seem to be around.\r\n");
        return;
    }

    if(IsNpc(victim) || GetTrustLevel(victim) < LEVEL_CREATOR)
    {
        ch->Echo("They wouldn't know what to do with a vnum range.\r\n");
        return;
    }

    if(r_lo > r_hi)
    {
        ch->Echo("Unacceptable vnum range.\r\n");
        return;
    }

    if(r_lo == 0)
    {
        r_hi = 0;
    }

    victim->PCData->Build.VnumRanges.Room.First = r_lo;
    victim->PCData->Build.VnumRanges.Room.Last = r_hi;
    victim->PCData->Build.VnumRanges.Object.First = r_lo;
    victim->PCData->Build.VnumRanges.Object.Last = r_hi;
    victim->PCData->Build.VnumRanges.Mob.First = r_lo;
    victim->PCData->Build.VnumRanges.Mob.Last = r_hi;

    AssignAreaTo(victim);
    ch->Echo("Done.\r\n");
    victim->Echo("%s has assigned you the vnum range %ld - %ld.\r\n",
                 ch->Name.c_str(), r_lo, r_hi);
    AssignAreaTo(victim);        /* Put back by Thoric on 02/07/96 */

    assert(victim->PCData->Build.Area != nullptr);

    auto vnumConverter = VnumConverter::Create(victim->PCData->Build.Area);
    Areas->Save(victim->PCData->Build.Area, vnumConverter);
}
