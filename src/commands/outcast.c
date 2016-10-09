#include "character.h"
#include "mud.h"
#include "clan.h"

void do_outcast( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim;
  Clan *clan;

  if ( IsNpc( ch ) || !IsClanned( ch ) )
    {
      SendToCharacter( "Huh?\r\n", ch );
      return;
    }

  clan = ch->pcdata->ClanInfo.Clan;

  if ( ( ch->pcdata->bestowments
        && IsName("outcast", ch->pcdata->bestowments))
       || !StrCmp( ch->name, clan->Leadership.Leader  )
       || !StrCmp( ch->name, clan->Leadership.Number1 )
       || !StrCmp( ch->name, clan->Leadership.Number2 ) )
    {
      ;
    }
  else
    {
      SendToCharacter( "Huh?\r\n", ch );
      return;
    }

  argument = OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
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

  if ( victim->pcdata->ClanInfo.Clan != clan )
    {
      SendToCharacter( "This player does not belong to your clan!\r\n", ch );
      return;
    }


  if ( victim->speaking & LANG_CLAN )
    {
      victim->speaking = LANG_COMMON;
    }

  RemoveBit( victim->speaks, LANG_CLAN );

  if ( !StrCmp( victim->name, clan->Leadership.Number1 ) )
    {
      FreeMemory( clan->Leadership.Number1 );
      clan->Leadership.Number1 = CopyString( "" );
    }

  if ( !StrCmp( victim->name, clan->Leadership.Number2 ) )
    {
      FreeMemory( clan->Leadership.Number2 );
      clan->Leadership.Number2 = CopyString( "" );
    }

  victim->pcdata->ClanInfo.Clan = NULL;
  RemoveClanMember( victim );
  FreeMemory(victim->pcdata->ClanInfo.ClanName);
  victim->pcdata->ClanInfo.ClanName = CopyString( "" );
  Act( AT_MAGIC, "You outcast $N from $t", ch, clan->Name, victim, TO_CHAR );
  Act( AT_MAGIC, "$n outcasts $N from $t", ch, clan->Name, victim, TO_ROOM );
  Act( AT_MAGIC, "$n outcasts you from $t", ch, clan->Name, victim, TO_VICT );

  FreeMemory( victim->pcdata->bestowments );
  victim->pcdata->bestowments = CopyString("");

  SaveCharacter( victim );      /* clan gets saved when pfile is saved */
}
