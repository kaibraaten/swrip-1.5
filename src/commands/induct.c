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

  clan = ch->pcdata->ClanInfo.Clan;

  if ( (ch->pcdata && ch->pcdata->bestowments
        && IsName("induct", ch->pcdata->bestowments))
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
      Clan *victimClan = victim->pcdata->ClanInfo.Clan;

      if ( victimClan->Type == CLAN_CRIME )
        {
          if ( victimClan == clan )
            {
              SendToCharacter( "This player already belongs to your crime family!\r\n", ch );
            }
          else
            {
              SendToCharacter( "This player already belongs to an organization!\r\n", ch );
            }

          return;
        }
      else if ( victimClan->Type == CLAN_GUILD )
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

  victim->pcdata->ClanInfo.Clan = clan;
  FreeMemory(victim->pcdata->ClanInfo.ClanName);
  victim->pcdata->ClanInfo.ClanName = CopyString( clan->Name );
  UpdateClanMember( victim );

  Act( AT_MAGIC, "You induct $N into $t", ch, clan->Name, victim, TO_CHAR );
  Act( AT_MAGIC, "$n inducts $N into $t", ch, clan->Name, victim, TO_NOTVICT );
  Act( AT_MAGIC, "$n inducts you into $t", ch, clan->Name, victim, TO_VICT );
  SaveCharacter( victim );
}
