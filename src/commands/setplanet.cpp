#include "character.hpp"
#include "mud.hpp"
#include "clan.hpp"
#include "spaceobject.hpp"
#include "planet.hpp"

void do_setplanet( Character *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];

  if ( IsNpc( ch ) )
    {
      ch->Echo("Huh?\r\n");
      return;
    }

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  if ( IsNullOrEmpty( arg1 ) )
    {
      ch->Echo("Usage: setplanet <planet> <field> [value]\r\n");
      ch->Echo("\r\nField being one of:\r\n");
      ch->Echo(" base_value flags\r\n");
      ch->Echo(" name spaceobject governed_by\r\n");
      return;
    }

  Planet *planet = Planets->FindByName(arg1);

  if ( !planet )
    {
      ch->Echo("No such planet.\r\n");
      return;
    }

  if ( !StrCmp( arg2, "name" ) )
    {
      if( Planets->FindByName(argument) != nullptr)
	{
   ch->Echo("There's already another planet with that name.\r\n" );
	  return;
	}
      
      unlink( GetPlanetFilename( planet ) );
      FreeMemory( planet->Name );
      planet->Name = CopyString( argument );
      ch->Echo("Done.\r\n");
      Planets->Save(planet);
      return;
    }

  if ( !StrCmp( arg2, "governed_by" ) )
    {
      Clan *clan = GetClan( argument );

      if ( clan )
        {
          planet->GovernedBy = clan;
          ch->Echo("Done.\r\n");
          Planets->Save(planet);
        }
      else
        {
          ch->Echo("No such clan.\r\n");
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
              ch->Echo("Done.\r\n");
              Planets->Save(planet);
            }
          else
            {
              ch->Echo("No such spaceobject.\r\n");
            }
        }

      return;
    }

  if ( !StrCmp( arg2, "base_value" ) )
    {
      planet->BaseValue = atoi( argument );
      ch->Echo("Done.\r\n");
      Planets->Save(planet);
      return;
    }

  if ( !StrCmp( arg2, "flags" ) )
    {
      char farg[MAX_INPUT_LENGTH];

      argument = OneArgument( argument, farg);

      if ( IsNullOrEmpty( farg ) )
        {
          ch->Echo("Possible flags: nocapture\r\n");
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
              ch ->Echo("No such flag: %s\r\n" , farg );
            }
        }

      ch->Echo("Done.\r\n");
      Planets->Save(planet);
      return;
    }

  do_setplanet( ch, "" );
}

