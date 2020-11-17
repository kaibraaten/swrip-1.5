#include <sstream>
#include "smaug2ansi.hpp"

///////////////////////////////////////////////////////////////////////////////
// Smaug2Ansi class

ColorParser::Smaug2Ansi *ColorParser::Smaug2Ansi::Instance()
{
    static Smaug2Ansi _Instance;
    return &_Instance;
}

std::string ColorParser::Smaug2Ansi::Parse(const std::string &original)
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
            std::map<char, AnsiMap>::const_iterator masterIter
                = _MasterMap.find(current);

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
                        outbuf << ansiIter->second;
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

ColorParser::Smaug2Ansi::Smaug2Ansi()
{
    FillMap(_Foreground, SmaugForegroundTokens, AnsiForegroundTokens);
    FillMap(_Foreground, SmaugSpecialTokens, AnsiSpecialTokens);
    FillMap(_Background, SmaugBackgroundTokens, AnsiBackgroundTokens);
    _MasterMap['&'] = _Foreground;
    _MasterMap['^'] = _Background;
}

void ColorParser::Smaug2Ansi::FillMap(std::map<char, std::string> &m,
                                      const std::vector<char> &mudArray,
                                      const std::vector<const char*> &ansiArray)
{
    for(size_t n = 0; n < mudArray.size(); ++n)
    {
        m[mudArray[n]] = ansiArray[n];
    }
}
