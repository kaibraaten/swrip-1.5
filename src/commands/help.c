#include <ctype.h>
#include "mud.h"
#include "help.h"
#include "character.h"

static short str_similarity( const char *astr, const char *bstr );
static void similar_help_files(Character *ch, char *argument);

void do_help( Character *ch, char *argument )
{
  HelpFile *pHelp = NULL;
  const char *help_text = NULL;

  if ( !argument || argument[0] == '\0')
    {
      do_help( ch, "help" );
      return;
    }

  pHelp = GetHelpFile( ch, argument );

  if ( !pHelp )
    {
      pager_printf( ch, "&C&wNo help on \'%s\' found.\r\n", argument );
      similar_help_files(ch, argument);
      return;
    }

  if ( GetHelpLevel( pHelp ) >= 0 && str_cmp( argument, "imotd" ) )
    {
      pager_printf( ch, "%s\r\n", GetHelpFileKeyword( pHelp ) );
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

  pager_printf( ch, help_text );
}

static short str_similarity( const char *astr, const char *bstr )
{
  short matches=0;

  if (!astr || !bstr)
    return matches;

  for ( ; *astr; astr++)
    {
      if ( LOWER(*astr) == LOWER(*bstr) )
        matches++;

      if (++bstr == '\0')
        return matches;
    }

  return matches;
}

static void similar_help_files(Character *ch, char *argument)
{
  HelpFile *pHelp = NULL;
  short level = 0;
  bool single = false;

  pager_printf( ch, "&C&BSimilar Help Files:\r\n" );

  for ( pHelp = first_help; pHelp; pHelp=pHelp->next)
    {
      char buf[MAX_STRING_LENGTH];
      char *extension = pHelp->keyword;

      if (pHelp->level > GetTrustLevel(ch))
	{
	  continue;
	}

      while ( extension[0] != '\0' )
        {
          extension= one_argument(extension, buf);

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
      pager_printf( ch, "&C&GNo similar help files.\r\n" );
      return;
    }

  for ( pHelp = first_help; pHelp; pHelp=pHelp->next)
    {
      char buf[MAX_STRING_LENGTH];
      char *extension = pHelp->keyword;

      while ( extension[0] != '\0' )
        {
          extension=one_argument(extension, buf);

          if ( str_similarity(argument, buf) >= level
               && pHelp->level <= GetTrustLevel(ch))
            {
              if (single)
                {
                  pager_printf( ch, "&C&GOpening only similar helpfile.&C\r\n" );
                  do_help( ch, buf);
                  return;
                }

              pager_printf(ch, "&C&G   %s\r\n", pHelp->keyword);
              break;
            }
        }
    }
}
