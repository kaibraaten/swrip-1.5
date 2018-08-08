#include "mud.hpp"
#include "character.hpp"
#include "skill.hpp"
#include "pcdata.hpp"

/*
 * Set a skill's attributes or what skills a player has.
 * High god command, with support for creating skills/spells/herbs/etc
 */
void do_sset( Character *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH / 2];
  Character *victim = nullptr;
  int value = 0;
  int sn = 0;
  bool fAll = false;

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  if ( IsNullOrEmpty( arg1 ) || IsNullOrEmpty( arg2 ) || IsNullOrEmpty( argument ) )
    {
      ch->Echo("Syntax: sset <victim> <skill> <value>\r\n");
      ch->Echo("or:     sset <victim> all     <value>\r\n");
      if ( GetTrustLevel(ch) > LEVEL_SUB_IMPLEM )
        {
          ch->Echo("or:     sset save skill table\r\n");
          ch->Echo("or:     sset save herb table\r\n");
          ch->Echo("or:     sset create skill 'new skill'\r\n");
          ch->Echo("or:     sset create herb 'new herb'\r\n");
        }
      if ( GetTrustLevel(ch) > LEVEL_GREATER )
	{
          ch->Echo("or:     sset <sn>     <field> <value>\r\n");
          ch->Echo("\r\nField being one of:\r\n");
          ch->Echo("  name code target minpos slot mana beats dammsg wearoff guild minlevel\r\n");
          ch->Echo("  type damtype acttype classtype powertype flag dice value difficulty affect\r\n");
          ch->Echo("  rmaffect level adept hit miss die imm (char/vict/room)\r\n");
          ch->Echo("  teachers\r\n");
          ch->Echo("Affect having the fields: <location> <modfifier> [duration] [bitvector]\r\n");
          ch->Echo("(See AFFECTTYPES for location, and AFFECTED_BY for bitvector)\r\n");
        }
      ch->Echo("Skill being any skill or spell.\r\n");
      return;
    }

  if ( GetTrustLevel(ch) > LEVEL_SUB_IMPLEM
       &&  !StrCmp( arg1, "save" )
       &&       !StrCmp( argument, "table" ) )
    {
      if ( !StrCmp( arg2, "skill" ) )
        {
          ch->Echo("Saving skill table...\r\n");
          SaveSkills();
          return;
        }
      if ( !StrCmp( arg2, "herb" ) )
        {
          ch->Echo("Saving herb table...\r\n");
          SaveHerbs();
          return;
        }
    }
  if ( GetTrustLevel(ch) > LEVEL_SUB_IMPLEM
       &&  !StrCmp( arg1, "create" )
       && (!StrCmp( arg2, "skill" ) || !StrCmp( arg2, "herb" )) )
    {
      Skill *skill = NULL;
      SkillType type = SKILL_UNKNOWN;

      if ( !StrCmp( arg2, "herb" ) )
        {
          type = SKILL_HERB;
          if ( TopHerb >= MAX_HERB )
            {
              ch->Echo("The current top herb is %d, which is the maximum.  "
                         "To add more herbs,\r\nMAX_HERB will have to be "
			 "raised in mud.hpp, and the mud recompiled.\r\n",
                         TopSN );
              return;
            }
        }
      else
        if ( TopSN >= MAX_SKILL )
          {
            ch->Echo("The current top sn is %d, which is the maximum.  "
                       "To add more skills,\r\nMAX_SKILL will have to be "
                       "raised in mud.hpp, and the mud recompiled.\r\n",
                       TopSN );
            return;
          }

      AllocateMemory( skill, Skill, 1 );
      AllocateMemory( skill->UseRec, struct timerset, 1 );

      if ( type == SKILL_HERB )
        {
          int max, x;

          HerbTable[TopHerb++] = skill;
          for ( max = x = 0; x < TopHerb-1; x++ )
            if ( HerbTable[x] && HerbTable[x]->Slot > max )
              max = HerbTable[x]->Slot;
          skill->Slot = max+1;
        }
      else
        SkillTable[TopSN++] = skill;

      skill->Name = CopyString( argument );
      skill->FunctionName = CopyString( "" );
      skill->Messages.NounDamage = CopyString( "" );
      skill->Messages.WearOff = CopyString( "" );
      skill->SpellFunction = spell_smaug;
      skill->Type = type;
      ch->Echo("Done.\r\n");
      return;
    }

  if ( arg1[0] == 'h' )
    sn = atoi( arg1+1 );
  else
    sn = atoi( arg1 );
  if ( GetTrustLevel(ch) > LEVEL_GREATER
       && ((arg1[0] == 'h' && IsNumber(arg1+1) && (sn=atoi(arg1+1))>=0)
           ||  (IsNumber(arg1) && (sn=atoi(arg1)) >= 0)) )
    {
      Skill *skill;

      if ( arg1[0] == 'h' )
        {
          if ( sn >= TopHerb )
            {
              ch->Echo("Herb number out of range.\r\n");
              return;
            }
          skill = HerbTable[sn];
        }
      else
        {
          if ( (skill=GetSkill(sn)) == NULL )
            {
              ch->Echo("Skill number out of range.\r\n");
              return;
            }
          sn %= 1000;
        }

      if ( !StrCmp( arg2, "difficulty" ) )
        {
          skill->Difficulty = atoi( argument );
          ch->Echo("Ok.\r\n");
          return;
        }
      if ( !StrCmp( arg2, "participants" ) )
        {
          skill->Participants = atoi( argument );
          ch->Echo("Ok.\r\n");
          return;
        }
      if ( !StrCmp( arg2, "alignment" ) )
        {
          skill->Alignment = atoi( argument );
          ch->Echo("Ok.\r\n");
          return;
        }
      if ( !StrCmp( arg2, "damtype" ) )
        {
          int x = GetSpellDamage( argument );

	  if ( x == -1 )
            ch->Echo("Not a spell damage type.\r\n");
          else
            {
              SET_SDAM( skill, x );
              ch->Echo("Ok.\r\n");
            }
          return;
        }
      if ( !StrCmp( arg2, "acttype" ) )
        {
          int x = GetSpellAction( argument );

          if ( x == -1 )
            ch->Echo("Not a spell action type.\r\n");
          else
            {
              SET_SACT( skill, x );
              ch->Echo("Ok.\r\n");
            }
          return;
        }
      if ( !StrCmp( arg2, "classtype" ) )
        {
          int x = GetSpellClass( argument );

          if ( x == -1 )
            ch->Echo("Not a spell class type.\r\n");
          else
            {
              SET_SCLA( skill, x );
              ch->Echo("Ok.\r\n");
            }
          return;
        }
      if ( !StrCmp( arg2, "powertype" ) )
        {
          int x = GetSpellPower( argument );

          if ( x == -1 )
            ch->Echo("Not a spell power type.\r\n");
          else
            {
              SET_SPOW( skill, x );
       ch->Echo("Ok.\r\n");
            }
          return;
        }
      if ( !StrCmp( arg2, "flag" ) )
        {
          int x = GetSpellFlag( argument );

          if ( x == -1 )
            ch->Echo("Not a spell flag.\r\n");
          else
            {
              ToggleBit( skill->Flags, 1 << x );
              ch->Echo("Ok.\r\n");
            }
          return;
        }
      if ( !StrCmp( arg2, "saves" ) )
        {
          int x = GetSpellSave( argument );

          if ( x == -1 )
            ch->Echo("Not a saving type.\r\n");
          else
            {
              skill->Saves = x;
              ch->Echo("Ok.\r\n");
            }
          return;
        }

      if ( !StrCmp( arg2, "code" ) )
        {
          SpellFun *spellfun;
          CmdFun    *dofun;

          if ( !StringPrefix( "spell_", argument )
               && (spellfun=GetSpellFunction(argument)) != spell_notfound )
            {
              skill->SpellFunction = spellfun;
              skill->SkillFunction = NULL;
              FreeMemory( skill->FunctionName );
              skill->FunctionName = CopyString( argument );
            }
          else if ( !StringPrefix( "do_", argument )
		    && (dofun=GetSkillFunction(argument)) != skill_notfound )
            {
              skill->SkillFunction = dofun;
              skill->SpellFunction = NULL;
              FreeMemory( skill->FunctionName );
              skill->FunctionName = CopyString( argument );
            }
          else
            {
              ch->Echo("Not a spell or skill.\r\n");
              return;
            }

          ch->Echo("Ok.\r\n");
          return;
        }

      if ( !StrCmp( arg2, "target" ) )
        {
          SkillTargetType x = GetSpellTarget( argument );

          if ( (int)x == -1 )
            ch->Echo("Not a valid target type.\r\n");
          else
            {
              skill->Target = x;
              ch->Echo("Ok.\r\n");
            }
          return;
        }
      if ( !StrCmp( arg2, "minpos" ) )
        {
          skill->Position = (PositionType)urange( POS_DEAD, atoi( argument ), POS_DRAG );
          ch->Echo("Ok.\r\n");
          return;
        }
      if ( !StrCmp( arg2, "minlevel" ) )
        {
          skill->Level = urange( 1, atoi( argument ), MAX_ABILITY_LEVEL );
          ch->Echo("Ok.\r\n");
          return;
        }
      if ( !StrCmp( arg2, "slot" ) )
        {
          skill->Slot = urange( 0, atoi( argument ), SHRT_MAX );
   ch->Echo("Ok.\r\n");
          return;
        }
      if ( !StrCmp( arg2, "mana" ) )
        {
          skill->Mana = urange( 0, atoi( argument ), 2000 );
          ch->Echo("Ok.\r\n");
          return;
        }
      if ( !StrCmp( arg2, "beats" ) )
        {
          skill->Beats = urange( 0, atoi( argument ), 120 );
          ch->Echo("Ok.\r\n");
          return;
        }
      if ( !StrCmp( arg2, "guild" ) )
        {
          skill->Guild = atoi( argument );
          ch->Echo("Ok.\r\n");
          return;
        }
      if ( !StrCmp( arg2, "value" ) )
        {
          skill->Value = atoi( argument );
          ch->Echo("Ok.\r\n");
          return;
        }
      if ( !StrCmp( arg2, "type" ) )
        {
          skill->Type = GetSkillType( argument );
          ch->Echo("Ok.\r\n");
          return;
        }
      if ( !StrCmp( arg2, "rmaffect" ) )
        {
          SmaugAffect *aff = skill->Affects;
          SmaugAffect *aff_next;
          int num = atoi( argument );
          int cnt = 1;

          if ( !aff )
            {
              ch->Echo("This spell has no special affects to remove.\r\n");
              return;
            }
	  if ( num == 1 )
            {
              skill->Affects = aff->Next;
              FreeMemory( aff->Duration );
              FreeMemory( aff->Modifier );
              FreeMemory( aff );
              ch->Echo("Removed.\r\n");
              return;
            }
          for ( ; aff; aff = aff->Next )
            {
              if ( ++cnt == num && (aff_next=aff->Next) != NULL )
                {
                  aff->Next = aff_next->Next;
                  FreeMemory( aff_next->Duration );
                  FreeMemory( aff_next->Modifier );
                  FreeMemory( aff_next );
                  ch->Echo("Removed.\r\n");
                  return;
                }
            }
          ch->Echo("Not found.\r\n");
          return;
        }
      /*
       * affect <location> <modifier> <duration> <bitvector>
       */
      if ( !StrCmp( arg2, "affect" ) )
        {
          char location[MAX_INPUT_LENGTH];
          char modifier[MAX_INPUT_LENGTH];
          char duration[MAX_INPUT_LENGTH];
          char bitvector[MAX_INPUT_LENGTH];
          int loc, bit, tmpbit;
          SmaugAffect *aff;

          argument = OneArgument( argument, location );
          argument = OneArgument( argument, modifier );
          argument = OneArgument( argument, duration );

          if ( location[0] == '!' )
            loc = GetAffectType( location+1 ) + REVERSE_APPLY;
          else
            loc = GetAffectType( location );

          if ( (loc % REVERSE_APPLY) < 0
	       ||   (loc % REVERSE_APPLY) >= MAX_APPLY_TYPE )
            {
              ch->Echo("Unknown affect location.  See AFFECTTYPES.\r\n");
              return;
            }

          bit = 0;

          while ( argument[0] != 0 )
            {
              argument = OneArgument( argument, bitvector );

              if ( (tmpbit=GetAffectFlag( bitvector )) == -1 )
                ch->Echo("Unknown bitvector: %s.  See AFFECTED_BY\r\n", bitvector );
              else
                bit |= (1 << tmpbit);
            }

          AllocateMemory( aff, SmaugAffect, 1 );

          if ( !StrCmp( duration, "0" ) )
            duration[0] = '\0';

          if ( !StrCmp( modifier, "0" ) )
            modifier[0] = '\0';

          aff->Duration = CopyString( duration );
          aff->Location = loc;
          aff->Modifier = CopyString( modifier );
          aff->AffectedBy = bit;
          aff->Next = skill->Affects;
          skill->Affects = aff;
          ch->Echo("Ok.\r\n");
          return;
        }

      if ( !StrCmp( arg2, "level" ) )
        {
          skill->Level = urange( 1, atoi( argument ), MAX_ABILITY_LEVEL );
          ch->Echo("Ok.\r\n");
          return;
        }

      if ( !StrCmp( arg2, "name" ) )
        {
          FreeMemory(skill->Name);
          skill->Name = CopyString( argument );
          ch->Echo("Ok.\r\n");
          return;
        }

      if ( !StrCmp( arg2, "dammsg" ) )
        {
          FreeMemory(skill->Messages.NounDamage);
          if ( !StrCmp( argument, "clear" ) )
            skill->Messages.NounDamage = CopyString( "" );
          else
            skill->Messages.NounDamage = CopyString( argument );
          ch->Echo("Ok.\r\n");
          return;
        }

      if ( !StrCmp( arg2, "wearoff" ) )
        {
          FreeMemory(skill->Messages.WearOff);
          if ( StrCmp( argument, "clear" ) )
            skill->Messages.WearOff = CopyString( argument );
          ch->Echo("Ok.\r\n");
          return;
        }

      if ( !StrCmp( arg2, "hitchar" ) )
        {
          if ( skill->Messages.Success.ToCaster )
            FreeMemory(skill->Messages.Success.ToCaster);
          if ( StrCmp( argument, "clear" ) )
            skill->Messages.Success.ToCaster = CopyString( argument );
          ch->Echo("Ok.\r\n");
          return;
        }

      if ( !StrCmp( arg2, "hitvict" ) )
        {
          if ( skill->Messages.Success.ToVictim )
            FreeMemory(skill->Messages.Success.ToVictim);
          if ( StrCmp( argument, "clear" ) )
            skill->Messages.Success.ToVictim = CopyString( argument );
          ch->Echo("Ok.\r\n");
          return;
        }

      if ( !StrCmp( arg2, "hitroom" ) )
        {
          if ( skill->Messages.Success.ToRoom )
            FreeMemory(skill->Messages.Success.ToRoom);
          if ( StrCmp( argument, "clear" ) )
            skill->Messages.Success.ToRoom = CopyString( argument );
          ch->Echo("Ok.\r\n");
          return;
        }

      if ( !StrCmp( arg2, "misschar" ) )
        {
          if ( skill->Messages.Failure.ToCaster )
            FreeMemory(skill->Messages.Failure.ToCaster);
          if ( StrCmp( argument, "clear" ) )
            skill->Messages.Failure.ToCaster = CopyString( argument );
          ch->Echo("Ok.\r\n");
          return;
        }

      if ( !StrCmp( arg2, "missvict" ) )
        {
          if ( skill->Messages.Failure.ToVictim )
            FreeMemory(skill->Messages.Failure.ToVictim);
          if ( StrCmp( argument, "clear" ) )
            skill->Messages.Failure.ToVictim = CopyString( argument );
          ch->Echo("Ok.\r\n");
          return;
        }

      if ( !StrCmp( arg2, "missroom" ) )
        {
          if ( skill->Messages.Failure.ToRoom )
            FreeMemory(skill->Messages.Failure.ToRoom);
          if ( StrCmp( argument, "clear" ) )
            skill->Messages.Failure.ToRoom = CopyString( argument );
          ch->Echo("Ok.\r\n");
          return;
        }

      if ( !StrCmp( arg2, "diechar" ) )
        {
          if ( skill->Messages.VictimDeath.ToCaster )
            FreeMemory(skill->Messages.VictimDeath.ToCaster);
          if ( StrCmp( argument, "clear" ) )
            skill->Messages.VictimDeath.ToCaster = CopyString( argument );
          ch->Echo("Ok.\r\n");
          return;
        }

      if ( !StrCmp( arg2, "dievict" ) )
        {
          if ( skill->Messages.VictimDeath.ToVictim )
            FreeMemory(skill->Messages.VictimDeath.ToVictim);
          if ( StrCmp( argument, "clear" ) )
            skill->Messages.VictimDeath.ToVictim = CopyString( argument );
          ch->Echo("Ok.\r\n");
          return;
        }

      if ( !StrCmp( arg2, "dieroom" ) )
        {
          if ( skill->Messages.VictimDeath.ToRoom )
            FreeMemory(skill->Messages.VictimDeath.ToRoom);
          if ( StrCmp( argument, "clear" ) )
            skill->Messages.VictimDeath.ToRoom = CopyString( argument );
          ch->Echo("Ok.\r\n");
          return;
        }

      if ( !StrCmp( arg2, "immchar" ) )
        {
          if ( skill->Messages.VictimImmune.ToCaster )
            FreeMemory(skill->Messages.VictimImmune.ToCaster);
          if ( StrCmp( argument, "clear" ) )
            skill->Messages.VictimImmune.ToCaster = CopyString( argument );
          ch->Echo("Ok.\r\n");
          return;
        }

      if ( !StrCmp( arg2, "immvict" ) )
        {
          if ( skill->Messages.VictimImmune.ToVictim )
            FreeMemory(skill->Messages.VictimImmune.ToVictim);
          if ( StrCmp( argument, "clear" ) )
            skill->Messages.VictimImmune.ToVictim = CopyString( argument );
          ch->Echo("Ok.\r\n");
          return;
        }

      if ( !StrCmp( arg2, "immroom" ) )
        {
          if ( skill->Messages.VictimImmune.ToRoom )
            FreeMemory(skill->Messages.VictimImmune.ToRoom);
          if ( StrCmp( argument, "clear" ) )
            skill->Messages.VictimImmune.ToRoom = CopyString( argument );
          ch->Echo("Ok.\r\n");
          return;
        }

      if ( !StrCmp( arg2, "dice" ) )
        {
          if ( skill->Dice )
            FreeMemory(skill->Dice);
          if ( StrCmp( argument, "clear" ) )
            skill->Dice = CopyString( argument );
          ch->Echo("Ok.\r\n");
          return;
        }

      if ( !StrCmp( arg2, "teachers" ) )
        {
          if ( skill->Teachers )
            FreeMemory(skill->Teachers);
          if ( StrCmp( argument, "clear" ) )
            skill->Teachers = CopyString( argument );
          ch->Echo("Ok.\r\n");
          return;
        }

      do_sset( ch, "" );
      return;
    }

  if ( ( victim = GetCharacterAnywhere( ch, arg1 ) ) == NULL )
    {
      if ( (sn = LookupSkill(arg1)) >= 0 )
        {
          sprintf(arg1, "%d %s %s", sn, arg2, argument);
          do_sset(ch, arg1);
        }
      else
        ch->Echo("They aren't here.\r\n");
      return;

      ch->Echo("Only on NPC's.\r\n");
      return;
    }

  if ( IsNpc(victim) )
    {
      ch->Echo("Not on NPC's.\r\n");
      return;
    }

  if ( GetTrustLevel(ch) < SysData.LevelToMsetPlayers && victim != ch)
    {
      ch->Echo("You can't do that.\r\n");
      return;
    }

  fAll = !StrCmp( arg2, "all" );
  sn   = 0;
  if ( !fAll && ( sn = LookupSkill( arg2 ) ) < 0 )
    {
      ch->Echo("No such skill or spell.\r\n");
      return;
    }

  /*
   * Snarf the value.
   */
  if ( !IsNumber( argument ) )
    {
      ch->Echo("Value must be numeric.\r\n");
      return;
    }

  value = atoi( argument );
  if ( value < 0 || value > 100 )
    {
      ch->Echo("Value range is 0 to 100.\r\n");
      return;
    }

  if ( fAll )
    {
      for ( sn = 0; sn < TopSN; sn++ )
        {
          /* Fix by Narn to prevent ssetting skills the player shouldn't have. */
          if (SkillTable[sn]->Guild < 0 || SkillTable[sn]->Guild >= MAX_ABILITY )
            continue;
          if ( SkillTable[sn]->Name
               && ( GetAbilityLevel( victim, SkillTable[sn]->Guild ) >= SkillTable[sn]->Level
                    || value == 0 ) )
            victim->PCData->Learned[sn] = value;
        }
    }
  else
    {
      victim->PCData->Learned[sn] = value;
    }
}

