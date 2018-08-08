#include <string.h>
#include "mud.hpp"
#include "skill.hpp"
#include "character.hpp"

/*
 * Lookup a skills information
 * High god command
 */
void do_slookup( Character *ch, char *arg )
{
  char buf[MAX_STRING_LENGTH];
  int sn;
  const Skill *skill = NULL;

  if ( IsNullOrEmpty( arg ) )
    {
      ch->Echo("Slookup what?\r\n");
      return;
    }

  if ( !StrCmp( arg, "all" ) )
    {
      for ( sn = 0; sn < TopSN && SkillTable[sn] && SkillTable[sn]->Name; sn++ )
	{
   ch->Echo("Sn: %4d Slot: %4d Skill/spell: '%-20s' Damtype: %s\r\n",
		       sn, SkillTable[sn]->Slot, SkillTable[sn]->Name,
		       GetSpellDamageName(SPELL_DAMAGE( SkillTable[sn] )) );
	}
    }
  else if ( !StrCmp( arg, "herbs" ) )
    {
      for ( sn = 0; sn < TopHerb && HerbTable[sn] && HerbTable[sn]->Name; sn++ )
 ch->Echo("%d) %s\r\n", sn, HerbTable[sn]->Name );
    }
  else
    {
      const SmaugAffect *aff;
      int cnt = 0;

      if ( arg[0] == 'h' && IsNumber(arg+1) )
	{
	  sn = atoi(arg+1);

	  if ( !IS_VALID_HERB(sn) )
	    {
       ch->Echo("Invalid herb.\r\n");
	      return;
	    }

	  skill = HerbTable[sn];
	}
      else if ( IsNumber(arg) )
	{
	  sn = atoi(arg);

	  if ( (skill=GetSkill(sn)) == NULL )
	    {
       ch->Echo("Invalid sn.\r\n");
	      return;
	    }
	  sn %= 1000;
	}
      else if ( ( sn = LookupSkill( arg ) ) >= 0 )
	skill = SkillTable[sn];
      else if ( ( sn = LookupHerb( arg ) ) >= 0 )
	skill = HerbTable[sn];
      else
	{
   ch->Echo("No such skill, spell, proficiency or tongue.\r\n");
	  return;
	}

      if ( !skill )
	{
   ch->Echo("Not created yet.\r\n");
	  return;
	}

      ch->Echo("Sn: %4d Slot: %4d %s: %s\r\n",
	    sn, skill->Slot, SkillTypeName[skill->Type], skill->Name );

      if ( skill->Flags )
	{
	  size_t x = 0;

   ch->Echo("Damtype: %s  Acttype: %s   Classtype: %s   Powertype: %s\r\n",
		GetSpellDamageName( SPELL_DAMAGE( skill ) ),
		GetSpellActionName( SPELL_ACTION( skill ) ),
		GetSpellClassName( SPELL_CLASS( skill ) ),
		GetSpellPowerName( SPELL_POWER( skill ) ) );

	  strcpy( buf, "Flags:" );

	  for ( x = 11; x < 32; x++ )
	    if ( SPELL_FLAG( skill, 1 << x ) )
	      {
		strcat( buf, " " );
		strcat( buf, SpellFlag[x] );
	      }

	  strcat( buf, "\r\n" );
   ch->Echo(buf);
	}

      ch->Echo("Saves: %s\r\n", GetSpellSavesName( skill->Saves ) );

      if ( skill->Difficulty )
 ch->Echo("Difficulty: %d\r\n", (int) skill->Difficulty );

      ch->Echo("Type: %s  Target: %s  Minpos: %d  Mana: %d  Beats: %d\r\n",
	    SkillTypeName[skill->Type],
	    GetSpellTargetName(urange(TAR_IGNORE, skill->Target, TAR_OBJ_INV)),
	    skill->Position,
	    skill->Mana,
	    skill->Beats );
      ch->Echo("Code: %s\r\n",
	    skill->SkillFunction || skill->SpellFunction ? skill->FunctionName : "(none set)");

      ch->Echo("Dammsg: %s\r\nWearoff: %s\n",
	    skill->Messages.NounDamage,
	    !IsNullOrEmpty( skill->Messages.WearOff ) ? skill->Messages.WearOff : "(none set)" );

      if ( !IsNullOrEmpty( skill->Dice ) )
 ch->Echo("Dice: %s\r\n", skill->Dice );

      if ( !IsNullOrEmpty( skill->Teachers ) )
 ch->Echo("Teachers: %s\r\n", skill->Teachers );

      if ( skill->Participants )
 ch->Echo("Participants: %d\r\n", (int) skill->Participants );

      if ( skill->UseRec->NumberOfTimesUsed )
	SendTimer(skill->UseRec, ch);

      for ( aff = skill->Affects; aff; aff = aff->Next )
	{
	  if ( aff == skill->Affects )
     ch->Echo("\r\n");

	  sprintf( buf, "Affect %d", ++cnt );

	  if ( aff->Location )
	    {
	      strcat( buf, " modifies " );
	      strcat( buf, AffectTypes[aff->Location % REVERSE_APPLY] );
	      strcat( buf, " by '" );
	      strcat( buf, aff->Modifier );

	      if ( aff->AffectedBy )
		strcat( buf, "' and" );
	      else
		strcat( buf, "'" );
	    }

	  if ( aff->AffectedBy )
	    {
	      strcat( buf, " applies" );

	      for ( size_t x = 0; x < MAX_BIT; x++ )
                {
                  if ( IsBitSet(aff->AffectedBy, 1 << x) )
                    {
                      strcat( buf, " " );
                      strcat( buf, AffectFlags[x] );
                    }
                }
	    }

	  if ( !IsNullOrEmpty( aff->Duration ) )
	    {
	      strcat( buf, " for '" );
	      strcat( buf, aff->Duration );
	      strcat( buf, "' rounds" );
	    }

	  if ( aff->Location >= REVERSE_APPLY )
	    strcat( buf, " (affects caster only)" );

	  strcat( buf, "\r\n" );
   ch->Echo(buf);

	  if ( !aff->Next )
     ch->Echo("\r\n");
	}

      if ( !IsNullOrEmpty( skill->Messages.Success.ToCaster ) )
 ch->Echo("Hitchar   : %s\r\n", skill->Messages.Success.ToCaster );

      if ( !IsNullOrEmpty( skill->Messages.Success.ToVictim ) )
 ch->Echo("Hitvict   : %s\r\n", skill->Messages.Success.ToVictim );

      if ( !IsNullOrEmpty( skill->Messages.Success.ToRoom ) )
 ch->Echo("Hitroom   : %s\r\n", skill->Messages.Success.ToRoom );

      if ( !IsNullOrEmpty( skill->Messages.Failure.ToCaster ) )
 ch->Echo("Misschar  : %s\r\n", skill->Messages.Failure.ToCaster );

      if ( !IsNullOrEmpty( skill->Messages.Failure.ToVictim ) )
 ch->Echo("Missvict  : %s\r\n", skill->Messages.Failure.ToVictim );

      if ( !IsNullOrEmpty( skill->Messages.Failure.ToRoom ) )
 ch->Echo("Missroom  : %s\r\n", skill->Messages.Failure.ToRoom );

      if ( !IsNullOrEmpty( skill->Messages.VictimDeath.ToCaster ) )
 ch->Echo("Diechar   : %s\r\n", skill->Messages.VictimDeath.ToCaster );

      if ( !IsNullOrEmpty( skill->Messages.VictimDeath.ToVictim ) )
 ch->Echo("Dievict   : %s\r\n", skill->Messages.VictimDeath.ToVictim );

      if ( !IsNullOrEmpty( skill->Messages.VictimDeath.ToRoom ) )
 ch->Echo("Dieroom   : %s\r\n", skill->Messages.VictimDeath.ToRoom );

      if ( !IsNullOrEmpty( skill->Messages.VictimImmune.ToCaster ) )
 ch->Echo("Immchar   : %s\r\n", skill->Messages.VictimImmune.ToCaster );

      if ( !IsNullOrEmpty( skill->Messages.VictimImmune.ToVictim ) )
 ch->Echo("Immvict   : %s\r\n", skill->Messages.VictimImmune.ToVictim );

      if ( !IsNullOrEmpty( skill->Messages.VictimImmune.ToRoom ) )
 ch->Echo("Immroom   : %s\r\n", skill->Messages.VictimImmune.ToRoom );

      if ( skill->Type != SKILL_HERB && skill->Guild >= 0 && skill->Guild < MAX_ABILITY)
	{
	  sprintf(buf, "Ability: %s (%d)   Align: %4d   lvl: %3d\r\n",
		  AbilityName[skill->Guild], skill->Guild, skill->Alignment, skill->Level );
   ch->Echo(buf);
	}

      ch->Echo("\r\n");
    }
}

