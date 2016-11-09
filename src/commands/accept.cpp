#include "character.hpp"
#include "mud.hpp"
#include "arena.hpp"

void do_accept(Character *ch, std::string argument)
{
  char buf[MAX_INPUT_LENGTH];

  if ( CharactersInArena() > 0 )
    {
      SendToCharacter("Please wait until the current arena is closed before you accept.\r\n",ch);
      return;
    }

  if ( !ch->Challenged )
    {
      SendToCharacter("You have not been challenged!\r\n",ch);
      return;
    }
  else
    {
      Character *dch = ch->Challenged;

      if (!dch || !(dch->InRoom) || IsNullOrEmpty( dch->Name ))
        return;

      if ( dch->InRoom == ch->InRoom )
        {
          SendToCharacter("You must be in a different room as your challenger.\r\n",ch);
        }

      if ( dch->InRoom == ch->InRoom )
        {
          SendToCharacter("You must be in a different room as your challenger.\r\n",ch);
          return;
        }

      sprintf(buf,"%s has accepted %s's challenge!\r\n",ch->Name,dch->Name);
      ToChannel(buf,CHANNEL_ARENA,"&RArena&W",5);
      ch->Challenged = NULL;
      ch->ReTran = ch->InRoom->Vnum;
      CharacterFromRoom(ch);
      CharacterToRoom(ch, GetRoom(PREP_END));
      do_look(ch,"auto");
      dch->ReTran = dch->InRoom->Vnum;
      CharacterFromRoom(dch);
      CharacterToRoom(dch, GetRoom(PREP_START));
      do_look(dch,"auto");
      arena.PeopleIsInArena = 0;
      arena.PeopleChallenged = 1;
      arena.TimeToStart = 3;
      arena.TimeLeftInGame =0;
      arena.ArenaPot =0;
      arena.BetPot = 0;
      StartArena();
      return;
    }
}
