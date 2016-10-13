#include "character.h"
#include "mud.h"
#include "shuttle.h"

static void output_shuttle(Character * ch, Shuttle * shuttle);

void do_pluogus( Character *ch, char *argument )
{
  Shuttle * shuttle = NULL;

  if ( !HasComlink( ch ) )
    {
      SendToCharacter( "You need a comlink to do that!\r\n", ch);
      return;
    }

  if ((shuttle = GetShuttle("Serin Pluogus")) != NULL)
    {
      output_shuttle(ch, shuttle);
      SendToCharacter("\r\n", ch);
    }

  if ((shuttle = GetShuttle("Serin Tocca")) != NULL)
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
      stop = stop->next;
    }

  SendToCharacter( "Next stops: ", ch);
  /* Safety Check */
  if ( stop == NULL)
    stop = shuttle->FirstStop;

  itt = 0;

  while (1)
    {
      itt++;
      /* No stops i guess */
      if (stop == NULL)
	break;

      /* WTF BUT IT CRASHES */
      if (shuttle == NULL)
        {
          Bug("SHUTTLE IS NULLLLLL", 0);
          return;
        }

      if (itt > 4)
	break;

      if ( stop->Name )
        Echo( ch, "%s  ", stop->Name );
      else
        SendToCharacter("(unnamed)  ", ch);

      if ( (stop = stop->next) == NULL)
        stop = shuttle->FirstStop;
    }
  SendToCharacter( "\r\n", ch );
}
