#include <sstream>
#include "smaug_stripper.hpp"

ColorParser::SmaugStripper *ColorParser::SmaugStripper::Instance()
{
    static SmaugStripper _Instance;
    return &_Instance;
}

std::string ColorParser::SmaugStripper::Parse(const std::string &original)
{
    std::ostringstream outbuf;

    for(std::string::const_iterator i = original.cbegin();
        i != original.cend(); ++i)
    {
        const char current = *i;

        if((current == '&' || current == '^')
           && i + 1 != original.cend())
        {
            // Get the correct foreground/background map
            std::map<char, AnsiMap>::const_iterator masterIter = _MasterMap.find(current);

            if(masterIter != _MasterMap.cend())
            {
                const AnsiMap &m = masterIter->second;
                const char nextChar = *(i + 1);

                // Check if colour code is to be escaped.
                if(nextChar == '&' || nextChar == '^')
                {
                    outbuf << nextChar;
                    ++i;
                    continue;
                }
                else
                {
                    // Find the correct ANSI sequence.
                    AnsiMap::const_iterator ansiIter = m.find(nextChar);

                    if(ansiIter != m.cend())
                    {
                        ++i;
                        continue;
                    }
                }
            }
        }

        outbuf << current;
    }

    return outbuf.str();
}

ColorParser::SmaugStripper::SmaugStripper()
{
    FillMap(_Foreground, SmaugForegroundTokens);
    FillMap(_Foreground, SmaugSpecialTokens);
    FillMap(_Background, SmaugBackgroundTokens);
    _MasterMap['&'] = _Foreground;
    _MasterMap['^'] = _Background;
}

void ColorParser::SmaugStripper::FillMap(std::map<char, std::string> &m,
                                         const std::vector<char> &mudArray)
{
    for(size_t n = 0; n < mudArray.size(); ++n)
    {
        m[mudArray[n]] = "";
    }
}
