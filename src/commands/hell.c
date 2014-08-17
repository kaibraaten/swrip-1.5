#include <time.h>
#include "mud.h"
#include "character.h"

void do_hell( Character *ch, char *argument )
{
  Character *victim;
  char arg[MAX_INPUT_LENGTH];
  short hell_time;
  bool h_d = false;
  struct tm *tms;

  argument = OneArgument(argument, arg);
  if ( !*arg )
    {
      send_to_char( "Hell who, and for how long?\r\n", ch );
      return;
    }
  if ( !(victim = get_char_world(ch, arg)) || IsNpc(victim) )
    {
      send_to_char( "They aren't here.\r\n", ch );
      return;
    }
  if ( IsImmortal(victim) )
    {
      send_to_char( "There is no point in helling an immortal.\r\n", ch );
      return;
    }
  if ( victim->pcdata->release_date != 0 )
    {
      ch_printf(ch, "They are already in hell until %24.24s, by %s.\r\n",
                ctime(&victim->pcdata->release_date), victim->pcdata->helled_by);
      return;
    }

  argument = OneArgument(argument, arg);

  if ( !*arg || !IsNumber(arg) )
    {
      send_to_char( "Hell them for how long?\r\n", ch );
      return;
    }

  hell_time = atoi(arg);

  if ( hell_time <= 0 )
    {
      send_to_char( "You cannot hell for zero or negative time.\r\n", ch );
      return;
    }

  argument = OneArgument(argument, arg);

  if ( !*arg || !StringPrefix(arg, "hours") )
    {
      h_d = true;
    }
  else if ( StringPrefix(arg, "days") )
    {
      send_to_char( "Is that value in hours or days?\r\n", ch );
      return;
    }
  else if ( hell_time > 30 )
    {
      send_to_char( "You may not hell a person for more than 30 days at a time.\r\n", ch );
      return;
    }
  tms = localtime(&current_time);
  if ( h_d )
    tms->tm_hour += hell_time;
  else
    tms->tm_mday += hell_time;

  victim->pcdata->release_date = mktime(tms);
  victim->pcdata->helled_by = CopyString(ch->name);
  ch_printf(ch, "%s will be released from hell at %24.24s.\r\n", victim->name,
            ctime(&victim->pcdata->release_date));
  act(AT_MAGIC, "$n disappears in a cloud of hellish light.", victim, NULL, ch, TO_NOTVICT);
  char_from_room(victim);
  char_to_room(victim, get_room_index(6));
  act(AT_MAGIC, "$n appears in a could of hellish light.", victim, NULL, ch, TO_NOTVICT);
  do_look(victim, "auto");
  ch_printf(victim, "The immortals are not pleased with your actions.\r\n"
            "You shall remain in hell for %d %s%s.\r\n", hell_time,
            (h_d ? "hour" : "day"), (hell_time == 1 ? "" : "s"));
  save_char_obj(victim);        /* used to save ch, fixed by Thoric 09/17/96 */
}
