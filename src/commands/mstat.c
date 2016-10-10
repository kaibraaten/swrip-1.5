#include <string.h>
#include <time.h>
#include "mud.h"
#include "character.h"
#include "clan.h"
#include "skill.h"

void do_mstat( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Affect *paf = NULL;
  Character *victim = NULL;
  Skill *skill = NULL;
  int x = 0;

  SetCharacterColor( AT_PLAIN, ch );

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      SendToCharacter( "Mstat whom?\r\n", ch );
      return;
    }

  if ( arg[0] != '\'' && arg[0] != '"' && strlen(argument) > strlen(arg) )
    strcpy( arg, argument );

  if ( ( victim = GetCharacterAnywhere( ch, arg ) ) == NULL )
    {
      SendToCharacter( "They aren't here.\r\n", ch );
      return;
    }

  if ( ( ( GetTrustLevel( ch ) < LEVEL_GREATER ) && !IsNpc(victim) ) || ( ( GetTrustLevel( ch ) < GetTrustLevel( victim ) ) && !IsNpc(victim) ) )
    {
      SetCharacterColor( AT_IMMORT, ch );
      SendToCharacter( "Their godly glow prevents you from getting a good look.\r\n", ch );
      return;
    }

  Echo( ch, "Name: %s     Organization: %s\r\n",
             victim->name,
             ( IsNpc( victim ) || !victim->pcdata->ClanInfo.Clan ) ? "(none)"
             : victim->pcdata->ClanInfo.Clan->Name );

  if( GetTrustLevel(ch) >= LEVEL_GREATER && !IsNpc(victim) && victim->desc )
    Echo( ch, "Host: %s   Descriptor: %d   Trust: %d   AuthedBy: %s\r\n",
	  victim->desc->remote.hostname, victim->desc->descriptor,
	  victim->trust, !IsNullOrEmpty( victim->pcdata->authed_by )
	  ? victim->pcdata->authed_by : "(unknown)" );

  if ( !IsNpc(victim) && victim->pcdata->release_date != 0 )
    Echo(ch, "Helled until %24.24s by %s.\r\n",
              ctime(&victim->pcdata->release_date),
              victim->pcdata->helled_by);

  Echo( ch, "Vnum: %d   Sex: %s   Room: %d   Count: %d  Killed: %d\r\n",
             IsNpc(victim) ? victim->Prototype->vnum : 0,
             victim->sex == SEX_MALE    ? "male"   :
             victim->sex == SEX_FEMALE  ? "female" : "neutral",
             victim->in_room == NULL    ?        0 : victim->in_room->vnum,
             IsNpc(victim) ? victim->Prototype->count : 1,
             IsNpc(victim) ? victim->Prototype->killed
             : victim->pcdata->mdeaths + victim->pcdata->pdeaths
             );

  Echo( ch, "Str: %d  Int: %d  Wis: %d  Dex: %d  Con: %d  Cha: %d  Lck: %d  Frc: %d\r\n",
             GetCurrentStrength(victim),
             GetCurrentIntelligence(victim),
             GetCurrentWisdom(victim),
             GetCurrentDexterity(victim),
             GetCurrentConstitution(victim),
             GetCurrentCharisma(victim),
             GetCurrentLuck(victim),
             GetCurrentForce(victim) );

  Echo( ch, "Hps: %d/%d  Force: %d/%d   Move: %d/%d\r\n",
             victim->hit,         victim->max_hit,
             victim->mana,        victim->max_mana,
             victim->move,        victim->max_move );

  if ( !IsNpc( victim ) )
    {
      int ability;

      for ( ability = 0 ; ability < MAX_ABILITY ; ability++ )
        Echo( ch, "%-15s   Level: %-3d   Max: %-3d   Exp: %-10ld   Next: %-10ld\r\n",
                   AbilityName[ability], GetAbilityLevel( victim, ability ), GetMaxAbilityLevel(victim, ability),
		   GetAbilityXP( victim, ability ),
		   GetRequiredXpForLevel( GetAbilityLevel( victim, ability ) + 1 ) );
    }

  Echo( ch,
             "Top Level: %d     Race: %d  Align: %d  AC: %d  Gold: %d\r\n",
             victim->top_level,  victim->race,   victim->alignment,
             GetArmorClass(victim),      victim->gold );

  if (  victim->race  < MAX_NPC_RACE  && victim->race  >= 0 )
    Echo( ch, "Race: %s\r\n",
               NpcRace[victim->race] );

  Echo( ch, "Hitroll: %d   Damroll: %d   Position: %d   Wimpy: %d \r\n",
             GetHitRoll(victim), GetDamageRoll(victim),
             victim->position,    victim->wimpy );
  Echo( ch, "Fighting: %s    Master: %s    Leader: %s\r\n",
             victim->fighting ? victim->fighting->who->name : "(none)",
             victim->master      ? victim->master->name   : "(none)",
             victim->leader      ? victim->leader->name   : "(none)" );

  if ( !IsNpc(victim) )
    Echo( ch,
               "Thirst: %d   Full: %d   Drunk: %d\r\n",
               victim->pcdata->condition[COND_THIRST],
               victim->pcdata->condition[COND_FULL],
               victim->pcdata->condition[COND_DRUNK] );
  else
    Echo( ch, "Hit dice: %dd%d+%d.  Damage dice: %dd%d+%d.\r\n",
               victim->Prototype->hitnodice,
               victim->Prototype->hitsizedice,
               victim->Prototype->hitplus,
               victim->Prototype->damnodice,
               victim->Prototype->damsizedice,
               victim->Prototype->damplus );

  Echo( ch, "MentalState: %d   EmotionalState: %d\r\n",
             victim->mental_state, victim->emotional_state );
  Echo( ch, "Saving throws: %d %d %d %d %d.\r\n",
             victim->saving.poison_death,
             victim->saving.wand,
             victim->saving.para_petri,
             victim->saving.breath,
             victim->saving.spell_staff  );
  Echo( ch, "Carry figures: items (%d/%d)  weight (%d/%d)   Numattacks: %d\r\n",
             victim->carry_number, GetCarryCapacityNumber(victim), victim->carry_weight, GetCarryCapacityWeight(victim), victim->numattacks );

  if ( IsNpc( victim ) )
    {
      Echo( ch, "Act flags: %s\r\n", FlagString(victim->act, act_flags) );
      Echo( ch, "VIP flags: %s\r\n", FlagString(victim->vip_flags, planet_flags) );
    }
  else
    {
      Echo( ch, "Years: %d   Seconds Played: %d   Timer: %d   Act: %d\r\n",
                 GetAge( victim ), (int) victim->pcdata->played, victim->timer, victim->act );

      Echo( ch, "Player flags: %s\r\n",
                 FlagString(victim->act, plr_flags) );
      Echo( ch, "Pcflags: %s\r\n",
                 FlagString(victim->pcdata->flags, pc_flags) );
      Echo( ch, "Wanted flags: %s\r\n",
                 FlagString(victim->pcdata->wanted_flags, planet_flags) );
    }

  Echo( ch, "Affected by: %s\r\n",
             FlagString( victim->affected_by, affected_flags ) );
  Echo( ch, "Speaks: %d   Speaking: %d\r\n",
             victim->speaks, victim->speaking );
  SendToCharacter( "Languages: ", ch );

  for ( x = 0; lang_array[x] != LANG_UNKNOWN; x++ )
    {
      if ( CharacterKnowsLanguage( victim, lang_array[x], victim )
	   || (IsNpc(victim) && victim->speaks == 0) )
	{
	  if ( IsBitSet(lang_array[x], victim->speaking)
	       || (IsNpc(victim) && !victim->speaking) )
	    {
	      SetCharacterColor( AT_RED, ch );
	    }

        SendToCharacter( lang_names[x], ch );
        SendToCharacter( " ", ch );
        SetCharacterColor( AT_PLAIN, ch );
      }
    else if ( IsBitSet(lang_array[x], victim->speaking)
	      || (IsNpc(victim) && !victim->speaking) )
      {
	SetCharacterColor( AT_PINK, ch );
	SendToCharacter( lang_names[x], ch );
	SendToCharacter( " ", ch );
	SetCharacterColor( AT_PLAIN, ch );
      }
    }

  SendToCharacter( "\r\n", ch );

  if ( victim->pcdata && !IsNullOrEmpty( victim->pcdata->bestowments ) )
    {
      Echo( ch, "Bestowments: %s\r\n", victim->pcdata->bestowments );
    }

  Echo( ch, "Short description: %s\r\nLong  description: %s",
	victim->short_descr,
	!IsNullOrEmpty( victim->long_descr ) ? victim->long_descr : "(none)\r\n" );

  if ( IsNpc(victim) && ( victim->spec_fun || victim->spec_2 ) )
    {
      Echo( ch, "Mobile has spec fun: %s %s\r\n",
	    LookupSpecial( victim->spec_fun ),
	    victim->spec_2 ? LookupSpecial( victim->spec_2 ) : "" );
    }

  Echo( ch, "Body Parts : %s\r\n",
             FlagString(victim->xflags, part_flags) );
  Echo( ch, "Resistant  : %s\r\n",
             FlagString(victim->resistant, ris_flags) );
  Echo( ch, "Immune     : %s\r\n",
             FlagString(victim->immune, ris_flags) );
  Echo( ch, "Susceptible: %s\r\n",
             FlagString(victim->susceptible, ris_flags) );
  Echo( ch, "Attacks    : %s\r\n",
             FlagString(victim->attacks, attack_flags) );
  Echo( ch, "Defenses   : %s\r\n",
             FlagString(victim->defenses, defense_flags) );

  for ( paf = victim->first_affect; paf; paf = paf->next )
    {
      if ( (skill=GetSkill(paf->Type)) != NULL )
	{
	  Echo( ch,
		     "%s: '%s' modifies %s by %d for %d rounds with bits %s.\r\n",
		     SkillTypeName[skill->Type],
		     skill->Name,
		     GetAffectLocationName( paf->Location ),
		     paf->Modifier,
		     paf->Duration,
		     FlagString( paf->AffectedBy, affected_flags )
		     );
	}
    }
}
