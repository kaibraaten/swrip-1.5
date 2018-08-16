#include "character.hpp"
#include "mud.hpp"

void do_consider( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  const Character *victim = nullptr;
  const char *msg = nullptr;
  int diff = 0;

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      ch->Echo( "Consider killing whom?\r\n" );
      return;
    }

  if ( ( victim = GetCharacterInRoom( ch, arg ) ) == NULL )
    {
      ch->Echo( "They're not here.\r\n" );
      return;
    }

  diff = ( victim->TopLevel - ch->TopLevel ) * 10;
  diff += (int) (victim->MaxHit - ch->MaxHit) / 10;

  if ( diff <= -200)
    msg = "$N looks like a feather!";
  else if ( diff <= -150)
    msg = "Hey! Where'd $N go?";
  else if ( diff <= -100)
    msg = "Easy as picking off womp rats at beggers canyon!";
  else if ( diff <=  -50)
    msg = "$N is a wimp.";
  else if ( diff <=    0)
    msg = "$N looks weaker than you.";
  else if ( diff <=   50)
    msg = "$N looks about as strong as you.";
  else if ( diff <=  100)
    msg = "It would take a bit of luck...";
  else if ( diff <=  150)
    msg = "It would take a lot of luck, and a really big blaster!";
  else if ( diff <=  200)
    msg = "Why don't you just attack a star destoyer with a vibroblade?";
  else
    msg = "$N is built like an AT-AT!";

  Act( AT_CONSIDER, msg, ch, NULL, victim, TO_CHAR );
}
