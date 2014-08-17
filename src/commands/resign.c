#include "character.h"
#include "mud.h"

void do_resign( Character *ch, char *argument )
{
  CLAN_DATA *clan = NULL;
  long xp_to_lose = 0;
  long xp_actually_lost = 0;

  if ( IsNpc(ch) || !ch->pcdata )
    {
      send_to_char( "You can't do that.\r\n", ch );
      return;
    }

  clan =  ch->pcdata->clan;

  if ( clan == NULL )
    {
      send_to_char( "You have to join an organization before you can quit it.\r\n", ch );
      return;
    }

  if ( !StrCmp( ch->name, ch->pcdata->clan->leadership.leader ) )
    {
      ch_printf( ch, "You can't resign from %s ... you are the leader!\r\n", clan->name );
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

  remove_member( ch );
  ch->pcdata->clan = NULL;
  FreeMemory(ch->pcdata->clan_name);
  ch->pcdata->clan_name = CopyString( "" );
  act( AT_MAGIC, "You resign your position in $t", ch, clan->name, NULL , TO_CHAR );

  xp_to_lose = umax( GetExperience( ch, DIPLOMACY_ABILITY ) - exp_level( GetAbilityLevel( ch, DIPLOMACY_ABILITY ) ), 0 );
  xp_actually_lost = lose_exp( ch, DIPLOMACY_ABILITY, xp_to_lose );
  ch_printf( ch, "You lose %ld diplomacy experience.\r\n", xp_actually_lost );

  FreeMemory( ch->pcdata->bestowments );
  ch->pcdata->bestowments = CopyString("");

  save_char_obj( ch );  /* clan gets saved when pfile is saved */
}
