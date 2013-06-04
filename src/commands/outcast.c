#include "character.h"
#include "mud.h"
#include "clan.h"

void do_outcast( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim;
  Clan *clan;

  if ( is_npc( ch ) || !is_clanned( ch ) )
    {
      send_to_char( "Huh?\r\n", ch );
      return;
    }

  clan = ch->pcdata->clan;

  if ( (ch->pcdata && ch->pcdata->bestowments
        && is_name("outcast", ch->pcdata->bestowments))
       || !str_cmp( ch->name, clan->leadership.leader  )
       || !str_cmp( ch->name, clan->leadership.number1 )
       || !str_cmp( ch->name, clan->leadership.number2 ) )
    {
      ;
    }
  else
    {
      send_to_char( "Huh?\r\n", ch );
      return;
    }

  argument = one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Outcast whom?\r\n", ch );
      return;
    }

  if ( ( victim = get_char_world( ch, arg ) ) == NULL )
    {
      send_to_char( "That player is not here.\r\n", ch);
      return;
    }

  if ( is_npc(victim) )
    {
      send_to_char( "Not on NPC's.\r\n", ch );
      return;
    }

  if ( victim == ch )
    {
      send_to_char( "Kick yourself out of your own clan?\r\n", ch );
      return;
    }

  if ( victim->pcdata->clan != ch->pcdata->clan )
    {
      send_to_char( "This player does not belong to your clan!\r\n", ch );
      return;
    }


  if ( victim->speaking & LANG_CLAN )
    {
      victim->speaking = LANG_COMMON;
    }

  REMOVE_BIT( victim->speaks, LANG_CLAN );
  --clan->members;

  if ( !str_cmp( victim->name, ch->pcdata->clan->leadership.number1 ) )
    {
      STRFREE( ch->pcdata->clan->leadership.number1 );
      ch->pcdata->clan->leadership.number1 = STRALLOC( "" );
    }

  if ( !str_cmp( victim->name, ch->pcdata->clan->leadership.number2 ) )
    {
      STRFREE( ch->pcdata->clan->leadership.number2 );
      ch->pcdata->clan->leadership.number2 = STRALLOC( "" );
    }

  victim->pcdata->clan = NULL;
  RemoveMember( victim );
  STRFREE(victim->pcdata->clan_name);
  victim->pcdata->clan_name = STRALLOC( "" );
  act( AT_MAGIC, "You outcast $N from $t", ch, clan->name, victim, TO_CHAR );
  act( AT_MAGIC, "$n outcasts $N from $t", ch, clan->name, victim, TO_ROOM );
  act( AT_MAGIC, "$n outcasts you from $t", ch, clan->name, victim, TO_VICT );

  DISPOSE( victim->pcdata->bestowments );
  victim->pcdata->bestowments = str_dup("");

  save_char_obj( victim );      /* clan gets saved when pfile is saved */
}
