#include "character.h"
#include "mud.h"
#include "clan.h"

void do_induct( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim = NULL;
  Clan *clan = NULL;

  if ( IsNpc( ch ) || !IsClanned( ch ) )
    {
      SendToCharacter( "Huh?\r\n", ch );
      return;
    }

  clan = ch->PCData->ClanInfo.Clan;

  if ( (ch->PCData && ch->PCData->Bestowments
        && IsName("induct", ch->PCData->Bestowments))
       || !StrCmp( ch->Name, clan->Leadership.Leader  )
       || !StrCmp( ch->Name, clan->Leadership.Number1 )
       || !StrCmp( ch->Name, clan->Leadership.Number2 ) )
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
      SendToCharacter( "Induct whom?\r\n", ch );
      return;
    }

  if ( ( victim = GetCharacterAnywhere( ch, arg ) ) == NULL )
    {
      SendToCharacter( "That player is not here.\r\n", ch);
      return;
    }

  if ( IsNpc(victim) )
    {
      SendToCharacter( "Not on NPCs.\r\n", ch );
      return;
    }

  if ( IsClanned( victim ) )
    {
      Clan *victimClan = victim->PCData->ClanInfo.Clan;

      if ( victimClan->Type == CLAN_GUILD )
        {
          if ( victimClan == clan )
            {
              SendToCharacter( "This player already belongs to your guild!\r\n", ch );
            }
	  else
            {
              SendToCharacter( "This player already belongs to an organization!\r\n", ch );
            }

          return;
        }
      else
        {
          if ( victimClan == clan )
            {
              SendToCharacter( "This player already belongs to your organization!\r\n", ch );
            }
          else
            {
              SendToCharacter( "This player already belongs to an organization!\r\n", ch );
            }

          return;
        }
    }

  victim->PCData->ClanInfo.Clan = clan;
  FreeMemory(victim->PCData->ClanInfo.ClanName);
  victim->PCData->ClanInfo.ClanName = CopyString( clan->Name );
  UpdateClanMember( victim );

  Act( AT_MAGIC, "You induct $N into $t", ch, clan->Name, victim, TO_CHAR );
  Act( AT_MAGIC, "$n inducts $N into $t", ch, clan->Name, victim, TO_NOTVICT );
  Act( AT_MAGIC, "$n inducts you into $t", ch, clan->Name, victim, TO_VICT );
  SaveCharacter( victim );
}
