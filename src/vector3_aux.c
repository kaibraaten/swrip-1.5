/*
 * Copyright (c) 2006 Kai Braaten
 *
 * Permission is hereby granted, free of charge, to any person
 * obtaining a copy of this software and associated documentation
 * files (the "Software"), to deal in the Software without
 * restriction, including without limitation the rights to use,
 * copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following
 * conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 * HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 * OTHER DEALINGS IN THE SOFTWARE.
 */

/*
 * This file contains various utility functions to handle a ship's
 * behaviour in three dimensional space.
 *
 * The code assumes that you have replaced the old position and
 * heading variables in SPACE_DATA like this:
 *
 * struct ship_data
 * {
 *   Vector3 pos;  // current position
 *   Vector3 head; // heading/trajectory
 * };
 *
 * Don't forget to initialze the structures before use:
 * vector_init( &ship->pos );
 * vector_init( &ship->head );
 *
 * To get the most out of the Vector3 library it is recommended to use
 * it for everything related to positions and movement, including planets,
 * asteroids, missiles, and whatever else might apply to your codebase.
 * It will likely require a little work, as planets' positions were
 * originally handled as integers.
 *
 * A reminder about floating point comparisons:
 * Testing two floats or doubles for equality is not reliable in C.
 * This means that the following code may not give you the result you want:
 *
 * // Bad code follows:
 * if( vector_distance( &ship->pos, &target->pos ) == 100.0 )
 * {
 *   ... your code here
 * }
 *
 * Instead you must use a little slack like this:
 * if( myDouble < 101.0 && myDouble > 99.0 )
 */

#include <stdio.h>
#include "vector3.h"
#include "mud.h"
#include "vector3_aux.h"

/*
 * To check if a ship is facing a specific position, which can be another
 * ship, a planet, an asteroid, etc.
 *
 * if( ship_is_facing( ship, &target->pos ) )
 * {
 *   ... your code here
 * }
 */
static bool ship_is_facing( const SHIP_DATA * const ship,
    const Vector3 * const target )
{
  Vector3 h, d;
  bool facing = FALSE;
  double cosofa = 0.0;

  vector_copy( &h, &ship->head );

  d.x = target->x - ship->pos.x;
  d.y = target->y - ship->pos.y;
  d.z = target->z - ship->pos.z;

  cosofa =
    vector_dot( &h, &d ) / ( vector_length( &h ) + vector_length( &d ) );

  if( cosofa > 0.75 )
    facing = TRUE;

  return facing;
}

bool ship_is_facing_ship( const SHIP_DATA * const ship,
    const SHIP_DATA * const target )
{
  return ship_is_facing( ship, &target->pos );
}

bool ship_is_facing_planet( const SHIP_DATA * const ship,
    const PLANET_DATA * const target )
{
  return ship_is_facing( ship, &target->pos );
}

/*
 * Flip the trajectory to head the opposite way (180 degrees).
 */
void ship_turn_180( SHIP_DATA * const ship )
{
  ship->head.x *= -1;
  ship->head.y *= -1;
  ship->head.z *= -1;
}

/*
 * Set a new course towards another space object's position.
 *
 * Towards another ship.
 * ship_set_course( ship, &target->pos );
 *
 * Towards a planet.
 * ship_set_course( ship, &planet->pos );
 *
 * Etc, etc...
 */
void ship_set_course( SHIP_DATA * const ship,
    const Vector3 * const destination )
{
  ship->head.x = destination->x - ship->pos.x;
  ship->head.y = destination->y - ship->pos.y;
  ship->head.z = destination->z - ship->pos.z;
  vector_normalize( &ship->head );
}

void ship_set_course_to_ship( SHIP_DATA * const ship,
    const SHIP_DATA * const target )
{
  ship_set_course( ship, &target->pos );
}

void ship_set_course_to_planet( SHIP_DATA * const ship,
    const PLANET_DATA * const target )
{
  ship_set_course( ship, &target->pos );
}

void missile_set_course_to_ship( MISSILE_DATA * const missile,
    const SHIP_DATA * const target )
{
  missile->head.x = target->pos.x - missile->pos.x;
  missile->head.y = target->pos.y - missile->pos.y;
  missile->head.z = target->pos.z - missile->pos.z;
  vector_normalize( &missile->head );
}

/*
 * High-level function to align a ship's trajectory with another's.
 * Useful for grouped ships, docked ships, etc.
 */
void ship_align_heading( SHIP_DATA * const ship,
    const SHIP_DATA * const target )
{
  vector_copy( &ship->head, &target->head );
}

/*
 * Calculate new position based on heading and speed.
 */

static void move_space_object( Vector3 * const pos,
    const Vector3 * const head, const int speed )
{
  if( speed > 0 )
  {
    const double change = vector_length( head );

    if( change > 0 )
    {
      Vector3 tmpv;
      tmpv.x = head->x / change;
      tmpv.y = head->y / change;
      tmpv.z = head->z / change;
      pos->x += ( tmpv.x * speed ) / 5;
      pos->y += ( tmpv.y * speed ) / 5;
      pos->z += ( tmpv.z * speed ) / 5;
    }
  }
}

void ship_move( SHIP_DATA * const ship )
{
  move_space_object( &ship->pos, &ship->head, ship->currspeed );
}

void missile_move( MISSILE_DATA * const missile )
{
  move_space_object( &missile->pos, &missile->head, missile->speed );
}

double ship_distance_to_ship( const SHIP_DATA * const ship,
    const SHIP_DATA * const target )
{
  return vector_distance( &ship->pos, &target->pos );
}

double ship_distance_to_planet( const SHIP_DATA * const ship,
    const PLANET_DATA * const planet )
{
  return vector_distance( &ship->pos, &planet->pos );
}

double missile_distance_to_ship( const MISSILE_DATA * const missile,
    const SHIP_DATA * const target )
{
  return vector_distance( &missile->pos, &target->pos );
}

void vector_randomize( Vector3 * const vec, int from, int to )
{
  vec->x += number_range( from, to );
  vec->y += number_range( from, to );
  vec->z += number_range( from, to );
}
