#include <cstring>
#include <utility/random.hpp>
#include "mud.hpp"
#include "character.hpp"
#include "skill.hpp"
#include "pcdata.hpp"

void do_disguise( Character *ch, std::string argument )
{
  int the_chance = 0;
  short gsn = 0;
  const size_t maxTitleLength = 50;
  
  if ( IsNpc(ch) )
    return;

  if( ch->PCData->Flags.test( Flag::PCData::NoTitle ) )
    {
      ch->Echo( "You try but the Force resists you.\r\n" );
      return;
    }

  if(ch->PCData->Learned[gsn_disguise] > 0)
    {
      gsn = gsn_disguise;
    }
  else
    {
      gsn = gsn_cloak;
    }

  if ( argument.empty() )
    {
      ch->Echo( "Change your title to what?\r\n" );
      return;
    }

  the_chance = (int) (ch->PCData->Learned[gsn]);

  if ( GetRandomPercent() > the_chance )
    {
      ch->Echo( "You try to disguise yourself but fail.\r\n" );
      return;
    }

  if ( argument.size() > maxTitleLength )
    {
      argument.erase(maxTitleLength);
    }
  
  SmashTilde( argument );
  SetCharacterTitle( ch, argument );
  LearnFromSuccess( ch, gsn );
  ch->Echo( "Ok.\r\n" );
}

