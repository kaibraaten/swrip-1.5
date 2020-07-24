#include <utility/random.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "log.hpp"
#include "object.hpp"
#include "act.hpp"

/* Allows PCs to learn spells embedded in object. Should prove interesting. - Samson 8-9-98 */
void do_study(std::shared_ptr<Character> ch, std::string argument) /* study by Absalom */
{
    std::shared_ptr<Object> obj;
    int bookskills = 0;

    if(argument.empty())
    {
        ch->Echo("Study what?\r\n");
        return;
    }

    if((obj = GetCarriedObject(ch, argument)) == NULL)
    {
        ch->Echo("You do not have that item.\r\n");
        return;
    }

    if(obj->ItemType != ITEM_BOOK
       && obj->ItemType != ITEM_SCROLL)
    {
        ch->Echo("You can only study books and datapads.\r\n");
        return;
    }

    Act(AT_MAGIC, "$n studies $p.", ch, obj, NULL, ActTarget::Room);
    Act(AT_MAGIC, "You study $p.", ch, obj, NULL, ActTarget::Char);

    for(int i = OVAL_BOOK_SKILL1; i <= OVAL_BOOK_SKILL3; ++i)
    {
        if(obj->Value[i] >= 0 && obj->Value[i] < MAX_SKILL)
        {
            bookskills++;
        }
    }

    int book = GetRandomNumberFromRange(1, bookskills);
    int sn = obj->Value[book];

    if(sn < 0 || sn >= MAX_SKILL || SkillTable[sn] == nullptr)
    {
        Log->Bug("Do_study: bad sn %d.", sn);
        return;
    }

    const auto &skill = SkillTable[sn];
    int characterLevel = GetAbilityLevel(ch, skill->Class);

    if(characterLevel < skill->Level)
    {
        ch->Echo("&RYou're not high enough level in %s to learn %s.&d\r\n",
                 AbilityName[(int)skill->Class], skill->Name.c_str());
        return;
    }
    
    SetWaitState(ch, skill->Beats);

    if(GetRandomPercent() >= 55 + GetSkillLevel(ch, gsn_study) * 4 / 5)
    {
        ch->Echo("You cannot glean any knowledge from it.\r\n");
        LearnFromFailure(ch, gsn_study);
        return;
    }

    if(GetSkillLevel(ch, sn) <= 0)
    {
        Act(AT_MAGIC, "You have begun learning the ability to $t!",
            ch, skill->Name, nullptr, ActTarget::Char);
    }
    else if(GetSkillLevel(ch, sn) < 15)
    {
        Act(AT_MAGIC, "You have learned a bit more of the ability to $t!",
            ch, skill->Name, nullptr, ActTarget::Char);
    }
    else
    {
        Act(AT_MAGIC, "You have absorbed everything the book teaches you on the ability to $t!",
            ch, skill->Name, nullptr, ActTarget::Char);
    }
    
    ch->PCData->Learned[sn] += urange(0, 20 - ch->PCData->Learned[sn], 5);
    ch->PCData->Learned[sn] += 5;
    LearnFromSuccess(ch, gsn_study);
}
