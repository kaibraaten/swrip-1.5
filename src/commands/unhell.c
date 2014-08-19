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
  location = ch->in_room;
  ch->in_room = GetRoom(6);
  victim = get_char_room(ch, arg);
  ch->in_room = location;            /* The case of unhell self, etc. */
  if ( !victim || IsNpc(victim) || victim->in_room->vnum != 6 )
    {
      SendToCharacter( "No one like that is in hell.\r\n", ch );
      return;
    }
  location = GetRoom( WhereHome(victim) );
  if ( !location )
    location = ch->in_room;
  MOBtrigger = false;
  Act( AT_MAGIC, "$n disappears in a cloud of godly light.", victim, NULL, ch, TO_NOTVICT );
  CharacterFromRoom(victim);
  CharacterToRoom(victim, location);
  SendToCharacter( "The gods have smiled on you and released you from hell early!\r\n", victim );
  do_look(victim, "auto");
  SendToCharacter( "They have been released.\r\n", ch );

  if ( victim->pcdata->helled_by )
    {
      if( StrCmp(ch->name, victim->pcdata->helled_by) )
        ChPrintf(ch, "(You should probably write a note to %s, explaining the early release.)\r\n",
                  victim->pcdata->helled_by);
      FreeMemory(victim->pcdata->helled_by);
      victim->pcdata->helled_by = NULL;
    }

  MOBtrigger = false;
  Act( AT_MAGIC, "$n appears in a cloud of godly light.", victim, NULL, ch, TO_NOTVICT );
  victim->pcdata->release_date = 0;
  save_char_obj(victim);
}
