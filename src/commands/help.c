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

  pHelp = GetHelp( ch, argument );

  if ( !pHelp )
    {
      pager_printf( ch, "&C&wNo help on \'%s\' found.\r\n", argument );
      similar_help_files(ch, argument);
      return;
    }

  if ( GetHelpLevel( pHelp ) >= 0 && str_cmp( argument, "imotd" ) )
    {
      pager_printf( ch, "%s\r\n", GetHelpKeyword( pHelp ) );
    }

  if ( !is_npc(ch) && IS_SET( ch->act , PLR_SOUND ) )
    {
      pager_printf( ch, "!!SOUND(help)" );
    }

  /*
   * Strip leading '.' to allow initial blanks.
   */
  if ( GetHelpText( pHelp )[0] == '.' )
    {
      help_text = GetHelpText( pHelp ) + 1;
    }
  else
    {
      help_text = GetHelpText( pHelp );
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
  short level = 0;
  bool single = FALSE;
  CerisMapIterator *iter = NULL;

  pager_printf( ch, "&C&BSimilar Help Files:\r\n" );

  iter = CreateMapIterator( HelpFiles );

  for ( ; !MapIterator_IsDone( iter ); MapIterator_Next( iter ) )
    {
      HelpFile *pHelp = (HelpFile*) MapIterator_GetKey( iter );
      char buf[MAX_STRING_LENGTH];
      char *extension = GetHelpKeyword( pHelp );

      if (GetHelpLevel( pHelp ) > get_trust(ch))
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

  DestroyMapIterator( iter );

  if (level == 0)
    {
      pager_printf( ch, "&C&GNo similar help files.\r\n" );
      return;
    }

  iter = CreateMapIterator( HelpFiles );

  for ( ; !MapIterator_IsDone( iter ); MapIterator_Next( iter ) )
    {
      HelpFile *pHelp = (HelpFile*) MapIterator_GetKey( iter );
      char buf[MAX_STRING_LENGTH];
      char *extension = GetHelpKeyword( pHelp );

      while ( extension[0] != '\0' )
        {
          extension=one_argument(extension, buf);

          if ( str_similarity(argument, buf) >= level
               && GetHelpLevel( pHelp ) <= get_trust(ch))
            {
              if (single)
                {
                  pager_printf( ch, "&C&GOpening only similar helpfile.&C\r\n" );
                  do_help( ch, buf);
		  DestroyMapIterator( iter );
                  return;
                }

              pager_printf(ch, "&C&G   %s\r\n", GetHelpKeyword( pHelp ) );
              break;
            }
        }
    }

  DestroyMapIterator( iter );
}
