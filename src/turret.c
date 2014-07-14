#include "mud.h"
#include "turret.h"
#include "constants.h"

struct turret_data
{
  vnum_t room_vnum;
  int weapon_state;
  SHIP_DATA *target;
  SHIP_DATA *owner;
};

TURRET_DATA *create_turret( SHIP_DATA *owner )
{
  TURRET_DATA *turret = NULL;
  CREATE( turret, TURRET_DATA, 1 );
  turret->owner = owner;
  reset_turret( turret );

  return turret;
}

TURRET_DATA *copy_turret( const TURRET_DATA *old_turret, SHIP_DATA *owner_of_new_turret )
{
  TURRET_DATA *new_turret = create_turret( owner_of_new_turret );

  set_turret_room( new_turret, old_turret->room_vnum );
  new_turret->weapon_state = old_turret->weapon_state;
  set_turret_target( new_turret, old_turret->target );
  new_turret->owner = old_turret->owner;

  return new_turret;
}

bool is_turret_installed( const TURRET_DATA *turret )
{
  return get_turret_room( turret ) != 0;
}

void destroy_turret( TURRET_DATA *turret )
{
  DISPOSE( turret );
}

void reset_turret( TURRET_DATA *turret )
{
  set_turret_ready( turret );
  clear_turret_target( turret );
}

void set_turret_ready( TURRET_DATA *turret )
{
  turret->weapon_state = LASER_READY;
}

bool is_turret_ready( const TURRET_DATA *turret )
{
  return turret->weapon_state == LASER_READY;
}

bool is_turret_recharging( const TURRET_DATA *turret )
{
  return turret->weapon_state > turret->owner->sclass;
}

void fire_turret( TURRET_DATA *turret )
{
  if( turret_has_target( turret ) )
    {
      turret->weapon_state++;
    }
}

void set_turret_damaged( TURRET_DATA *turret )
{
  if( is_turret_installed( turret ) )
    {
      turret->weapon_state = LASER_DAMAGED;
    }
}

bool is_turret_damaged( const TURRET_DATA *turret )
{
  return turret->weapon_state == LASER_DAMAGED;
}

void clear_turret_target( TURRET_DATA *turret )
{
  turret->target = 0;
}

void set_turret_target( TURRET_DATA *turret, SHIP_DATA *target )
{
  turret->target = target;
}

SHIP_DATA *get_turret_target( const TURRET_DATA *turret )
{
  return turret->target;
}

bool turret_has_target( const TURRET_DATA *turret )
{
  return get_turret_target( turret ) != NULL;
}

void set_turret_room( TURRET_DATA *turret, vnum_t room_vnum )
{
  turret->room_vnum = room_vnum;
}

vnum_t get_turret_room( const TURRET_DATA *turret )
{
  return turret->room_vnum;
}

int get_energy_draw( const TURRET_DATA *turret )
{
  int draw = 0;

  if( turret_has_target( turret ) )
    {
      draw = turret->weapon_state;
    }

  return draw;
}
