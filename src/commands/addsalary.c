#include "character.h"
#include "mud.h"

void do_addsalary ( Character *ch , char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  Character *victim;
  CLAN_DATA *clan;
  int salary;

  if ( IsNpc( ch ) || !ch->pcdata->clan )
    {
      send_to_char( "Huh?\r\n", ch );
      return;
    }

  clan = ch->pcdata->clan;

  if ( (ch->pcdata && ch->pcdata->bestowments
        &&    IsName("salary", ch->pcdata->bestowments))
       || !StrCmp( ch->name, clan->leadership.leader  ) )
    ;
  else
    {
      send_to_char( "You clan hasn't seen fit to bestow that ability to you!\r\n", ch );
      return;
    }

  argument = OneArgument( argument, arg );
  argument = OneArgument( argument, arg2 );

  salary = atoi(arg2);

  if ( arg[0] == '\0' )
    {
      send_to_char( "Assign a salary to whom?\r\n", ch );
      return;
    }

  if ( ( victim = get_char_world( ch, arg ) ) == NULL )
    {
      send_to_char( "That player is not here.\r\n", ch);
      return;
    }

  if ( IsNpc(victim) )
    {
      send_to_char( "Not on NPC's.\r\n", ch );
      return;
    }

  if ( victim == ch )
    {
      send_to_char( "Nice try.\r\n", ch );
      return;
    }

  if ( victim->pcdata->clan != ch->pcdata->clan )
    {
      send_to_char( "This player does not belong to your clan!\r\n", ch );
      return;
    }

  if ( salary < 0 )
    {
      ch_printf( ch, "Salary's must be positive!\r\n", victim->name );
      return;
    }

  victim->pcdata->salary = salary;
  ch_printf( ch, "%s has been assigned %d credits for a salary.\r\n", victim->name, salary );
  ch_printf( victim, "%s has give you a %d credit salary.\r\n", ch->name, salary );
}
