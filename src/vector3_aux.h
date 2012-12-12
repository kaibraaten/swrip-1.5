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

#ifndef _VECTOR3_AUX_H_
#define _VECTOR3_AUX_H_

#include "mud.h"

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
bool ship_is_facing_ship( const SHIP_DATA * const ship,
			  const SHIP_DATA * const target );

bool ship_is_facing_planet( const SHIP_DATA * const ship,
			    const PLANET_DATA * const planet );

/*
 * Flip the trajectory to head the opposite way (180 degrees).
 */
void ship_turn_180( SHIP_DATA * const ship );

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
                      const Vector3 * const destination );

void ship_set_course_to_ship( SHIP_DATA * const ship,
			      const SHIP_DATA * const target );

void ship_set_course_to_planet( SHIP_DATA * const ship,
				const PLANET_DATA * const planet );
void missile_set_course_to_ship( MISSILE_DATA * const m,
				 const SHIP_DATA * const target );

/*
 * High-level function to align a ship's trajectory with another's.
 * Useful for grouped ships, docked ships, etc.
 */
void ship_align_heading( SHIP_DATA * const ship,
                         const SHIP_DATA * const target );

/*
 * Calculate new position based on heading and speed.
 */
void ship_move( SHIP_DATA * const ship );
void missile_move( MISSILE_DATA * const m );

double ship_distance_to_ship( const SHIP_DATA * const ship,
			      const SHIP_DATA * const target );
double ship_distance_to_planet( const SHIP_DATA * const ship,
				const PLANET_DATA * const planet );
double missile_distance_to_ship( const MISSILE_DATA * const m,
				 const SHIP_DATA * const s );
void vector_randomize( Vector3 * const vec, int from, int to );

#ifdef __cplusplus
}
#endif

#endif /* include guard */
