#include <string.h>
#include "mud.h"
#include "character.h"
#include "clan.h"
#include "skill.h"

void do_special_forces ( Character *ch , char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  int the_chance, credits;
  Clan *clan = NULL;
  
  if ( IsNpc( ch ) )
    return;

  strcpy( arg, argument );

  switch( ch->SubState )
    {
    default:
      if ( ch->BackupWait )
        {
          SendToCharacter( "&RYour reinforcements are already on the way.\r\n", ch );
          return;
        }

      if ( !IsClanned( ch ) )
        {
          SendToCharacter( "&RYou need to be a member of an organization before you can call for reinforcements.\r\n", ch );
          return;
        }

      if ( ch->Gold < GetAbilityLevel( ch, LEADERSHIP_ABILITY ) * 350 )
        {
          Echo( ch, "&RYou dont have enough credits to send for reinforcements.\r\n" );
          return;
        }

      the_chance = (int) (ch->PCData->Learned[gsn_specialforces]);

      if ( GetRandomPercent() < the_chance )
        {
          SendToCharacter( "&GYou begin making the call for reinforcements.\r\n", ch);
          Act( AT_PLAIN, "$n begins issuing orders int $s comlink.", ch,
               NULL, argument , TO_ROOM );
          AddTimerToCharacter( ch , TIMER_CMD_FUN , 1 , do_special_forces , SUB_PAUSE );
          ch->dest_buf = CopyString(arg);
          return;
        }
      SendToCharacter("&RYou call for reinforcements but nobody answers.\r\n",ch);
      LearnFromFailure( ch, gsn_specialforces );
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
      SendToCharacter("&RYou are interupted before you can finish your call.\r\n", ch);
      return;
    }

  ch->SubState = SUB_NONE;

  SendToCharacter( "&GYour reinforcements are on the way.\r\n", ch);
  credits = GetAbilityLevel( ch, LEADERSHIP_ABILITY ) * 350;
  Echo( ch, "It cost you %d credits.\r\n", credits);
  ch->Gold -= umin( credits , ch->Gold );

  LearnFromSuccess( ch, gsn_specialforces );

  clan = ch->PCData->ClanInfo.Clan->MainClan ? ch->PCData->ClanInfo.Clan->MainClan : ch->PCData->ClanInfo.Clan;
  
  if ( !StrCmp( clan->Name, BADGUY_CLAN) )
    ch->BackupMob = MOB_VNUM_IMP_FORCES;
  else if ( !StrCmp( clan->Name, GOODGUY_CLAN ) )
    ch->BackupMob = MOB_VNUM_NR_FORCES;
  else
    ch->BackupMob = MOB_VNUM_MERC_FORCES;

  ch->BackupWait = GetRandomNumberFromRange(1,2);
}
