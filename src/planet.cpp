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

#include <cassert>
#include "planet.hpp"
#include "area.hpp"

 /////////////////////////////////////////////////////
struct Planet::Impl
{
    std::list<std::shared_ptr<Area>> Areas;
};

/////////////////////////////////////////////////////
Planet::Planet()
    : pImpl(std::make_unique<Impl>())
{

}

Planet::~Planet()
{

}

const std::list<std::shared_ptr<Area> > &Planet::Areas() const
{
    return pImpl->Areas;
}

void Planet::Add(std::shared_ptr<Area> area)
{
    assert(area->Planet == nullptr);

    pImpl->Areas.push_back(area);
}

void Planet::Remove(std::shared_ptr<Area> area)
{
    assert(area->Planet != nullptr);

    pImpl->Areas.remove(area);
    area->Planet = nullptr;
}

////////////////////////////////////////////////////

long GetTaxes(std::shared_ptr<Planet> planet)
{
    long gain = planet->BaseValue;
    gain += planet->BaseValue * planet->PopularSupport / 100;
    gain += umax(0, planet->PopularSupport / 10 * planet->Population);

    return gain;
}
