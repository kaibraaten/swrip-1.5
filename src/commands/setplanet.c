#include "character.h"
#include "mud.h"
#include "clan.h"
#include "spaceobject.h"
#include "planet.h"

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

  if ( IsNullOrEmpty( arg1 ) )
    {
      SendToCharacter( "Usage: setplanet <planet> <field> [value]\r\n", ch );
      SendToCharacter( "\r\nField being one of:\r\n", ch );
      SendToCharacter( " base_value flags\r\n", ch );
      SendToCharacter( " name spaceobject governed_by\r\n", ch );
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
      if( GetPlanet( argument ) )
	{
	  Echo( ch, "There's already another planet with that name.\r\n" );
	  return;
	}
      
      unlink( GetPlanetFilename( planet ) );
      FreeMemory( planet->Name );
      planet->Name = CopyString( argument );
      SendToCharacter( "Done.\r\n", ch );
      SavePlanet( planet );
      return;
    }

  if ( !StrCmp( arg2, "governed_by" ) )
    {
      Clan *clan = GetClan( argument );

      if ( clan )
        {
          planet->GovernedBy = clan;
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
      if ( (planet->Spaceobject = GetSpaceobject(argument)) )
        {
          Spaceobject *spaceobject = planet->Spaceobject;

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

  if ( !StrCmp( arg2, "base_value" ) )
    {
      planet->BaseValue = atoi( argument );
      SendToCharacter( "Done.\r\n", ch );
      SavePlanet( planet );
      return;
    }

  if ( !StrCmp( arg2, "flags" ) )
    {
      char farg[MAX_INPUT_LENGTH];

      argument = OneArgument( argument, farg);

      if ( IsNullOrEmpty( farg ) )
        {
          SendToCharacter( "Possible flags: nocapture\r\n", ch );
          return;
        }

      for ( ; !IsNullOrEmpty( farg ); argument = OneArgument( argument, farg) )
	{
          if ( !StrCmp( farg, "nocapture" ) )
            {
              ToggleBit( planet->Flags, PLANET_NOCAPTURE );
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
