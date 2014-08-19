#include <string.h>
#include "mud.h"
#include "character.h"

void do_detrap( Character *ch, char *argument )
{
  char arg  [MAX_INPUT_LENGTH];
  Object *obj;
  Object *trap;
  int percent;
  bool found;

  switch( ch->substate )
    {
    default:
      if ( IsNpc(ch) && IsAffectedBy( ch, AFF_CHARM ) )
        {
          SendToCharacter( "You can't concentrate enough for that.\r\n", ch );
          return;
        }
      argument = OneArgument( argument, arg );
      if ( !IsNpc(ch) && !ch->pcdata->learned[gsn_detrap] )
        {
          SendToCharacter("You do not yet know of this skill.\r\n", ch );
          return;
        }
      if ( arg[0] == '\0' )
        {
	  SendToCharacter( "Detrap what?\r\n", ch );
          return;
        }
      if ( ms_find_obj(ch) )
        return;
      found = false;
      if ( ch->mount )
        {
          SendToCharacter( "You can't do that while mounted.\r\n", ch );
          return;
        }
      if ( !ch->in_room->first_content )
        {
          SendToCharacter( "You can't find that here.\r\n", ch );
          return;
        }
      for ( obj = ch->in_room->first_content; obj; obj = obj->next_content )
        {
          if ( CanSeeObject( ch, obj ) && NiftyIsName( arg, obj->name ) )
            {
              found = true;
              break;
            }
        }
      if ( !found )
        {
          SendToCharacter( "You can't find that here.\r\n", ch );
          return;
        }
      Act( AT_ACTION, "You carefully begin your attempt to remove a trap from $p...", ch, obj, NULL, TO_CHAR );
      Act( AT_ACTION, "$n carefully attempts to remove a trap from $p...", ch, obj, NULL, TO_ROOM );
      ch->dest_buf = CopyString( obj->name );
      add_timer( ch, TIMER_DO_FUN, 3, do_detrap, SUB_PAUSE );
      return;

    case SUB_PAUSE:
      if ( !ch->dest_buf )
        {
          SendToCharacter( "Your detrapping was interrupted!\r\n", ch );
          Bug( "do_detrap: ch->dest_buf NULL!", 0 );
          return;
        }
      strcpy( arg, (const char*)ch->dest_buf );
      FreeMemory( ch->dest_buf );
      FreeMemory(ch->dest_buf);
      ch->substate = SUB_NONE;
      break;
    case SUB_TIMER_DO_ABORT:
      FreeMemory(ch->dest_buf);
      ch->substate = SUB_NONE;
      SendToCharacter( "You carefully stop what you were doing.\r\n", ch );
      return;
    }

  if ( !ch->in_room->first_content )
    {
      SendToCharacter( "You can't find that here.\r\n", ch );
      return;
    }
  for ( obj = ch->in_room->first_content; obj; obj = obj->next_content )
    {
      if ( CanSeeObject( ch, obj ) && NiftyIsName( arg, obj->name ) )
        {
          found = true;
          break;
        }
    }
  if ( !found )
    {
      SendToCharacter( "You can't find that here.\r\n", ch );
      return;
    }
  if ( (trap = get_trap( obj )) == NULL )
    {
      SendToCharacter( "You find no trap on that.\r\n", ch );
      return;
    }

  percent  = GetRandomPercent() - ( GetAbilityLevel( ch, SMUGGLING_ABILITY ) / 20 )
    - (GetCurrentLuck(ch) - 16);

  separate_obj(obj);

  if ( !IsNpc(ch) || percent > ch->pcdata->learned[gsn_detrap] )
    {
      SendToCharacter( "Ooops!\r\n", ch );
      spring_trap( ch, trap );
      LearnFromFailure( ch, gsn_detrap );
      return;
    }
  extract_obj( trap );

  SendToCharacter( "You successfully remove a trap.\r\n", ch );
  LearnFromSuccess( ch, gsn_detrap );
}
