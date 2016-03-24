#include "mud.h"
#include "character.h"
#include "skill.h"

/*
 * Set a skill's attributes or what skills a player has.
 * High god command, with support for creating skills/spells/herbs/etc
 */
void do_sset( Character *ch, char *argument )
{
  char arg1 [MAX_INPUT_LENGTH];
  char arg2 [MAX_INPUT_LENGTH];
  Character *victim;
  int value;
  int sn;
  bool fAll;

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  if ( arg1[0] == '\0' || arg2[0] == '\0' || argument[0] == '\0' )
    {
      SendToCharacter( "Syntax: sset <victim> <skill> <value>\r\n",        ch );
      SendToCharacter( "or:     sset <victim> all     <value>\r\n",        ch );
      if ( GetTrustLevel(ch) > LEVEL_SUB_IMPLEM )
        {
          SendToCharacter( "or:     sset save skill table\r\n",            ch );
          SendToCharacter( "or:     sset save herb table\r\n",             ch );
          SendToCharacter( "or:     sset create skill 'new skill'\r\n",    ch );
          SendToCharacter( "or:     sset create herb 'new herb'\r\n",      ch );
        }
      if ( GetTrustLevel(ch) > LEVEL_GREATER )
	{
          SendToCharacter( "or:     sset <sn>     <field> <value>\r\n",    ch );
          SendToCharacter( "\r\nField being one of:\r\n",                  ch );
          SendToCharacter( "  name code target minpos slot mana beats dammsg wearoff guild minlevel\r\n", ch );
          SendToCharacter( "  type damtype acttype classtype powertype flag dice value difficulty affect\r\n", ch );
          SendToCharacter( "  rmaffect level adept hit miss die imm (char/vict/room)\r\n", ch );
          SendToCharacter( "  components teachers\r\n",                    ch );
          SendToCharacter( "Affect having the fields: <location> <modfifier> [duration] [bitvector]\r\n", ch );
          SendToCharacter( "(See AFFECTTYPES for location, and AFFECTED_BY for bitvector)\r\n", ch );
        }
      SendToCharacter( "Skill being any skill or spell.\r\n",              ch );
      return;
    }

  if ( GetTrustLevel(ch) > LEVEL_SUB_IMPLEM
       &&  !StrCmp( arg1, "save" )
       &&       !StrCmp( argument, "table" ) )
    {
      if ( !StrCmp( arg2, "skill" ) )
        {
          SendToCharacter( "Saving skill table...\r\n", ch );
          SaveSkills();
          return;
        }
      if ( !StrCmp( arg2, "herb" ) )
        {
          SendToCharacter( "Saving herb table...\r\n", ch );
          SaveHerbs();
          return;
        }
    }
  if ( GetTrustLevel(ch) > LEVEL_SUB_IMPLEM
       &&  !StrCmp( arg1, "create" )
       && (!StrCmp( arg2, "skill" ) || !StrCmp( arg2, "herb" )) )
    {
      Skill *skill;
      short type = SKILL_UNKNOWN;

      if ( !StrCmp( arg2, "herb" ) )
        {
          type = SKILL_HERB;
          if ( TopHerb >= MAX_HERB )
            {
              Echo( ch, "The current top herb is %d, which is the maximum.  "
                         "To add more herbs,\r\nMAX_HERB will have to be "
			 "raised in mud.h, and the mud recompiled.\r\n",
                         TopSN );
              return;
            }
        }
      else
        if ( TopSN >= MAX_SKILL )
          {
            Echo( ch, "The current top sn is %d, which is the maximum.  "
                       "To add more skills,\r\nMAX_SKILL will have to be "
                       "raised in mud.h, and the mud recompiled.\r\n",
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
      SendToCharacter( "Done.\r\n", ch );
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
              SendToCharacter( "Herb number out of range.\r\n", ch );
              return;
            }
          skill = HerbTable[sn];
        }
      else
        {
          if ( (skill=GetSkill(sn)) == NULL )
            {
              SendToCharacter( "Skill number out of range.\r\n", ch );
              return;
            }
          sn %= 1000;
        }

      if ( !StrCmp( arg2, "difficulty" ) )
        {
          skill->Difficulty = atoi( argument );
          SendToCharacter( "Ok.\r\n", ch );
          return;
        }
      if ( !StrCmp( arg2, "participants" ) )
        {
          skill->Participants = atoi( argument );
          SendToCharacter( "Ok.\r\n", ch );
          return;
        }
      if ( !StrCmp( arg2, "alignment" ) )
        {
          skill->Alignment = atoi( argument );
          SendToCharacter( "Ok.\r\n", ch );
          return;
        }
      if ( !StrCmp( arg2, "damtype" ) )
        {
          int x = GetSpellDamage( argument );

	  if ( x == -1 )
            SendToCharacter( "Not a spell damage type.\r\n", ch );
          else
            {
              SET_SDAM( skill, x );
              SendToCharacter( "Ok.\r\n", ch );
            }
          return;
        }
      if ( !StrCmp( arg2, "acttype" ) )
        {
          int x = GetSpellAction( argument );

          if ( x == -1 )
            SendToCharacter( "Not a spell action type.\r\n", ch );
          else
            {
              SET_SACT( skill, x );
              SendToCharacter( "Ok.\r\n", ch );
            }
          return;
        }
      if ( !StrCmp( arg2, "classtype" ) )
        {
          int x = GetSpellClass( argument );

          if ( x == -1 )
            SendToCharacter( "Not a spell class type.\r\n", ch );
          else
            {
              SET_SCLA( skill, x );
              SendToCharacter( "Ok.\r\n", ch );
            }
          return;
        }
      if ( !StrCmp( arg2, "powertype" ) )
        {
          int x = GetSpellPower( argument );

          if ( x == -1 )
            SendToCharacter( "Not a spell power type.\r\n", ch );
          else
            {
              SET_SPOW( skill, x );
	      SendToCharacter( "Ok.\r\n", ch );
            }
          return;
        }
      if ( !StrCmp( arg2, "flag" ) )
        {
          int x = GetSpellFlag( argument );

          if ( x == -1 )
            SendToCharacter( "Not a spell flag.\r\n", ch );
          else
            {
              ToggleBit( skill->Flags, 1 << (x+11) );
              SendToCharacter( "Ok.\r\n", ch );
            }
          return;
        }
      if ( !StrCmp( arg2, "saves" ) )
        {
          int x = GetSpellSave( argument );

          if ( x == -1 )
            SendToCharacter( "Not a saving type.\r\n", ch );
          else
            {
              skill->Saves = x;
              SendToCharacter( "Ok.\r\n", ch );
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
              SendToCharacter( "Not a spell or skill.\r\n", ch );
              return;
            }

          SendToCharacter( "Ok.\r\n", ch );
          return;
        }

      if ( !StrCmp( arg2, "target" ) )
        {
          int x = GetSpellTarget( argument );

          if ( x == -1 )
            SendToCharacter( "Not a valid target type.\r\n", ch );
          else
            {
              skill->Target = x;
              SendToCharacter( "Ok.\r\n", ch );
            }
          return;
        }
      if ( !StrCmp( arg2, "minpos" ) )
        {
          skill->Position = urange( POS_DEAD, atoi( argument ), POS_DRAG );
          SendToCharacter( "Ok.\r\n", ch );
          return;
        }
      if ( !StrCmp( arg2, "minlevel" ) )
        {
          skill->Level = urange( 1, atoi( argument ), MAX_ABILITY_LEVEL );
          SendToCharacter( "Ok.\r\n", ch );
          return;
        }
      if ( !StrCmp( arg2, "slot" ) )
        {
          skill->Slot = urange( 0, atoi( argument ), SHRT_MAX );
	  SendToCharacter( "Ok.\r\n", ch );
          return;
        }
      if ( !StrCmp( arg2, "mana" ) )
        {
          skill->MinimumMana = urange( 0, atoi( argument ), 2000 );
          SendToCharacter( "Ok.\r\n", ch );
          return;
        }
      if ( !StrCmp( arg2, "beats" ) )
        {
          skill->Beats = urange( 0, atoi( argument ), 120 );
          SendToCharacter( "Ok.\r\n", ch );
          return;
        }
      if ( !StrCmp( arg2, "guild" ) )
        {
          skill->Guild = atoi( argument );
          SendToCharacter( "Ok.\r\n", ch );
          return;
        }
      if ( !StrCmp( arg2, "value" ) )
        {
          skill->MiscValue = atoi( argument );
          SendToCharacter( "Ok.\r\n", ch );
          return;
        }
      if ( !StrCmp( arg2, "type" ) )
        {
          skill->Type = GetSkillType( argument );
          SendToCharacter( "Ok.\r\n", ch );
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
              SendToCharacter( "This spell has no special affects to remove.\r\n", ch );
              return;
            }
	  if ( num == 1 )
            {
              skill->Affects = aff->next;
              FreeMemory( aff->duration );
              FreeMemory( aff->modifier );
              FreeMemory( aff );
              SendToCharacter( "Removed.\r\n", ch );
              return;
            }
          for ( ; aff; aff = aff->next )
            {
              if ( ++cnt == num && (aff_next=aff->next) != NULL )
                {
                  aff->next = aff_next->next;
                  FreeMemory( aff_next->duration );
                  FreeMemory( aff_next->modifier );
                  FreeMemory( aff_next );
                  SendToCharacter( "Removed.\r\n", ch );
                  return;
                }
            }
          SendToCharacter( "Not found.\r\n", ch );
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
              SendToCharacter( "Unknown affect location.  See AFFECTTYPES.\r\n", ch );
              return;
            }
          bit = 0;
          while ( argument[0] != 0 )
            {
              argument = OneArgument( argument, bitvector );
              if ( (tmpbit=GetAffectedFlag( bitvector )) == -1 )
                Echo( ch, "Unknown bitvector: %s.  See AFFECTED_BY\r\n", bitvector );
              else
                bit |= (1 << tmpbit);
            }
          AllocateMemory( aff, SmaugAffect, 1 );
          if ( !StrCmp( duration, "0" ) )
            duration[0] = '\0';
          if ( !StrCmp( modifier, "0" ) )
            modifier[0] = '\0';
          aff->duration = CopyString( duration );
          aff->location = loc;
          aff->modifier = CopyString( modifier );
          aff->bitvector = bit;
          aff->next = skill->Affects;
          skill->Affects = aff;
          SendToCharacter( "Ok.\r\n", ch );
          return;
        }
      if ( !StrCmp( arg2, "level" ) )
        {
          skill->Level = urange( 1, atoi( argument ), MAX_ABILITY_LEVEL );
          SendToCharacter( "Ok.\r\n", ch );
          return;
        }
      if ( !StrCmp( arg2, "adept" ) )
        {
          return;
        }
      if ( !StrCmp( arg2, "name" ) )
        {
          FreeMemory(skill->Name);
          skill->Name = CopyString( argument );
          SendToCharacter( "Ok.\r\n", ch );
          return;
        }
      if ( !StrCmp( arg2, "dammsg" ) )
        {
          FreeMemory(skill->Messages.NounDamage);
          if ( !StrCmp( argument, "clear" ) )
            skill->Messages.NounDamage = CopyString( "" );
          else
            skill->Messages.NounDamage = CopyString( argument );
          SendToCharacter( "Ok.\r\n", ch );
          return;
        }
      if ( !StrCmp( arg2, "wearoff" ) )
        {
          FreeMemory(skill->Messages.WearOff);
          if ( StrCmp( argument, "clear" ) )
            skill->Messages.WearOff = CopyString( argument );
          SendToCharacter( "Ok.\r\n", ch );
          return;
        }
      if ( !StrCmp( arg2, "hitchar" ) )
        {
          if ( skill->Messages.Success.ToCaster )
            FreeMemory(skill->Messages.Success.ToCaster);
          if ( StrCmp( argument, "clear" ) )
            skill->Messages.Success.ToCaster = CopyString( argument );
          SendToCharacter( "Ok.\r\n", ch );
          return;
        }
      if ( !StrCmp( arg2, "hitvict" ) )
        {
          if ( skill->Messages.Success.ToVictim )
            FreeMemory(skill->Messages.Success.ToVictim);
          if ( StrCmp( argument, "clear" ) )
            skill->Messages.Success.ToVictim = CopyString( argument );
          SendToCharacter( "Ok.\r\n", ch );
          return;
        }
      if ( !StrCmp( arg2, "hitroom" ) )
        {
          if ( skill->Messages.Success.ToRoom )
            FreeMemory(skill->Messages.Success.ToRoom);
          if ( StrCmp( argument, "clear" ) )
            skill->Messages.Success.ToRoom = CopyString( argument );
          SendToCharacter( "Ok.\r\n", ch );
          return;
        }
      if ( !StrCmp( arg2, "misschar" ) )
        {
          if ( skill->Messages.Failure.ToCaster )
            FreeMemory(skill->Messages.Failure.ToCaster);
          if ( StrCmp( argument, "clear" ) )
            skill->Messages.Failure.ToCaster = CopyString( argument );
          SendToCharacter( "Ok.\r\n", ch );
          return;
        }
      if ( !StrCmp( arg2, "missvict" ) )
        {
          if ( skill->Messages.Failure.ToVictim )
            FreeMemory(skill->Messages.Failure.ToVictim);
          if ( StrCmp( argument, "clear" ) )
            skill->Messages.Failure.ToVictim = CopyString( argument );
          SendToCharacter( "Ok.\r\n", ch );
          return;
        }
      if ( !StrCmp( arg2, "missroom" ) )
        {
          if ( skill->Messages.Failure.ToRoom )
            FreeMemory(skill->Messages.Failure.ToRoom);
          if ( StrCmp( argument, "clear" ) )
            skill->Messages.Failure.ToRoom = CopyString( argument );
          SendToCharacter( "Ok.\r\n", ch );
          return;
        }
      if ( !StrCmp( arg2, "diechar" ) )
        {
          if ( skill->Messages.VictimDeath.ToCaster )
            FreeMemory(skill->Messages.VictimDeath.ToCaster);
          if ( StrCmp( argument, "clear" ) )
            skill->Messages.VictimDeath.ToCaster = CopyString( argument );
          SendToCharacter( "Ok.\r\n", ch );
          return;
        }
      if ( !StrCmp( arg2, "dievict" ) )
        {
          if ( skill->Messages.VictimDeath.ToVictim )
            FreeMemory(skill->Messages.VictimDeath.ToVictim);
          if ( StrCmp( argument, "clear" ) )
            skill->Messages.VictimDeath.ToVictim = CopyString( argument );
          SendToCharacter( "Ok.\r\n", ch );
          return;
        }
      if ( !StrCmp( arg2, "dieroom" ) )
        {
          if ( skill->Messages.VictimDeath.ToRoom )
            FreeMemory(skill->Messages.VictimDeath.ToRoom);
          if ( StrCmp( argument, "clear" ) )
            skill->Messages.VictimDeath.ToRoom = CopyString( argument );
          SendToCharacter( "Ok.\r\n", ch );
          return;
        }
      if ( !StrCmp( arg2, "immchar" ) )
        {
          if ( skill->Messages.VictimImmune.ToCaster )
            FreeMemory(skill->Messages.VictimImmune.ToCaster);
          if ( StrCmp( argument, "clear" ) )
            skill->Messages.VictimImmune.ToCaster = CopyString( argument );
          SendToCharacter( "Ok.\r\n", ch );
          return;
        }
      if ( !StrCmp( arg2, "immvict" ) )
        {
          if ( skill->Messages.VictimImmune.ToVictim )
            FreeMemory(skill->Messages.VictimImmune.ToVictim);
          if ( StrCmp( argument, "clear" ) )
            skill->Messages.VictimImmune.ToVictim = CopyString( argument );
          SendToCharacter( "Ok.\r\n", ch );
          return;
        }
      if ( !StrCmp( arg2, "immroom" ) )
        {
          if ( skill->Messages.VictimImmune.ToRoom )
            FreeMemory(skill->Messages.VictimImmune.ToRoom);
          if ( StrCmp( argument, "clear" ) )
            skill->Messages.VictimImmune.ToRoom = CopyString( argument );
          SendToCharacter( "Ok.\r\n", ch );
          return;
        }
      if ( !StrCmp( arg2, "dice" ) )
        {
          if ( skill->Dice )
            FreeMemory(skill->Dice);
          if ( StrCmp( argument, "clear" ) )
            skill->Dice = CopyString( argument );
          SendToCharacter( "Ok.\r\n", ch );
          return;
        }
      if ( !StrCmp( arg2, "components" ) )
        {
          if ( skill->Components )
            FreeMemory(skill->Components);
          if ( StrCmp( argument, "clear" ) )
            skill->Components = CopyString( argument );
          SendToCharacter( "Ok.\r\n", ch );
          return;
        }
      if ( !StrCmp( arg2, "teachers" ) )
        {
          if ( skill->Teachers )
            FreeMemory(skill->Teachers);
          if ( StrCmp( argument, "clear" ) )
            skill->Teachers = CopyString( argument );
          SendToCharacter( "Ok.\r\n", ch );
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
        SendToCharacter( "They aren't here.\r\n", ch );
      return;

      SendToCharacter( "Only on NPC's.\r\n", ch );
      return;
    }

  if ( IsNpc(victim) )
    {
      SendToCharacter( "Not on NPC's.\r\n", ch );
      return;
    }

  if ( GetTrustLevel(ch) < sysdata.level_mset_player && victim != ch)
    {
      SendToCharacter( "You can't do that.\r\n", ch );
      return;
    }

  fAll = !StrCmp( arg2, "all" );
  sn   = 0;
  if ( !fAll && ( sn = LookupSkill( arg2 ) ) < 0 )
    {
      SendToCharacter( "No such skill or spell.\r\n", ch );
      return;
    }

  /*
   * Snarf the value.
   */
  if ( !IsNumber( argument ) )
    {
      SendToCharacter( "Value must be numeric.\r\n", ch );
      return;
    }

  value = atoi( argument );
  if ( value < 0 || value > 100 )
    {
      SendToCharacter( "Value range is 0 to 100.\r\n", ch );
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
            victim->pcdata->learned[sn] = value;
        }
    }
  else
    {
      victim->pcdata->learned[sn] = value;
    }
}
