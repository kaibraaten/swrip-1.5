#include "character.h"
#include "mud.h"

/*
 * 'Split' originally by Gnort, God of Chaos.
 */
void do_split( Character *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  char arg[MAX_INPUT_LENGTH];
  Character *gch = NULL;
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

  for ( gch = ch->in_room->first_person; gch; gch = gch->next_in_room )
    {
      if ( is_same_group( gch, ch ) )
	{
	  members++;
	}
    }


  if (( IsBitSet(ch->act, PLR_AUTOGOLD)) && (members < 2))
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
  ch_printf( ch,
             "You split %d credits. Your share is %d credits.\r\n",
             amount, share + extra );

  sprintf( buf, "$n splits %d credits. Your share is %d credits.",
           amount, share );

  for ( gch = ch->in_room->first_person; gch; gch = gch->next_in_room )
    {
      if ( gch != ch && is_same_group( gch, ch ) )
        {
          act( AT_GOLD, buf, ch, NULL, gch, TO_VICT );
          gch->gold += share;
        }
    }
}
