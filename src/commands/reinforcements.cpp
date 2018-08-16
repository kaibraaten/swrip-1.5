#include <string.h>
#include "mud.hpp"
#include "character.hpp"
#include "clan.hpp"
#include "skill.hpp"
#include "pcdata.hpp"

void do_reinforcements( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  int the_chance = 0;
  long credits = 0;
  Clan *clan = NULL;
  
  if ( IsNpc( ch ) )
    return;

  strcpy( arg, argument );

  switch( ch->SubState )
    {
    default:
      if ( ch->BackupWait )
        {
          ch->Echo("&RYour reinforcements are already on the way.\r\n");
          return;
        }

      if ( !IsClanned( ch ) )
        {
          ch->Echo("&RYou need to be a member of an organization before you can call for reinforcements.\r\n");
          return;
        }

      if ( ch->Gold < GetAbilityLevel( ch, LEADERSHIP_ABILITY ) * 50 )
        {
          ch->Echo("&RYou dont have enough credits to send for reinforcements.\r\n" );
          return;
        }

      the_chance = (int) (ch->PCData->Learned[gsn_reinforcements]);
      if ( GetRandomPercent() < the_chance )
        {
          ch->Echo("&GYou begin making the call for reinforcements.\r\n");
          Act( AT_PLAIN, "$n begins issuing orders int $s comlink.", ch,
               NULL, argument , TO_ROOM );
	  AddTimerToCharacter( ch , TIMER_CMD_FUN , 1 , do_reinforcements , SUB_PAUSE );
          ch->dest_buf = CopyString(arg);
          return;
        }
      ch->Echo("&RYou call for reinforcements but nobody answers.\r\n");
      LearnFromFailure( ch, gsn_reinforcements );
      return;

    case SUB_PAUSE:
      if ( !ch->dest_buf )
        return;
      strcpy(arg, (const char*)ch->dest_buf);
      FreeMemory( ch->dest_buf);
      break;

    case SUB_TIMER_DO_ABORT:
      FreeMemory( ch->dest_buf );
      ch->SubState = SUB_NONE;
      ch->Echo("&RYou are interupted before you can finish your call.\r\n");
      return;
    }

  ch->SubState = SUB_NONE;

  ch->Echo("&GYour reinforcements are on the way.\r\n");
  credits = GetAbilityLevel( ch, LEADERSHIP_ABILITY ) * 50;
  ch->Echo("It cost you %d credits.\r\n", credits);
  ch->Gold -= umin( credits , ch->Gold );

  LearnFromSuccess( ch, gsn_reinforcements );

  clan = ch->PCData->ClanInfo.Clan->MainClan ? ch->PCData->ClanInfo.Clan->MainClan : ch->PCData->ClanInfo.Clan;
  
  if ( !StrCmp( clan->Name, BADGUY_CLAN ) )
    ch->BackupMob = MOB_VNUM_STORMTROOPER;
  else if ( !StrCmp( clan->Name, GOODGUY_CLAN) )
    ch->BackupMob = MOB_VNUM_NR_TROOPER;
  else
    ch->BackupMob = MOB_VNUM_MERCINARY;

  ch->BackupWait = GetRandomNumberFromRange(1,2);
}
