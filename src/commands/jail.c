#include <time.h>
#include "mud.h"
#include "character.h"

void do_jail ( Character *ch , char *argument )
{
  Character *victim =NULL;
  Clan   *clan =NULL;
  Room *jail =NULL;
  char arg[MAX_INPUT_LENGTH];
  short jail_time;
  bool h_d = false;
  struct tm *tms;

  argument = OneArgument(argument, arg);

  if ( IsNpc (ch) ) return;

  if ( !ch->pcdata || ( clan = ch->pcdata->clan ) == NULL )
    {
      SendToCharacter( "Only members of organizations can jail their enemies.\r\n", ch );
      return;
    }

  jail = GetRoom( clan->jail );
  if ( !jail && clan->mainclan )
    jail = GetRoom( clan->mainclan->jail );

  if ( !jail )
    {
      SendToCharacter( "Your organization does not have a suitable prison.\r\n", ch );
      return;
    }

  if ( jail->area && ch->in_room->area
&& jail->area != ch->in_room->area &&
       ( !jail->area->planet || jail->area->planet != ch->in_room->area->planet ) )
    {
      SendToCharacter( "Your organizations prison is to far away.\r\n", ch );
      return;
    }

  if ( ch->mount )
    {
      SendToCharacter( "You can't do that while mounted.\r\n", ch );
      return;
    }

  if ( arg[0] == '\0' )
    {
      SendToCharacter( "Jail who?\r\n", ch );
      return;
    }

  if ( ( victim = GetCharacterInRoom( ch, arg ) ) == NULL )
    {
      SendToCharacter( "They aren't here.\r\n", ch );
      return;
    }

  if ( victim == ch )
    {
      SendToCharacter( "That's pointless.\r\n", ch );
      return;
    }

  if ( IsNpc(victim) )
    {
      SendToCharacter( "That would be a waste of time.\r\n", ch );
      return;
    }

  if ( IsBitSet( ch->in_room->room_flags, ROOM_SAFE ) )
    {
      SetCharacterColor( AT_MAGIC, ch );
      SendToCharacter( "This isn't a good place to do that.\r\n", ch );
      return;
    }

  if ( ch->position == POS_FIGHTING )
    {
      SendToCharacter( "Interesting combat technique.\r\n" , ch );
      return;
    }

  if ( ch->position <= POS_SLEEPING )
    {
      SendToCharacter( "In your dreams or what?\r\n" , ch );
      return;
    }

  argument = OneArgument(argument, arg);
  if ( !*arg || !IsNumber(arg) )
    {
      SendToCharacter( "Jail them for how long?\r\n", ch );
      return;
    }

  jail_time = atoi(arg);

  if ( jail_time < 0 )
    {
      SendToCharacter( "You cannot hell for negative time.\r\n", ch );
      return;
    }

  if ( jail_time == 0 && victim->in_room->vnum != ROOM_VNUM_HELL)
    {
      SendToCharacter( "Jail restrictions released.\r\n", ch );
      victim->pcdata->jail_vnum = 0;
      victim->pcdata->release_date = 0;
      return;
    }

  if ( victim->position >= POS_SLEEPING )
    {
      SendToCharacter( "You will have to stun them first.\r\n" , ch );
      return;
    }


  argument = OneArgument(argument, arg);

  if ( !*arg || !StringPrefix(arg, "hours") )
    h_d = true;
  else if ( StringPrefix(arg, "days") )
    {
      SendToCharacter( "Is that value in hours or days?\r\n", ch );
      return;
    }
  else if ( jail_time > 30 )
    {
      SendToCharacter( "You may not hell a person for more than 30 days at a time.\r\n", ch );
      return;
    }

  tms = localtime(&current_time);

  if ( h_d )
    tms->tm_hour += jail_time;
  else
    tms->tm_mday += jail_time;

  victim->pcdata->release_date = mktime(tms);
  victim->pcdata->helled_by = CopyString(ch->name);
  victim->pcdata->jail_vnum = jail->vnum;
  ChPrintf(ch, "%s will be released from jail at %24.24s.\r\n", victim->name,
            ctime(&victim->pcdata->release_date));
  Act(AT_MAGIC, "$n is dragged away.", victim, NULL, ch, TO_NOTVICT);
  CharacterFromRoom(victim);
  CharacterToRoom ( victim , jail );
  Act(AT_MAGIC, "$n is dragged in.", victim, NULL, ch, TO_NOTVICT);
  do_look(victim, "auto");
  ChPrintf(victim, "Whoops. You broke too many laws.\r\n"
            "You shall remain in jail for %d %s%s.\r\n", jail_time,
            (h_d ? "hour" : "day"), (jail_time == 1 ? "" : "s"));
  save_char_obj(victim);        /* used to save ch, fixed by Thoric 09/17/96 */

  LearnFromSuccess( ch , gsn_jail );
}
