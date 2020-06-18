#include "character.hpp"
#include "mud.hpp"
#include "descriptor.hpp"
#include "repos/descriptorrepository.hpp"

void do_forceclose(std::shared_ptr<Character> ch, std::string arg)
{
    if (arg.empty())
    {
        ch->Echo("Usage: forceclose <descriptor#>\r\n");
        return;
    }

    int desc = ToLong(arg);

    for (auto d : Descriptors->Entities())
    {
        if (d->Socket == desc)
        {
            if (d->Char && GetTrustLevel(d->Char) >= GetTrustLevel(ch))
            {
                ch->Echo("They might not like that...\r\n");
                return;
            }

            CloseDescriptor(d, false);
            ch->Echo("Ok.\r\n");
            return;
        }
    }

    ch->Echo("Not found!\r\n");
}

