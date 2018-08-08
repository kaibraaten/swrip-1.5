#include "character.hpp"
#include "mud.hpp"
#include "clan.hpp"
#include "pcdata.hpp"

void do_outcast( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim = NULL;
  Clan *clan = NULL;

  if ( IsNpc( ch ) || !IsClanned( ch ) )
    {
      ch->Echo("Huh?\r\n");
      return;
    }

  clan = ch->PCData->ClanInfo.Clan;

  if ( ( ch->PCData->Bestowments
        && IsName("outcast", ch->PCData->Bestowments))
       || !StrCmp( ch->Name, clan->Leadership.Leader  )
       || !StrCmp( ch->Name, clan->Leadership.Number1 )
       || !StrCmp( ch->Name, clan->Leadership.Number2 ) )
    {
      ;
    }
  else
    {
      ch->Echo("Huh?\r\n");
      return;
    }

  argument = OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      ch->Echo("Outcast whom?\r\n");
      return;
    }

  if ( ( victim = GetCharacterAnywhere( ch, arg ) ) == NULL )
    {
      ch->Echo("That player is not here.\r\n");
      return;
    }

  if ( IsNpc(victim) )
    {
      ch->Echo("Not on NPC's.\r\n");
      return;
    }

  if ( victim == ch )
    {
      ch->Echo("Kick yourself out of your own clan?\r\n");
      return;
    }

  if ( victim->PCData->ClanInfo.Clan != clan )
    {
      ch->Echo("This player does not belong to your clan!\r\n");
      return;
    }


  if ( victim->Speaking & LANG_CLAN )
    {
      victim->Speaking = LANG_COMMON;
    }

  RemoveBit( victim->Speaks, LANG_CLAN );

  if ( !StrCmp( victim->Name, clan->Leadership.Number1 ) )
    {
      FreeMemory( clan->Leadership.Number1 );
      clan->Leadership.Number1 = CopyString( "" );
    }

  if ( !StrCmp( victim->Name, clan->Leadership.Number2 ) )
    {
      FreeMemory( clan->Leadership.Number2 );
      clan->Leadership.Number2 = CopyString( "" );
    }

  victim->PCData->ClanInfo.Clan = NULL;
  RemoveClanMember( victim );
  FreeMemory(victim->PCData->ClanInfo.ClanName);
  victim->PCData->ClanInfo.ClanName = CopyString( "" );
  Act( AT_MAGIC, "You outcast $N from $t", ch, clan->Name, victim, TO_CHAR );
  Act( AT_MAGIC, "$n outcasts $N from $t", ch, clan->Name, victim, TO_ROOM );
  Act( AT_MAGIC, "$n outcasts you from $t", ch, clan->Name, victim, TO_VICT );

  FreeMemory( victim->PCData->Bestowments );
  victim->PCData->Bestowments = CopyString("");

  SaveCharacter( victim );      /* clan gets saved when pfile is saved */
}

