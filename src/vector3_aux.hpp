/*
 * Copyright (c) 2006 - 2018 Kai Braaten
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

#ifndef _SWRIP_VECTOR3_AUX_HPP_
#define _SWRIP_VECTOR3_AUX_HPP_

#include <utility/vector3.hpp>
#include "types.hpp"

/*
 * To check if a ship is facing a specific position, which can be another
 * ship, a planet, an asteroid, etc.
 *
 * if( ship_is_facing( ship, &target->Position.) )
 * {
 *   ... your code here
 * }
 */
bool IsShipFacingShip( const Ship * const ship,
			  const Ship * const target );

bool IsShipFacingSpaceobject( const Ship * const ship,
				 const Spaceobject * const spaceobject );

/*
 * Flip the trajectory to head the opposite way (180 degrees).
 */
void TurnShip180( Ship * const ship );

/*
 * Set a new course towards another space object's position.
 *
 * Towards another ship.
 * SetShipCourse( ship, &target->Position.);
 *
 * Towards a planet.
 * SetShipCourse( ship, &planet->Position.);
 *
 * Etc, etc...
 */
void SetShipCourse( Ship * const ship,
                      const Vector3 * const destination );

void SetShipCourseTowardsShip( Ship * const ship,
			      const Ship * const target );

void SetShipCourseTowardsSpaceobject( Ship * const ship,
				     const Spaceobject * const spaceobject );
void SetMissileCourseTowardsShip( Missile * const m,
				 const Ship * const target );

/*
 * High-level function to align a ship's trajectory with another's.
 * Useful for grouped ships, docked ships, etc.
 */
void AlignShipTrajectory( Ship * const ship,
                         const Ship * const target );

/*
 * Calculate new position based on heading and speed.
 */
void MoveShip( Ship * const ship );
void MoveMissile( Missile * const m );
void MoveSpaceobject( Spaceobject * const spaceobj );

double GetShipDistanceToShip( const Ship * const ship,
			      const Ship * const target );
double GetShipDistanceToSpaceobject( const Ship * const ship,
				     const Spaceobject * const spaceobject );
double GetMissileDistanceToShip( const Missile * const m,
				 const Ship * const s );
void RandomizeVector( Vector3 * const vec, int from, int to );

#endif /* include guard */
