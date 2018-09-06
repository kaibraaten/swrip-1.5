#include <sstream>
#include <cstring>
#include "mud.hpp"
#include "character.hpp"
#include "descriptor.hpp"

void do_users( Character *ch, std::string arg )
{
  int count = 0;
  std::ostringstream buf;

  SetCharacterColor( AT_PLAIN, ch );
  buf << "Desc|Con|Idle| Port | Player@HostIP                 "
      << "\r\n"
      << "----+---+----+------+-------------------------------"
      << "\r\n";
  ch->Echo(buf.str());

  for ( const Descriptor *d : Descriptors->Entities() )
    {
      if ( arg.empty() )
        {
          if( GetTrustLevel(ch) >= LEVEL_IMPLEMENTOR
	      || (d->Character && CanSeeCharacter( ch, d->Character )) )
            {
              count++;
              ch->Echo(" %3d| %2d|%4d|%6d| %s@%s ",
                       d->Socket,
                       d->ConnectionState,
                       d->Idle / 4,
                       d->Remote.Port,
                       d->Original  ? d->Original->Name.c_str()  :
                       d->Character ? d->Character->Name.c_str() : "(none)",
                       d->Remote.HostIP.c_str() );

	      if ( ch->TopLevel >= LEVEL_GREATER
		   && ( !d->Character || d->Character->TopLevel <= LEVEL_GREATER ) )
                ch->Echo(" (%s)", d->Remote.Hostname.c_str()  );

              ch->Echo("\r\n");
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
              ch->Echo(" %3d| %2d|%4d|%6d| %-12s@%-16s ",
                       d->Socket,
                       d->ConnectionState,
                       d->Idle / 4,
                       d->Remote.Port,
                       d->Original  ? d->Original->Name.c_str() :
                       d->Character ? d->Character->Name.c_str() : "(none)",
                       d->Remote.Hostname.c_str()
                       );

              ch->Echo("\r\n");
            }
        }
    }

  ch->Echo("%d user%s.\r\n", count, count == 1 ? "" : "s" );
}
