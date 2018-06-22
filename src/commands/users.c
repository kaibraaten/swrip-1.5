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

  for ( d = FirstDescriptor; d; d = d->Next )
    {
      if ( IsNullOrEmpty( arg ) )
        {
          if( GetTrustLevel(ch) >= LEVEL_IMPLEMENTOR
	      || (d->Character && CanSeeCharacter( ch, d->Character )) )
            {
              count++;
              sprintf( buf,
                       " %3d| %2d|%4d|%6d| %s@%s ",
                       d->Socket,
                       d->ConnectionState,
                       d->Idle / 4,
                       d->Remote.Port,
                       d->Original  ? d->Original->Name  :
                       d->Character ? d->Character->Name : "(none)",
                       d->Remote.HostIP );

	      if ( ch->TopLevel >= LEVEL_GREATER
		   && ( !d->Character || d->Character->TopLevel <= LEVEL_GREATER ) )
                sprintf( buf + strlen( buf ), " (%s)", d->Remote.Hostname  );

	      strcat(buf, "\r\n");
              SendToPager( buf, ch );
            }
        }
      else
        {
          if ( (GetTrustLevel(ch) >= LEVEL_IMPLEMENTOR
                ||   (d->Character && CanSeeCharacter( ch, d->Character )) )
               &&   ( !StringPrefix( arg, d->Remote.Hostname )
                      ||   ( d->Character && !StringPrefix( arg, d->Character->Name ) ) ) )
            {
              count++;
              PagerPrintf( ch,
			   " %3d| %2d|%4d|%6d| %-12s@%-16s ",
			   d->Socket,
			   d->ConnectionState,
			   d->Idle / 4,
			   d->Remote.Port,
			   d->Original  ? d->Original->Name  :
			   d->Character ? d->Character->Name : "(none)",
			   d->Remote.Hostname
			   );
              buf[0] = '\0';

              strcat(buf, "\r\n");
              SendToPager( buf, ch );
            }
        }
    }

  PagerPrintf( ch, "%d user%s.\r\n", count, count == 1 ? "" : "s" );
}
