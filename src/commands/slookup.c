#include <string.h>
#include "mud.h"
#include "skill.h"

/*
 * Lookup a skills information
 * High god command
 */
void do_slookup( Character *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  char arg[MAX_INPUT_LENGTH];
  int sn;
  const Skill *skill = NULL;

  OneArgument( argument, arg );

  if ( arg[0] == '\0' )
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

      Echo( ch, "Sn: %4d Slot: %4d %s: '%-20s'\r\n",
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
		strcat( buf, GetSpellFlagName( x-11 ) );
	      }

	  strcat( buf, "\r\n" );
	  SendToCharacter( buf, ch );
	}

      Echo( ch, "Saves: %s\r\n", GetSpellSavesName( skill->Saves ) );

      if ( skill->Difficulty != '\0' )
	Echo( ch, "Difficulty: %d\r\n", (int) skill->Difficulty );

      Echo( ch, "Type: %s  Target: %s  Minpos: %d  Mana: %d  Beats: %d\r\n",
	    SkillTypeName[skill->Type],
	    GetSpellTargetName(urange(TAR_IGNORE, skill->Target, TAR_OBJ_INV)),
	    skill->Position,
	    skill->MinimumMana,
	    skill->Beats );
      Echo( ch, "Flags: %d  Guild: %s (%d)  Code: %s\r\n",
	    skill->Flags,
	    ability_name[skill->Guild], skill->Guild,
	    skill->SkillFunction || skill->SpellFunction ? skill->FunctionName : "(none set)");

      Echo( ch, "Dammsg: %s\r\nWearoff: %s\n",
	    skill->Messages.NounDamage,
	    !IsNullOrEmpty( skill->Messages.WearOff ) ? skill->Messages.WearOff : "(none set)" );

      if ( skill->Dice && skill->Dice[0] != '\0' )
	Echo( ch, "Dice: %s\r\n", skill->Dice );

      if ( skill->Teachers && skill->Teachers[0] != '\0' )
	Echo( ch, "Teachers: %s\r\n", skill->Teachers );

      if ( skill->Components && skill->Components[0] != '\0' )
	Echo( ch, "Components: %s\r\n", skill->Components );

      if ( skill->Participants )
	Echo( ch, "Participants: %d\r\n", (int) skill->Participants );

      if ( skill->UseRec->num_uses )
	SendTimer(skill->UseRec, ch);

      for ( aff = skill->Affects; aff; aff = aff->next )
	{
	  if ( aff == skill->Affects )
	    SendToCharacter( "\r\n", ch );

	  sprintf( buf, "Affect %d", ++cnt );

	  if ( aff->location )
	    {
	      strcat( buf, " modifies " );
	      strcat( buf, affect_types[aff->location % REVERSE_APPLY] );
	      strcat( buf, " by '" );
	      strcat( buf, aff->modifier );

	      if ( aff->bitvector )
		strcat( buf, "' and" );
	      else
		strcat( buf, "'" );
	    }

	  if ( aff->bitvector )
	    {
	      int x;

	      strcat( buf, " applies" );

	      for ( x = 0; x < 32; x++ )
		if ( IsBitSet(aff->bitvector, 1 << x) )
		  {
		    strcat( buf, " " );
		    strcat( buf, affected_flags[x] );
		  }
	    }

	  if ( aff->duration[0] != '\0' && aff->duration[0] != '0' )
	    {
	      strcat( buf, " for '" );
	      strcat( buf, aff->duration );
	      strcat( buf, "' rounds" );
	    }

	  if ( aff->location >= REVERSE_APPLY )
	    strcat( buf, " (affects caster only)" );

	  strcat( buf, "\r\n" );
	  SendToCharacter( buf, ch );

	  if ( !aff->next )
	    SendToCharacter( "\r\n", ch );
	}

      if ( skill->Messages.Success.ToCaster && skill->Messages.Success.ToCaster[0] != '\0' )
	Echo( ch, "Hitchar   : %s\r\n", skill->Messages.Success.ToCaster );

      if ( skill->Messages.Success.ToVictim && skill->Messages.Success.ToVictim[0] != '\0' )
	Echo( ch, "Hitvict   : %s\r\n", skill->Messages.Success.ToVictim );

      if ( skill->Messages.Success.ToRoom && skill->Messages.Success.ToRoom[0] != '\0' )
	Echo( ch, "Hitroom   : %s\r\n", skill->Messages.Success.ToRoom );

      if ( skill->Messages.Failure.ToCaster && skill->Messages.Failure.ToCaster[0] != '\0' )
	Echo( ch, "Misschar  : %s\r\n", skill->Messages.Failure.ToCaster );

      if ( skill->Messages.Failure.ToVictim && skill->Messages.Failure.ToVictim[0] != '\0' )
	Echo( ch, "Missvict  : %s\r\n", skill->Messages.Failure.ToVictim );

      if ( skill->Messages.Failure.ToRoom && skill->Messages.Failure.ToRoom[0] != '\0' )
	Echo( ch, "Missroom  : %s\r\n", skill->Messages.Failure.ToRoom );

      if ( skill->Messages.VictimDeath.ToCaster && skill->Messages.VictimDeath.ToCaster[0] != '\0' )
	Echo( ch, "Diechar   : %s\r\n", skill->Messages.VictimDeath.ToCaster );

      if ( skill->Messages.VictimDeath.ToVictim && skill->Messages.VictimDeath.ToVictim[0] != '\0' )
	Echo( ch, "Dievict   : %s\r\n", skill->Messages.VictimDeath.ToVictim );

      if ( skill->Messages.VictimDeath.ToRoom && skill->Messages.VictimDeath.ToRoom[0] != '\0' )
	Echo( ch, "Dieroom   : %s\r\n", skill->Messages.VictimDeath.ToRoom );

      if ( skill->Messages.VictimImmune.ToCaster && skill->Messages.VictimImmune.ToCaster[0] != '\0' )
	Echo( ch, "Immchar   : %s\r\n", skill->Messages.VictimImmune.ToCaster );

      if ( skill->Messages.VictimImmune.ToVictim && skill->Messages.VictimImmune.ToVictim[0] != '\0' )
	Echo( ch, "Immvict   : %s\r\n", skill->Messages.VictimImmune.ToVictim );

      if ( skill->Messages.VictimImmune.ToRoom && skill->Messages.VictimImmune.ToRoom[0] != '\0' )
	Echo( ch, "Immroom   : %s\r\n", skill->Messages.VictimImmune.ToRoom );

      if ( skill->Type != SKILL_HERB && skill->Guild >= 0 && skill->Guild < MAX_ABILITY)
	{
	  sprintf(buf, "guild: %s   Align: %4d   lvl: %3d\r\n",
		  ability_name[skill->Guild], skill->Alignment,    skill->Level );
	  SendToCharacter( buf, ch );
	}

      SendToCharacter( "\r\n", ch );
    }
}
