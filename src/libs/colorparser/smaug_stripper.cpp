#include <sstream>
#include "smaug_stripper.hpp"

ColorParser::SmaugStripper *ColorParser::SmaugStripper::Instance()
{
  static SmaugStripper _Instance;
  return &_Instance;
}

std::string ColorParser::SmaugStripper::Parse( const std::string &original )
{
  std::ostringstream outbuf;

  for( std::string::const_iterator i = original.begin();
       i != original.end(); ++i )
    {
      char current = *i;

      if( ( current == '&' || current == '^' )
          && i + 1 != original.end() )
	{
          // Get the correct foreground/background map
	  std::map< char, AnsiMap >::iterator masterIter
            = _MasterMap.find( current );

          if( masterIter != _MasterMap.end() )
            {
              const AnsiMap &m = masterIter->second;
              char nextChar = *(i+1);

              // Check if colour code is to be escaped.
              if( nextChar == '&' || nextChar == '^' )
                {
                  outbuf << nextChar;
                  ++i;
                  continue;
                }
              else
                {
                  // Find the correct ANSI sequence.
		  AnsiMap::const_iterator ansiIter = m.find( nextChar );

                  if( ansiIter != m.end() )
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
  FillMap( _Foreground, SmaugForegroundTokens, SmaugForegroundTokensSize() );
  FillMap( _Foreground, SmaugSpecialTokens, SmaugSpecialTokensSize() );
  FillMap( _Background, SmaugBackgroundTokens, SmaugBackgroundTokensSize() );
  _MasterMap[ '&' ] = _Foreground;
  _MasterMap[ '^' ] = _Background;
}

void ColorParser::SmaugStripper::FillMap( std::map< char, std::string > &m,
                                          const char mudArray[],
                                          size_t arraySize )
{
  for( size_t n = 0; n < arraySize; ++n )
    {
      m[ mudArray[n] ] = "";
    }
}
