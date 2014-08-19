#include "character.h"
#include "mud.h"

void do_resign( Character *ch, char *argument )
{
  Clan *clan = NULL;
  long xp_to_lose = 0;
  long xp_actually_lost = 0;

  if ( IsNpc(ch) || !ch->pcdata )
    {
      SendToCharacter( "You can't do that.\r\n", ch );
      return;
    }

  clan =  ch->pcdata->clan;

  if ( clan == NULL )
    {
      SendToCharacter( "You have to join an organization before you can quit it.\r\n", ch );
      return;
    }

  if ( !StrCmp( ch->name, ch->pcdata->clan->leadership.leader ) )
    {
      ChPrintf( ch, "You can't resign from %s ... you are the leader!\r\n", clan->name );
      return;
    }

  if ( ch->speaking & LANG_CLAN )
    ch->speaking = LANG_COMMON;

  RemoveBit( ch->speaks, LANG_CLAN );
  --clan->members;

  if ( !StrCmp( ch->name, ch->pcdata->clan->leadership.number1 ) )
    {
      FreeMemory( ch->pcdata->clan->leadership.number1 );
      ch->pcdata->clan->leadership.number1 = CopyString( "" );
    }

  if ( !StrCmp( ch->name, ch->pcdata->clan->leadership.number2 ) )
    {
      FreeMemory( ch->pcdata->clan->leadership.number2 );
      ch->pcdata->clan->leadership.number2 = CopyString( "" );
    }

  RemoveClanMember( ch );
  ch->pcdata->clan = NULL;
  FreeMemory(ch->pcdata->clan_name);
  ch->pcdata->clan_name = CopyString( "" );
  Act( AT_MAGIC, "You resign your position in $t", ch, clan->name, NULL , TO_CHAR );

  xp_to_lose = umax( GetAbilityXP( ch, DIPLOMACY_ABILITY ) - GetRequiredXpForLevel( GetAbilityLevel( ch, DIPLOMACY_ABILITY ) ), 0 );
  xp_actually_lost = lose_exp( ch, DIPLOMACY_ABILITY, xp_to_lose );
  ChPrintf( ch, "You lose %ld diplomacy experience.\r\n", xp_actually_lost );

  FreeMemory( ch->pcdata->bestowments );
  ch->pcdata->bestowments = CopyString("");

  save_char_obj( ch );  /* clan gets saved when pfile is saved */
}
