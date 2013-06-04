#include "character.h"
#include "mud.h"
#include "clan.h"

void do_resign( Character *ch, char *argument )
{
  Clan *clan = NULL;
  long xp_to_lose = 0;
  long xp_actually_lost = 0;

  if ( is_npc(ch) )
    {
      send_to_char( "You can't do that.\r\n", ch );
      return;
    }

  if( !is_clanned( ch ) )
    {
      send_to_char( "You have to join an organization before you can quit it.\r\n", ch );
      return;
    }

  clan = ch->pcdata->clan;

  if ( !str_cmp( ch->name, ch->pcdata->clan->leadership.leader ) )
    {
      ch_printf( ch, "You can't resign from %s ... you are the leader!\r\n", clan->name );
      return;
    }

  if ( ch->speaking & LANG_CLAN )
    ch->speaking = LANG_COMMON;

  REMOVE_BIT( ch->speaks, LANG_CLAN );
  --clan->members;

  if ( !str_cmp( ch->name, ch->pcdata->clan->leadership.number1 ) )
    {
      STRFREE( ch->pcdata->clan->leadership.number1 );
      ch->pcdata->clan->leadership.number1 = STRALLOC( "" );
    }

  if ( !str_cmp( ch->name, ch->pcdata->clan->leadership.number2 ) )
    {
      STRFREE( ch->pcdata->clan->leadership.number2 );
      ch->pcdata->clan->leadership.number2 = STRALLOC( "" );
    }

  RemoveMember( ch );
  ch->pcdata->clan = NULL;
  STRFREE(ch->pcdata->clan_name);
  ch->pcdata->clan_name = STRALLOC( "" );
  act( AT_MAGIC, "You resign your position in $t", ch, clan->name, NULL , TO_CHAR );

  xp_to_lose = UMAX( get_exp( ch, DIPLOMACY_ABILITY ) - exp_level( get_level( ch, DIPLOMACY_ABILITY ) ), 0 );
  xp_actually_lost = lose_exp( ch, DIPLOMACY_ABILITY, xp_to_lose );
  ch_printf( ch, "You lose %ld diplomacy experience.\r\n", xp_actually_lost );

  DISPOSE( ch->pcdata->bestowments );
  ch->pcdata->bestowments = str_dup("");

  save_char_obj( ch );  /* clan gets saved when pfile is saved */
}
