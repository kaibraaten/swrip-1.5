#include "character.h"
#include "mud.h"

void do_induct( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim;
  CLAN_DATA *clan;

  if ( IsNpc( ch ) || !ch->pcdata->clan )
    {
      send_to_char( "Huh?\r\n", ch );
      return;
    }

  clan = ch->pcdata->clan;

  if ( (ch->pcdata && ch->pcdata->bestowments
        && is_name("induct", ch->pcdata->bestowments))
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
      send_to_char( "Induct whom?\r\n", ch );
      return;
    }

  if ( ( victim = get_char_world( ch, arg ) ) == NULL )
    {
      send_to_char( "That player is not here.\r\n", ch);
      return;
    }

  if ( IsNpc(victim) )
    {
      send_to_char( "Not on NPCs.\r\n", ch );
      return;
    }

  if ( victim->pcdata->clan )
    {
      if ( victim->pcdata->clan->clan_type == CLAN_CRIME )
        {
          if ( victim->pcdata->clan == clan )
            {
              send_to_char( "This player already belongs to your crime family!\r\n", ch );
            }
          else
            {
              send_to_char( "This player already belongs to an organization!\r\n", ch );
            }

          return;
        }
      else if ( victim->pcdata->clan->clan_type == CLAN_GUILD )
        {
          if ( victim->pcdata->clan == clan )
            {
              send_to_char( "This player already belongs to your guild!\r\n", ch );
            }
	  else
            {
              send_to_char( "This player already belongs to an organization!\r\n", ch );
            }

          return;
        }
      else
        {
          if ( victim->pcdata->clan == clan )
            {
              send_to_char( "This player already belongs to your organization!\r\n", ch );
            }
          else
            {
              send_to_char( "This player already belongs to an organization!\r\n", ch );
            }

          return;
        }
    }

  clan->members++;

  victim->pcdata->clan = clan;
  DISPOSE(victim->pcdata->clan_name);
  victim->pcdata->clan_name = str_dup( clan->name );
  update_member( victim );
  act( AT_MAGIC, "You induct $N into $t", ch, clan->name, victim, TO_CHAR );
  act( AT_MAGIC, "$n inducts $N into $t", ch, clan->name, victim, TO_NOTVICT );
  act( AT_MAGIC, "$n inducts you into $t", ch, clan->name, victim, TO_VICT );
  save_char_obj( victim );
}
