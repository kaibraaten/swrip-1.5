#include "character.h"
#include "mud.h"

void do_outcast( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim;
  Clan *clan;

  if ( IsNpc( ch ) || !ch->pcdata->clan )
    {
      SendToCharacter( "Huh?\r\n", ch );
      return;
    }

  clan = ch->pcdata->clan;

  if ( (ch->pcdata && ch->pcdata->bestowments
        && IsName("outcast", ch->pcdata->bestowments))
       || !StrCmp( ch->name, clan->leadership.leader  )
       || !StrCmp( ch->name, clan->leadership.number1 )
       || !StrCmp( ch->name, clan->leadership.number2 ) )
    {
      ;
    }
  else
    {
      SendToCharacter( "Huh?\r\n", ch );
      return;
    }

  argument = OneArgument( argument, arg );

  if ( arg[0] == '\0' )
    {
      SendToCharacter( "Outcast whom?\r\n", ch );
      return;
    }

  if ( ( victim = GetCharacterAnywhere( ch, arg ) ) == NULL )
    {
      SendToCharacter( "That player is not here.\r\n", ch);
      return;
    }

  if ( IsNpc(victim) )
    {
      SendToCharacter( "Not on NPC's.\r\n", ch );
      return;
    }

  if ( victim == ch )
    {
      SendToCharacter( "Kick yourself out of your own clan?\r\n", ch );
      return;
    }

  if ( victim->pcdata->clan != ch->pcdata->clan )
    {
      SendToCharacter( "This player does not belong to your clan!\r\n", ch );
      return;
    }


  if ( victim->speaking & LANG_CLAN )
    {
      victim->speaking = LANG_COMMON;
    }

  RemoveBit( victim->speaks, LANG_CLAN );
  --clan->members;

  if ( !StrCmp( victim->name, ch->pcdata->clan->leadership.number1 ) )
    {
      FreeMemory( ch->pcdata->clan->leadership.number1 );
      ch->pcdata->clan->leadership.number1 = CopyString( "" );
    }

  if ( !StrCmp( victim->name, ch->pcdata->clan->leadership.number2 ) )
    {
      FreeMemory( ch->pcdata->clan->leadership.number2 );
      ch->pcdata->clan->leadership.number2 = CopyString( "" );
    }

  victim->pcdata->clan = NULL;
  RemoveClanMember( victim );
  FreeMemory(victim->pcdata->clan_name);
  victim->pcdata->clan_name = CopyString( "" );
  Act( AT_MAGIC, "You outcast $N from $t", ch, clan->name, victim, TO_CHAR );
  Act( AT_MAGIC, "$n outcasts $N from $t", ch, clan->name, victim, TO_ROOM );
  Act( AT_MAGIC, "$n outcasts you from $t", ch, clan->name, victim, TO_VICT );

  FreeMemory( victim->pcdata->bestowments );
  victim->pcdata->bestowments = CopyString("");

  SaveCharacter( victim );      /* clan gets saved when pfile is saved */
}
