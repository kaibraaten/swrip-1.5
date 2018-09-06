#include "character.hpp"
#include "mud.hpp"
#include "area.hpp"
#include "pcdata.hpp"
#include "room.hpp"

void do_rlist( Character *ch, std::string argument )
{
  Room *room = NULL;
  vnum_t vnum = INVALID_VNUM;
  std::string arg1;
  std::string arg2;
  Area *tarea = ch->PCData->Build.Area;
  vnum_t lrange = INVALID_VNUM;
  vnum_t trange = INVALID_VNUM;

  if ( IsNpc(ch) || GetTrustLevel( ch ) < LEVEL_AVATAR || !ch->PCData
       || ( !ch->PCData->Build.Area && GetTrustLevel( ch ) < LEVEL_GREATER ) )
    {
      ch->Echo("You don't have an assigned area.\r\n");
      return;
    }

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  if ( tarea )
    {
      if ( arg1.empty() )
	lrange = tarea->VnumRanges.Room.First;     /* here.            -Thoric */
      else
        lrange = std::stoi( arg1 );
      
      if ( arg2.empty() )
        trange = tarea->VnumRanges.Room.Last;
      else
        trange = std::stoi(arg2);

      if ( ( lrange < tarea->VnumRanges.Room.First || trange > tarea->VnumRanges.Room.Last )
           && GetTrustLevel( ch ) < LEVEL_GREATER )
        {
          ch->Echo("That is out of your vnum range.\r\n");
          return;
        }
    }
  else
    {
      lrange = IsNumber( arg1 ) ? std::stoi( arg1 ) : 1;
      trange = IsNumber( arg2 ) ? std::stoi( arg2 ) : 1;
    }

  for ( vnum = lrange; vnum <= trange; vnum++ )
    {
      if ( (room = GetRoom( vnum )) == NULL )
        continue;

      ch->Echo("&w%5d) %s\r\n", vnum, room->Name.c_str() );
    }
}
