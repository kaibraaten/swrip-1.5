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
 * heading variables in Spaceobject like this:
 *
 * struct ship_data
 * {
 *   Vector3 pos;  // current position
 *   Vector3 head; // heading/trajectory
 * };
 *
 * Don't forget to initialize the structures before use:
 * InitializeVector( &ship->pos );
 * InitializeVector( &ship->head );
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
 * if( GetDistanceBetweenVectors( &ship->pos, &target->pos ) == 100.0 )
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
#include "spaceobject.h"

static bool IsShipFacing( const Ship * const ship,
                          const Vector3 * const target );
static void HandleMovement( Vector3 * const pos,
                            const Vector3 * const head, const int speed );

bool IsShipFacingShip( const Ship * const ship,
			  const Ship * const target )
{
  return IsShipFacing( ship, &target->pos );
}

bool IsShipFacingSpaceobject( const Ship * const ship,
				 const Spaceobject * const target )
{
  return IsShipFacing( ship, &target->Position );
}

/*
 * Flip the trajectory to head the opposite way (180 degrees).
 */
void TurnShip180( Ship * const ship )
{
  ship->head.x *= -1;
  ship->head.y *= -1;
  ship->head.z *= -1;
}

/*
 * Set a new course towards another space object's position.
 *
 * Towards another ship.
 * SetShipCourse( ship, &target->pos );
 *
 * Towards a spaceobject.
 * SetShipCourse( ship, &spaceobject->pos );
 *
 * Etc, etc...
 */
void SetShipCourse( Ship * const ship,
		      const Vector3 * const destination )
{
  ship->head.x = destination->x - ship->pos.x;
  ship->head.y = destination->y - ship->pos.y;
  ship->head.z = destination->z - ship->pos.z;
  NormalizeVector( &ship->head );
}

void SetShipCourseTowardsShip( Ship * const ship,
			      const Ship * const target )
{
  SetShipCourse( ship, &target->pos );
}

void SetShipCourseTowardsSpaceobject( Ship * const ship,
				     const Spaceobject * const target )
{
  SetShipCourse( ship, &target->Position );
}

void SetMissileCourseTowardsShip( Missile * const missile,
				 const Ship * const target )
{
  missile->head.x = target->pos.x - missile->pos.x;
  missile->head.y = target->pos.y - missile->pos.y;
  missile->head.z = target->pos.z - missile->pos.z;
  NormalizeVector( &missile->head );
}

/*
 * High-level function to align a ship's trajectory with another's.
 * Useful for grouped ships, docked ships, etc.
 */
void AlignShipTrajectory( Ship * const ship,
			 const Ship * const target )
{
  CopyVector( &ship->head, &target->head );
}

void MoveSpaceobject( Spaceobject * const spaceobj )
{
  HandleMovement( &spaceobj->Position, &spaceobj->Heading, spaceobj->Speed );
}

void MoveShip( Ship * const ship )
{
  HandleMovement( &ship->pos, &ship->head, ship->currspeed );
}

void MoveMissile( Missile * const missile )
{
  HandleMovement( &missile->pos, &missile->head, missile->speed );
}

double GetShipDistanceToShip( const Ship * const ship,
			      const Ship * const target )
{
  return GetDistanceBetweenVectors( &ship->pos, &target->pos );
}

double GetShipDistanceToSpaceobject( const Ship * const ship,
				     const Spaceobject * const spaceobject )
{
  return GetDistanceBetweenVectors( &ship->pos, &spaceobject->Position );
}

double GetMissileDistanceToShip( const Missile * const missile,
				 const Ship * const target )
{
  return GetDistanceBetweenVectors( &missile->pos, &target->pos );
}

void RandomizeVector( Vector3 * const vec, int from, int to )
{
  vec->x += GetRandomNumberFromRange( from, to );
  vec->y += GetRandomNumberFromRange( from, to );
  vec->z += GetRandomNumberFromRange( from, to );
}

/*
 * Calculate new position based on heading and speed.
 */
static void HandleMovement( Vector3 * const pos,
                            const Vector3 * const head, const int speed )
{
  if( speed > 0 )
    {
      const double change = GetVectorLength( head );

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

/*
 * To check if a ship is facing a specific position, which can be another
 * ship, a planet, an asteroid, etc.
 *
 * if( ship_is_facing( ship, &target->pos ) )
 * {
 *   ... your code here
 * }
 */
static bool IsShipFacing( const Ship * const ship,
                          const Vector3 * const target )
{
  Vector3 h, d;
  bool facing = false;
  double cosofa = 0.0;

  CopyVector( &h, &ship->head );

  d.x = target->x - ship->pos.x;
  d.y = target->y - ship->pos.y;
  d.z = target->z - ship->pos.z;

  cosofa = GetVectorDotProduct( &h, &d ) / ( GetVectorLength( &h ) + GetVectorLength( &d ) );

  if( cosofa > 0.75 )
    facing = true;

  return facing;
}
