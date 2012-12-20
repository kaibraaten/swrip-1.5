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

#include <math.h>
#include "vector3.h"

/*
 * Copy vector 'from' into 'to'
 */
void vector_copy( Vector3 * const to, const Vector3 * const from )
{
  to->x = from->x;
  to->y = from->y;
  to->z = from->z;
}

/*
 * Return the length of a vector
 */
double vector_length( const Vector3 * const v )
{
  return sqrt( v->x * v->x + v->y * v->y + v->z * v->z );
}

/*
 * Return the distance between two vectors
 */
double vector_distance( const Vector3 * const a, const Vector3 * const b )
{
  return sqrt( ( a->x - b->x ) * ( a->x - b->x )
	       + ( a->y - b->y ) * ( a->y - b->y )
	       + ( a->z - b->z ) * ( a->z - b->z ) );
}

/*
 * Calculate dot product
 */
double vector_dot( const Vector3 * const a, const Vector3 * const b )
{
  return ( a->x * b->x ) + ( a->y * b->y ) + ( a->z * b->z );
}

/*
 * Normalize a vector
 */
void vector_normalize( Vector3 * const v )
{
  float magnitude = ( v->x * v->x ) + ( v->y * v->y ) + ( v->z * v->z );

  if( magnitude == 0.0 )
    return;

  magnitude = sqrt( magnitude );
  v->x /= magnitude;
  v->y /= magnitude;
  v->z /= magnitude;
}

/*
 * Initialize a vector's member variables.
 */
void vector_init( Vector3 * const v )
{
  v->x = 0.0;
  v->y = 0.0;
  v->z = 0.0;
}

void vector_set( Vector3 * const vec, double x, double y, double z )
{
  vec->x = x;
  vec->y = y;
  vec->z = z;
}
