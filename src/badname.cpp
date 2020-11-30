#include "mud.hpp"
#include "badname.hpp"
#include "repos/badnamerepository.hpp"

bool IsBadName(std::string name)
{
    auto foundName = BadNames->Find([&name](const auto &badName)
                                    {
                                        return StrCmp(badName, name) == 0;
                                    });
    return !foundName.empty();
}

void AddBadName(std::string name)
{
    if(IsBadName(name))
    {
        return;
    }

    BadNames->Add(name);
}

void RemoveBadName(std::string name)
{
    BadNames->Remove(name);
}
