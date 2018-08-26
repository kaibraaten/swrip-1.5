#include <sstream>
#include "smaug2ansi.hpp"

///////////////////////////////////////////////////////////////////////////////
// Smaug2Ansi class

ColorParser::Smaug2Ansi *ColorParser::Smaug2Ansi::Instance()
{
  static Smaug2Ansi _Instance;
  return &_Instance;
}

std::string ColorParser::Smaug2Ansi::Parse( const std::string &original )
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
	  std::map< char, AnsiMap >::const_iterator masterIter
            = _MasterMap.find( current );

          if( masterIter != _MasterMap.end() )
            {
              const AnsiMap &m = masterIter->second;
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
                  // Find the correct ANSI sequence.
		  AnsiMap::const_iterator ansiIter = m.find( nextChar );

                  if( ansiIter != m.end() )
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
  FillMap( _Foreground, SmaugForegroundTokens, AnsiForegroundTokens,
	   SmaugForegroundTokensSize() );
  FillMap( _Foreground, SmaugSpecialTokens, AnsiSpecialTokens,
	   SmaugSpecialTokensSize() );
  FillMap( _Background, SmaugBackgroundTokens, AnsiBackgroundTokens,
	   SmaugBackgroundTokensSize() );
  _MasterMap[ '&' ] = _Foreground;
  _MasterMap[ '^' ] = _Background;
}

void ColorParser::Smaug2Ansi::FillMap( std::map< char, std::string > &m,
				       const char mudArray[],
				       const char * const ansiArray[],
				       size_t arraySize )
{
  for( size_t n = 0; n < arraySize; ++n )
    {
      m[ mudArray[n] ] = ansiArray[ n ];
    }
}
