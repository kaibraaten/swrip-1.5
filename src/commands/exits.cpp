#include <cstring>
#include "mud.hpp"
#include "character.hpp"
#include "room.hpp"
#include "exit.hpp"

void do_exits(Character *ch, std::string argument)
{
    char buf[MAX_STRING_LENGTH] = { '\0' };
    bool found = false;
    bool fAuto = !StrCmp(argument, "auto");

    SetCharacterColor(AT_EXITS, ch);

    if (IsBlind(ch))
    {
        ch->Echo("You can't see a thing!\r\n");
        return;
    }

    strcpy(buf, fAuto ? "Exits:" : "Obvious exits:\r\n");

    for (std::shared_ptr<Exit> pexit : ch->InRoom->Exits())
    {
        if (pexit->ToRoom
            && !pexit->Flags.test(Flag::Exit::Hidden))
        {
            found = true;

            if (!fAuto)
            {
                if (pexit->Flags.test(Flag::Exit::Closed))
                {
                    sprintf(buf + strlen(buf), "%-5s - (closed)\r\n",
                        Capitalize(GetDirectionName(pexit->Direction)).c_str());
                }
                else if (pexit->Flags.test(Flag::Exit::Window))
                {
                    sprintf(buf + strlen(buf), "%-5s - (window)\r\n",
                        Capitalize(GetDirectionName(pexit->Direction)).c_str());
                }
                else if (pexit->Flags.test(Flag::Exit::Auto))
                {
                    sprintf(buf + strlen(buf), "%-5s - %s\r\n",
                        Capitalize(pexit->Keyword).c_str(),
                        IsRoomDark(pexit->ToRoom)
                        ? "Too dark to tell"
                            : GetRoomName(pexit->ToRoom).c_str());
                }
                else
                {
                    sprintf(buf + strlen(buf), "%-5s - %s\r\n",
                        Capitalize(GetDirectionName(pexit->Direction)).c_str(),
                        IsRoomDark(pexit->ToRoom)
                        ? "Too dark to tell"
                            : GetRoomName(pexit->ToRoom).c_str());
                }
            }
            else
            {
                sprintf(buf + strlen(buf), " %s",
                    Capitalize(GetDirectionName(pexit->Direction)).c_str());
            }
        }
    }

    if (!found)
        strcat(buf, fAuto ? " none.\r\n" : "None.\r\n");
    else if (fAuto)
        strcat(buf, ".\r\n");

    ch->Echo("%s", buf);
}
