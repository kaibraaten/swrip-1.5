#include "mud.h"

void do_resign( CHAR_DATA *ch, char *argument )
{
  CLAN_DATA *clan = NULL;
  long xp_to_lose = 0;
  long xp_actually_lost = 0;

  if ( IS_NPC(ch) || !ch->pcdata )
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

  if ( !str_cmp( ch->name, ch->pcdata->clan->leader ) )
    {
      ch_printf( ch, "You can't resign from %s ... you are the leader!\r\n", clan->name );
      return;
    }

  if ( ch->speaking & LANG_CLAN )
    ch->speaking = LANG_COMMON;

  REMOVE_BIT( ch->speaks, LANG_CLAN );
  --clan->members;

  if ( !str_cmp( ch->name, ch->pcdata->clan->number1 ) )
    {
      STRFREE( ch->pcdata->clan->number1 );
      ch->pcdata->clan->number1 = STRALLOC( "" );
    }

  if ( !str_cmp( ch->name, ch->pcdata->clan->number2 ) )
    {
      STRFREE( ch->pcdata->clan->number2 );
      ch->pcdata->clan->number2 = STRALLOC( "" );
    }

  remove_member( ch );
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
