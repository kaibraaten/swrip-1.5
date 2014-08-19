#include <string.h>
#include "mud.h"
#include "character.h"

void do_disguise( Character *ch, char *argument )
{
  int the_chance;
  short gsn;

  if ( IsNpc(ch) )
    return;

  if ( IsBitSet( ch->pcdata->flags, PCFLAG_NOTITLE ))
    {
      SendToCharacter( "You try but the Force resists you.\r\n", ch );
      return;
    }

  if(ch->pcdata->learned[gsn_disguise] <= 0)
    gsn = gsn_cloak;
  else
    gsn = gsn_disguise;

  if ( argument[0] == '\0' )
    {
      SendToCharacter( "Change your title to what?\r\n", ch );
      return;
    }

  the_chance = (int) (ch->pcdata->learned[gsn]);

  if ( GetRandomPercent( ) > the_chance )
    {
      SendToCharacter( "You try to disguise yourself but fail.\r\n", ch );
      return;
    }

  if ( strlen(argument) > 50 )
    argument[50] = '\0';

  SmashTilde( argument );
  set_title( ch, argument );
  learn_from_success( ch, gsn );
  SendToCharacter( "Ok.\r\n", ch );
}
