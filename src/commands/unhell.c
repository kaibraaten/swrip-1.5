#include "character.h"
#include "mud.h"

void do_unhell( Character *ch, char *argument )
{
  Character *victim;
  char arg[MAX_INPUT_LENGTH];
  Room *location;

  argument = OneArgument(argument, arg);
  if ( !*arg )
    {
      SendToCharacter( "Unhell whom..?\r\n", ch );
      return;
    }
  location = ch->InRoom;
  ch->InRoom = GetRoom(6);
  victim = GetCharacterInRoom(ch, arg);
  ch->InRoom = location;            /* The case of unhell self, etc. */
  if ( !victim || IsNpc(victim) || victim->InRoom->Vnum != ROOM_VNUM_HELL )
    {
      SendToCharacter( "No one like that is in hell.\r\n", ch );
      return;
    }
  location = GetRoom( WhereHome(victim) );
  if ( !location )
    location = ch->InRoom;
  MOBtrigger = false;
  Act( AT_MAGIC, "$n disappears in a cloud of godly light.", victim, NULL, ch, TO_NOTVICT );
  CharacterFromRoom(victim);
  CharacterToRoom(victim, location);
  SendToCharacter( "The gods have smiled on you and released you from hell early!\r\n", victim );
  do_look(victim, "auto");
  SendToCharacter( "They have been released.\r\n", ch );

  if ( victim->PCData->helled_by )
    {
      if( StrCmp(ch->Name, victim->PCData->helled_by) )
        Echo(ch, "(You should probably write a note to %s, explaining the early release.)\r\n",
                  victim->PCData->helled_by);
      FreeMemory(victim->PCData->helled_by);
      victim->PCData->helled_by = NULL;
    }

  MOBtrigger = false;
  Act( AT_MAGIC, "$n appears in a cloud of godly light.", victim, NULL, ch, TO_NOTVICT );
  victim->PCData->release_date = 0;
  SaveCharacter(victim);
}
