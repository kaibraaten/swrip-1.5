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
      SendToCharacter( "You can't see anything but stars!\r\n", ch );
      return;
    }

  if ( ch->position == POS_SLEEPING )
    {
      SendToCharacter( "You can't see anything, you're sleeping!\r\n", ch );
      return;
    }

  if ( IsBlind( ch ) )
    {
      Echo( ch, "You can't see a thing!\r\n" );
      return;
    }

  argument = OneArgument( argument, arg1 );

  if ( IsNullOrEmpty( arg1 ) )
    {
      save_act = ch->act;
      SetBit( ch->act, PLR_BRIEF );
      do_look( ch, "auto" );
      ch->act = save_act;
      return;
    }

  if ( ( victim = GetCharacterInRoom( ch, arg1 ) ) == NULL )
    {
      SendToCharacter( "They're not here.", ch );
      return;
    }
  else
    {
      if ( CanSeeCharacter( victim, ch ) )
        {
          Act( AT_ACTION, "$n glances at you.", ch, NULL, victim, TO_VICT    );
          Act( AT_ACTION, "$n glances at $N.",  ch, NULL, victim, TO_NOTVICT );
        }

      ShowCharacterCondition( ch, victim );
      return;
    }
}
