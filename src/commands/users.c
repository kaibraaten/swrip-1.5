#include <string.h>
#include "mud.h"
#include "character.h"

void do_users( Character *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  Descriptor *d;
  int count = 0;
  char arg[MAX_INPUT_LENGTH];

  OneArgument (argument, arg);
  SetPagerColor( AT_PLAIN, ch );
  sprintf(buf,
          "Desc|Con|Idle| Port | Player@HostIP                 ");
  strcat(buf, "\r\n");
  strcat(buf, "----+---+----+------+-------------------------------");
  strcat(buf, "\r\n");
  SendToPager(buf, ch);

  for ( d = first_descriptor; d; d = d->next )
    {
      if (arg[0] == '\0')
        {
          if (  GetTrustLevel(ch) >= LEVEL_IMPLEMENTOR
                ||   (d->character && CanSeeCharacter( ch, d->character )) )
            {
              count++;
              sprintf( buf,
                       " %3d| %2d|%4d|%6d| %s@%s ",
                       d->descriptor,
                       d->connection_state,
                       d->idle / 4,
                       d->remote.port,
                       d->original  ? d->original->name  :
                       d->character ? d->character->name : "(none)",
                       d->remote.hostip );
	      if ( ch->top_level >= LEVEL_GREATER && ( !d->character || d->character->top_level <= LEVEL_GREATER ) )
                sprintf( buf + strlen( buf ), " (%s)", d->remote.hostname  );
              strcat(buf, "\r\n");
              SendToPager( buf, ch );
            }
        }
      else
        {
          if ( (GetTrustLevel(ch) >= LEVEL_IMPLEMENTOR
                ||   (d->character && CanSeeCharacter( ch, d->character )) )
               &&   ( !StringPrefix( arg, d->remote.hostname )
                      ||   ( d->character && !StringPrefix( arg, d->character->name ) ) ) )
            {
              count++;
              PagerPrintf( ch,
                            " %3d| %2d|%4d|%6d| %-12s@%-16s ",
                            d->descriptor,
                            d->connection_state,
                            d->idle / 4,
                            d->remote.port,
                            d->original  ? d->original->name  :
                            d->character ? d->character->name : "(none)",
                            d->remote.hostname
                            );
              buf[0] = '\0';

              strcat(buf, "\r\n");
              SendToPager( buf, ch );
            }
        }
    }

  PagerPrintf( ch, "%d user%s.\r\n", count, count == 1 ? "" : "s" );
}
