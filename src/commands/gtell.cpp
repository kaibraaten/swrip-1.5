#include "character.hpp"
#include "mud.hpp"

void do_gtell(std::shared_ptr<Character> ch, std::string argument)
{
    if(argument.empty())
    {
        ch->Echo("Tell your group what?\r\n");
        return;
    }

    if(ch->Flags.test(Flag::Plr::NoTell))
    {
        ch->Echo("Your message didn't get through!\r\n");
        return;
    }

    /*
     * Note use of SendToCharacter, so gtell works on sleepers.
     */
     /*    sprintf( buf, "%s tells the group '%s'.\r\n", ch->Name, argument );*/
    for(auto gch = FirstCharacter; gch; gch = gch->Next)
    {
        if(IsInSameGroup(gch, ch))
        {
            SetCharacterColor(AT_GTELL, gch);
            /* Groups unscrambled regardless of clan language.  Other languages
               still garble though. -- Altrag */

            if(CharacterKnowsLanguage(gch, ch->Speaking, gch)
               || (IsNpc(ch) && !ch->Speaking))
                gch->Echo("%s tells the group '%s'.\r\n",
                          ch->Name.c_str(), argument.c_str());
            else
                gch->Echo("%s tells the group '%s'.\r\n",
                          ch->Name.c_str(), Scramble(argument, ch->Speaking).c_str());
        }
    }
}
