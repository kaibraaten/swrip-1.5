#include <ctime>
#include "mud.hpp"
#include "character.hpp"
#include "pcdata.hpp"
#include "repos/playerrepository.hpp"

void do_hell( Character *ch, std::string argument )
{
  Character *victim = NULL;
  std::string arg;
  short hell_time = 0;
  bool h_d = false;
  struct tm *tms = NULL;

  argument = OneArgument(argument, arg);

  if ( arg.empty() )
    {
      ch->Echo( "Hell who, and for how long?\r\n" );
      return;
    }

  if ( !(victim = GetCharacterAnywhere(ch, arg)) || IsNpc(victim) )
    {
      ch->Echo( "They aren't here.\r\n" );
      return;
    }

  if ( IsImmortal(victim) )
    {
      ch->Echo( "There is no point in helling an immortal.\r\n" );
      return;
    }

  if ( victim->PCData->ReleaseDate != 0 )
    {
      ch->Echo( "They are already in hell until %24.24s, by %s.\r\n",
                ctime(&victim->PCData->ReleaseDate),
                victim->PCData->HelledBy.c_str());
      return;
    }

  argument = OneArgument(argument, arg);

  if ( arg.empty() || !IsNumber(arg) )
    {
      ch->Echo( "Hell them for how long?\r\n" );
      return;
    }

  hell_time = ToLong(arg);

  if ( hell_time <= 0 )
    {
      ch->Echo( "You cannot hell for zero or negative time.\r\n" );
      return;
    }

  argument = OneArgument(argument, arg);

  if ( arg.empty() || !StringPrefix(arg, "hours") )
    {
      h_d = true;
    }
  else if ( StringPrefix(arg, "days") )
    {
      ch->Echo( "Is that value in hours or days?\r\n" );
      return;
    }
  else if ( hell_time > 30 )
    {
      ch->Echo( "You may not hell a person for more than 30 days at a time.\r\n" );
      return;
    }
  
  tms = localtime(&current_time);

  if ( h_d )
    tms->tm_hour += hell_time;
  else
    tms->tm_mday += hell_time;

  victim->PCData->ReleaseDate = mktime(tms);
  victim->PCData->HelledBy = ch->Name;
  ch->Echo( "%s will be released from hell at %24.24s.\r\n", victim->Name.c_str(),
            ctime(&victim->PCData->ReleaseDate));
  Act(AT_MAGIC, "$n disappears in a cloud of hellish light.", victim, NULL, ch, TO_NOTVICT);
  CharacterFromRoom(victim);
  CharacterToRoom(victim, GetRoom(ROOM_VNUM_HELL));
  Act(AT_MAGIC, "$n appears in a could of hellish light.", victim, NULL, ch, TO_NOTVICT);
  do_look(victim, "auto");
  victim->Echo( "The immortals are not pleased with your actions.\r\n"
                "You shall remain in hell for %d %s%s.\r\n", hell_time,
                (h_d ? "hour" : "day"), (hell_time == 1 ? "" : "s"));
  PlayerCharacters->Save(victim);
}
