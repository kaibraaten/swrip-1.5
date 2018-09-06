#include "character.hpp"
#include "mud.hpp"
#include "arena.hpp"
#include "room.hpp"

void do_accept(Character *ch, std::string argument)
{
  char buf[MAX_INPUT_LENGTH];

  if ( CharactersInArena() > 0 )
    {
      ch->Echo("Please wait until the current arena is closed before you accept.\r\n");
      return;
    }

  if ( !ch->Challenged )
    {
      ch->Echo("You have not been challenged!\r\n");
      return;
    }
  else
    {
      Character *dch = ch->Challenged;

      if (dch == nullptr )
        return;

      if ( dch->InRoom == ch->InRoom )
        {
          ch->Echo("You must be in a different room as your challenger.\r\n");
        }

      if ( dch->InRoom == ch->InRoom )
        {
          ch->Echo("You must be in a different room as your challenger.\r\n");
          return;
        }

      sprintf(buf,"%s has accepted %s's challenge!\r\n",
              ch->Name.c_str(), dch->Name.c_str());
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

