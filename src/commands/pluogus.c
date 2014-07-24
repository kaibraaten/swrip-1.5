#include "character.h"
#include "mud.h"
#include "shuttle.h"

static void output_shuttle(Character * ch, SHUTTLE_DATA * shuttle);

void do_pluogus( Character *ch, char *argument )
{
  SHUTTLE_DATA * shuttle = NULL;

  if ( !has_comlink( ch ) )
    {
      send_to_char( "You need a comlink to do that!\r\n", ch);
      return;
    }

  if ((shuttle = get_shuttle("Serin Pluogus")) != NULL)
    {
      output_shuttle(ch, shuttle);
      send_to_char("\r\n", ch);
    }

  if ((shuttle = get_shuttle("Serin Tocca")) != NULL)
    {
      output_shuttle(ch, shuttle);
      send_to_char("\r\n", ch);
    }
}

static void output_shuttle(Character * ch, SHUTTLE_DATA * shuttle)
{
  STOP_DATA * stop = NULL;
  int itt = 0;

  if (shuttle == NULL) return;
  if (shuttle->current == NULL) return;
  if (shuttle->first_stop == NULL) return;

  set_char_color(AT_SHIP, ch);
  ch_printf(ch, "%s Schedule Information:\r\n", shuttle->name );

  stop = shuttle->current;
  /* current port */
  if ( shuttle->state == SHUTTLE_STATE_LANDING || shuttle->state == SHUTTLE_STATE_LANDED )
    {
      ch_printf( ch, "Currently docked at %s.\r\n", shuttle->current->stop_name );
      stop = stop->next;
    }

  send_to_char( "Next stops: ", ch);
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
        ch_printf( ch, "%s  ", stop->stop_name );
      else
        send_to_char("(unnamed)  ", ch);
      if ( (stop = stop->next) == NULL)
        stop = shuttle->first_stop;
    }
  send_to_char( "\r\n", ch );
}
