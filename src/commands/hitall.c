#include "mud.h"
#include "character.h"
#include "room.h"

static bool is_legal_kill(Character *ch, Character *vch);

void do_hitall( Character *ch, char *argument )
{
  short nvict = 0;
  short nhit = 0;
  short percent = 0;
  CerisList *peopleInRoom = NULL;
  CerisListIterator *peopleInRoomIterator = NULL;

  if ( IS_SET(ch->in_room->room_flags, ROOM_SAFE) )
    {
      send_to_char( "You cannot do that here.\r\n", ch);
      return;
    }

  if( NumberOfPeopleInRoom( ch->in_room ) == 0 )
    {
      send_to_char( "There's no one here!\r\n", ch );
      return;
    }

  percent = IsNpc(ch) ? 80 : ch->pcdata->learned[gsn_hitall];

  peopleInRoom = List_Copy( ch->in_room->People );
  peopleInRoomIterator = CreateListIterator( peopleInRoom, ForwardsIterator );

  for( ; !ListIterator_IsDone( peopleInRoomIterator ); ListIterator_Next( peopleInRoomIterator ) )
    {
      Character *vch = (Character*) ListIterator_GetData( peopleInRoomIterator );

      if ( is_same_group(ch, vch) || !is_legal_kill(ch, vch) ||
           !can_see(ch, vch) || is_safe(ch, vch) )
	{
	  continue;
	}

      if ( ++nvict > get_level( ch, COMBAT_ABILITY ) / 5 )
	{
	  break;
	}

      if ( IS_SET(vch->act, PLR_AFK))
        {
          log_printf( "%s just attacked %s with HITALL with an afk flag on!.",
		      ch->name, vch->name );
        }

      if ( chance(ch, percent) )
        {
          nhit++;
          global_retcode = one_hit(ch, vch, TYPE_UNDEFINED);
        }
      else
	{
	  global_retcode = damage(ch, vch, 0, TYPE_UNDEFINED);
	}

      /* Fireshield, etc. could kill ch too.. :>.. -- Altrag */
      if ( global_retcode == rCHAR_DIED || global_retcode == rBOTH_DIED
           || char_died(ch) )
	{
	  DestroyListIterator( peopleInRoomIterator );
	  DestroyList( peopleInRoom );
	  return;
	}
    }

  DestroyListIterator( peopleInRoomIterator );
  DestroyList( peopleInRoom );

  if ( !nvict )
    {
      send_to_char( "There's no one here!\r\n", ch );
      return;
    }

  ch->move = UMAX(0, ch->move-nvict*3+nhit);

  if ( nhit )
    {
      learn_from_success(ch, gsn_hitall);
    }
  else
    {
      learn_from_failure(ch, gsn_hitall);
    }
}

static bool is_legal_kill(Character *ch, Character *vch)
{
  if ( IsNpc(ch) || IsNpc(vch) )
    {
      return TRUE;
    }

  if ( is_safe(ch,vch) )
    {
      return FALSE;
    }

  return TRUE;
}
