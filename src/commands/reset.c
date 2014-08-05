#include "reset.h"
#include "mud.h"
#include "character.h"

void do_reset( Character *ch, char *argument )
{
  Area *pArea = NULL;
  char arg[MAX_INPUT_LENGTH];
  char *parg;

  parg = one_argument(argument, arg);

  if ( ch->substate == SUB_REPEATCMD )
    {
      pArea = (Area*)ch->dest_buf;

      if ( pArea && pArea != ch->pcdata->area && pArea != ch->in_room->area )
        {
          Area *tmp;

          for ( tmp = first_build; tmp; tmp = tmp->next )
	    if ( tmp == pArea )
              break;
          if ( !tmp )
            for ( tmp = first_area; tmp; tmp = tmp->next )
              if ( tmp == pArea )
                break;
          if ( !tmp )
            {
              send_to_char("Your area pointer got lost. Reset mode off.\r\n", ch);
              bug("do_reset: %s's dest_buf points to invalid area", (int)ch->name);
              ch->substate = SUB_NONE;
              DISPOSE(ch->dest_buf);
              return;
            }
        }

      if ( !*arg )
        {
          ch_printf(ch, "Editing resets for area: %s\r\n", pArea->name);
          return;
        }

      if ( !str_cmp(arg, "done") || !str_cmp(arg, "off") )
        {
          send_to_char( "Reset mode off.\r\n", ch );
          ch->substate = SUB_NONE;
          DISPOSE(ch->dest_buf);
          return;
        }
    }
  if ( !pArea && get_trust(ch) > LEVEL_GREATER )
    {
      char fname[80];

      sprintf(fname, "%s.are", capitalize(arg));

      for ( pArea = first_build; pArea; pArea = pArea->next )
	{
	  if ( !str_cmp(fname, pArea->filename) )
	    {
	      argument = parg;
	      break;
	    }
	}

      if ( !pArea )
        pArea = ch->pcdata->area;

      if ( !pArea )
        pArea = ch->in_room->area;
    }
  else
    {
      pArea = ch->pcdata->area;
    }

  if ( !pArea )
    {
      send_to_char( "You do not have an assigned area.\r\n", ch );
      return;
    }

  edit_reset(ch, argument, pArea, NULL);
}
