#include <string.h>
#include "mud.h"
#include "character.h"

void do_users( CHAR_DATA *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  DESCRIPTOR_DATA *d;
  int count = 0;
  char arg[MAX_INPUT_LENGTH];

  one_argument (argument, arg);
  set_pager_color( AT_PLAIN, ch );
  sprintf(buf,
          "Desc|Con|Idle| Port | Player@HostIP                 ");
  strcat(buf, "\r\n");
  strcat(buf, "----+---+----+------+-------------------------------");
  strcat(buf, "\r\n");
  send_to_pager(buf, ch);

  for ( d = first_descriptor; d; d = d->next )
    {
      if (arg[0] == '\0')
        {
          if (  get_trust(ch) >= LEVEL_SUPREME
                ||   (d->character && can_see( ch, d->character )) )
            {
              count++;
              sprintf( buf,
                       " %3d| %2d|%4d|%6d| %s@%s ",
                       d->descriptor,
                       d->connected,
                       d->idle / 4,
                       d->remote.port,
                       d->original  ? d->original->name  :
                       d->character ? d->character->name : "(none)",
                       d->remote.hostip );
	      if ( ch->top_level >= LEVEL_GOD && ( !d->character || d->character->top_level <= LEVEL_GOD ) )
                sprintf( buf + strlen( buf ), " (%s)", d->remote.host  );
              strcat(buf, "\r\n");
              send_to_pager( buf, ch );
            }
        }
      else
        {
          if ( (get_trust(ch) >= LEVEL_SUPREME
                ||   (d->character && can_see( ch, d->character )) )
               &&   ( !str_prefix( arg, d->remote.host )
                      ||   ( d->character && !str_prefix( arg, d->character->name ) ) ) )
            {
              count++;
              pager_printf( ch,
                            " %3d| %2d|%4d|%6d| %-12s@%-16s ",
                            d->descriptor,
                            d->connected,
                            d->idle / 4,
                            d->remote.port,
                            d->original  ? d->original->name  :
                            d->character ? d->character->name : "(none)",
                            d->remote.host
                            );
              buf[0] = '\0';

              strcat(buf, "\r\n");
              send_to_pager( buf, ch );
            }
        }
    }

  pager_printf( ch, "%d user%s.\r\n", count, count == 1 ? "" : "s" );
}
