#include "reset.h"
#include "mud.h"
#include "character.h"

void do_reset( Character *ch, char *argument )
{
  Area *pArea = NULL;
  char arg[MAX_INPUT_LENGTH];
  char *parg;

  parg = OneArgument(argument, arg);

  if ( ch->SubState == SUB_REPEATCMD )
    {
      pArea = (Area*)ch->dest_buf;

      if ( pArea && pArea != ch->PCData->Build.Area && pArea != ch->InRoom->Area )
        {
          Area *tmp;

          for ( tmp = first_build; tmp; tmp = tmp->Next )
	    if ( tmp == pArea )
              break;
          if ( !tmp )
            for ( tmp = first_area; tmp; tmp = tmp->Next )
              if ( tmp == pArea )
                break;
          if ( !tmp )
            {
              SendToCharacter("Your area pointer got lost. Reset mode off.\r\n", ch);
              Bug("do_reset: %s's dest_buf points to invalid area", ch->Name);
              ch->SubState = SUB_NONE;
              FreeMemory(ch->dest_buf);
              return;
            }
        }

      if ( !*arg )
        {
          Echo(ch, "Editing resets for area: %s\r\n", pArea->Name);
          return;
        }

      if ( !StrCmp(arg, "done") || !StrCmp(arg, "off") )
        {
          SendToCharacter( "Reset mode off.\r\n", ch );
          ch->SubState = SUB_NONE;
          FreeMemory(ch->dest_buf);
          return;
        }
    }
  if ( !pArea && GetTrustLevel(ch) > LEVEL_GREATER )
    {
      char fname[80];

      sprintf(fname, "%s.are", Capitalize(arg));

      for ( pArea = first_build; pArea; pArea = pArea->Next )
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
      SendToCharacter( "You do not have an assigned area.\r\n", ch );
      return;
    }

  EditReset(ch, argument, pArea, NULL);
}
