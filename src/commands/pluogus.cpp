#include "character.hpp"
#include "mud.hpp"
#include "shuttle.hpp"

static void output_shuttle(Character * ch, Shuttle * shuttle);

void do_pluogus( Character *ch, char *argument )
{
  Shuttle *shuttle = nullptr;

  if ( !HasComlink( ch ) )
    {
      SendToCharacter( "You need a comlink to do that!\r\n", ch);
      return;
    }

  shuttle = Shuttles->FindByName("Serin Pluogus");

  if (shuttle != nullptr)
    {
      output_shuttle(ch, shuttle);
      SendToCharacter("\r\n", ch);
    }

  shuttle = Shuttles->FindByName("Serin Tocca");

  if (shuttle != nullptr)
    {
      output_shuttle(ch, shuttle);
      SendToCharacter("\r\n", ch);
    }
}

static void output_shuttle(Character * ch, Shuttle * shuttle)
{
  ShuttleStop * stop = NULL;
  int itt = 0;

  if (shuttle == NULL)
    return;

  if (shuttle->CurrentStop == NULL)
    return;

  if (shuttle->FirstStop == NULL)
    return;

  SetCharacterColor(AT_SHIP, ch);
  Echo(ch, "%s Schedule Information:\r\n", shuttle->Name );

  stop = shuttle->CurrentStop;
  /* current port */
  if ( shuttle->State == SHUTTLE_STATE_LANDING || shuttle->State == SHUTTLE_STATE_LANDED )
    {
      Echo( ch, "Currently docked at %s.\r\n", shuttle->CurrentStop->Name );
      stop = stop->Next;
    }

  SendToCharacter( "Next stops: ", ch);
  /* Safety Check */
  if ( stop == NULL)
    stop = shuttle->FirstStop;

  itt = 0;

  while(true)
    {
      itt++;
      /* No stops i guess */
      if (stop == NULL)
	break;

      if (itt > 4)
	break;

      if ( stop->Name )
        Echo( ch, "%s  ", stop->Name );
      else
        SendToCharacter("(unnamed)  ", ch);

      if ( (stop = stop->Next) == NULL)
        stop = shuttle->FirstStop;
    }
  SendToCharacter( "\r\n", ch );
}
