#include <sstream>
#include "smaug2html.hpp"

static const char * const HtmlSpecialTokens[] = {
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

static const char * const HtmlForegroundTokens[] = {
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

static const char * const HtmlBackgroundTokens[] = {
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

std::string ColorParser::Smaug2Html::Parse( const std::string &original )
{
  std::ostringstream outbuf;
  const std::string closeFont = "</font>";
  _CurrentFg = "lightgrey";
  _CurrentBk = "black";
  bool isOpen = false;
  int numFontTags = 0;
  int numCloseTags = 0;

  for( std::string::const_iterator i = original.begin();
       i != original.end(); ++i )
    {
      char current = *i;

      if( ( current == '&' || current == '^' ) && i + 1 != original.end() )
        {
          // Get the correct foreground/background map
	  std::map< char, HtmlMap >::const_iterator masterIter = _MasterMap.find( current );

          if( masterIter != _MasterMap.end() )
            {
              const HtmlMap &m = masterIter->second;
              char nextChar = *(i + 1);

	      // Check if colour code is to be escaped.
              if( nextChar == '&' || nextChar == '^' )
                {
                  outbuf << nextChar;
                  ++i;
                  continue;
                }
              else
                {
                  // Find the correct HTML tag.
		  HtmlMap::const_iterator htmlIter = m.find( nextChar );

                  if( htmlIter != m.end() )
                    {
                      if( isOpen )
                        {
                          outbuf << closeFont;
                          ++numCloseTags;
                        }

                      if( *i == '&' )
                        {
                          _CurrentFg = htmlIter->second;

                          if( nextChar == 'D' || nextChar == 'd' )
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

  if( numFontTags > numCloseTags )
    {
      for( int counter = 0; counter < ( numFontTags - numCloseTags ); ++counter )
        {
          outbuf << closeFont;
        }
    }

  outbuf << "\n";

  return outbuf.str();
}

ColorParser::Smaug2Html::Smaug2Html()
{
  FillMap( _Foreground, SmaugForegroundTokens, HtmlForegroundTokens,
           SmaugForegroundTokensSize() );
  FillMap( _Foreground, SmaugSpecialTokens, HtmlSpecialTokens,
           SmaugSpecialTokensSize() );	   
  FillMap( _Background, SmaugBackgroundTokens, HtmlBackgroundTokens,
           SmaugBackgroundTokensSize() );
  _MasterMap[ '&' ] = _Foreground;
  _MasterMap[ '^' ] = _Background;
}

void ColorParser::Smaug2Html::FillMap( std::map< char, std::string > &m,
				       const char mudArray[],
				       const char * const htmlArray[],
				       size_t arraySize )
{
  for( size_t n = 0; n < arraySize; ++n )
    {
      m[ mudArray[n] ] = htmlArray[ n ];
    }
}

std::string ColorParser::Smaug2Html::MakeColourTag() const
{
  return "<font color=\"" + _CurrentFg
    + "\" style=\"background-color:" + _CurrentBk + "\">";
}
