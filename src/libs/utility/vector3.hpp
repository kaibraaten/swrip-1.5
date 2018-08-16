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

#ifndef _VECTOR3_HPP_
#define _VECTOR3_HPP_

typedef struct vector3 Vector3;

/*
 * General purpose vector structure in three dimensions.
 */
struct vector3
{
  double x, y, z;
};

/*
 * Return the length of a vector
 * Not to be confused with the distance between two vectors!
 */
double GetVectorLength( const Vector3 * const v );

/*
 * Normalize a vector
 */
void NormalizeVector( Vector3 * const v );

/*
 * Copy vector a vector
 */
void CopyVector( Vector3 * const to, const Vector3 * const from );

/*
 * Return the distance between two vectors
 */
double GetDistanceBetweenVectors( const Vector3 * const a, const Vector3 * const b );

/*
 * Calculate dot product
 */
double GetVectorDotProduct( const Vector3 * const a, const Vector3 * const b );

/*
 * Initialize a vector's member variables.
 */
void InitializeVector( Vector3 * const v );

/*
 * Set the coordinates.
 */

void SetVector( Vector3 * const vec, double x, double y, double z );

#endif