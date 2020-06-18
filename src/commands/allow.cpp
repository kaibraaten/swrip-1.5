#include "mud.hpp"
#include "ban.hpp"
#include "character.hpp"
#include "repos/banrepository.hpp"

void do_allow( std::shared_ptr<Character> ch, std::string argument )
{
  if ( argument.empty() )
    {
      ch->Echo( "Remove which site from the ban list?\r\n" );
      return;
    }

  auto ban = Bans->Find([argument](const auto &b)
                        {
                          return StrCmp(argument, b->Site) == 0;
                        });

  if (ban != nullptr)
    {
      Bans->Remove(ban);
      Bans->Save();
      ch->Echo( "Site no longer banned.\r\n" );
      return;
    }

  ch->Echo( "Site is not banned.\r\n" );
}

