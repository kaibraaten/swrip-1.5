#include <cctype>
#include "mud.hpp"
#include "help.hpp"
#include "character.hpp"
#include "repos/helprepository.hpp"

static short str_similarity( const std::string &astr, const std::string &bstr );
static void similar_help_files(Character *ch, const std::string &argument);

void do_help( Character *ch, std::string argument )
{
  std::shared_ptr<HelpFile> pHelp;
  std::string help_text;

  if ( argument.empty() )
    {
      do_help( ch, "help" );
      return;
    }

  pHelp = GetHelpFile( ch, argument );

  if ( !pHelp )
    {
      ch->Echo( "&C&wNo help on \'%s\' found.\r\n", argument.c_str() );
      similar_help_files(ch, argument);
      return;
    }

  if ( GetHelpFileLevel( pHelp ) >= 0 && StrCmp( argument, "imotd" ) )
    {
      ch->Echo( "%s\r\n", GetHelpFileKeyword( pHelp ).c_str() );
    }

  help_text = GetHelpFileText( pHelp );

  /*
   * Strip leading '.' to allow initial blanks.
   */
  if ( GetHelpFileText( pHelp )[0] == '.' )
    {
      help_text = help_text.substr(1);
    }
  
  ch->Echo( "%s", help_text.c_str() );
}

static short str_similarity( const std::string &stl_astr, const std::string &stl_bstr )
{
  const char *astr = stl_astr.c_str();
  const char *bstr = stl_bstr.c_str();
  short matches = 0;

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

static void similar_help_files(Character *ch, const std::string &argument)
{
  short level = 0;
  bool single = false;

  ch->Echo( "&C&BSimilar Help Files:\r\n" );

  for(const auto &pHelp : HelpFiles->Entities())
    {
      std::string extension = GetHelpFileKeyword( pHelp );

      if (GetHelpFileLevel( pHelp ) > GetTrustLevel(ch))
	{
	  continue;
	}

      while ( !extension.empty() )
        {
          std::string buf;
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

  for(const auto &pHelp : HelpFiles->Entities())
    {
      std::string extension = GetHelpFileKeyword( pHelp );

      while ( !extension.empty() )
        {
          std::string buf;
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

              ch->Echo( "&C&G   %s\r\n", GetHelpFileKeyword( pHelp ).c_str() );
              break;
            }
        }
    }
}
