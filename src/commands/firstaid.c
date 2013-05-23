#include "character.h"
#include "mud.h"

void do_first_aid( CHAR_DATA *ch, char *argument )
{
  OBJ_DATA   *medpac;
  CHAR_DATA  *victim;
  int         heal;
  char        buf[MAX_STRING_LENGTH];

  if ( ch->position == POS_FIGHTING )
    {
      send_to_char( "You can't do that while fighting!\r\n",ch );
      return;
    }

  medpac = get_eq_char( ch, WEAR_HOLD );
  if ( !medpac || medpac->item_type != ITEM_MEDPAC )
    {
      send_to_char( "You need to be holding a medpac.\r\n",ch );
      return;
    }

  if ( medpac->value[0] <= 0 )
    {
      send_to_char( "Your medpac seems to be empty.\r\n",ch );
      return;
    }

  if ( argument[0] == '\0' )
    victim = ch;
  else
    victim = get_char_room( ch, argument );

  if ( !victim )
    {
      ch_printf( ch, "I don't see any %s here...\r\n" , argument );
      return;
    }

  heal = number_range( 1, 150 );

  if ( heal > ch->pcdata->learned[gsn_first_aid]*2 )
    {
      ch_printf( ch, "You fail in your attempt at first aid.\r\n");
      learn_from_failure( ch , gsn_first_aid );
      return;
    }

  if ( victim == ch )
    {
      ch_printf( ch, "You tend to your wounds.\r\n");
      sprintf( buf , "$n uses %s to help heal $s wounds." , medpac->short_descr );
      act( AT_ACTION, buf, ch, NULL, victim, TO_ROOM );
    }
  else
    {
      sprintf( buf , "You tend to $N's wounds." );
      act( AT_ACTION, buf, ch, NULL, victim, TO_CHAR );
      sprintf( buf , "$n uses %s to help heal $N's wounds." , medpac->short_descr );
      act( AT_ACTION, buf, ch, NULL, victim, TO_NOTVICT );
      sprintf( buf , "$n uses %s to help heal your wounds." , medpac->short_descr );
      act( AT_ACTION, buf, ch, NULL, victim, TO_VICT );
    }

  --medpac->value[0];
  victim->hit += URANGE ( 0, heal , victim->max_hit - victim->hit );

  learn_from_success( ch , gsn_first_aid );
}