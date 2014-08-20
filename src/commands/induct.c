#include "character.h"
#include "mud.h"

void do_induct( Character *ch, char *argument )
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
        && IsName("induct", ch->pcdata->bestowments))
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

  if ( victim->pcdata->clan )
    {
      if ( victim->pcdata->clan->clan_type == CLAN_CRIME )
        {
          if ( victim->pcdata->clan == clan )
            {
              SendToCharacter( "This player already belongs to your crime family!\r\n", ch );
            }
          else
            {
              SendToCharacter( "This player already belongs to an organization!\r\n", ch );
            }

          return;
        }
      else if ( victim->pcdata->clan->clan_type == CLAN_GUILD )
        {
          if ( victim->pcdata->clan == clan )
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
          if ( victim->pcdata->clan == clan )
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

  clan->members++;

  victim->pcdata->clan = clan;
  FreeMemory(victim->pcdata->clan_name);
  victim->pcdata->clan_name = CopyString( clan->name );
  UpdateClanMember( victim );
  Act( AT_MAGIC, "You induct $N into $t", ch, clan->name, victim, TO_CHAR );
  Act( AT_MAGIC, "$n inducts $N into $t", ch, clan->name, victim, TO_NOTVICT );
  Act( AT_MAGIC, "$n inducts you into $t", ch, clan->name, victim, TO_VICT );
  SaveCharacter( victim );
}
