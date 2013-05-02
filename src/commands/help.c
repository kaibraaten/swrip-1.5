#include <ctype.h>
#include "mud.h"

static short str_similarity( const char *astr, const char *bstr );
static void similar_help_files(CHAR_DATA *ch, char *argument);

void do_help( CHAR_DATA *ch, char *argument )
{
  HELP_DATA *pHelp;

  if ( !argument || argument[0] == '\0')
    {
      do_help( ch, "help" );
      return;
    }

  if ( (pHelp = get_help( ch, argument )) == NULL )
    {
      pager_printf( ch, "&C&wNo help on \'%s\' found.\r\n", argument );
      similar_help_files(ch, argument);
      return;
    }

  if ( pHelp->level >= 0 && str_cmp( argument, "imotd" ) )
    {
      send_to_pager( pHelp->keyword, ch );
      send_to_pager( "\r\n", ch );
    }

  if ( !IS_NPC(ch) && IS_SET( ch->act , PLR_SOUND ) )
    send_to_pager( "!!SOUND(help)", ch );

  /*
   * Strip leading '.' to allow initial blanks.
   */
  if ( pHelp->text[0] == '.' )
    send_to_pager( pHelp->text+1, ch );
  else
    send_to_pager( pHelp->text  , ch );
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
  HELP_DATA *pHelp=NULL;
  char buf[MAX_STRING_LENGTH];
  char *extension;
  short lvl=0;
  bool single=FALSE;

  send_to_pager( "&C&BSimilar Help Files:\r\n", ch);

  for ( pHelp = first_help; pHelp; pHelp=pHelp->next)
    {
      buf[0]='\0';
      extension=pHelp->keyword;

      if (pHelp->level > get_trust(ch))
        continue;

      while ( extension[0] != '\0' )
        {
          extension= one_argument(extension, buf);

          if ( str_similarity(argument, buf) > lvl)
            {
              lvl=str_similarity(argument, buf);
	      single=TRUE;
            }
          else if ( str_similarity(argument, buf) == lvl && lvl > 0)
            {
              single=FALSE;
            }
        }
    }

  if (lvl==0)
    {
      send_to_pager( "&C&GNo similar help files.\r\n", ch);
      return;
    }

  for ( pHelp = first_help; pHelp; pHelp=pHelp->next)
    {
      buf[0]='\0';
      extension=pHelp->keyword;

      while ( extension[0] != '\0' )
        {
          extension=one_argument(extension, buf);

          if ( str_similarity(argument, buf) >= lvl
               && pHelp->level <= get_trust(ch))
            {
              if (single)
                {
                  send_to_pager( "&C&GOpening only similar helpfile.&C\r\n", ch);
                  do_help( ch, buf);
                  return;
                }

              pager_printf(ch, "&C&G   %s\r\n", pHelp->keyword);
              break;

            }
        }
    }
}
