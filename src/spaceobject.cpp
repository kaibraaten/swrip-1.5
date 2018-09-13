/****************************************************************************
 *                   Star Wars: Rise in Power MUD Codebase                  *
 * ------------------------------------------------------------------------ *
 * SWRiP Code Additions and changes from the SWReality and Smaug Code       *
 * copyright (c) 2001 by Mark Miller (Darrik Vequir)                        *
 * ------------------------------------------------------------------------ *
 * Star Wars Reality Code Additions and changes from the Smaug Code         *
 * copyright (c) 1997 by Sean Cooper                                        *
 * ------------------------------------------------------------------------ *
 * Starwars and Starwars Names copyright(c) Lucas Film Ltd.                 *
 * ------------------------------------------------------------------------ *
 * SMAUG 1.0 (C) 1994, 1995, 1996 by Derek Snider                           *
 * SMAUG code team: Thoric, Altrag, Blodkai, Narn, Haus,                    *
 * Scryn, Rennard, Swordbearer, Gorog, Grishnakh and Tricops                *
 * ------------------------------------------------------------------------ *
 * Merc 2.1 Diku Mud improvments copyright (C) 1992, 1993 by Michael        *
 * Chastain, Michael Quan, and Mitchell Tse.                                *
 * ------------------------------------------------------------------------ *
 * Original Diku Mud copyright (C) 1990, 1991 by Sebastian Hammer,          *
 * Michael Seifert, Hans Henrik Staerfeldt, Tom Madsen, and Katja Nyboe.    *
 ****************************************************************************/

#include <cctype>
#include "mud.hpp"
#include "vector3_aux.hpp"
#include "spaceobject.hpp"
#include "ship.hpp"
#include "planet.hpp"
#include "repos/spaceobjectrepository.hpp"

void SpaceobjectUpdate( void )
{
  for(Spaceobject *spaceobj : Spaceobjects->Entities())
    {
      MoveSpaceobject( spaceobj );

      if( spaceobj->Position.x > MAX_COORD )
        spaceobj->Position.x = -MAX_COORD_S;

      if( spaceobj->Position.y > MAX_COORD )
        spaceobj->Position.y = -MAX_COORD_S;

      if( spaceobj->Position.z > MAX_COORD )
        spaceobj->Position.z = -MAX_COORD_S;

      if( spaceobj->Position.x < -MAX_COORD )
        spaceobj->Position.x = MAX_COORD_S;

      if( spaceobj->Position.y < -MAX_COORD )
        spaceobj->Position.y = MAX_COORD_S;

      if( spaceobj->Position.z < -MAX_COORD )
        spaceobj->Position.z = MAX_COORD_S;
    }
}

/*
 * Get pointer to space structure from spaceobject name.
 */
Spaceobject *GetSpaceobject( const std::string &name )
{
  Spaceobject *spaceobject = Spaceobjects->Find([name](const auto &so)
                                                {
                                                  return StrCmp(name, so->Name) == 0;
                                                });

  if(spaceobject == nullptr)
    {
      spaceobject = Spaceobjects->Find([name](const auto &so)
                                       {
                                         return StringPrefix(name, so->Name) == 0;
                                       });
    }

  return spaceobject;
}

struct SpaceobjectSearch
{
  vnum_t vnum;
  Spaceobject *spaceobject;
};

static bool FindSpaceobjectFromHangar(Ship *ship, void *userData)
{
  struct SpaceobjectSearch *data = (struct SpaceobjectSearch*)userData;

  if ( data->vnum == ship->Rooms.Hangar )
    {
      if( ship->BayOpen )
        {
          data->spaceobject = ship->Spaceobject;
          return false;
        }
    }

  return true;
}

/*
 * Get pointer to space structure from the dock vnun.
 */
Spaceobject *GetSpaceobjectFromDockVnum( vnum_t vnum )
{
  Spaceobject *spaceobject = Spaceobjects->Find([vnum](const auto &so)
                                                {
                                                  return GetLandingSiteFromVnum(so, vnum) != nullptr;
                                                });

  if(spaceobject != nullptr)
    {
      return spaceobject;
    }

  struct SpaceobjectSearch data;
  data.vnum = vnum;
  data.spaceobject = NULL;
  ForEachShip(FindSpaceobjectFromHangar, &data);

  if(data.spaceobject != NULL)
    {
      return data.spaceobject;
    }
  else
    {
      return NULL;
    }
}

const LandingSite *GetLandingSiteFromVnum( const Spaceobject *spaceobj, vnum_t vnum )
{
  size_t siteNum = 0;

  for( siteNum = 0; siteNum < MAX_LANDINGSITE; ++siteNum )
    {
      const LandingSite *site = &spaceobj->LandingSites[siteNum];

      if( vnum == site->Dock )
        {
          return site;
        }
    }

  return NULL;
}

const LandingSite *GetLandingSiteFromLocationName( const Spaceobject *spaceobj,
                                                   const std::string &name )
{
  size_t siteNum = 0;

  for( siteNum = 0; siteNum < MAX_LANDINGSITE; ++siteNum )
    {
      const LandingSite *site = &spaceobj->LandingSites[siteNum];

      if ( !StringPrefix( name, site->LocationName ) )
        {
          return site;
        }
    }

  return NULL;
}
