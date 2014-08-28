#include "character.h"
#include "mud.h"

void do_addsalary ( Character *ch , char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  Character *victim;
  Clan *clan;
  int salary;

  if ( !IsClanned( ch ) )
    {
      SendToCharacter( "Huh?\r\n", ch );
      return;
    }

  clan = ch->pcdata->ClanInfo.Clan;

  if ( (ch->pcdata && ch->pcdata->bestowments
        &&    IsName("salary", ch->pcdata->bestowments))
       || !StrCmp( ch->name, clan->leadership.leader  ) )
    ;
  else
    {
      SendToCharacter( "You clan hasn't seen fit to bestow that ability to you!\r\n", ch );
      return;
    }

  argument = OneArgument( argument, arg );
  argument = OneArgument( argument, arg2 );

  salary = atoi(arg2);

  if ( arg[0] == '\0' )
    {
      SendToCharacter( "Assign a salary to whom?\r\n", ch );
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
      SendToCharacter( "Nice try.\r\n", ch );
      return;
    }

  if ( victim->pcdata->ClanInfo.Clan != ch->pcdata->ClanInfo.Clan )
    {
      SendToCharacter( "This player does not belong to your clan!\r\n", ch );
      return;
    }

  if ( salary < 0 )
    {
      Echo( ch, "Salary's must be positive!\r\n", victim->name );
      return;
    }

  victim->pcdata->ClanInfo.Salary = salary;
  Echo( ch, "%s has been assigned %d credits for a salary.\r\n", victim->name, salary );
  Echo( victim, "%s has give you a %d credit salary.\r\n", ch->name, salary );
}
