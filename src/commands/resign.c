#include "character.h"
#include "mud.h"
#include "clan.h"

void do_resign( Character *ch, char *argument )
{
  Clan *clan = NULL;
  long xp_to_lose = 0;
  long xp_actually_lost = 0;

  if ( IsNpc(ch) )
    {
      SendToCharacter( "You can't do that.\r\n", ch );
      return;
    }

  if ( !IsClanned( ch ) )
    {
      SendToCharacter( "You have to join an organization before you can quit it.\r\n", ch );
      return;
    }

  clan = ch->pcdata->ClanInfo.Clan;

  if ( !StrCmp( ch->name, ch->pcdata->ClanInfo.Clan->leadership.leader ) )
    {
      Echo( ch, "You can't resign from %s ... you are the leader!\r\n", clan->name );
      return;
    }

  if ( ch->speaking & LANG_CLAN )
    ch->speaking = LANG_COMMON;

  RemoveBit( ch->speaks, LANG_CLAN );
  --clan->members;

  if ( !StrCmp( ch->name, ch->pcdata->ClanInfo.Clan->leadership.number1 ) )
    {
      FreeMemory( ch->pcdata->ClanInfo.Clan->leadership.number1 );
      ch->pcdata->ClanInfo.Clan->leadership.number1 = CopyString( "" );
    }

  if ( !StrCmp( ch->name, ch->pcdata->ClanInfo.Clan->leadership.number2 ) )
    {
      FreeMemory( ch->pcdata->ClanInfo.Clan->leadership.number2 );
      ch->pcdata->ClanInfo.Clan->leadership.number2 = CopyString( "" );
    }

  RemoveClanMember( ch );
  ch->pcdata->ClanInfo.Clan = NULL;
  FreeMemory(ch->pcdata->ClanInfo.ClanName);
  ch->pcdata->ClanInfo.ClanName = CopyString( "" );
  Act( AT_MAGIC, "You resign your position in $t", ch, clan->name, NULL , TO_CHAR );

  xp_to_lose = umax( GetAbilityXP( ch, DIPLOMACY_ABILITY ) - GetRequiredXpForLevel( GetAbilityLevel( ch, DIPLOMACY_ABILITY ) ), 0 );
  xp_actually_lost = LoseXP( ch, DIPLOMACY_ABILITY, xp_to_lose );
  Echo( ch, "You lose %ld diplomacy experience.\r\n", xp_actually_lost );

  FreeMemory( ch->pcdata->bestowments );
  ch->pcdata->bestowments = CopyString("");

  SaveCharacter( ch );  /* clan gets saved when pfile is saved */
}
