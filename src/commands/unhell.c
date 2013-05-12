#include "mud.h"

void do_unhell( CHAR_DATA *ch, char *argument )
{
  CHAR_DATA *victim;
  char arg[MAX_INPUT_LENGTH];
  ROOM_INDEX_DATA *location;

  argument = one_argument(argument, arg);
  if ( !*arg )
    {
      send_to_char( "Unhell whom..?\r\n", ch );
      return;
    }
  location = ch->in_room;
  ch->in_room = get_room_index(6);
  victim = get_char_room(ch, arg);
  ch->in_room = location;            /* The case of unhell self, etc. */
  if ( !victim || IS_NPC(victim) || victim->in_room->vnum != 6 )
    {
      send_to_char( "No one like that is in hell.\r\n", ch );
      return;
    }
  location = get_room_index( wherehome(victim) );
  if ( !location )
    location = ch->in_room;
  MOBtrigger = FALSE;
  act( AT_MAGIC, "$n disappears in a cloud of godly light.", victim, NULL, ch, TO_NOTVICT );
  char_from_room(victim);
  char_to_room(victim, location);
  send_to_char( "The gods have smiled on you and released you from hell early!\r\n", victim );
  do_look(victim, "auto");
  send_to_char( "They have been released.\r\n", ch );

  if ( victim->pcdata->helled_by )
    {
      if( str_cmp(ch->name, victim->pcdata->helled_by) )
        ch_printf(ch, "(You should probably write a note to %s, explaining the early release.)\r\n",
                  victim->pcdata->helled_by);
      STRFREE(victim->pcdata->helled_by);
      victim->pcdata->helled_by = NULL;
    }

  MOBtrigger = FALSE;
  act( AT_MAGIC, "$n appears in a cloud of godly light.", victim, NULL, ch, TO_NOTVICT );
  victim->pcdata->release_date = 0;
  save_char_obj(victim);
}