#include "mud.hpp"
#include "ban.hpp"
#include "character.hpp"

void do_allow( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      ch->Echo( "Remove which site from the ban list?\r\n" );
      return;
    }

  auto ban = Bans->Find([arg](const auto &b)
                        {
                          return StrCmp(arg, b->Site) == 0;
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

