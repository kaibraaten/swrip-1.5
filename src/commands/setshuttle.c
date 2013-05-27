#ifdef __STRICT_ANSI__
/* To include the prototype for snprintf() */
#define _BSD_SOURCE
#endif

#include "mud.h"
#include "shuttle.h"
#include "character.h"

void do_setshuttle(CHAR_DATA * ch, char * argument)
{
  SHUTTLE_DATA * shuttle;
  char arg1[MIL];
  char arg2[MIL];
  int value;

  if ( is_npc( ch ) )
    {
      send_to_char( "Huh?\r\n", ch );
      return;
    }

  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );

  if ( arg1[0] == '\0' || arg2[0] == '\0' || argument[0] == '\0')
    {
      send_to_char( "Usage: setshuttle <shuttle name> <field> <value>\r\n", ch);
      send_to_char( "Fields:\r\n\tfirstroom, lastroom, entrance, delay\r\n", ch);
      send_to_char( "\tname, filename, type, stop, remove shuttle\r\n", ch);\
      send_to_char("\tsetshuttle <shuttle> stop <add>\r\n",ch);
      send_to_char("\tsetshuttle <shuttle> stop <stop #> name <value>\r\n",ch);
      send_to_char("\tsetshuttle <shuttle> stop <stop #> room <value>\r\n",ch);
      return;
    }

  shuttle = get_shuttle(arg1);
  if ( !shuttle ) {
    set_char_color( AT_RED, ch );
    send_to_char("No such shuttle.\r\nValid shuttles:\r\n", ch);
    set_char_color( AT_YELLOW, ch );
    for ( shuttle = first_shuttle; shuttle; shuttle = shuttle->next )
      ch_printf(ch, "Shuttle Name: %s - %s\r\n", shuttle->name,
                shuttle->type == SHUTTLE_TURBOCAR ? "Turbocar" :
                shuttle->type == SHUTTLE_SPACE ? "Space" :
                shuttle->type == SHUTTLE_HYPERSPACE ? "Hyperspace" : "Other" );
    return;
  }

  value = is_number( argument ) ? atoi( argument ) : -1;

  if (!str_cmp(arg2, "firstroom"))
    {
      if (value > shuttle->room.last)
        {
          send_to_char("Uh.. First room should be less than last room.\r\n", ch);
          return;
        }
      shuttle->room.first = value;
    }
  else if (!str_cmp(arg2, "lastroom"))
    {
      if (value < shuttle->room.first)
        {
          send_to_char("Uh.. First room should be less than last room.\r\n", ch);
          return;
        }
      shuttle->room.last = value;
    }
  else if (!str_cmp(arg2, "entrance"))
    {
      if (value > shuttle->room.last
          || value < shuttle->room.first )
        {
          send_to_char("Not within valid range.\r\n", ch);
          return;
        }
      shuttle->room.entrance = value;
    }
  else if (!str_cmp(arg2, "delay"))
    {
      shuttle->delay = value;
      shuttle->current_delay = shuttle->delay;
    }
  else if (!str_cmp(arg2, "name"))
    {
      if (shuttle->name)
        STRFREE(shuttle->name);
      shuttle->name = STRALLOC(argument);
    }
  else if (!str_cmp(arg2, "filename"))
    {
      if (shuttle->filename && shuttle->filename[0] != '\0')
        {
          char filename[MSL];
          snprintf(filename, MSL, "%s/%s", SHUTTLE_DIR, shuttle->filename);
          unlink(filename);
          STRFREE(shuttle->filename);
        }
      shuttle->filename = STRALLOC(argument);
      write_shuttle_list();
    }
  else if (!str_cmp(arg2, "type"))
    {
      if (!str_cmp(argument, "turbocar"))
        shuttle->type = SHUTTLE_TURBOCAR;
      else if (!str_cmp(argument, "space"))
        shuttle->type = SHUTTLE_SPACE;
      else if (!str_cmp(argument, "hyperspace"))
        shuttle->type = SHUTTLE_HYPERSPACE;
      else
        {
          send_to_char("Types are: turbocar, space, hyperspace.\r\n", ch);
          return;
        }
    }
  else if (!str_cmp(arg2, "remove"))
    {
      destroy_shuttle(shuttle);
      send_to_char("Shuttle Removed.\r\n", ch);
      return;
    }
  else if (!str_cmp(arg2, "stop"))
    {
      STOP_DATA * stop = NULL;
      argument = one_argument(argument, arg1);
      if (arg1[0] == '\0' || argument[0] == '\0')
        {
          send_to_char("Usage: \r\n",ch);
          send_to_char("\tsetshuttle <shuttle> stop <add>\r\n",ch);
          send_to_char("\tsetshuttle <shuttle> stop <stop #> name <value>\r\n",ch);
          send_to_char("\tsetshuttle <shuttle> stop <stop #> room <value>\r\n",ch);
          return;
        }

      if (!str_cmp(arg1, "add"))
        {
          stop = create_stop();
          if ( stop->stop_name )
            STRFREE( stop->stop_name );
          stop->stop_name = STRALLOC("Stopless Name");
          stop->room = 2;
          LINK( stop, shuttle->first_stop, shuttle->last_stop, next, prev );
          if (shuttle->current == NULL)
            shuttle->current = shuttle->first_stop;
        }
      else {
        int count = 0;
        if (arg1[0] == '\0' || argument[0] == '\0')
          {
            send_to_char("Invalid Param.\r\n", ch);
            return;
          }
        value = is_number( arg1 ) ? atoi( arg1 ) : -1;

        for (stop = shuttle->first_stop; stop; stop = stop->next)
          {
            count++;
            if (value == count) break;
          }

        if ( stop == NULL)
          {
            send_to_char("Invalid Stop\r\n", ch);
            return;
          }

        argument = one_argument(argument, arg2);
        if (!str_cmp(arg2, "name"))
          {
	    if (stop->stop_name)
              STRFREE(stop->stop_name);
            stop->stop_name = STRALLOC(argument);
          }
        else if (!str_cmp(arg2, "room"))
          {
            value = is_number( argument ) ? atoi( argument ) : -1;
            stop->room = value;
          }
        else if (!str_cmp(arg2, "remove"))
          {
            UNLINK(stop, shuttle->first_stop, shuttle->last_stop, next, prev);
            if (stop->stop_name)
              STRFREE(stop->stop_name);
            DISPOSE(stop);
            send_to_char("Stop removed.\r\n", ch);
            return;
          } else {
          send_to_char("Invalid Option.\r\n", ch);
          return;
        }
      }
    }
  else
    {
      send_to_char("Unknown field", ch);
      return;
    }
  save_shuttle(shuttle);
  send_to_char("Ok.\r\n", ch);
}
