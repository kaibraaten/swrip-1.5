#include <sstream>
#include "smaug2html.hpp"

static const std::vector<const char*> HtmlSpecialTokens = {
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  ""
};

static const std::vector<const char*> HtmlForegroundTokens = {
  "black",
  "darkgoldenrod",
  "darkcyan",
  "gray",
  "green",
  "lawngreen",
  "deeppink",
  "darkred",
  "darkblue",
  "lightgrey",
  "yellow",
  "cyan",
  "purple",
  "red",
  "blue",
  "white",
};

static const std::vector<const char*> HtmlBackgroundTokens = {
  "black",
  "darkcyan",
  "green",
  "darkred",
  "darkblue",
  "lightgrey",
  "purple",
  "darkgoldenrod"
};

ColorParser::Smaug2Html *ColorParser::Smaug2Html::Instance()
{
    static Smaug2Html _Instance;
    return &_Instance;
}

std::string ColorParser::Smaug2Html::Parse(const std::string &original)
{
    std::ostringstream outbuf;
    const std::string closeFont = "</font>";
    _CurrentFg = "lightgrey";
    _CurrentBk = "black";
    bool isOpen = false;
    int numFontTags = 0;
    int numCloseTags = 0;

    for(std::string::const_iterator i = original.cbegin();
        i != original.cend(); ++i)
    {
        const char current = *i;

        if((current == '&' || current == '^') && i + 1 != original.cend())
        {
            // Get the correct foreground/background map
            std::map<char, HtmlMap>::const_iterator masterIter = _MasterMap.find(current);

            if(masterIter != _MasterMap.end())
            {
                const HtmlMap &m = masterIter->second;
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
                    // Find the correct HTML tag.
                    HtmlMap::const_iterator htmlIter = m.find(nextChar);

                    if(htmlIter != m.cend())
                    {
                        if(isOpen)
                        {
                            outbuf << closeFont;
                            ++numCloseTags;
                        }

                        if(*i == '&')
                        {
                            _CurrentFg = htmlIter->second;

                            if(nextChar == 'D' || nextChar == 'd')
                            {
                                _CurrentBk = "black";
                            }
                        }
                        else
                        {
                            _CurrentBk = htmlIter->second;
                        }

                        outbuf << MakeColourTag();
                        ++numFontTags;
                        isOpen = true;
                        ++i;
                        continue;
                    }
                }
            }
        }

        outbuf << current;
    }

    if(numFontTags > numCloseTags)
    {
        for(int counter = 0; counter < (numFontTags - numCloseTags); ++counter)
        {
            outbuf << closeFont;
        }
    }

    outbuf << "\n";

    return outbuf.str();
}

ColorParser::Smaug2Html::Smaug2Html()
{
    FillMap(_Foreground, SmaugForegroundTokens, HtmlForegroundTokens);
    FillMap(_Foreground, SmaugSpecialTokens, HtmlSpecialTokens);
    FillMap(_Background, SmaugBackgroundTokens, HtmlBackgroundTokens);
    _MasterMap['&'] = _Foreground;
    _MasterMap['^'] = _Background;
}

void ColorParser::Smaug2Html::FillMap(std::map<char, std::string> &m,
                                      const std::vector<char> &mudArray,
                                      const std::vector<const char*> &htmlArray)
{
    for(size_t n = 0; n < mudArray.size(); ++n)
    {
        m[mudArray[n]] = htmlArray[n];
    }
}

std::string ColorParser::Smaug2Html::MakeColourTag() const
{
    return "<font color=\"" + _CurrentFg
        + "\" style=\"background-color:" + _CurrentBk + "\">";
}
