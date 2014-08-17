#include "character.h"
#include "mud.h"

/* A much simpler version of look, this function will show you only
   the condition of a mob or pc, or if used without an argument, the
   same you would see if you enter the room and have config +brief.
   -- Narn, winter '96
*/
void do_glance( Character *ch, char *argument )
{
  char arg1 [MAX_INPUT_LENGTH];
  Character *victim;
  int save_act;

  if ( !ch->desc )
    return;

  if ( ch->position < POS_SLEEPING )
    {
      send_to_char( "You can't see anything but stars!\r\n", ch );
      return;
    }

  if ( ch->position == POS_SLEEPING )
    {
      send_to_char( "You can't see anything, you're sleeping!\r\n", ch );
      return;
    }

  if ( !check_blind( ch ) )
    return;

  argument = OneArgument( argument, arg1 );

  if ( arg1[0] == '\0' )
    {
      save_act = ch->act;
      SetBit( ch->act, PLR_BRIEF );
      do_look( ch, "auto" );
      ch->act = save_act;
      return;
    }

  if ( ( victim = get_char_room( ch, arg1 ) ) == NULL )
    {
      send_to_char( "They're not here.", ch );
      return;
    }
  else
    {
      if ( CanSeeCharacter( victim, ch ) )
        {
          act( AT_ACTION, "$n glances at you.", ch, NULL, victim, TO_VICT    );
          act( AT_ACTION, "$n glances at $N.",  ch, NULL, victim, TO_NOTVICT );
        }

      show_condition( ch, victim );
      return;
    }
}
