#include <ctime>
#include "mud.hpp"
#include "character.hpp"
#include "clan.hpp"
#include "skill.hpp"
#include "area.hpp"
#include "pcdata.hpp"
#include "room.hpp"
#include "repos/playerrepository.hpp"

void do_jail( Character *ch, std::string argument )
{
  Character *victim =NULL;
  Clan *clan =NULL;
  Room *jail =NULL;
  std::string arg;
  short jail_time = 0;
  bool h_d = false;
  struct tm *tms = NULL;

  argument = OneArgument(argument, arg);

  if ( IsNpc( ch ) )
    return;

  if ( !IsClanned( ch ) )
    {
      ch->Echo("Only members of organizations can jail their enemies.\r\n");
      return;
    }

  jail = GetRoom( clan->Jail );

  if ( !jail && clan->MainClan )
    jail = GetRoom( clan->MainClan->Jail );

  if ( !jail )
    {
      ch->Echo("Your organization does not have a suitable prison.\r\n");
      return;
    }

  if ( jail->Area && ch->InRoom->Area
       && jail->Area != ch->InRoom->Area
       && ( !jail->Area->Planet || jail->Area->Planet != ch->InRoom->Area->Planet ) )
    {
      ch->Echo("Your organizations prison is to far away.\r\n");
      return;
    }

  if ( ch->Mount )
    {
      ch->Echo("You can't do that while mounted.\r\n");
      return;
    }

  if ( arg.empty() )
    {
      ch->Echo("Jail who?\r\n");
      return;
    }

  if ( ( victim = GetCharacterInRoom( ch, arg ) ) == NULL )
    {
      ch->Echo("They aren't here.\r\n");
      return;
    }

  if ( victim == ch )
    {
      ch->Echo("That's pointless.\r\n");
      return;
    }

  if ( IsNpc(victim) )
    {
      ch->Echo("That would be a waste of time.\r\n");
      return;
    }

  if ( IsBitSet( ch->InRoom->Flags, ROOM_SAFE ) )
    {
      SetCharacterColor( AT_MAGIC, ch );
      ch->Echo("This isn't a good place to do that.\r\n");
      return;
    }

  if ( ch->Position == POS_FIGHTING )
    {
      ch->Echo("Interesting combat technique.\r\n" );
      return;
    }

  if ( ch->Position <= POS_SLEEPING )
    {
      ch->Echo("In your dreams or what?\r\n" );
      return;
    }

  argument = OneArgument(argument, arg);

  if ( arg.empty() || !IsNumber(arg) )
    {
      ch->Echo("Jail them for how long?\r\n");
      return;
    }

  jail_time = std::stoi(arg);

  if ( jail_time < 0 )
    {
      ch->Echo("You cannot hell for negative time.\r\n");
      return;
    }

  if ( jail_time == 0 && victim->InRoom->Vnum != ROOM_VNUM_HELL)
    {
      ch->Echo("Jail restrictions released.\r\n");
      victim->PCData->JailVnum = 0;
      victim->PCData->ReleaseDate = 0;
      return;
    }

  if ( victim->Position >= POS_SLEEPING )
    {
      ch->Echo("You will have to stun them first.\r\n" );
      return;
    }


  argument = OneArgument(argument, arg);

  if ( arg.empty() || !StringPrefix(arg, "hours") )
    {
      h_d = true;
    }
  else if ( StringPrefix(arg, "days") )
    {
      ch->Echo("Is that value in hours or days?\r\n");
      return;
    }
  else if ( jail_time > 30 )
    {
      ch->Echo("You may not hell a person for more than 30 days at a time.\r\n");
      return;
    }

  tms = localtime(&current_time);

  if ( h_d )
    tms->tm_hour += jail_time;
  else
    tms->tm_mday += jail_time;

  victim->PCData->ReleaseDate = mktime(tms);
  victim->PCData->HelledBy = ch->Name;
  victim->PCData->JailVnum = jail->Vnum;
  ch->Echo("%s will be released from jail at %24.24s.\r\n", victim->Name.c_str(),
            ctime(&victim->PCData->ReleaseDate));
  Act(AT_MAGIC, "$n is dragged away.", victim, NULL, ch, TO_NOTVICT);
  CharacterFromRoom(victim);
  CharacterToRoom ( victim , jail );
  Act(AT_MAGIC, "$n is dragged in.", victim, NULL, ch, TO_NOTVICT);
  do_look(victim, "auto");
  victim->Echo("Whoops. You broke too many laws.\r\n"
               "You shall remain in jail for %d %s%s.\r\n", jail_time,
               (h_d ? "hour" : "day"), (jail_time == 1 ? "" : "s"));
  PlayerCharacters->Save(victim);

  LearnFromSuccess( ch , gsn_jail );
}


