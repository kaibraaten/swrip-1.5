#include "mud.hpp"
#include "ban.hpp"

void do_allow( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      SendToCharacter( "Remove which site from the ban list?\r\n", ch );
      return;
    }

  auto ban = BanRepos->Find([arg](const auto &b)
                            {
                              return StrCmp(arg, b->Site) == 0;
                            });

  if (ban != nullptr)
    {
      BanRepos->Remove(ban);
      BanRepos->Save();
      SendToCharacter( "Site no longer banned.\r\n", ch );
      return;
    }

  SendToCharacter( "Site is not banned.\r\n", ch );
}
