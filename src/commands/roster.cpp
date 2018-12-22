#include "character.hpp"
#include "mud.hpp"
#include "clan.hpp"
#include "pcdata.hpp"

void do_roster( Character *ch, std::string argument )
{
  if( IsNpc( ch ) || !IsClanned( ch ) )
    {
      ch->Echo("Huh?\r\n" );
      return;
    }

  std::shared_ptr<Clan> clan = ch->PCData->ClanInfo.Clan;

  if( StrCmp(ch->Name, clan->Leadership.Leader )
      && StrCmp(ch->Name, clan->Leadership.Number1 )
      && StrCmp(ch->Name, clan->Leadership.Number2 )
      && !IsName("roster", ch->PCData->Bestowments) )
    {
      ch->Echo("Huh?\r\n");
      return;
    }

  ShowClanMembers( ch, clan, argument );
}
