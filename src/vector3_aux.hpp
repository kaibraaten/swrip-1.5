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

#include <memory>
#include <utility/vector3.hpp>
#include "types.hpp"

class Ship;
class Spaceobject;
class Missile;

 /*
  * To check if a ship is facing a specific position, which can be another
  * ship, a planet, an asteroid, etc.
  *
  * if( IsShipFacingShip( ship, &target->Position.) )
  * {
  *   ... your code here
  * }
  */
bool IsShipFacingShip(std::shared_ptr<Ship> ship, std::shared_ptr<Ship> target);

bool IsShipFacingSpaceobject(std::shared_ptr<Ship> ship,
                             std::shared_ptr<Spaceobject> spaceobject);

/*
 * Flip the trajectory to head the opposite way (180 degrees).
 */
void TurnShip180(std::shared_ptr<Ship> ship);

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
void SetShipCourse(std::shared_ptr<Ship> ship,
                   const Vector3 &destination);

void SetShipCourseTowardsShip(std::shared_ptr<Ship> ship,
                              std::shared_ptr<Ship> target);

void SetShipCourseTowardsSpaceobject(std::shared_ptr<Ship> ship,
                                     std::shared_ptr<Spaceobject> spaceobject);
void SetMissileCourseTowardsShip(std::shared_ptr<Missile> m,
                                 std::shared_ptr<Ship> target);

/*
 * High-level function to align a ship's trajectory with another's.
 * Useful for grouped ships, docked ships, etc.
 */
void AlignShipTrajectory(std::shared_ptr<Ship> ship, std::shared_ptr<Ship> target);

/*
 * Calculate new position based on heading and speed.
 */
void MoveShip(std::shared_ptr<Ship> ship);
void MoveMissile(std::shared_ptr<Missile> m);
void MoveSpaceobject(std::shared_ptr<Spaceobject> spaceobj);

double GetShipDistanceToShip(std::shared_ptr<Ship> ship, std::shared_ptr<Ship> target);
double GetShipDistanceToSpaceobject(std::shared_ptr<Ship> ship,
                                    std::shared_ptr<Spaceobject> spaceobject);
double GetMissileDistanceToShip(std::shared_ptr<Missile> m,
                                std::shared_ptr<Ship> s);
void RandomizeVector(Vector3 &vec, int from, int to);
bool IsBeyondGalaxy(const Vector3 &pos);

#endif /* include guard */
