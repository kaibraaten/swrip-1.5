#include "character.h"
#include "mud.h"

/*
 * 'Split' originally by Gnort, God of Chaos.
 */
void do_split( Character *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  char arg[MAX_INPUT_LENGTH];
  CerisListIterator *groupIterator = NULL;
  int members = 0;
  int amount = 0;
  int share = 0;
  int extra = 0;

  one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Split how much?\r\n", ch );
      return;
    }

  amount = atoi( arg );

  if ( amount < 0 )
    {
      send_to_char( "Your group wouldn't like that.\r\n", ch );
      return;
    }

  if ( amount == 0 )
    {
      send_to_char( "You hand out zero credits, but no one notices.\r\n", ch );
      return;
    }

  if ( ch->gold < amount )
    {
      send_to_char( "You don't have that many credits.\r\n", ch );
      return;
    }

  members = CountGroupMembersInRoom( ch );

  if (( IS_SET(ch->act, PLR_AUTOGOLD)) && (members < 2))
    {
      return;
    }

  if ( members < 2 )
    {
      send_to_char( "Just keep it all.\r\n", ch );
      return;
    }

  share = amount / members;
  extra = amount % members;

  if ( share == 0 )
    {
      send_to_char( "Don't even bother, cheapskate.\r\n", ch );
      return;
    }

  ch->gold -= amount;
  ch->gold += share + extra;

  set_char_color( AT_GOLD, ch );
  ch_printf( ch, "You split %d credits. Your share is %d credits.\r\n",
             amount, share + extra );

  sprintf( buf, "$n splits %d credits. Your share is %d credits.", amount, share );

  groupIterator = CreateListIterator( ch->in_room->People, ForwardsIterator );

  for( ; !ListIterator_IsDone( groupIterator ); ListIterator_Next( groupIterator ) )
    {
      Character *groupMember = (Character*) ListIterator_GetData( groupIterator );

      if ( groupMember != ch && is_same_group( groupMember, ch ) )
        {
          act( AT_GOLD, buf, ch, NULL, groupMember, TO_VICT );
          groupMember->gold += share;
        }
    }

  DestroyListIterator( groupIterator );
}
