#include "character.h"
#include "ship.h"
#include "mud.h"
#include "clan.h"

void do_capture( Character *ch , char *argument )
{
  Clan *clan;
  Planet *planet;
  Planet *cPlanet;
  float support = 0.0;
  int pCount = 0;
  char buf[MAX_STRING_LENGTH];

  if ( !ch->InRoom || !ch->InRoom->Area)
    return;

  if ( IsNpc(ch) || !ch->PCData )
    {
      SendToCharacter ( "huh?\r\n" , ch );
      return;
    }

  if ( !IsClanned( ch ) )
    {
      SendToCharacter ( "You need to be a member of an organization to do that!\r\n" , ch );
      return;
    }

  if ( ch->PCData->ClanInfo.Clan->MainClan )
    clan = ch->PCData->ClanInfo.Clan->MainClan;
  else
    clan = ch->PCData->ClanInfo.Clan;

  if ( clan->Type == CLAN_CRIME )
    {
      SendToCharacter ( "Crime families aren't in the business of controlling worlds.\r\n" , ch );
      return;
    }

  if ( clan->Type == CLAN_GUILD )
    {
      SendToCharacter ( "Your organization serves a much greater purpose.\r\n" , ch );
      return;
    }

  if ( ( planet = ch->InRoom->Area->planet ) == NULL )
    {
      SendToCharacter ( "You must be on a planet to capture it.\r\n" , ch );
      return;
    }

  if ( clan == planet->GovernedBy )
    {
      SendToCharacter ( "Your organization already controls this planet.\r\n" , ch );
      return;
    }

  if ( planet->Spaceobject )
    {
      Ship *ship;
      Clan *sClan;

      for ( ship = first_ship ; ship ; ship = ship->next )
        {
          if( !ship->spaceobject )
            continue;

          if( IsShipInHyperspace( ship ) || IsShipDisabled( ship ) )
            continue;

          if( !IsSpaceobjectInCaptureRange( ship, planet->Spaceobject ) )
            continue;

	  sClan = GetClan(ship->owner);

          if ( !sClan )
            continue;

          if ( sClan->MainClan )
            sClan = sClan->MainClan;

          if ( sClan == planet->GovernedBy )
            {
              SendToCharacter ( "A planet cannot be captured while protected by orbiting spacecraft.\r\n" , ch );
              return;
            }
        }
    }

  if ( IsBitSet( planet->Flags, PLANET_NOCAPTURE ) )
    {
      SendToCharacter ( "This planet cannot be captured.\r\n" , ch);
      return;
    }

  if ( planet->PopularSupport > 0 )
    {
      SendToCharacter ( "The population is not in favour of changing leaders right now.\r\n" , ch );
      return;
    }

  for ( cPlanet = first_planet ; cPlanet ; cPlanet = cPlanet->Next )
    if ( clan == cPlanet->GovernedBy )
      {
        pCount++;
        support += cPlanet->PopularSupport;
      }

  if ( support < 0 )
    {
      SendToCharacter ( "There is not enough popular support for your organization!\r\nTry improving loyalty on the planets that you already control.\r\n" , ch );
      return;
    }

  planet->GovernedBy = clan;
  planet->PopularSupport = 50;

  sprintf( buf , "%s has claimed the planet %s!", clan->Name, planet->Name );
  EchoToAll( AT_RED , buf , 0 );

  SavePlanet( planet );
}
