#include "character.h"
#include "mud.h"

void do_unjail ( Character *ch , char *argument )
{
  Character *victim =NULL;
  char arg[MAX_INPUT_LENGTH];

  argument = OneArgument(argument, arg);

  if ( ( victim = get_char_room( ch, arg ) ) == NULL )
    {
      send_to_char( "They aren't here.\r\n", ch );
      return;
    }

  if ( victim == ch )
    {
      send_to_char( "That's pointless.\r\n", ch );
      return;
    }

  if ( IsNpc(victim) )
    {
      send_to_char( "That would be a waste of time.\r\n", ch );
      return;
    }

  if ( IsBitSet( ch->in_room->room_flags, ROOM_SAFE ) )
    {
      set_char_color( AT_MAGIC, ch );
      send_to_char( "This isn't a good place to do that.\r\n", ch );
      return;
    }

  if ( ch->position == POS_FIGHTING )
    {
      send_to_char( "Interesting combat technique.\r\n" , ch );
      return;
    }

  if ( ch->position <= POS_SLEEPING )
    {
      send_to_char( "In your dreams or what?\r\n" , ch );
      return;
    }

  if ( victim->in_room->vnum == 6)
    {
      send_to_char( "Only an immortal can unhell someone.\r\n", ch );
      return;
    }
  send_to_char( "Jail restrictions released.\r\n", ch );
  victim->pcdata->jail_vnum = 0;
  victim->pcdata->release_date = 0;
}
