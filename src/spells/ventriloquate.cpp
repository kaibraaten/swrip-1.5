#include <ctype.h>
#include "mud.hpp"
#include "character.hpp"
#include "room.hpp"

extern std::string spell_target_name;

ch_ret spell_ventriloquate(int sn, int level, std::shared_ptr<Character> caster, const Vo &vo)
{
    char buf1[MAX_STRING_LENGTH] = {'\0'};
    char buf2[MAX_STRING_LENGTH] = {'\0'};
    std::string speaker;

    spell_target_name = OneArgument(spell_target_name, speaker);

    sprintf(buf1, "%s says '%s'.\r\n",
            speaker.c_str(), spell_target_name.c_str());
    sprintf(buf2, "Someone makes %s say '%s'.\r\n",
            speaker.c_str(), spell_target_name.c_str());
    buf1[0] = CharToUppercase(buf1[0]);

    for (auto vch : caster->InRoom->Characters())
    {
        if (!IsName(speaker, vch->Name))
        {
            SetCharacterColor(AT_SAY, vch);
            vch->Echo("%s", SaveVsSpellStaff(level, vch) ? buf2 : buf1);
        }
    }

    return rNONE;
}

