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
      Echo( ch , "You will have to resign from %s before you can join a new organization.\r\n", ch->PCData->ClanInfo.Clan->Name );
      return;
    }

  if ( ! IsBitSet( ch->InRoom->Flags , ROOM_RECRUIT ) )
    {
      SendToCharacter( "You don't seem to be in a recruitment office.\r\n", ch );
      return;
    }

  for ( clan = first_clan; clan; clan = clan->Next )
    {
      if ( ( ch->InRoom->Vnum == clan->EnlistRoom1 ||
             ch->InRoom->Vnum == clan->EnlistRoom2 ) )
        {
          if( !StrCmp( clan->Name, "The Empire" )
	      && ch->Race != RACE_HUMAN
	      && ch->Race != RACE_DEFEL )
            {
              SendToCharacter( "&CThe recruiter says, 'You will need to find a sponsor to enlist'&R&w\r\n", ch );
              return;
            }

          SetBit( ch->Speaks, LANG_CLAN );
          FreeMemory( ch->PCData->ClanInfo.ClanName );
          ch->PCData->ClanInfo.ClanName = CopyString( clan->Name );
          ch->PCData->ClanInfo.Clan = clan;
          Echo( ch, "Welcome to %s.\r\n", clan->Name );
          UpdateClanMember( ch );
	  SaveCharacter( ch );
          return;
        }
    }

  SendToCharacter( "They don't seem to be recruiting right now.\r\n", ch );
}
