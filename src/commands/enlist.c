#include "mud.h"

void do_enlist( CHAR_DATA *ch, char *argument )
{
  CLAN_DATA *clan;

  if ( IS_NPC(ch) || !ch->pcdata )
    {
      send_to_char( "You can't do that.\r\n", ch );
      return;
    }

  if ( ch->pcdata->clan )
    {
      ch_printf( ch , "You will have to resign from %s before you can join a new organization.\r\n", ch->pcdata->clan->name );
      return;
    }

  if ( ! IS_SET( ch->in_room->room_flags , ROOM_RECRUIT ) )
    {
      send_to_char( "You don't seem to be in a recruitment office.\r\n", ch );
      return;
    }

  for ( clan = first_clan; clan; clan = clan->next )
    {
      if ( ( ch->in_room->vnum == clan->enlistroom1 ||
             ch->in_room->vnum == clan->enlistroom2 ) )
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
          update_member( ch );
          save_clan ( clan );
          return;
        }
    }

  send_to_char( "They don't seem to be recruiting right now.\r\n", ch );
}
