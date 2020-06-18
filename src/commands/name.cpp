#include <cctype>
#include <utility/algorithms.hpp>
#include "mud.hpp"
#include "character.hpp"
#include "pcdata.hpp"
#include "race.hpp"
#include "repos/playerrepository.hpp"

void do_name( std::shared_ptr<Character> ch, std::string argument )
{
    if ( IsAuthed(ch) || ch->PCData->AuthState != 2)
    {
        ch->Echo("Huh?\r\n");
        return;
    }

    if( argument.empty() )
    {
        ch->Echo( "Change your name to what?\r\n" );
        return;
    }

    argument[0] = CharToUppercase(argument[0]);

    if (!IsNameAcceptable(argument))
    {
        ch->Echo("Illegal name, try another.\r\n");
        return;
    }

    if (!StrCmp(ch->Name, argument))
    {
        ch->Echo("That's already your name!\r\n");
        return;
    }

    bool taken = Find(PlayerCharacters->Entities(),
                      [argument](const auto &pc)
                      {
                          return StrCmp(argument, pc->Name) == 0;
                      }) != nullptr
        || PlayerCharacters->Exists(argument);
    
    if (taken)
    {
        ch->Echo("That name is already taken. Please choose another.\r\n");
        return;
    }

    ch->Name = argument;
    std::string buf = FormatString("%s the %s",ch->Name.c_str(),
                                   RaceTable[ch->Race].Name );
    SetCharacterTitle( ch, buf );

    ch->Echo("Your name has been changed. Please apply again.\r\n");
    ch->PCData->AuthState = 1;
}
