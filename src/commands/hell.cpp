#include <time.h>
#include "mud.hpp"
#include "character.hpp"

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
      SendToCharacter( "Hell who, and for how long?\r\n", ch );
      return;
    }
  if ( !(victim = GetCharacterAnywhere(ch, arg)) || IsNpc(victim) )
    {
      SendToCharacter( "They aren't here.\r\n", ch );
      return;
    }
  if ( IsImmortal(victim) )
    {
      SendToCharacter( "There is no point in helling an immortal.\r\n", ch );
      return;
    }
  if ( victim->PCData->ReleaseDate != 0 )
    {
      Echo(ch, "They are already in hell until %24.24s, by %s.\r\n",
                ctime(&victim->PCData->ReleaseDate), victim->PCData->HelledBy);
      return;
    }

  argument = OneArgument(argument, arg);

  if ( !*arg || !IsNumber(arg) )
    {
      SendToCharacter( "Hell them for how long?\r\n", ch );
      return;
    }

  hell_time = atoi(arg);

  if ( hell_time <= 0 )
    {
      SendToCharacter( "You cannot hell for zero or negative time.\r\n", ch );
      return;
    }

  argument = OneArgument(argument, arg);

  if ( !*arg || !StringPrefix(arg, "hours") )
    {
      h_d = true;
    }
  else if ( StringPrefix(arg, "days") )
    {
      SendToCharacter( "Is that value in hours or days?\r\n", ch );
      return;
    }
  else if ( hell_time > 30 )
    {
      SendToCharacter( "You may not hell a person for more than 30 days at a time.\r\n", ch );
      return;
    }
  tms = localtime(&current_time);
  if ( h_d )
    tms->tm_hour += hell_time;
  else
    tms->tm_mday += hell_time;

  victim->PCData->ReleaseDate = mktime(tms);
  victim->PCData->HelledBy = CopyString(ch->Name);
  Echo(ch, "%s will be released from hell at %24.24s.\r\n", victim->Name,
            ctime(&victim->PCData->ReleaseDate));
  Act(AT_MAGIC, "$n disappears in a cloud of hellish light.", victim, NULL, ch, TO_NOTVICT);
  CharacterFromRoom(victim);
  CharacterToRoom(victim, GetRoom(ROOM_VNUM_HELL));
  Act(AT_MAGIC, "$n appears in a could of hellish light.", victim, NULL, ch, TO_NOTVICT);
  do_look(victim, "auto");
  Echo(victim, "The immortals are not pleased with your actions.\r\n"
            "You shall remain in hell for %d %s%s.\r\n", hell_time,
            (h_d ? "hour" : "day"), (hell_time == 1 ? "" : "s"));
  SaveCharacter(victim);        /* used to save ch, fixed by Thoric 09/17/96 */
}
