#include "mud.h"
#include "character.h"

void do_enlist( Character *ch, char *argument )
{
  Clan *clan;

  if ( IsNpc(ch) || !ch->pcdata )
    {
      SendToCharacter( "You can't do that.\r\n", ch );
      return;
    }

  if ( ch->pcdata->clan )
    {
      ChPrintf( ch , "You will have to resign from %s before you can join a new organization.\r\n", ch->pcdata->clan->name );
      return;
    }

  if ( ! IsBitSet( ch->in_room->room_flags , ROOM_RECRUIT ) )
    {
      SendToCharacter( "You don't seem to be in a recruitment office.\r\n", ch );
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
              SendToCharacter( "&CThe recruiter says, 'You will need to find a sponsor to enlist'&R&w\r\n", ch );
              return;
            }
          SetBit( ch->speaks, LANG_CLAN );
          ++clan->members;
          FreeMemory( ch->pcdata->clan_name );
          ch->pcdata->clan_name = CopyString( clan->name );
          ch->pcdata->clan = clan;
          ChPrintf( ch, "Welcome to %s.\r\n", clan->name );
          UpdateClanMember( ch );
          SaveClan ( clan );
          return;
        }
    }

  SendToCharacter( "They don't seem to be recruiting right now.\r\n", ch );
}
