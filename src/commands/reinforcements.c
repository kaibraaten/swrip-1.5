#include <string.h>
#include "mud.h"
#include "character.h"

void do_reinforcements( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  int the_chance, credits;

  if ( is_npc( ch ) || !ch->pcdata )
    return;

  strcpy( arg, argument );

  switch( ch->substate )
    {
    default:
      if ( ch->backup_wait )
        {
          send_to_char( "&RYour reinforcements are already on the way.\r\n", ch );
          return;
        }

      if ( !ch->pcdata->clan )
        {
          send_to_char( "&RYou need to be a member of an organization before you can call for reinforcements.\r\n", ch );
          return;
        }

      if ( ch->gold < get_level( ch, LEADERSHIP_ABILITY ) * 50 )
        {
          ch_printf( ch, "&RYou dont have enough credits to send for reinforcements.\r\n" );
          return;
        }

      the_chance = (int) (ch->pcdata->learned[gsn_reinforcements]);
      if ( number_percent( ) < the_chance )
        {
          send_to_char( "&GYou begin making the call for reinforcements.\r\n", ch);
          act( AT_PLAIN, "$n begins issuing orders int $s comlink.", ch,
               NULL, argument , TO_ROOM );
	  add_timer ( ch , TIMER_DO_FUN , 1 , do_reinforcements , SUB_PAUSE );
          ch->dest_buf = str_dup(arg);
          return;
        }
      send_to_char("&RYou call for reinforcements but nobody answers.\r\n",ch);
      learn_from_failure( ch, gsn_reinforcements );
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

  send_to_char( "&GYour reinforcements are on the way.\r\n", ch);
  credits = get_level( ch, LEADERSHIP_ABILITY ) * 50;
  ch_printf( ch, "It cost you %d credits.\r\n", credits);
  ch->gold -= UMIN( credits , ch->gold );

  learn_from_success( ch, gsn_reinforcements );

  if ( nifty_is_name( "empire" , ch->pcdata->clan->name ) )
    ch->backup_mob = MOB_VNUM_STORMTROOPER;
  else if ( nifty_is_name( "rebel" , ch->pcdata->clan->name ) )
    ch->backup_mob = MOB_VNUM_NR_TROOPER;
  else
    ch->backup_mob = MOB_VNUM_MERCINARY;

  ch->backup_wait = number_range(1,2);
}
