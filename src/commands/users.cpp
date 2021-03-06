#include <sstream>
#include <cstring>
#include "mud.hpp"
#include "character.hpp"
#include "descriptor.hpp"
#include "repos/descriptorrepository.hpp"

void do_users(std::shared_ptr<Character> ch, std::string arg)
{
    int count = 0;
    std::ostringstream buf;

    SetCharacterColor(AT_PLAIN, ch);
    buf << "Desc|Con|Idle| Port | Player@HostIP                 "
        << "\r\n"
        << "----+---+----+------+-------------------------------"
        << "\r\n";
    ch->Echo(buf.str());

    for (auto d : Descriptors)
    {
        if (arg.empty())
        {
            if (GetTrustLevel(ch) >= LEVEL_IMPLEMENTOR
                || (d->Char && CanSeeCharacter(ch, d->Char)))
            {
                count++;
                ch->Echo(" %3d| %2d|%4d|%6d| %s@%s ",
                         d->Socket,
                         (int)d->ConnectionState,
                         d->Idle / 4,
                         d->Remote.Port,
                         d->Original ? d->Original->Name.c_str() :
                         d->Char ? d->Char->Name.c_str() : "(none)",
                         d->Remote.HostIP.c_str());

                if (ch->TopLevel() >= LEVEL_GREATER
                    && (!d->Char || d->Char->TopLevel() <= LEVEL_GREATER))
                    ch->Echo(" (%s)", d->Remote.Hostname.c_str());

                ch->Echo("\r\n");
            }
        }
        else
        {
            if ((GetTrustLevel(ch) >= LEVEL_IMPLEMENTOR
                 || (d->Char && CanSeeCharacter(ch, d->Char)))
                && (!StringPrefix(arg, d->Remote.Hostname)
                    || (d->Char && !StringPrefix(arg, d->Char->Name))))
            {
                count++;
                ch->Echo(" %3d| %2d|%4d|%6d| %-12s@%-16s ",
                         d->Socket,
                         (int)d->ConnectionState,
                         d->Idle / 4,
                         d->Remote.Port,
                         d->Original ? d->Original->Name.c_str() :
                         d->Char ? d->Char->Name.c_str() : "(none)",
                         d->Remote.Hostname.c_str()
                    );

                ch->Echo("\r\n");
            }
        }
    }

    ch->Echo("%d user%s.\r\n", count, count == 1 ? "" : "s");
}
