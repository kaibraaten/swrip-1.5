#include "character.h"
#include "mud.h"
#include "clan.h"
#include "spaceobject.h"

void do_setplanet( Character *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  Planet *planet;

  if ( IsNpc( ch ) )
    {
      SendToCharacter( "Huh?\r\n", ch );
      return;
    }

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  if ( arg1[0] == '\0' )
    {
      SendToCharacter( "Usage: setplanet <planet> <field> [value]\r\n", ch );
      SendToCharacter( "\r\nField being one of:\r\n", ch );
      SendToCharacter( " base_value flags\r\n", ch );
      SendToCharacter( " name filename spaceobject governed_by\r\n", ch );
      return;
    }

  planet = GetPlanet( arg1 );

  if ( !planet )
    {
      SendToCharacter( "No such planet.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "name" ) )
    {
      FreeMemory( planet->name );
      planet->name = CopyString( argument );
      SendToCharacter( "Done.\r\n", ch );
      SavePlanet( planet );
      return;
    }

  if ( !StrCmp( arg2, "governed_by" ) )
    {
      Clan *clan = GetClan( argument );

      if ( clan )
        {
          planet->governed_by = clan;
          SendToCharacter( "Done.\r\n", ch );
          SavePlanet( planet );
        }
      else
        {
          SendToCharacter( "No such clan.\r\n", ch );
        }

      return;
    }

  if ( !StrCmp( arg2, "spaceobject" ) )
    {
      if ( (planet->spaceobject = GetSpaceobjectFromName(argument)) )
        {
          Spaceobject *spaceobject = planet->spaceobject;

          if (spaceobject != NULL)
	    {
              spaceobject->Planet = planet;
              SendToCharacter( "Done.\r\n", ch );
              SavePlanet(planet);
            }
          else
            {
              SendToCharacter( "No such spaceobject.\r\n", ch );
            }
        }

      return;
    }

  if ( !StrCmp( arg2, "filename" ) )
    {
      FreeMemory( planet->filename );
      planet->filename = CopyString( argument );
      SendToCharacter( "Done.\r\n", ch );
      SavePlanet( planet );
      WritePlanetList();
      return;
    }

  if ( !StrCmp( arg2, "base_value" ) )
    {
      planet->base_value = atoi( argument );
      SendToCharacter( "Done.\r\n", ch );
      SavePlanet( planet );
      return;
    }

  if ( !StrCmp( arg2, "flags" ) )
    {
      char farg[MAX_INPUT_LENGTH];

      argument = OneArgument( argument, farg);

      if ( farg[0] == '\0' )
        {
          SendToCharacter( "Possible flags: nocapture\r\n", ch );
          return;
        }

      for ( ; farg[0] != '\0'; argument = OneArgument( argument, farg) )
	{
          if ( !StrCmp( farg, "nocapture" ) )
            {
              ToggleBit( planet->flags, PLANET_NOCAPTURE );
            }
          else
            {
              Echo( ch , "No such flag: %s\r\n" , farg );
            }
        }

      SendToCharacter( "Done.\r\n", ch );
      SavePlanet( planet );
      return;
    }

  do_setplanet( ch, "" );
}
