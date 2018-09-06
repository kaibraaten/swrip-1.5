#include "character.hpp"
#include "mud.hpp"

/* A much simpler version of look, this function will show you only
   the condition of a mob or pc, or if used without an argument, the
   same you would see if you enter the room and have config +brief.
   -- Narn, winter '96
*/
void do_glance( Character *ch, std::string argument )
{
  std::string arg1;
  Character *victim = nullptr;

  if ( !ch->Desc )
    return;

  if ( ch->Position < POS_SLEEPING )
    {
      ch->Echo( "You can't see anything but stars!\r\n" );
      return;
    }

  if ( ch->Position == POS_SLEEPING )
    {
      ch->Echo( "You can't see anything, you're sleeping!\r\n" );
      return;
    }

  if ( IsBlind( ch ) )
    {
      ch->Echo( "You can't see a thing!\r\n" );
      return;
    }

  argument = OneArgument( argument, arg1 );

  if ( arg1.empty() )
    {
      int saveFlags = ch->Flags;
      SetBit( ch->Flags, PLR_BRIEF );
      do_look( ch, "auto" );
      ch->Flags = saveFlags;
      return;
    }

  if ( ( victim = GetCharacterInRoom( ch, arg1 ) ) == NULL )
    {
      ch->Echo( "They're not here." );
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
