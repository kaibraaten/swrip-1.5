#include <ctype.h>
#include "mud.h"
#include "help.h"
#include "character.h"

static short str_similarity( const char *astr, const char *bstr );
static void similar_help_files(CHAR_DATA *ch, char *argument);

void do_help( CHAR_DATA *ch, char *argument )
{
  HELP_DATA *pHelp = NULL;
  const char *help_text = NULL;

  if ( !argument || argument[0] == '\0')
    {
      do_help( ch, "help" );
      return;
    }

  pHelp = get_help( ch, argument );

  if ( !pHelp )
    {
      pager_printf( ch, "&C&wNo help on \'%s\' found.\r\n", argument );
      similar_help_files(ch, argument);
      return;
    }

  if ( pHelp->level >= 0 && str_cmp( argument, "imotd" ) )
    {
      pager_printf( ch, "%s\r\n", pHelp->keyword );
    }

  if ( !is_npc(ch) && IS_SET( ch->act , PLR_SOUND ) )
    {
      pager_printf( ch, "!!SOUND(help)" );
    }

  /*
   * Strip leading '.' to allow initial blanks.
   */
  if ( pHelp->text[0] == '.' )
    {
      help_text = pHelp->text + 1;
    }
  else
    {
      help_text = pHelp->text;
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

static void similar_help_files(CHAR_DATA *ch, char *argument)
{
  HELP_DATA *pHelp = NULL;
  short level = 0;
  bool single = FALSE;

  pager_printf( ch, "&C&BSimilar Help Files:\r\n" );

  for ( pHelp = first_help; pHelp; pHelp=pHelp->next)
    {
      char buf[MAX_STRING_LENGTH];
      char *extension = pHelp->keyword;

      if (pHelp->level > get_trust(ch))
	{
	  continue;
	}

      while ( extension[0] != '\0' )
        {
          extension= one_argument(extension, buf);

          if ( str_similarity(argument, buf) > level)
            {
              level = str_similarity(argument, buf);
	      single = TRUE;
            }
          else if ( str_similarity(argument, buf) == level && level > 0)
            {
              single = FALSE;
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
               && pHelp->level <= get_trust(ch))
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
