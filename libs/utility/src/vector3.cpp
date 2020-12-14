/*
 * Copyright (c) 2006 -2018 Kai Braaten
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

#include <cmath>
#include "vector3.hpp"

Vector3::Vector3(double xval, double yval, double zval)
    : x(xval),
    y(yval),
    z(zval)
{

}

bool Vector3::operator==(const Vector3 &rhv) const
{
    return x == rhv.x
        && y == rhv.y
        && z == rhv.z;
}

/*
 * Return the length of a vector
 */
double Vector3::Length() const
{
    return sqrt(x * x + y * y + z * z);
}

/*
 * Return the distance between two vectors
 */
double GetDistanceBetweenVectors(const Vector3 &a, const Vector3 &b)
{
    return sqrt((a.x - b.x) * (a.x - b.x)
                + (a.y - b.y) * (a.y - b.y)
                + (a.z - b.z) * (a.z - b.z));
}

/*
 * Calculate dot product
 */
double GetVectorDotProduct(const Vector3 &a, const Vector3 &b)
{
    return (a.x * b.x) + (a.y * b.y) + (a.z * b.z);
}

/*
 * Normalize a vector
 */
void Vector3::Normalize()
{
    double magnitude = (x * x) + (y * y) + (z * z);

    if(magnitude == 0.0)
        return;

    magnitude = sqrt(magnitude);
    x /= magnitude;
    y /= magnitude;
    z /= magnitude;
}
