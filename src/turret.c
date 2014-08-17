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

#include "mud.h"
#include "turret.h"
#include "constants.h"

struct Turret
{
  vnum_t room_vnum;
  int weapon_state;
  Ship *target;
  Ship *owner;
};

Turret *create_turret( Ship *owner )
{
  Turret *turret = NULL;
  CREATE( turret, Turret, 1 );
  turret->owner = owner;
  reset_turret( turret );

  return turret;
}

Turret *copy_turret( const Turret *old_turret, Ship *owner_of_new_turret )
{
  Turret *new_turret = create_turret( owner_of_new_turret );

  set_turret_room( new_turret, old_turret->room_vnum );
  new_turret->weapon_state = old_turret->weapon_state;
  set_turret_target( new_turret, old_turret->target );
  new_turret->owner = old_turret->owner;

  return new_turret;
}

bool is_turret_installed( const Turret *turret )
{
  return get_turret_room( turret ) != 0;
}

void destroy_turret( Turret *turret )
{
  DISPOSE( turret );
}

void reset_turret( Turret *turret )
{
  set_turret_ready( turret );
  clear_turret_target( turret );
}

void set_turret_ready( Turret *turret )
{
  turret->weapon_state = LASER_READY;
}

bool is_turret_ready( const Turret *turret )
{
  return turret->weapon_state == LASER_READY;
}

bool is_turret_recharging( const Turret *turret )
{
  return turret->weapon_state > (int)turret->owner->sclass;
}

void fire_turret( Turret *turret )
{
  if( turret_has_target( turret ) )
    {
      turret->weapon_state++;
    }
}

void set_turret_damaged( Turret *turret )
{
  if( is_turret_installed( turret ) )
    {
      turret->weapon_state = LASER_DAMAGED;
    }
}

bool is_turret_damaged( const Turret *turret )
{
  return turret->weapon_state == LASER_DAMAGED;
}

void clear_turret_target( Turret *turret )
{
  turret->target = 0;
}

void set_turret_target( Turret *turret, Ship *target )
{
  turret->target = target;
}

Ship *get_turret_target( const Turret *turret )
{
  return turret->target;
}

bool turret_has_target( const Turret *turret )
{
  return get_turret_target( turret ) != NULL;
}

void set_turret_room( Turret *turret, vnum_t room_vnum )
{
  turret->room_vnum = room_vnum;
}

vnum_t get_turret_room( const Turret *turret )
{
  return turret->room_vnum;
}

int get_energy_draw( const Turret *turret )
{
  int draw = 0;

  if( turret_has_target( turret ) )
    {
      draw = turret->weapon_state;
    }

  return draw;
}
