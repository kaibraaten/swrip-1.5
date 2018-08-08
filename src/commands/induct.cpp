#include "character.hpp"
#include "mud.hpp"
#include "clan.hpp"
#include "pcdata.hpp"

void do_induct( Character *ch, char *argument )
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
      ch->Echo("Huh?\r\n");
      return;
    }

  argument = OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      ch->Echo("Induct whom?\r\n");
      return;
    }

  if ( ( victim = GetCharacterAnywhere( ch, arg ) ) == NULL )
    {
      ch->Echo("That player is not here.\r\n");
      return;
    }

  if ( IsNpc(victim) )
    {
      ch->Echo("Not on NPCs.\r\n");
      return;
    }

  if ( IsClanned( victim ) )
    {
      Clan *victimClan = victim->PCData->ClanInfo.Clan;

      if ( victimClan->Type == CLAN_GUILD )
        {
          if ( victimClan == clan )
            {
              ch->Echo("This player already belongs to your guild!\r\n");
            }
	  else
            {
              ch->Echo("This player already belongs to an organization!\r\n");
            }

          return;
        }
      else
        {
          if ( victimClan == clan )
            {
              ch->Echo("This player already belongs to your organization!\r\n");
            }
          else
            {
              ch->Echo("This player already belongs to an organization!\r\n");
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


