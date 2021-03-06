/*
 * Copyright (c) 2008-2018 Kai Braaten
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

#ifndef _CERIS_COLORPARSER_HPP_
#define _CERIS_COLORPARSER_HPP_

#include <string>
namespace ColorParser
{
    /// <summary>
    /// Convert text with Smaug style color tokens to ANSI color sequences.
    /// </summary>
    /// <param name="txt">Text containing color tokens.</param>
    /// <returns>The converted text.</returns>
    std::string Smaug2Ansi(const std::string &txt);

    /// <summary>
    /// Convert text with Smaug style color tokens to HTML color tags.
    /// </summary>
    /// <param name="txt">Text containing color tokens.</param>
    /// <returns>The converted text.</returns>
    std::string Smaug2Html(const std::string &txt);

    /// <summary>
    /// Strip away all Smaug color tokens from text.
    /// </summary>
    /// <param name="txt">Text containing color tokens.</param>
    /// <returns>The converted text.</returns>
    std::string Smaug2None(const std::string &txt);

    /// <summary>
    /// Send text through unaltered.
    /// </summary>
    /// <param name="txt">Text containing color tokens.</param>
    /// <returns>Same as the txt parameter.</returns>
    std::string Passthrough(const std::string &txt);
}
#endif
