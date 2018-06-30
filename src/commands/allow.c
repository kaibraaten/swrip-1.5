#include "mud.h"
#include "ban.h"

static bool SiteIsBanned(const void *element, const void *ud)
{
  const Ban *ban = (const Ban*)element;
  const char *arg = (const char*)ud;

  return !StrCmp( arg, ban->Site );
}

void do_allow( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Ban *ban = NULL;
  const List *bans = GetEntities(BanRepository);

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      SendToCharacter( "Remove which site from the ban list?\r\n", ch );
      return;
    }

  ban = (Ban*)FindIf(bans, SiteIsBanned, arg);

  if (ban != NULL)
    {
      RemoveBan(ban);

      if ( ban->BanTime != NULL )
        {
          FreeMemory(ban->BanTime);
        }

      FreeMemory( ban->Site );
      FreeMemory( ban );
      SaveBans();
      SendToCharacter( "Site no longer banned.\r\n", ch );
      return;
    }

  SendToCharacter( "Site is not banned.\r\n", ch );
}
