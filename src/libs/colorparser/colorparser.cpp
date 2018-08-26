#include <string>
#include <cstdio>
#include <map>

#include "colorparser.hpp"
#include "cp_internal.hpp"
#include "smaug2html.hpp"
#include "smaug2ansi.hpp"
#include "passthrough.hpp"
#include "smaug_stripper.hpp"

namespace ColorParser {
// &
const char SmaugSpecialTokens[] = {
  'i', // ANSI_ITALIC
  'I', // ANSI_ITALIC
  'v', // ANSI_REVERSE
  'u', // ANSI_REVERSE
  'V', // ANSI_UNDERLINE
  'U', // ANSI_UNDERLINE
  's', // ANSI_STRIKEOUT
  'S', // ANSI_STRIKEOUT
  'f', // ANSI_BOLD
  'F', // ANSI_BLINK
  'd', // ANSI_RESET
  'D'  // ANSI_RESET
};

size_t SmaugSpecialTokensSize()
{
  return sizeof( SmaugSpecialTokens ) / sizeof( *SmaugSpecialTokens );
}

const char * const AnsiSpecialTokens[] = {
  "\033[3m", // ANSI_ITALIC
  "\033[3m", // ANSI_ITALIC
  "\033[7m", // ANSI_REVERSE
  "\033[7m", // ANSI_REVERSE
  "\033[4m", // ANSI_UNDERLINE
  "\033[4m", // ANSI_UNDERLINE
  "\033[9m", // ANSI_STRIKEOUT
  "\033[9m", // ANSI_STRIKEOUT
  "\033[1m", // ANSI_BOLD
  "\033[5m", // ANSI_BLINK
  "\033[0m", // ANSI_RESET
  "\033[0m"  // ANSI_RESET
};

size_t AnsiSpecialTokensSize()
{
  return sizeof( AnsiSpecialTokens ) / sizeof( *AnsiSpecialTokens );
}

// &
const char SmaugForegroundTokens[] = {
  'x', // ANSI_BLACK
  'O', // ANSI_ORANGE
  'c', // ANSI_CYAN
  'z', // ANSI_DGREY
  'g', // ANSI_DGREEN
  'G', // ANSI_GREEN
  'P', // ANSI_PINK
  'r', // ANSI_DRED
  'b', // ANSI_DBLUE
  'w', // ANSI_GREY
  'Y', // ANSI_YELLOW
  'C', // ANSI_LBLUE
  'p', // ANSI_PURPLE
  'R', // ANSI_RED
  'B', // ANSI_BLUE
  'W'  // ANSI_WHITE
};

size_t SmaugForegroundTokensSize()
{
  return sizeof( SmaugForegroundTokens ) / sizeof( *SmaugForegroundTokens );
}

const char * const AnsiForegroundTokens[] = {
  "\033[0;30m", // ANSI_BLACK
  "\033[0;33m", // ANSI_ORANGE
  "\033[0;36m", // ANSI_CYAN
  "\033[1;30m", // ANSI_DGREY
  "\033[0;32m", // ANSI_DGREEN
  "\033[1;32m", // ANSI_GREEN
  "\033[1;35m", // ANSI_PINK
  "\033[0;31m", // ANSI_DRED
  "\033[0;34m", // ANSI_DBLUE
  "\033[0;37m", // ANSI_GREY
  "\033[1;33m", // ANSI_YELLOW
  "\033[1;36m", // ANSI_LBLUE
  "\033[0;35m", // ANSI_PURPLE
  "\033[1;31m", // ANSI_RED
  "\033[1;34m", // ANSI_BLUE
  "\033[1;37m"  // ANSI_WHITE
};

size_t AnsiForegroundTokensSize()
{
  return sizeof( AnsiForegroundTokens ) / sizeof( *AnsiForegroundTokens );
}

// ^
const char SmaugBackgroundTokens[] = {
  'x', // BACK_BLACK
  'c', // BACK_CYAN
  'g', // BACK_DGREEN
  'r', // BACK_DRED
  'b', // BACK_DBLUE
  'w', // BACK_GREY
  'p', // BACK_PURPLE
  'O'  // BACK_ORANGE
};

size_t SmaugBackgroundTokensSize()
{
  return sizeof( SmaugBackgroundTokens ) / sizeof( *SmaugBackgroundTokens );
}

const char * const AnsiBackgroundTokens[] = {
  "\033[40m", // BACK_BLACK
  "\033[46m", // BACK_CYAN
  "\033[42m", // BACK_DGREEN
  "\033[41m", // BACK_DRED
  "\033[44m", // BACK_DBLUE
  "\033[47m", // BACK_GREY
  "\033[45m", // BACK_PURPLE
  "\033[43m"  // BACK_ORANGE
};

size_t AnsiBackgroundTokensSize()
{
  return sizeof( AnsiBackgroundTokens ) / sizeof( *AnsiBackgroundTokens );
}

///////////////////////////////////////////////////////////////////////////////
// Exported interface below here

std::string Smaug2Ansi( const std::string &text )
{
  return Smaug2Ansi::Instance()->Parse( text );
}

std::string Smaug2Html( const std::string &text )
{
  return Smaug2Html::Instance()->Parse( text );
}

std::string Smaug2None( const std::string &text )
{
  return SmaugStripper::Instance()->Parse( text );
}

std::string Passthrough( const std::string &text )
{
  return Passthrough::Instance()->Parse( text );
}

}
