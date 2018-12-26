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
 * InitializeVector( &ship->Position.);
 * InitializeVector( &ship->Heading.);
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
 * if( GetDistanceBetweenVectors( &ship->Position. &target->Position.) == 100.0 )
 * {
 *   ... your code here
 * }
 *
 * Instead you must use a little slack like this:
 * if( myDouble < 101.0 && myDouble > 99.0 )
 */

#include <cstdio>
#include <utility/random.hpp>
#include "mud.hpp"
#include "vector3_aux.hpp"
#include "spaceobject.hpp"
#include "ship.hpp"
#include "missile.hpp"

static bool IsShipFacing(std::shared_ptr<Ship> ship,
                         const Vector3 * const target);
static void HandleMovement( Vector3 * const pos,
                            const Vector3 * const head, const int speed );

bool IsShipFacingShip(std::shared_ptr<Ship> ship,
                      std::shared_ptr<Ship> target)
{
  return IsShipFacing( ship, &target->Position );
}

bool IsShipFacingSpaceobject( std::shared_ptr<Ship> ship,
                              std::shared_ptr<Spaceobject> target )
{
  return IsShipFacing( ship, &target->Position );
}

/*
 * Flip the trajectory to head the opposite way (180 degrees).
 */
void TurnShip180( std::shared_ptr<Ship> ship )
{
  ship->Heading.x *= -1;
  ship->Heading.y *= -1;
  ship->Heading.z *= -1;
}

/*
 * Set a new course towards another space object's position.
 *
 * Towards another ship.
 * SetShipCourse( ship, &target->Position );
 *
 * Towards a spaceobject.
 * SetShipCourse( ship, &spaceobject->Position );
 *
 * Etc, etc...
 */
void SetShipCourse( std::shared_ptr<Ship> ship,
                    const Vector3 * const destination )
{
  ship->Heading.x = destination->x - ship->Position.x;
  ship->Heading.y = destination->y - ship->Position.y;
  ship->Heading.z = destination->z - ship->Position.z;
  NormalizeVector( &ship->Heading );
}

void SetShipCourseTowardsShip( std::shared_ptr<Ship> ship,
                               std::shared_ptr<Ship> target )
{
  SetShipCourse( ship, &target->Position );
}

void SetShipCourseTowardsSpaceobject( std::shared_ptr<Ship> ship,
                                      std::shared_ptr<Spaceobject> target )
{
  SetShipCourse( ship, &target->Position );
}

void SetMissileCourseTowardsShip( std::shared_ptr<Missile> missile,
                                  std::shared_ptr<Ship> target )
{
  missile->Heading.x = target->Position.x - missile->Position.x;
  missile->Heading.y = target->Position.y - missile->Position.y;
  missile->Heading.z = target->Position.z - missile->Position.z;
  NormalizeVector( &missile->Heading );
}

/*
 * High-level function to align a ship's trajectory with another's.
 * Useful for grouped ships, docked ships, etc.
 */
void AlignShipTrajectory( std::shared_ptr<Ship> ship,
                          std::shared_ptr<Ship> target )
{
  CopyVector( &ship->Heading, &target->Heading );
}

void MoveSpaceobject( std::shared_ptr<Spaceobject> spaceobj )
{
  HandleMovement( &spaceobj->Position, &spaceobj->Heading, spaceobj->Speed );
}

void MoveShip( std::shared_ptr<Ship> ship )
{
  HandleMovement( &ship->Position, &ship->Heading, ship->Thrusters.Speed.Current );
}

void MoveMissile( std::shared_ptr<Missile> missile )
{
  HandleMovement( &missile->Position, &missile->Heading, missile->Speed );
}

double GetShipDistanceToShip( std::shared_ptr<Ship> ship,
			      std::shared_ptr<Ship> target )
{
  return GetDistanceBetweenVectors( &ship->Position, &target->Position );
}

double GetShipDistanceToSpaceobject( std::shared_ptr<Ship> ship,
				     std::shared_ptr<Spaceobject> spaceobject )
{
  return GetDistanceBetweenVectors( &ship->Position, &spaceobject->Position );
}

double GetMissileDistanceToShip( std::shared_ptr<Missile> missile,
				 std::shared_ptr<Ship> target )
{
  return GetDistanceBetweenVectors( &missile->Position, &target->Position );
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
 * if( ship_is_facing( ship, &target->Position ) )
 * {
 *   ... your code here
 * }
 */
static bool IsShipFacing( std::shared_ptr<Ship> ship,
                          const Vector3 * const target )
{
  Vector3 h, d;
  bool facing = false;
  double cosofa = 0.0;

  CopyVector( &h, &ship->Heading );

  d.x = target->x - ship->Position.x;
  d.y = target->y - ship->Position.y;
  d.z = target->z - ship->Position.z;

  cosofa = GetVectorDotProduct( &h, &d ) / ( GetVectorLength( &h ) + GetVectorLength( &d ) );

  if( cosofa > 0.75 )
    facing = true;

  return facing;
}

