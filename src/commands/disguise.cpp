#include <string.h>
#include "mud.hpp"
#include "character.hpp"
#include "skill.hpp"

void do_disguise( Character *ch, char *argument )
{
  int the_chance;
  short gsn;
  const size_t maxTitleLength = 50;
  
  if ( IsNpc(ch) )
    return;

  if ( IsBitSet( ch->PCData->Flags, PCFLAG_NOTITLE ))
    {
      SendToCharacter( "You try but the Force resists you.\r\n", ch );
      return;
    }

  if(ch->PCData->Learned[gsn_disguise] <= 0)
    gsn = gsn_cloak;
  else
    gsn = gsn_disguise;

  if ( IsNullOrEmpty( argument ) )
    {
      SendToCharacter( "Change your title to what?\r\n", ch );
      return;
    }

  the_chance = (int) (ch->PCData->Learned[gsn]);

  if ( GetRandomPercent() > the_chance )
    {
      SendToCharacter( "You try to disguise yourself but fail.\r\n", ch );
      return;
    }

  if ( strlen(argument) > maxTitleLength )
    argument[maxTitleLength] = '\0';

  SmashTilde( argument );
  SetCharacterTitle( ch, argument );
  LearnFromSuccess( ch, gsn );
  SendToCharacter( "Ok.\r\n", ch );
}
