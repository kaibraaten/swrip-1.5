#include <string.h>
#include "mud.h"
#include "character.h"
#include "clan.h"
#include "skill.h"

void do_elite_guard( Character *ch , char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  int the_chance, credits;

  if ( IsNpc( ch ) )
    return;

  strcpy( arg, argument );

  switch( ch->substate )
    {
    default:
      if ( ch->backup_wait )
        {
          SendToCharacter( "&RYou already have backup coming.\r\n", ch );
          return;
        }

      if ( !IsClanned( ch ) )
        {
          SendToCharacter( "&RYou need to be a member of an organization before you can call for a guard.\r\n", ch );
          return;
        }

      if ( ch->gold < GetAbilityLevel(ch, LEADERSHIP_ABILITY) * 200 )
        {
          Echo( ch, "&RYou dont have enough credits.\r\n", ch );
          return;
        }

      the_chance = (int) (ch->pcdata->learned[gsn_eliteguard]);
      if ( GetRandomPercent() < the_chance )
        {
          SendToCharacter( "&GYou begin making the call for reinforcements.\r\n", ch);
          Act( AT_PLAIN, "$n begins issuing orders int $s comlink.", ch,
               NULL, argument , TO_ROOM );
          AddTimerToCharacter( ch , TIMER_CMD_FUN , 1 , do_elite_guard , SUB_PAUSE );
          ch->dest_buf = CopyString(arg);
          return;
        }
      SendToCharacter("&RYou call for a guard but nobody answers.\r\n",ch);
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
      ch->substate = SUB_NONE;
      SendToCharacter("&RYou are interupted before you can finish your call.\r\n", ch);
      return;
    }

  ch->substate = SUB_NONE;

  SendToCharacter( "&GYour guard is on the way.\r\n", ch);

  credits = GetAbilityLevel(ch, LEADERSHIP_ABILITY) * 200;
  Echo( ch, "It cost you %d credits.\r\n", credits);
  ch->gold -= umin( credits , ch->gold );

  LearnFromSuccess( ch, gsn_eliteguard );

  if ( NiftyIsName( "empire" , ch->pcdata->ClanInfo.Clan->name ) )
    ch->backup_mob = MOB_VNUM_IMP_ELITE;
  else if ( NiftyIsName( "rebel" , ch->pcdata->ClanInfo.Clan->name )
	    || NiftyIsName( "republic" , ch->pcdata->ClanInfo.Clan->name ) )
    ch->backup_mob = MOB_VNUM_NR_ELITE;
  else
    ch->backup_mob = MOB_VNUM_MERC_ELITE;

  ch->backup_wait = 1;
}
