#include "mud.h"
#include "character.h"
#include "clan.h"

static Clan *GetRecruitingClan( const ROOM_INDEX_DATA *enlistRoom );

void do_enlist( CHAR_DATA *ch, char *argument )
{
  Clan *clan;

  if ( is_npc(ch) || !ch->pcdata )
    {
      send_to_char( "You can't do that.\r\n", ch );
      return;
    }

  if ( is_clanned( ch ) )
    {
      ch_printf( ch , "You will have to resign from %s before you can join a new organization.\r\n", ch->pcdata->clan->name );
      return;
    }

  if ( ! IS_SET( ch->in_room->room_flags , ROOM_RECRUIT ) )
    {
      send_to_char( "You don't seem to be in a recruitment office.\r\n", ch );
      return;
    }

  clan = GetRecruitingClan( ch->in_room );

  if( clan )
    {
      if( !str_cmp( clan->name, "The Empire" )
	  && ch->race != RACE_HUMAN
	  && ch->race != RACE_DEFEL )
	{
	  send_to_char( "&CThe recruiter says, 'You will need to find a sponsor to enlist'&R&w\r\n", ch );
	  return;
	}

      SET_BIT( ch->speaks, LANG_CLAN );
      ++clan->members;
      STRFREE( ch->pcdata->clan_name );
      ch->pcdata->clan_name = QUICKLINK( clan->name );
      ch->pcdata->clan = clan;
      ch_printf( ch, "Welcome to %s.\r\n", clan->name );
      UpdateMember( ch );
      SaveClan( clan );
      return;
    }

  send_to_char( "They don't seem to be recruiting right now.\r\n", ch );
}

static Clan *GetRecruitingClan( const ROOM_INDEX_DATA *enlistRoom )
{
  CerisListIterator *iter = CreateListIterator( ClanList, ForwardsIterator );
  Clan *clan = NULL;

  for( ; !ListIterator_IsDone( iter ); ListIterator_Next( iter ) )
    {
      Clan *current = (Clan*) ListIterator_GetData( iter );

      if( ( enlistRoom->vnum == current->enlistroom1
	    || enlistRoom->vnum == current->enlistroom2 ) )
        {
	  clan = current;
	  break;
	}
    }

  DestroyListIterator( iter );

  return clan;
}
