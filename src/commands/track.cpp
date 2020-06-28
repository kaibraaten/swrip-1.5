#include "character.hpp"
#include "track.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "ship.hpp"
#include "pcdata.hpp"

void do_track(std::shared_ptr<Character> ch, std::string arg)
{
    std::shared_ptr<Character> vict;
    char buf[MAX_STRING_LENGTH] = { '\0' };
    int maxdist = 0;

    if(!IsNpc(ch) && GetSkillLevel(ch, gsn_track) <= 0)
    {
        ch->Echo("You do not know of this skill yet.\r\n");
        return;
    }

    if(arg.empty())
    {
        ch->Echo("Whom are you trying to track?\r\n");
        return;
    }

    SetWaitState(ch, SkillTable[gsn_track]->Beats);

    if(!(vict = GetCharacterAnywhere(ch, arg)))
    {
        ch->Echo("You can't sense a trail from here.\r\n");
        return;
    }

    maxdist = 100 + ch->TopLevel * 30;

    if(!IsNpc(ch))
        maxdist = (maxdist * GetSkillLevel(ch, gsn_track)) / 100;

    DirectionType dir = FindFirstStep(ch->InRoom, vict->InRoom, maxdist);

    switch(dir)
    {
    case BFS_ERROR:
        ch->Echo("Hmm... something seems to be wrong.\r\n");
        break;

    case BFS_ALREADY_THERE:
        ch->Echo("You're already in the same room!\r\n");
        break;

    case BFS_NO_PATH:
        sprintf(buf, "You can't sense a trail from here.\r\n");
        ch->Echo("%s", buf);
        LearnFromFailure(ch, gsn_track);
        break;

    default:
        ch->Echo("You sense a trail %s from here...\r\n",
                 GetDirectionName((DirectionType)dir));
        LearnFromSuccess(ch, gsn_track);
        break;
    }
}
