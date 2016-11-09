#include <string.h>
#include "mud.h"
#include "character.hpp"

void do_order( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  char argbuf[MAX_INPUT_LENGTH];
  Character *victim = NULL;
  Character *och = NULL;
  Character *och_next = NULL;
  bool found = false;
  bool fAll = false;

  strcpy( argbuf, argument );
  argument = OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) || IsNullOrEmpty( argument ) )
    {
      SendToCharacter( "Order whom to do what?\r\n", ch );
      return;
    }

  if ( IsAffectedBy( ch, AFF_CHARM ) )
    {
      SendToCharacter( "You feel like taking, not giving, orders.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg, "all" ) )
    {
      fAll = true;
    }
  else
    {
      if ( ( victim = GetCharacterInRoom( ch, arg ) ) == NULL )
        {
          SendToCharacter( "They aren't here.\r\n", ch );
          return;
        }

      if ( victim == ch )
        {
          SendToCharacter( "Aye aye, right away!\r\n", ch );
          return;
        }

      if ( !IsAffectedBy(victim, AFF_CHARM) || victim->Master != ch )
        {
          SendToCharacter( "Do it yourself!\r\n", ch );
          return;
        }
    }

  if ( !StringPrefix("mp",argument) )
    {
      SendToCharacter( "But that's cheating!\r\n", ch );
      return;
    }

  for ( och = ch->InRoom->FirstPerson; och; och = och_next )
    {
      och_next = och->NextInRoom;

      if ( IsAffectedBy(och, AFF_CHARM)
           && och->Master == ch
           && ( fAll || och == victim ) )
        {
          found = true;
          Act( AT_ACTION, "$n orders you to '$t'.",
	       ch, argument, och, TO_VICT );
	  Interpret( och, argument );
        }
    }

  if ( found )
    {
      sprintf( log_buf, "%s: order %s.", ch->Name, argbuf );
      LogStringPlus( log_buf, LOG_NORMAL, ch->TopLevel );
      SendToCharacter( "Ok.\r\n", ch );
      SetWaitState( ch, 12 );
    }
  else
    {
      SendToCharacter( "You have no followers here.\r\n", ch );
    }
}
