#include "mud.hpp"
#include "social.hpp"
#include "character.hpp"
#include "repos/socialrepository.hpp"

void do_socials( std::shared_ptr<Character> ch, std::string argument )
{
  const int NUMBER_OF_COLUMNS = 6;
  int col = 0;

  SetCharacterColor( AT_PLAIN, ch );

  for(auto social : Socials->Entities())
    {
      ch->Echo("%-12s", social->Name.c_str() );
      
      if ( ++col % NUMBER_OF_COLUMNS == 0 )
        {
          ch->Echo("\r\n");
        }
    }

  if ( col % NUMBER_OF_COLUMNS != 0 )
    {
      ch->Echo("\r\n");
    }
}
