#include <ctype.h>
#include "mud.hpp"
#include "help.hpp"
#include "character.hpp"

static short str_similarity( const char *astr, const char *bstr );
static void similar_help_files(Character *ch, char *argument);

void do_help( Character *ch, char *argument )
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
      ch->Echo( "&C&wNo help on \'%s\' found.\r\n", argument );
      similar_help_files(ch, argument);
      return;
    }

  if ( GetHelpFileLevel( pHelp ) >= 0 && StrCmp( argument, "imotd" ) )
    {
      ch->Echo( "%s\r\n", GetHelpFileKeyword( pHelp ) );
    }

  help_text = GetHelpFileText( pHelp );

  /*
   * Strip leading '.' to allow initial blanks.
   */
  if ( GetHelpFileText( pHelp )[0] == '.' )
    {
      ++help_text;
    }

  ch->Echo( "%s", help_text );
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

      ++bstr;

      if (*bstr == '\0')
        return matches;
    }

  return matches;
}

static void similar_help_files(Character *ch, char *argument)
{
  short level = 0;
  bool single = false;

  ch->Echo( "&C&BSimilar Help Files:\r\n" );

  for(const HelpFile *pHelp : HelpFiles->Entities())
    {
      char buf[MAX_STRING_LENGTH] = { '\0' };
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
      ch->Echo( "&C&GNo similar help files.\r\n" );
      return;
    }

  for(const HelpFile *pHelp : HelpFiles->Entities())
    {
      char buf[MAX_STRING_LENGTH] = { '\0' };
      char *extension = GetHelpFileKeyword( pHelp );

      while ( !IsNullOrEmpty( extension ) )
        {
          extension = OneArgument(extension, buf);

          if ( str_similarity(argument, buf) >= level
               && GetHelpFileLevel( pHelp ) <= GetTrustLevel(ch))
            {
              if (single)
                {
                  ch->Echo( "&C&GOpening only similar helpfile.&C\r\n" );
                  do_help( ch, buf);
                  return;
                }

              ch->Echo( "&C&G   %s\r\n", GetHelpFileKeyword( pHelp ) );
              break;
            }
        }
    }
}

