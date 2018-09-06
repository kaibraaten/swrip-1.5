#include "reset.hpp"
#include "mud.hpp"
#include "character.hpp"
#include "area.hpp"
#include "pcdata.hpp"
#include "log.hpp"
#include "room.hpp"

void do_reset( Character *ch, std::string argument )
{
  Area *pArea = NULL;
  std::string arg;
  std::string parg = OneArgument(argument, arg);

  if ( ch->SubState == SUB_REPEATCMD )
    {
      pArea = (Area*)ch->dest_buf;

      if ( pArea && pArea != ch->PCData->Build.Area && pArea != ch->InRoom->Area )
        {
          Area *tmp = nullptr;

          for ( tmp = FirstBuild; tmp; tmp = tmp->Next )
	    if ( tmp == pArea )
              break;

          if ( !tmp )
            for ( tmp = FirstArea; tmp; tmp = tmp->Next )
              if ( tmp == pArea )
                break;

          if ( !tmp )
            {
              ch->Echo("Your area pointer got lost. Reset mode off.\r\n");
              Log->Bug("do_reset: %s's dest_buf points to invalid area", ch->Name.c_str());
              ch->SubState = SUB_NONE;
              FreeMemory(ch->dest_buf);
              return;
            }
        }

      if ( arg.empty() )
        {
          ch->Echo("Editing resets for area: %s\r\n", pArea->Name.c_str());
          return;
        }

      if ( !StrCmp(arg, "done") || !StrCmp(arg, "off") )
        {
          ch->Echo("Reset mode off.\r\n");
          ch->SubState = SUB_NONE;
          FreeMemory(ch->dest_buf);
          return;
        }
    }

  if ( !pArea && GetTrustLevel(ch) > LEVEL_GREATER )
    {
      char fname[80];

      sprintf(fname, "%s.are", Capitalize(arg).c_str());

      for ( pArea = FirstBuild; pArea; pArea = pArea->Next )
	{
	  if ( !StrCmp(fname, pArea->Filename) )
	    {
	      argument = parg;
	      break;
	    }
	}

      if ( !pArea )
        pArea = ch->PCData->Build.Area;

      if ( !pArea )
        pArea = ch->InRoom->Area;
    }
  else
    {
      pArea = ch->PCData->Build.Area;
    }

  if ( !pArea )
    {
      ch->Echo("You do not have an assigned area.\r\n");
      return;
    }

  EditReset(ch, argument, pArea, NULL);
}
