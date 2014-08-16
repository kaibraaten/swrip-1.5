#include <string.h>
#include "mud.h"
#include "character.h"

void do_add_patrol ( Character *ch , char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  int the_chance, credits;

  if ( IsNpc( ch ) || !ch->pcdata )
    return;

  strcpy( arg, argument );

  switch( ch->substate )
    {
    default:
      if ( ch->backup_wait )
        {
          send_to_char( "&RYou already have backup coming.\r\n", ch );
          return;
        }

      if ( !ch->pcdata->clan )
        {
          send_to_char( "&RYou need to be a member of an organization before you can call for a guard.\r\n", ch );
          return;
        }

      if ( ch->gold < GetAbilityLevel( ch, LEADERSHIP_ABILITY ) * 30 )
        {
          ch_printf( ch, "&RYou dont have enough credits.\r\n", ch );
          return;
        }

      the_chance = (int) (ch->pcdata->learned[gsn_addpatrol]);
      if ( number_percent( ) < the_chance )
        {
          send_to_char( "&GYou begin making the call for reinforcements.\r\n", ch);
          act( AT_PLAIN, "$n begins issuing orders int $s comlink.", ch,
               NULL, argument , TO_ROOM );
          add_timer ( ch, TIMER_DO_FUN, 1, do_add_patrol, SUB_PAUSE );
          ch->dest_buf = str_dup(arg);
          return;
        }
      send_to_char("&RYou call for a guard but nobody answers.\r\n",ch);
      learn_from_failure( ch, gsn_addpatrol );
      return;

    case SUB_PAUSE:
      if ( !ch->dest_buf )
        return;
      strcpy(arg, (const char*)ch->dest_buf);
      DISPOSE( ch->dest_buf);
      break;

    case SUB_TIMER_DO_ABORT:
      DISPOSE( ch->dest_buf );
      ch->substate = SUB_NONE;
      send_to_char("&RYou are interupted before you can finish your call.\r\n", ch);
      return;
    }

  ch->substate = SUB_NONE;

  send_to_char( "&GYour guard is on the way.\r\n", ch);

  credits = GetAbilityLevel( ch, LEADERSHIP_ABILITY ) * 30;
  ch_printf( ch, "It cost you %d credits.\r\n", credits);
  ch->gold -= umin( credits , ch->gold );

  learn_from_success( ch, gsn_addpatrol );

  if ( nifty_is_name( "empire" , ch->pcdata->clan->name ) )
    ch->backup_mob = MOB_VNUM_IMP_PATROL;
  else if ( nifty_is_name( "rebel" , ch->pcdata->clan->name ) )
    ch->backup_mob = MOB_VNUM_NR_PATROL;
  else
    ch->backup_mob = MOB_VNUM_MERC_PATROL;

  ch->backup_wait = 1;
}

