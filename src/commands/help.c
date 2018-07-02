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

  help_text = GetHelpFileText( pHelp );

  /*
   * Strip leading '.' to allow initial blanks.
   */
  if ( GetHelpFileText( pHelp )[0] == '.' )
    {
      ++help_text;
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
  const List *helpFiles = GetEntities(HelpFileRepository);
  ListIterator *iterator = AllocateListIterator(helpFiles);

  PagerPrintf( ch, "&C&BSimilar Help Files:\r\n" );

  while(ListHasMoreElements(iterator))
    {
      const HelpFile *pHelp = (HelpFile*) GetListData(iterator);
      char buf[MAX_STRING_LENGTH] = { '\0' };
      char *extension = GetHelpFileKeyword( pHelp );

      MoveToNextListElement(iterator);

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

  FreeListIterator(iterator);
  iterator = NULL;

  if (level == 0)
    {
      PagerPrintf( ch, "&C&GNo similar help files.\r\n" );
      return;
    }

  iterator = AllocateListIterator(helpFiles);

  while(ListHasMoreElements(iterator))
    {
      const HelpFile *pHelp = (HelpFile*) GetListData(iterator);
      char buf[MAX_STRING_LENGTH] = { '\0' };
      char *extension = GetHelpFileKeyword( pHelp );

      MoveToNextListElement(iterator);

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

  FreeListIterator(iterator);
}
