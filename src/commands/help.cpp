#include <ctype.h>
#include "mud.hpp"
#include "help.hpp"
#include "character.hpp"

static short str_similarity( const char *astr, const char *bstr );
static void similar_help_files(Character *ch, std::string argument);

void do_help( Character *ch, std::string argument )
{
  HelpFile *pHelp = NULL;
  const char *help_text = NULL;

  if ( IsNullOrEmpty( argument ) )
    {
      do_help( ch, "help" );
      return;
    }

  pHelp = GetHelpFile( ch, argument );

  if ( !pHelp )
    {
      PagerPrintf( ch, "&C&wNo help on \'%s\' found.\r\n", argument );
      similar_help_files(ch, argument);
      return;
    }

  if ( GetHelpFileLevel( pHelp ) >= 0 && StrCmp( argument, "imotd" ) )
    {
      PagerPrintf( ch, "%s\r\n", GetHelpFileKeyword( pHelp ) );
    }

  /*
   * Strip leading '.' to allow initial blanks.
   */
  if ( GetHelpFileText( pHelp )[0] == '.' )
    {
      help_text = GetHelpFileText( pHelp ) + 1;
    }
  else
    {
      help_text = GetHelpFileText( pHelp );
    }

  SendToPager( help_text, ch );
}

static short str_similarity( const char *astr, const char *bstr )
{
  short matches=0;

  if (!astr || !bstr)
    return matches;

  for ( ; *astr; astr++)
    {
      if ( CharToLowercase(*astr) == CharToLowercase(*bstr) )
        matches++;

      if (++bstr == '\0')
        return matches;
    }

  return matches;
}

static void similar_help_files(Character *ch, std::string argument)
{
  HelpFile *pHelp = NULL;
  short level = 0;
  bool single = false;

  PagerPrintf( ch, "&C&BSimilar Help Files:\r\n" );

  for ( pHelp = FirstHelp; pHelp; pHelp=pHelp->Next)
    {
      char buf[MAX_STRING_LENGTH];
      char *extension = GetHelpFileKeyword( pHelp );

      if (GetHelpFileLevel( pHelp ) > GetTrustLevel(ch))
	{
	  continue;
	}

      while ( !IsNullOrEmpty( extension ) )
        {
          extension = OneArgument(extension, buf);

          if ( str_similarity(argument, buf) > level)
            {
              level = str_similarity(argument, buf);
	      single = true;
            }
          else if ( str_similarity(argument, buf) == level && level > 0)
            {
              single = false;
            }
        }
    }

  if (level == 0)
    {
      PagerPrintf( ch, "&C&GNo similar help files.\r\n" );
      return;
    }

  for ( pHelp = FirstHelp; pHelp; pHelp=pHelp->Next)
    {
      char buf[MAX_STRING_LENGTH];
      char *extension = GetHelpFileKeyword( pHelp );

      while ( !IsNullOrEmpty( extension ) )
        {
          extension = OneArgument(extension, buf);

          if ( str_similarity(argument, buf) >= level
               && GetHelpFileLevel( pHelp ) <= GetTrustLevel(ch))
            {
              if (single)
                {
                  PagerPrintf( ch, "&C&GOpening only similar helpfile.&C\r\n" );
                  do_help( ch, buf);
                  return;
                }

              PagerPrintf(ch, "&C&G   %s\r\n", GetHelpFileKeyword( pHelp ) );
              break;
            }
        }
    }
}
