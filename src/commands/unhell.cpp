#include "character.hpp"
#include "mud.hpp"
#include "pcdata.hpp"
#include "room.hpp"

void do_unhell( Character *ch, char *argument )
{
  Character *victim = NULL;
  char arg[MAX_INPUT_LENGTH];
  Room *location = NULL;

  argument = OneArgument(argument, arg);
  if ( !*arg )
    {
      ch->Echo("Unhell whom..?\r\n");
      return;
    }
  location = ch->InRoom;
  ch->InRoom = GetRoom(6);
  victim = GetCharacterInRoom(ch, arg);
  ch->InRoom = location;            /* The case of unhell self, etc. */
  if ( !victim || IsNpc(victim) || victim->InRoom->Vnum != ROOM_VNUM_HELL )
    {
      ch->Echo("No one like that is in hell.\r\n");
      return;
    }
  location = GetRoom( WhereHome(victim) );
  if ( !location )
    location = ch->InRoom;
  MOBtrigger = false;
  Act( AT_MAGIC, "$n disappears in a cloud of godly light.", victim, NULL, ch, TO_NOTVICT );
  CharacterFromRoom(victim);
  CharacterToRoom(victim, location);
  victim->Echo("The gods have smiled on you and released you from hell early!\r\n");
  do_look(victim, "auto");
  ch->Echo("They have been released.\r\n");

  if ( victim->PCData->HelledBy )
    {
      if( StrCmp(ch->Name, victim->PCData->HelledBy) )
        ch->Echo("(You should probably write a note to %s, explaining the early release.)\r\n",
                 victim->PCData->HelledBy);
      FreeMemory(victim->PCData->HelledBy);
      victim->PCData->HelledBy = NULL;
    }

  MOBtrigger = false;
  Act( AT_MAGIC, "$n appears in a cloud of godly light.", victim, NULL, ch, TO_NOTVICT );
  victim->PCData->ReleaseDate = 0;
  SaveCharacter(victim);
}

