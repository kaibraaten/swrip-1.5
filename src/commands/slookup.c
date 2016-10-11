#include <string.h>
#include "mud.h"
#include "skill.h"

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
      SendToCharacter( "Slookup what?\r\n", ch );
      return;
    }

  if ( !StrCmp( arg, "all" ) )
    {
      for ( sn = 0; sn < TopSN && SkillTable[sn] && SkillTable[sn]->Name; sn++ )
	{
	  PagerPrintf( ch, "Sn: %4d Slot: %4d Skill/spell: '%-20s' Damtype: %s\r\n",
		       sn, SkillTable[sn]->Slot, SkillTable[sn]->Name,
		       GetSpellDamageName(SPELL_DAMAGE( SkillTable[sn] )) );
	}
    }
  else if ( !StrCmp( arg, "herbs" ) )
    {
      for ( sn = 0; sn < TopHerb && HerbTable[sn] && HerbTable[sn]->Name; sn++ )
	PagerPrintf( ch, "%d) %s\r\n", sn, HerbTable[sn]->Name );
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
	      SendToCharacter( "Invalid herb.\r\n", ch );
	      return;
	    }

	  skill = HerbTable[sn];
	}
      else if ( IsNumber(arg) )
	{
	  sn = atoi(arg);

	  if ( (skill=GetSkill(sn)) == NULL )
	    {
	      SendToCharacter( "Invalid sn.\r\n", ch );
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
	  SendToCharacter( "No such skill, spell, proficiency or tongue.\r\n", ch );
	  return;
	}

      if ( !skill )
	{
	  SendToCharacter( "Not created yet.\r\n", ch );
	  return;
	}

      Echo( ch, "Sn: %4d Slot: %4d %s: %s\r\n",
	    sn, skill->Slot, SkillTypeName[skill->Type], skill->Name );

      if ( skill->Flags )
	{
	  size_t x = 0;

	  Echo( ch, "Damtype: %s  Acttype: %s   Classtype: %s   Powertype: %s\r\n",
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
	  SendToCharacter( buf, ch );
	}

      Echo( ch, "Saves: %s\r\n", GetSpellSavesName( skill->Saves ) );

      if ( skill->Difficulty )
	Echo( ch, "Difficulty: %d\r\n", (int) skill->Difficulty );

      Echo( ch, "Type: %s  Target: %s  Minpos: %d  Mana: %d  Beats: %d\r\n",
	    SkillTypeName[skill->Type],
	    GetSpellTargetName(urange(TAR_IGNORE, skill->Target, TAR_OBJ_INV)),
	    skill->Position,
	    skill->Mana,
	    skill->Beats );
      Echo( ch, "Code: %s\r\n",
	    skill->SkillFunction || skill->SpellFunction ? skill->FunctionName : "(none set)");

      Echo( ch, "Dammsg: %s\r\nWearoff: %s\n",
	    skill->Messages.NounDamage,
	    !IsNullOrEmpty( skill->Messages.WearOff ) ? skill->Messages.WearOff : "(none set)" );

      if ( !IsNullOrEmpty( skill->Dice ) )
	Echo( ch, "Dice: %s\r\n", skill->Dice );

      if ( !IsNullOrEmpty( skill->Teachers ) )
	Echo( ch, "Teachers: %s\r\n", skill->Teachers );

      if ( skill->Participants )
	Echo( ch, "Participants: %d\r\n", (int) skill->Participants );

      if ( skill->UseRec->num_uses )
	SendTimer(skill->UseRec, ch);

      for ( aff = skill->Affects; aff; aff = aff->next )
	{
	  if ( aff == skill->Affects )
	    SendToCharacter( "\r\n", ch );

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
	      int x;

	      strcat( buf, " applies" );

	      for ( x = 0; x < MAX_BIT; x++ )
		if ( IsBitSet(aff->AffectedBy, 1 << x) )
		  {
		    strcat( buf, " " );
		    strcat( buf, AffectFlags[x] );
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
	  SendToCharacter( buf, ch );

	  if ( !aff->next )
	    SendToCharacter( "\r\n", ch );
	}

      if ( !IsNullOrEmpty( skill->Messages.Success.ToCaster ) )
	Echo( ch, "Hitchar   : %s\r\n", skill->Messages.Success.ToCaster );

      if ( !IsNullOrEmpty( skill->Messages.Success.ToVictim ) )
	Echo( ch, "Hitvict   : %s\r\n", skill->Messages.Success.ToVictim );

      if ( !IsNullOrEmpty( skill->Messages.Success.ToRoom ) )
	Echo( ch, "Hitroom   : %s\r\n", skill->Messages.Success.ToRoom );

      if ( !IsNullOrEmpty( skill->Messages.Failure.ToCaster ) )
	Echo( ch, "Misschar  : %s\r\n", skill->Messages.Failure.ToCaster );

      if ( !IsNullOrEmpty( skill->Messages.Failure.ToVictim ) )
	Echo( ch, "Missvict  : %s\r\n", skill->Messages.Failure.ToVictim );

      if ( !IsNullOrEmpty( skill->Messages.Failure.ToRoom ) )
	Echo( ch, "Missroom  : %s\r\n", skill->Messages.Failure.ToRoom );

      if ( !IsNullOrEmpty( skill->Messages.VictimDeath.ToCaster ) )
	Echo( ch, "Diechar   : %s\r\n", skill->Messages.VictimDeath.ToCaster );

      if ( !IsNullOrEmpty( skill->Messages.VictimDeath.ToVictim ) )
	Echo( ch, "Dievict   : %s\r\n", skill->Messages.VictimDeath.ToVictim );

      if ( !IsNullOrEmpty( skill->Messages.VictimDeath.ToRoom ) )
	Echo( ch, "Dieroom   : %s\r\n", skill->Messages.VictimDeath.ToRoom );

      if ( !IsNullOrEmpty( skill->Messages.VictimImmune.ToCaster ) )
	Echo( ch, "Immchar   : %s\r\n", skill->Messages.VictimImmune.ToCaster );

      if ( !IsNullOrEmpty( skill->Messages.VictimImmune.ToVictim ) )
	Echo( ch, "Immvict   : %s\r\n", skill->Messages.VictimImmune.ToVictim );

      if ( !IsNullOrEmpty( skill->Messages.VictimImmune.ToRoom ) )
	Echo( ch, "Immroom   : %s\r\n", skill->Messages.VictimImmune.ToRoom );

      if ( skill->Type != SKILL_HERB && skill->Guild >= 0 && skill->Guild < MAX_ABILITY)
	{
	  sprintf(buf, "Ability: %s (%d)   Align: %4d   lvl: %3d\r\n",
		  AbilityName[skill->Guild], skill->Guild, skill->Alignment, skill->Level );
	  SendToCharacter( buf, ch );
	}

      SendToCharacter( "\r\n", ch );
    }
}
