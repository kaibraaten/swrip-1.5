#include <string.h>
#include "mud.hpp"
#include "character.hpp"
#include "clan.hpp"
#include "skill.hpp"
#include "pcdata.hpp"

void do_elite_guard( Character *ch , char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  int the_chance = 0, credits = 0;
  Clan *clan = NULL;
  
  if ( IsNpc( ch ) )
    return;

  strcpy( arg, argument );

  switch( ch->SubState )
    {
    default:
      if ( ch->BackupWait )
        {
          ch->Echo( "&RYou already have backup coming.\r\n" );
          return;
        }

      if ( !IsClanned( ch ) )
        {
          ch->Echo( "&RYou need to be a member of an organization before you can call for a guard.\r\n" );
          return;
        }

      if ( ch->Gold < GetAbilityLevel(ch, LEADERSHIP_ABILITY) * 200 )
        {
          ch->Echo( "&RYou dont have enough credits.\r\n", ch );
          return;
        }

      the_chance = (int) (ch->PCData->Learned[gsn_eliteguard]);

      if ( GetRandomPercent() < the_chance )
        {
          ch->Echo( "&GYou begin making the call for reinforcements.\r\n" );
          Act( AT_PLAIN, "$n begins issuing orders int $s comlink.", ch,
               NULL, argument , TO_ROOM );
          AddTimerToCharacter( ch , TIMER_CMD_FUN , 1 , do_elite_guard , SUB_PAUSE );
          ch->dest_buf = CopyString(arg);
          return;
        }
      
      ch->Echo("&RYou call for a guard but nobody answers.\r\n");
      LearnFromFailure( ch, gsn_eliteguard );
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

  ch->Echo( "&GYour guard is on the way.\r\n" );

  credits = GetAbilityLevel(ch, LEADERSHIP_ABILITY) * 200;
  ch->Echo( "It cost you %d credits.\r\n", credits);
  ch->Gold -= umin( credits , ch->Gold );

  LearnFromSuccess( ch, gsn_eliteguard );

  clan = ch->PCData->ClanInfo.Clan->MainClan ? ch->PCData->ClanInfo.Clan->MainClan : ch->PCData->ClanInfo.Clan;
  
  if ( !StrCmp( clan->Name, BADGUY_CLAN ) )
    ch->BackupMob = MOB_VNUM_IMP_ELITE;
  else if (!StrCmp( clan->Name, GOODGUY_CLAN))
    ch->BackupMob = MOB_VNUM_NR_ELITE;
  else
    ch->BackupMob = MOB_VNUM_MERC_ELITE;

  ch->BackupWait = 1;
}

