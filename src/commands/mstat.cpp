#include <cstring>
#include <ctime>
#include "mud.hpp"
#include "character.hpp"
#include "clan.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "room.hpp"

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
      ch->Echo("Mstat whom?\r\n");
      return;
    }

  if ( arg[0] != '\'' && arg[0] != '"' && strlen(argument) > strlen(arg) )
    strcpy( arg, argument );

  if ( ( victim = GetCharacterAnywhere( ch, arg ) ) == NULL )
    {
      ch->Echo("They aren't here.\r\n");
      return;
    }

  if ( ( ( GetTrustLevel( ch ) < LEVEL_GREATER ) && !IsNpc(victim) ) || ( ( GetTrustLevel( ch ) < GetTrustLevel( victim ) ) && !IsNpc(victim) ) )
    {
      SetCharacterColor( AT_IMMORT, ch );
      ch->Echo("Their godly glow prevents you from getting a good look.\r\n");
      return;
    }

  ch->Echo("Name: %s     Organization: %s\r\n",
             victim->Name,
             ( IsNpc( victim ) || !victim->PCData->ClanInfo.Clan ) ? "(none)"
             : victim->PCData->ClanInfo.Clan->Name );

  if( GetTrustLevel(ch) >= LEVEL_GREATER && !IsNpc(victim) && victim->Desc )
    ch->Echo("Host: %s   Descriptor: %d   Trust: %d   AuthedBy: %s\r\n",
	  victim->Desc->Remote.Hostname, victim->Desc->Socket,
	  victim->Trust, !IsNullOrEmpty( victim->PCData->AuthedBy )
	  ? victim->PCData->AuthedBy : "(unknown)" );

  if ( !IsNpc(victim) && victim->PCData->ReleaseDate != 0 )
    ch->Echo("Helled until %24.24s by %s.\r\n",
              ctime(&victim->PCData->ReleaseDate),
              victim->PCData->HelledBy);

  ch->Echo("Vnum: %d   Sex: %s   Room: %d   Count: %d  Killed: %d\r\n",
             IsNpc(victim) ? victim->Prototype->Vnum : 0,
             victim->Sex == SEX_MALE    ? "male"   :
             victim->Sex == SEX_FEMALE  ? "female" : "neutral",
             victim->InRoom == NULL    ?        0 : victim->InRoom->Vnum,
             IsNpc(victim) ? victim->Prototype->Count : 1,
             IsNpc(victim) ? victim->Prototype->Killed
             : victim->PCData->MDeaths + victim->PCData->PDeaths
             );

  ch->Echo("Str: %d  Int: %d  Wis: %d  Dex: %d  Con: %d  Cha: %d  Lck: %d  Frc: %d\r\n",
             GetCurrentStrength(victim),
             GetCurrentIntelligence(victim),
             GetCurrentWisdom(victim),
             GetCurrentDexterity(victim),
             GetCurrentConstitution(victim),
             GetCurrentCharisma(victim),
             GetCurrentLuck(victim),
             GetCurrentForce(victim) );

  ch->Echo("Hps: %d/%d  Force: %d/%d   Move: %d/%d\r\n",
	victim->Hit,         victim->MaxHit,
	victim->Mana,        victim->MaxMana,
	victim->Move,        victim->MaxMove );

  if ( !IsNpc( victim ) )
    {
      int ability;

      for ( ability = 0 ; ability < MAX_ABILITY ; ability++ )
        ch->Echo("%-15s   Level: %-3d   Max: %-3d   Exp: %-10ld   Next: %-10ld\r\n",
                   AbilityName[ability], GetAbilityLevel( victim, ability ), GetMaxAbilityLevel(victim, ability),
		   GetAbilityXP( victim, ability ),
		   GetRequiredXpForLevel( GetAbilityLevel( victim, ability ) + 1 ) );
    }

  ch->Echo("Top Level: %d     Race: %d  Align: %d  AC: %d  Gold: %d\r\n",
	victim->TopLevel,  victim->Race,   victim->Alignment,
	GetArmorClass(victim),      victim->Gold );

  if (  victim->Race  < MAX_NPC_RACE  && victim->Race  >= 0 )
    ch->Echo("Race: %s\r\n",
               NpcRace[victim->Race] );

  ch->Echo("Hitroll: %d   Damroll: %d   Position: %d   Wimpy: %d \r\n",
             GetHitRoll(victim), GetDamageRoll(victim),
             victim->Position,    victim->Wimpy );
  ch->Echo("Fighting: %s    Master: %s    Leader: %s\r\n",
             victim->Fighting ? victim->Fighting->Who->Name : "(none)",
             victim->Master      ? victim->Master->Name   : "(none)",
             victim->Leader      ? victim->Leader->Name   : "(none)" );

  if ( !IsNpc(victim) )
    ch->Echo("Thirst: %d   Full: %d   Drunk: %d\r\n",
             victim->PCData->Condition[COND_THIRST],
             victim->PCData->Condition[COND_FULL],
             victim->PCData->Condition[COND_DRUNK] );
  else
    ch->Echo("Hit dice: %dd%d+%d.  Damage dice: %dd%d+%d.\r\n",
               victim->Prototype->HitNoDice,
               victim->Prototype->HitSizeDice,
               victim->Prototype->HitPlus,
               victim->Prototype->DamNoDice,
               victim->Prototype->DamSizeDice,
               victim->Prototype->DamPlus );

  ch->Echo("MentalState: %d   EmotionalState: %d\r\n",
        victim->MentalState, victim->EmotionalState );
  ch->Echo("Saving throws: %d %d %d %d %d.\r\n",
        victim->Saving.PoisonDeath,
        victim->Saving.Wand,
        victim->Saving.ParaPetri,
        victim->Saving.Breath,
        victim->Saving.SpellStaff  );
  ch->Echo("Carry figures: items (%d/%d)  weight (%d/%d)   Numattacks: %d\r\n",
        victim->CarryNumber, GetCarryCapacityNumber(victim),
        victim->CarryWeight, GetCarryCapacityWeight(victim), victim->NumberOfAttacks );

  if ( IsNpc( victim ) )
    {
      ch->Echo("Mob flags: %s\r\n", FlagString(victim->Flags, MobFlags).c_str() );
      ch->Echo("VIP flags: %s\r\n", FlagString(victim->VipFlags, WantedFlags).c_str() );
    }
  else
    {
      ch->Echo("Years: %d   Seconds Played: %d   Idle Timer: %d\r\n",
	    GetAge( victim ), (int) victim->PCData->Played, victim->IdleTimer );

      ch->Echo("Player flags: %s\r\n",
            FlagString(victim->Flags, PlayerFlags).c_str() );
      ch->Echo("Pcflags: %s\r\n",
            FlagString(victim->PCData->Flags, PcFlags).c_str() );
      ch->Echo("Wanted flags: %s\r\n",
            FlagString(victim->PCData->WantedFlags, WantedFlags).c_str() );
    }

  ch->Echo("Affected by: %s\r\n",
        FlagString( victim->AffectedBy, AffectFlags ).c_str() );
  ch->Echo("Speaks: %d   Speaking: %d\r\n",
             victim->Speaks, victim->Speaking );
  ch->Echo("Languages: ");

  for ( x = 0; LanguageArray[x] != LANG_UNKNOWN; x++ )
    {
      if ( CharacterKnowsLanguage( victim, LanguageArray[x], victim )
	   || (IsNpc(victim) && victim->Speaks == 0) )
	{
	  if ( IsBitSet(LanguageArray[x], victim->Speaking)
	       || (IsNpc(victim) && !victim->Speaking) )
	    {
	      SetCharacterColor( AT_RED, ch );
	    }

        ch->Echo(LanguageNames[x]);
        ch->Echo(" ");
        SetCharacterColor( AT_PLAIN, ch );
      }
    else if ( IsBitSet(LanguageArray[x], victim->Speaking)
	      || (IsNpc(victim) && !victim->Speaking) )
      {
	SetCharacterColor( AT_PINK, ch );
 ch->Echo(LanguageNames[x]);
 ch->Echo(" ");
	SetCharacterColor( AT_PLAIN, ch );
      }
    }

  ch->Echo("\r\n");

  if ( victim->PCData && !IsNullOrEmpty( victim->PCData->Bestowments ) )
    {
      ch->Echo("Bestowments: %s\r\n", victim->PCData->Bestowments );
    }

  ch->Echo("Short description: %s\r\nLong  description: %s",
	victim->ShortDescr,
	!IsNullOrEmpty( victim->LongDescr ) ? victim->LongDescr : "(none)\r\n" );

  if ( IsNpc(victim) && ( victim->spec_fun || victim->spec_2 ) )
    {
      ch->Echo("Mobile has spec fun: %s %s\r\n",
	    LookupSpecial( victim->spec_fun ),
	    victim->spec_2 ? LookupSpecial( victim->spec_2 ) : "" );
    }

  ch->Echo("Body Parts : %s\r\n",
        FlagString(victim->BodyParts, PartFlags).c_str() );
  ch->Echo("Resistant  : %s\r\n",
        FlagString(victim->Resistant, RisFlags).c_str() );
  ch->Echo("Immune     : %s\r\n",
        FlagString(victim->Immune, RisFlags).c_str() );
  ch->Echo("Susceptible: %s\r\n",
        FlagString(victim->Susceptible, RisFlags).c_str() );
  ch->Echo("Attacks    : %s\r\n",
        FlagString(victim->AttackFlags, AttackFlags).c_str() );
  ch->Echo("Defenses   : %s\r\n",
        FlagString(victim->DefenseFlags, DefenseFlags).c_str() );

  for ( paf = victim->FirstAffect; paf; paf = paf->Next )
    {
      if ( (skill=GetSkill(paf->Type)) != NULL )
	{
          ch->Echo("%s: '%s' modifies %s by %d for %d rounds with bits %s.\r\n",
                   SkillTypeName[skill->Type],
                   skill->Name,
                   GetAffectLocationName( paf->Location ),
                   paf->Modifier,
                   paf->Duration,
                   FlagString( paf->AffectedBy, AffectFlags ).c_str()
                   );
	}
    }
}
