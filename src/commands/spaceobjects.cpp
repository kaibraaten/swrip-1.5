#include <utility/algorithms.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "spaceobject.hpp"
#include "repos/spaceobjectrepository.hpp"

void do_spaceobjects(std::shared_ptr<Character> ch, std::string argument)
{
    SetCharacterColor(AT_RED, ch);

    auto suns = Filter(Spaceobjects->Entities(),
                       [](const auto &spaceobject)
                       {
                           return spaceobject->Type <= SPACE_SUN;
                       });
    sort(std::begin(suns), std::end(suns), [](const auto &sun1, const auto &sun2)
         {
             return StrCmp(sun1->Name, sun2->Name) < 0;
         });
    for(auto spaceobject : suns)
    {
        if(!(spaceobject->IsSimulator && (!IsGreater(ch))))
        {
            ch->Echo("%s\r\n", spaceobject->Name.c_str());
        }
    }

    ch->Echo("\r\n");
    SetCharacterColor(AT_NOTE, ch);

    auto planets = Filter(Spaceobjects->Entities(),
                          [](const auto &spaceobject)
                          {
                              return spaceobject->Type == SPACE_PLANET;
                          });
    std::sort(std::begin(planets), std::end(planets), [](const auto &p1, const auto &p2)
              {
                  return StrCmp(p1->Name, p2->Name) < 0;
              });
    for(auto spaceobject : planets)
    {
        if(!(spaceobject->IsSimulator && (!IsGreater(ch))))
        {
            ch->Echo("%s\r\n", spaceobject->Name.c_str());
        }
    }

    if(suns.empty() && planets.empty())
    {
        ch->Echo("There are no spaceobjects currently formed.\r\n");
        return;
    }
}
