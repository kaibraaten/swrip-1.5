#include "mud.h"
#include "character.h"
#include "clan.h"

void do_enlist( Character *ch, char *argument )
{
  Clan *clan;

  if ( IsNpc(ch) )
    {
      SendToCharacter( "You can't do that.\r\n", ch );
      return;
    }

  if ( IsClanned( ch ) )
    {
      Echo( ch , "You will have to resign from %s before you can join a new organization.\r\n", ch->pcdata->ClanInfo.Clan->Name );
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
          if( !StrCmp( clan->Name, "The Empire" )
	      && ch->race != RACE_HUMAN
	      && ch->race != RACE_DEFEL )
            {
              SendToCharacter( "&CThe recruiter says, 'You will need to find a sponsor to enlist'&R&w\r\n", ch );
              return;
            }
          SetBit( ch->speaks, LANG_CLAN );
          ++clan->members;
          FreeMemory( ch->pcdata->ClanInfo.ClanName );
          ch->pcdata->ClanInfo.ClanName = CopyString( clan->Name );
          ch->pcdata->ClanInfo.Clan = clan;
          Echo( ch, "Welcome to %s.\r\n", clan->Name );
          UpdateClanMember( ch );
          SaveClan ( clan );
          return;
        }
    }

  SendToCharacter( "They don't seem to be recruiting right now.\r\n", ch );
}
