#include <cstring>
#include <utility/random.hpp>
#include "mud.hpp"
#include "character.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "log.hpp"
#include "room.hpp"
#include "object.hpp"

void do_detrap( Character *ch, std::string argument )
{
  std::string arg;
  Object *obj = NULL;
  Object *trap = NULL;
  int percent = 0;
  bool found = false;

  switch( ch->SubState )
    {
    default:
      if ( IsNpc(ch) && IsAffectedBy( ch, AFF_CHARM ) )
        {
          ch->Echo( "You can't concentrate enough for that.\r\n" );
          return;
        }
      
      argument = OneArgument( argument, arg );

      if ( !IsNpc(ch) && !ch->PCData->Learned[gsn_detrap] )
        {
          ch->Echo("You do not yet know of this skill.\r\n" );
          return;
        }
      
      if ( arg.empty() )
        {
	  ch->Echo( "Detrap what?\r\n" );
          return;
        }

      if ( HasMentalStateToFindObject(ch) )
        return;

      found = false;

      if ( ch->Mount )
        {
          ch->Echo( "You can't do that while mounted.\r\n" );
          return;
        }

      if ( ch->InRoom->Objects().empty() )
        {
          ch->Echo( "You can't find that here.\r\n" );
          return;
        }

      for(auto i = std::begin(ch->InRoom->Objects()); i != std::end(ch->InRoom->Objects()); ++i)
        {
          obj = *i;
          
          if ( CanSeeObject( ch, obj ) && NiftyIsName( arg, obj->Name ) )
            {
              found = true;
              break;
            }
        }

      if ( !found )
        {
          ch->Echo( "You can't find that here.\r\n" );
          return;
        }

      Act( AT_ACTION, "You carefully begin your attempt to remove a trap from $p...",
           ch, obj, NULL, TO_CHAR );
      Act( AT_ACTION, "$n carefully attempts to remove a trap from $p...",
           ch, obj, NULL, TO_ROOM );
      ch->dest_buf = CopyString( obj->Name );
      AddTimerToCharacter( ch, TIMER_CMD_FUN, 3, do_detrap, SUB_PAUSE );
      return;

    case SUB_PAUSE:
      if ( !ch->dest_buf )
        {
          ch->Echo( "Your detrapping was interrupted!\r\n" );
          Log->Bug( "do_detrap: ch->dest_buf NULL!" );
          return;
        }
      
      arg = static_cast<const char*>(ch->dest_buf);
      FreeMemory( ch->dest_buf );
      ch->SubState = SUB_NONE;
      break;

    case SUB_TIMER_DO_ABORT:
      FreeMemory(ch->dest_buf);
      ch->SubState = SUB_NONE;
      ch->Echo( "You carefully stop what you were doing.\r\n" );
      return;
    }

  if ( ch->InRoom->Objects().empty() )
    {
      ch->Echo( "You can't find that here.\r\n" );
      return;
    }

  for(auto i = std::begin(ch->InRoom->Objects()); i != std::end(ch->InRoom->Objects()); ++i)
    {
      obj = *i;
      
      if ( CanSeeObject( ch, obj ) && NiftyIsName( arg, obj->Name ) )
        {
          found = true;
          break;
        }
    }
  
  if ( !found )
    {
      ch->Echo( "You can't find that here.\r\n" );
      return;
    }
  
  if ( (trap = GetTrap( obj )) == NULL )
    {
      ch->Echo( "You find no trap on that.\r\n" );
      return;
    }

  percent  = GetRandomPercent() - ( GetAbilityLevel( ch, SMUGGLING_ABILITY ) / 20 )
    - (GetCurrentLuck(ch) - 16);

  SeparateOneObjectFromGroup(obj);

  if ( !IsNpc(ch) || percent > ch->PCData->Learned[gsn_detrap] )
    {
      ch->Echo( "Ooops!\r\n" );
      SpringTrap( ch, trap );
      LearnFromFailure( ch, gsn_detrap );
      return;
    }

  ExtractObject( trap );

  ch->Echo( "You successfully remove a trap.\r\n" );
  LearnFromSuccess( ch, gsn_detrap );
}
