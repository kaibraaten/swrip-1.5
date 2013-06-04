#include <time.h>
#include "mud.h"
#include "character.h"
#include "clan.h"

void do_jail ( Character *ch , char *argument )
{
  Character *victim =NULL;
  Clan   *clan =NULL;
  ROOM_INDEX_DATA *jail =NULL;
  char arg[MAX_INPUT_LENGTH];
  short jail_time;
  bool h_d = FALSE;
  struct tm *tms;

  argument = one_argument(argument, arg);

  if ( is_npc (ch) ) return;

  if ( !ch->pcdata || ( clan = ch->pcdata->clan ) == NULL )
    {
      send_to_char( "Only members of organizations can jail their enemies.\r\n", ch );
      return;
    }

  jail = get_room_index( clan->jail );
  if ( !jail && clan->mainclan )
    jail = get_room_index( clan->mainclan->jail );

  if ( !jail )
    {
      send_to_char( "Your organization does not have a suitable prison.\r\n", ch );
      return;
    }

  if ( jail->area && ch->in_room->area
&& jail->area != ch->in_room->area &&
       ( !jail->area->planet || jail->area->planet != ch->in_room->area->planet ) )
    {
      send_to_char( "Your organizations prison is to far away.\r\n", ch );
      return;
    }

  if ( ch->mount )
    {
      send_to_char( "You can't do that while mounted.\r\n", ch );
      return;
    }

  if ( arg[0] == '\0' )
    {
      send_to_char( "Jail who?\r\n", ch );
      return;
    }

  if ( ( victim = get_char_room( ch, arg ) ) == NULL )
    {
      send_to_char( "They aren't here.\r\n", ch );
      return;
    }

  if ( victim == ch )
    {
      send_to_char( "That's pointless.\r\n", ch );
      return;
    }

  if ( is_npc(victim) )
    {
      send_to_char( "That would be a waste of time.\r\n", ch );
      return;
    }

  if ( IS_SET( ch->in_room->room_flags, ROOM_SAFE ) )
    {
      set_char_color( AT_MAGIC, ch );
      send_to_char( "This isn't a good place to do that.\r\n", ch );
      return;
    }

  if ( ch->position == POS_FIGHTING )
    {
      send_to_char( "Interesting combat technique.\r\n" , ch );
      return;
    }

  if ( ch->position <= POS_SLEEPING )
    {
      send_to_char( "In your dreams or what?\r\n" , ch );
      return;
    }

  argument = one_argument(argument, arg);
  if ( !*arg || !is_number(arg) )
    {
      send_to_char( "Jail them for how long?\r\n", ch );
      return;
    }

  jail_time = atoi(arg);

  if ( jail_time < 0 )
    {
      send_to_char( "You cannot hell for negative time.\r\n", ch );
      return;
    }

  if ( jail_time == 0 && victim->in_room->vnum != ROOM_VNUM_HELL)
    {
      send_to_char( "Jail restrictions released.\r\n", ch );
      victim->pcdata->jail_vnum = 0;
      victim->pcdata->release_date = 0;
      return;
    }

  if ( victim->position >= POS_SLEEPING )
    {
      send_to_char( "You will have to stun them first.\r\n" , ch );
      return;
    }


  argument = one_argument(argument, arg);

  if ( !*arg || !str_prefix(arg, "hours") )
    h_d = TRUE;
  else if ( str_prefix(arg, "days") )
    {
      send_to_char( "Is that value in hours or days?\r\n", ch );
      return;
    }
  else if ( jail_time > 30 )
    {
      send_to_char( "You may not hell a person for more than 30 days at a time.\r\n", ch );
      return;
    }

  tms = localtime(&current_time);

  if ( h_d )
    tms->tm_hour += jail_time;
  else
    tms->tm_mday += jail_time;

  victim->pcdata->release_date = mktime(tms);
  victim->pcdata->helled_by = STRALLOC(ch->name);
  victim->pcdata->jail_vnum = jail->vnum;
  ch_printf(ch, "%s will be released from jail at %24.24s.\r\n", victim->name,
            ctime(&victim->pcdata->release_date));
  act(AT_MAGIC, "$n is dragged away.", victim, NULL, ch, TO_NOTVICT);
  char_from_room(victim);
  char_to_room ( victim , jail );
  act(AT_MAGIC, "$n is dragged in.", victim, NULL, ch, TO_NOTVICT);
  do_look(victim, "auto");
  ch_printf(victim, "Whoops. You broke too many laws.\r\n"
            "You shall remain in jail for %d %s%s.\r\n", jail_time,
            (h_d ? "hour" : "day"), (jail_time == 1 ? "" : "s"));
  save_char_obj(victim);        /* used to save ch, fixed by Thoric 09/17/96 */

  learn_from_success( ch , gsn_jail );
}
