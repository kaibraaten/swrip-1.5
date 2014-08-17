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

#ifndef _SWRIP_VECTOR3_AUX_H_
#define _SWRIP_VECTOR3_AUX_H_

#include "types.h"

#ifdef __cplusplus
extern "C" {
#endif

/*
 * To check if a ship is facing a specific position, which can be another
 * ship, a planet, an asteroid, etc.
 *
 * if( ship_is_facing( ship, &target->pos ) )
 * {
 *   ... your code here
 * }
 */
bool ship_is_facing_ship( const Ship * const ship,
			  const Ship * const target );

bool ship_is_facing_spaceobject( const Ship * const ship,
				 const Spaceobject * const spaceobject );

/*
 * Flip the trajectory to head the opposite way (180 degrees).
 */
void ship_turn_180( Ship * const ship );

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
void ship_set_course( Ship * const ship,
                      const Vector3 * const destination );

void ship_set_course_to_ship( Ship * const ship,
			      const Ship * const target );

void ship_set_course_to_spaceobject( Ship * const ship,
				     const Spaceobject * const spaceobject );
void missile_set_course_to_ship( Missile * const m,
				 const Ship * const target );

/*
 * High-level function to align a ship's trajectory with another's.
 * Useful for grouped ships, docked ships, etc.
 */
void ship_align_heading( Ship * const ship,
                         const Ship * const target );

/*
 * Calculate new position based on heading and speed.
 */
void move_ship( Ship * const ship );
void move_missile( Missile * const m );
void move_spaceobject( Spaceobject * const spaceobj );

double ship_distance_to_ship( const Ship * const ship,
			      const Ship * const target );
double ship_distance_to_spaceobject( const Ship * const ship,
				     const Spaceobject * const spaceobject );
double missile_distance_to_ship( const Missile * const m,
				 const Ship * const s );
void vector_randomize( Vector3 * const vec, int from, int to );

#ifdef __cplusplus
}
#endif

#endif /* include guard */
