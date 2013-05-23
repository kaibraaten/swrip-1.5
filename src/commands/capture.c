#include "character.h"
#include "ships.h"
#include "mud.h"

void do_capture ( CHAR_DATA *ch , char *argument )
{
  CLAN_DATA *clan;
  PLANET_DATA *planet;
  PLANET_DATA *cPlanet;
  float support = 0.0;
  int pCount = 0;
  char buf[MAX_STRING_LENGTH];

  if ( !ch->in_room || !ch->in_room->area)
    return;

  if ( is_npc(ch) || !ch->pcdata )
    {
      send_to_char ( "huh?\r\n" , ch );
      return;
    }

  if ( !ch->pcdata->clan )
    {
      send_to_char ( "You need to be a member of an organization to do that!\r\n" , ch );
      return;
    }

  if ( ch->pcdata->clan->mainclan )
    clan = ch->pcdata->clan->mainclan;
  else
    clan = ch->pcdata->clan;

  if ( clan->clan_type == CLAN_CRIME )
    {
      send_to_char ( "Crime fimilies aren't in the business of controlling worlds.\r\n" , ch );
      return;
    }

  if ( clan->clan_type == CLAN_GUILD )
    {
      send_to_char ( "Your organization serves a much greater purpose.\r\n" , ch );
      return;
    }

  if ( ( planet = ch->in_room->area->planet ) == NULL )
    {
      send_to_char ( "You must be on a planet to capture it.\r\n" , ch );
      return;
    }

  if ( clan == planet->governed_by )
    {
      send_to_char ( "Your organization already controls this planet.\r\n" , ch );
      return;
    }

  if ( planet->spaceobject )
    {
      SHIP_DATA *ship;
      CLAN_DATA *sClan;

      for ( ship = first_ship ; ship ; ship = ship->next )
        {
          if( !ship->spaceobject )
            continue;

          if( ship_is_in_hyperspace( ship ) || ship_is_disabled( ship ) )
            continue;

          if( !space_in_range_c( ship, planet->spaceobject ) )
            continue;

	  sClan = get_clan(ship->owner);

          if ( !sClan )
            continue;

          if ( sClan->mainclan )
            sClan = sClan->mainclan;

          if ( sClan == planet->governed_by )
            {
              send_to_char ( "A planet cannot be captured while protected by orbiting spacecraft.\r\n" , ch );
              return;
            }
        }
    }

  if ( IS_SET( planet->flags, PLANET_NOCAPTURE ) )
    {
      send_to_char ( "This planet cannot be captured.\r\n" , ch);
      return;
    }

  if ( planet->pop_support > 0 )
    {
      send_to_char ( "The population is not in favour of changing leaders right now.\r\n" , ch );
      return;
    }

  for ( cPlanet = first_planet ; cPlanet ; cPlanet = cPlanet->next )
    if ( clan == cPlanet->governed_by )
      {
        pCount++;
        support += cPlanet->pop_support;
      }

  if ( support < 0 )
    {
      send_to_char ( "There is not enough popular support for your organization!\r\nTry improving loyalty on the planets that you already control.\r\n" , ch );
      return;
    }

  planet->governed_by = clan;
  planet->pop_support = 50;

  sprintf( buf , "%s has claimed the planet %s!", clan->name, planet->name );
  echo_to_all( AT_RED , buf , 0 );

  save_planet( planet );
}
