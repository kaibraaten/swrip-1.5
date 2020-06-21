#include "mud.hpp"
#include "planet.hpp"
#include "character.hpp"
#include "repos/planetrepository.hpp"

void do_makeplanet(std::shared_ptr<Character> ch, std::string argument)
{
    if(argument.empty())
    {
        ch->Echo("Usage: makeplanet <planet name>\r\n");
        return;
    }

    if(Planets->FindByName(argument) != nullptr)
    {
        ch->Echo("&RThere's already another planet with that name.&d\r\n");
        return;
    }

    std::shared_ptr<Planet> planet = std::make_shared<Planet>();
    planet->Name = argument;
    Planets->Add(planet);
}
