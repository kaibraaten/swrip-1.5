#include "character.hpp"
#include "ship.hpp"
#include "mud.hpp"
#include "clan.hpp"
#include "planet.hpp"
#include "area.hpp"
#include "pcdata.hpp"
#include "room.hpp"
#include "repos/planetrepository.hpp"

struct UserData
{
  std::shared_ptr<Planet> planet;
  bool PlanetIsProtected = false;
};

static bool CheckIfProtectingPlanet(std::shared_ptr<Ship> ship, void *userData);

void do_capture( Character *ch , std::string argument )
{
  std::shared_ptr<Clan> clan;
  std::shared_ptr<Planet> planet;
  float support = 0.0;
  int pCount = 0;
  char buf[MAX_STRING_LENGTH];

  if ( IsNpc(ch) )
    {
      ch->Echo( "Huh?\r\n" );
      return;
    }

  if ( !IsClanned( ch ) )
    {
      ch->Echo( "You need to be a member of an organization to do that!\r\n" );
      return;
    }

  if ( ch->PCData->ClanInfo.Clan->MainClan )
    clan = ch->PCData->ClanInfo.Clan->MainClan;
  else
    clan = ch->PCData->ClanInfo.Clan;

  if ( ( planet = ch->InRoom->Area->Planet ) == NULL )
    {
      ch->Echo( "You must be on a planet to capture it.\r\n" );
      return;
    }

  if ( clan == planet->GovernedBy )
    {
      ch->Echo( "Your organization already controls this planet.\r\n" );
      return;
    }

  if ( planet->Spaceobject )
    {
      struct UserData data;
      data.planet = planet;
      data.PlanetIsProtected = false;

      ForEachShip(CheckIfProtectingPlanet, &data);

      if ( data.PlanetIsProtected )
        {
          ch->Echo( "A planet cannot be captured while protected by orbiting spacecraft.\r\n" );
          return;
        }
    }

  if ( planet->Flags.test( Flag::Planet::NoCapture ) )
    {
      ch->Echo( "This planet cannot be captured.\r\n" );
      return;
    }

  if ( planet->PopularSupport > 0 )
    {
      ch->Echo( "The population is not in favour of changing leaders right now.\r\n" );
      return;
    }

  for( auto cPlanet : Planets )
    {
      if ( clan == cPlanet->GovernedBy )
        {
          pCount++;
          support += cPlanet->PopularSupport;
        }
    }

  if ( support < 0 )
    {
      ch->Echo( "There is not enough popular support for your organization!\r\nTry improving loyalty on the planets that you already control.\r\n" );
      return;
    }

  planet->GovernedBy = clan;
  planet->PopularSupport = 50;

  sprintf( buf, "%s has claimed the planet %s!",
           clan->Name.c_str(), planet->Name.c_str() );
  EchoToAll( AT_RED , buf , 0 );

  Planets->Save(planet);
}

static bool CheckIfProtectingPlanet(std::shared_ptr<Ship> ship, void *userData)
{
  UserData *data = (UserData*)userData;
  std::shared_ptr<Clan> sClan = GetClan(ship->Owner);

  if( !ship->Spaceobject )
    return true;

  if( IsShipInHyperspace( ship ) || IsShipDisabled( ship ) )
    return true;

  if( !IsSpaceobjectInCaptureRange( ship, data->planet->Spaceobject ) )
    return true;

  if ( !sClan )
    return true;

  if ( sClan->MainClan )
    {
      sClan = sClan->MainClan;
    }

  if ( sClan == data->planet->GovernedBy )
    {
      data->PlanetIsProtected = true;
      return false;
    }

  return true;
}

