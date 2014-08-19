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

  if (shuttle == NULL) return;
  if (shuttle->current == NULL) return;
  if (shuttle->first_stop == NULL) return;

  SetCharacterColor(AT_SHIP, ch);
  ChPrintf(ch, "%s Schedule Information:\r\n", shuttle->name );

  stop = shuttle->current;
  /* current port */
  if ( shuttle->state == SHUTTLE_STATE_LANDING || shuttle->state == SHUTTLE_STATE_LANDED )
    {
      ChPrintf( ch, "Currently docked at %s.\r\n", shuttle->current->stop_name );
      stop = stop->next;
    }

  SendToCharacter( "Next stops: ", ch);
  /* Safety Check */
  if ( stop == NULL)
    stop = shuttle->first_stop;

  itt = 0;
  while (1)
    {
      itt++;
      /* No stops i guess */
      if (stop == NULL) break;

      /* WTF BUT IT CRASHES */
      if (shuttle == NULL)
        {
          bug ("SHUTTLE IS NULLLLLL", 0);
          return;
        }

      if (itt > 4) break;
      if ( stop->stop_name )
        ChPrintf( ch, "%s  ", stop->stop_name );
      else
        SendToCharacter("(unnamed)  ", ch);
      if ( (stop = stop->next) == NULL)
        stop = shuttle->first_stop;
    }
  SendToCharacter( "\r\n", ch );
}
