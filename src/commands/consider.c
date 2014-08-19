#include "character.h"
#include "mud.h"

void do_consider( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim;
  char *msg;
  int diff;

  OneArgument( argument, arg );

  if ( arg[0] == '\0' )
    {
      SendToCharacter( "Consider killing whom?\r\n", ch );
      return;
    }

  if ( ( victim = get_char_room( ch, arg ) ) == NULL )
    {
      SendToCharacter( "They're not here.\r\n", ch );
      return;
    }

  diff = ( victim->top_level - ch->top_level ) * 10;
  diff += (int) (victim->max_hit - ch->max_hit) / 10;

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
