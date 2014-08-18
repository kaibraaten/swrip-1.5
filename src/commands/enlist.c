#include "mud.h"
#include "character.h"

void do_enlist( Character *ch, char *argument )
{
  Clan *clan;

  if ( IsNpc(ch) || !ch->pcdata )
    {
      send_to_char( "You can't do that.\r\n", ch );
      return;
    }

  if ( ch->pcdata->clan )
    {
      ch_printf( ch , "You will have to resign from %s before you can join a new organization.\r\n", ch->pcdata->clan->name );
      return;
    }

  if ( ! IsBitSet( ch->in_room->room_flags , ROOM_RECRUIT ) )
    {
      send_to_char( "You don't seem to be in a recruitment office.\r\n", ch );
      return;
    }

  for ( clan = first_clan; clan; clan = clan->next )
    {
      if ( ( ch->in_room->vnum == clan->enlistroom1 ||
             ch->in_room->vnum == clan->enlistroom2 ) )
        {
          if( !StrCmp( clan->name, "The Empire" )
	      && ch->race != RACE_HUMAN
	      && ch->race != RACE_DEFEL )
            {
              send_to_char( "&CThe recruiter says, 'You will need to find a sponsor to enlist'&R&w\r\n", ch );
              return;
            }
          SetBit( ch->speaks, LANG_CLAN );
          ++clan->members;
          FreeMemory( ch->pcdata->clan_name );
          ch->pcdata->clan_name = CopyString( clan->name );
          ch->pcdata->clan = clan;
          ch_printf( ch, "Welcome to %s.\r\n", clan->name );
          update_member( ch );
          save_clan ( clan );
          return;
        }
    }

  send_to_char( "They don't seem to be recruiting right now.\r\n", ch );
}
