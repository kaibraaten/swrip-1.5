#include <algorithm>
#include <cstring>
#include "mud.hpp"
#include "character.hpp"
#include "log.hpp"
#include "room.hpp"

void do_order( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  char argbuf[MAX_INPUT_LENGTH];
  Character *victim = NULL;
  bool fAll = false;

  strcpy( argbuf, argument );
  argument = OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) || IsNullOrEmpty( argument ) )
    {
      ch->Echo("Order whom to do what?\r\n");
      return;
    }

  if ( IsAffectedBy( ch, AFF_CHARM ) )
    {
      ch->Echo("You feel like taking, not giving, orders.\r\n");
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
          ch->Echo("They aren't here.\r\n");
          return;
        }

      if ( victim == ch )
        {
          ch->Echo("Aye aye, right away!\r\n");
          return;
        }

      if ( !IsAffectedBy(victim, AFF_CHARM) || victim->Master != ch )
        {
          ch->Echo("Do it yourself!\r\n");
          return;
        }
    }

  if ( !StringPrefix("mp",argument) )
    {
      ch->Echo("But that's cheating!\r\n");
      return;
    }

  std::list<Character*> charactersToOrder;

  copy_if(std::begin(ch->InRoom->Characters()),
          std::end(ch->InRoom->Characters()),
          std::begin(charactersToOrder),
          [ch, fAll, victim](auto och)
          {
            return IsAffectedBy(och, AFF_CHARM)
              && och->Master == ch
              && ( fAll || och == victim );
          });
  
  if ( !charactersToOrder.empty() )
    {
      for(Character *och : charactersToOrder)
        {
          Act( AT_ACTION, "$n orders you to '$t'.",
               ch, argument, och, TO_VICT );
          Interpret( och, argument );
        }
      
      Log->Info("%s: order %s.", ch->Name, argbuf );
      ch->Echo("Ok.\r\n");
      SetWaitState( ch, 12 );
    }
  else
    {
      ch->Echo("You have no followers here.\r\n");
    }
}

