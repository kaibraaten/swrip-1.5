#include <cstring>
#include "mud.hpp"
#include "skill.hpp"
#include "character.hpp"

/*
 * Lookup a skills information
 * High god command
 */
void do_slookup( Character *ch, std::string arg )
{
  char buf[MAX_STRING_LENGTH];
  int sn = 0;
  const Skill *skill = NULL;

  if ( arg.empty() )
    {
      ch->Echo("Slookup what?\r\n");
      return;
    }

  if ( !StrCmp( arg, "all" ) )
    {
      for ( sn = 0; sn < TopSN && SkillTable[sn] && !SkillTable[sn]->Name.empty(); sn++ )
	{
          ch->Echo("Sn: %4d Slot: %4d Skill/spell: '%-20s' Damtype: %s\r\n",
                   sn, SkillTable[sn]->Slot, SkillTable[sn]->Name.c_str(),
                   GetSpellDamageName(SPELL_DAMAGE( SkillTable[sn] )) );
	}
    }
  else if ( !StrCmp( arg, "herbs" ) )
    {
      for ( sn = 0; sn < TopHerb && HerbTable[sn] && !HerbTable[sn]->Name.empty(); sn++ )
        ch->Echo("%d) %s\r\n", sn, HerbTable[sn]->Name.c_str() );
    }
  else
    {
      int cnt = 0;

      if ( arg[0] == 'h' && IsNumber( arg.substr( 1 ) ) )
	{
	  sn = ToLong(arg.substr( 1 ) );

	  if ( !IS_VALID_HERB(sn) )
	    {
              ch->Echo("Invalid herb.\r\n");
	      return;
	    }

	  skill = HerbTable[sn];
	}
      else if ( IsNumber(arg) )
	{
	  sn = ToLong(arg);

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
	    sn, skill->Slot, SkillTypeName[skill->Type], skill->Name.c_str() );

      if ( skill->Flags.any() )
	{
	  size_t x = 0;

          ch->Echo("Damtype: %s  Acttype: %s   Classtype: %s   Powertype: %s\r\n",
                   GetSpellDamageName( SPELL_DAMAGE( skill ) ),
                   GetSpellActionName( SPELL_ACTION( skill ) ),
                   GetSpellClassName( SPELL_CLASS( skill ) ),
                   GetSpellPowerName( SPELL_POWER( skill ) ) );

	  strcpy( buf, "Flags:" );

	  for ( x = 11; x < Flag::MAX; x++ )
	    if ( SPELL_FLAG( skill, 1 << x ) )
	      {
		strcat( buf, " " );
		strcat( buf, SpellFlag[x] );
	      }

	  strcat( buf, "\r\n" );
          ch->Echo("%s", buf);
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
               skill->SkillFunction || skill->SpellFunction ? skill->FunctionName.c_str() : "(none set)");

      ch->Echo("Dammsg: %s\r\nWearoff: %s\n",
               skill->Messages.NounDamage.c_str(),
               !skill->Messages.WearOff.empty() ? skill->Messages.WearOff.c_str() : "(none set)" );

      if ( !skill->Dice.empty() )
        ch->Echo("Dice: %s\r\n", skill->Dice.c_str() );

      if ( !skill->Teachers.empty() )
        ch->Echo("Teachers: %s\r\n", skill->Teachers.c_str() );

      if ( skill->Participants != 0 )
        ch->Echo("Participants: %d\r\n", (int) skill->Participants );

      if ( skill->UseRec->NumberOfTimesUsed )
	SendTimer(skill->UseRec, ch);

      for ( const SmaugAffect *aff : skill->Affects )
	{
	  if ( aff == skill->Affects.front() )
            ch->Echo("\r\n");

	  sprintf( buf, "Affect %d", ++cnt );

	  if ( aff->Location )
	    {
	      strcat( buf, " modifies " );
	      strcat( buf, AffectTypes[aff->Location % REVERSE_APPLY] );
	      strcat( buf, " by '" );
	      strcat( buf, aff->Modifier.c_str() );

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

          if ( !aff->Duration.empty() )
	    {
	      strcat( buf, " for '" );
	      strcat( buf, aff->Duration.c_str() );
	      strcat( buf, "' rounds" );
	    }

	  if ( aff->Location >= REVERSE_APPLY )
	    strcat( buf, " (affects caster only)" );

	  strcat( buf, "\r\n" );
          ch->Echo("%s", buf);

	  if ( aff == skill->Affects.back() )
            ch->Echo("\r\n");
	}

      if ( !skill->Messages.Success.ToCaster.empty() )
        ch->Echo("Hitchar   : %s\r\n",
                 skill->Messages.Success.ToCaster.c_str() );

      if ( !skill->Messages.Success.ToVictim.empty() )
        ch->Echo("Hitvict   : %s\r\n",
                 skill->Messages.Success.ToVictim.c_str() );

      if ( !skill->Messages.Success.ToRoom.empty() )
        ch->Echo("Hitroom   : %s\r\n",
                 skill->Messages.Success.ToRoom.c_str() );

      if ( !skill->Messages.Failure.ToCaster.empty() )
        ch->Echo("Misschar  : %s\r\n",
                 skill->Messages.Failure.ToCaster.c_str() );

      if ( !skill->Messages.Failure.ToVictim.empty() )
        ch->Echo("Missvict  : %s\r\n",
                 skill->Messages.Failure.ToVictim.c_str() );

      if ( !skill->Messages.Failure.ToRoom.empty() )
        ch->Echo("Missroom  : %s\r\n",
                 skill->Messages.Failure.ToRoom.c_str() );

      if ( !skill->Messages.VictimDeath.ToCaster.empty() )
        ch->Echo("Diechar   : %s\r\n",
                 skill->Messages.VictimDeath.ToCaster.c_str() );

      if ( !skill->Messages.VictimDeath.ToVictim.empty() )
        ch->Echo("Dievict   : %s\r\n",
                 skill->Messages.VictimDeath.ToVictim.c_str() );

      if ( !skill->Messages.VictimDeath.ToRoom.empty() )
        ch->Echo("Dieroom   : %s\r\n",
                 skill->Messages.VictimDeath.ToRoom.c_str() );

      if ( !skill->Messages.VictimImmune.ToCaster.empty() )
        ch->Echo("Immchar   : %s\r\n",
                 skill->Messages.VictimImmune.ToCaster.c_str() );

      if ( !skill->Messages.VictimImmune.ToVictim.empty() )
        ch->Echo("Immvict   : %s\r\n",
                 skill->Messages.VictimImmune.ToVictim.c_str() );

      if ( !skill->Messages.VictimImmune.ToRoom.empty() )
        ch->Echo("Immroom   : %s\r\n",
                 skill->Messages.VictimImmune.ToRoom.c_str() );

      if ( skill->Type != SKILL_HERB && skill->Guild >= 0 && skill->Guild < MAX_ABILITY)
	{
	  sprintf(buf, "Ability: %s (%d)   Align: %4d   lvl: %3d\r\n",
		  AbilityName[skill->Guild], skill->Guild, skill->Alignment, skill->Level );
          ch->Echo("%s", buf);
	}

      ch->Echo("\r\n");
    }
}
