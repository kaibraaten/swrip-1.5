#include <cstring>
#include "mud.hpp"
#include "character.hpp"
#include "skill.hpp"
#include "pcdata.hpp"

void do_disguise( Character *ch, char *argument )
{
  int the_chance = 0;
  short gsn = 0;
  const size_t maxTitleLength = 50;
  
  if ( IsNpc(ch) )
    return;

  if ( IsBitSet( ch->PCData->Flags, PCFLAG_NOTITLE ))
    {
      ch->Echo( "You try but the Force resists you.\r\n" );
      return;
    }

  if(ch->PCData->Learned[gsn_disguise] <= 0)
    gsn = gsn_cloak;
  else
    gsn = gsn_disguise;

  if ( IsNullOrEmpty( argument ) )
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

  if ( strlen(argument) > maxTitleLength )
    argument[maxTitleLength] = '\0';

  SmashTilde( argument );
  SetCharacterTitle( ch, argument );
  LearnFromSuccess( ch, gsn );
  ch->Echo( "Ok.\r\n" );
}
