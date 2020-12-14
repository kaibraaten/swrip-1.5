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

#include <memory>
 /*
  * General purpose vector structure in three dimensions.
  */
class Vector3
{
public:
    Vector3(double x = 0, double y = 0, double z = 0);
    bool operator==(const Vector3 &rhv) const;
    void Normalize();
    double Length() const;

    double x = 0;
    double y = 0;
    double z = 0;
};

/*
 * Return the distance between two vectors
 */
double GetDistanceBetweenVectors(const Vector3 &a, const Vector3 &b);

/*
 * Calculate dot product
 */
double GetVectorDotProduct(const Vector3 &a, const Vector3 &b);

#endif
