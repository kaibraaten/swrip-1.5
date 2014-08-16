#include "mud.h"
#include "character.h"

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

  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );

  if ( arg1[0] == '\0' || arg2[0] == '\0' || argument[0] == '\0' )
    {
      send_to_char( "Syntax: sset <victim> <skill> <value>\r\n",        ch );
      send_to_char( "or:     sset <victim> all     <value>\r\n",        ch );
      if ( GetTrustLevel(ch) > LEVEL_SUB_IMPLEM )
        {
          send_to_char( "or:     sset save skill table\r\n",            ch );
          send_to_char( "or:     sset save herb table\r\n",             ch );
          send_to_char( "or:     sset create skill 'new skill'\r\n",    ch );
          send_to_char( "or:     sset create herb 'new herb'\r\n",      ch );
        }
      if ( GetTrustLevel(ch) > LEVEL_GREATER )
	{
          send_to_char( "or:     sset <sn>     <field> <value>\r\n",    ch );
          send_to_char( "\r\nField being one of:\r\n",                  ch );
          send_to_char( "  name code target minpos slot mana beats dammsg wearoff guild minlevel\r\n", ch );
          send_to_char( "  type damtype acttype classtype powertype flag dice value difficulty affect\r\n", ch );
          send_to_char( "  rmaffect level adept hit miss die imm (char/vict/room)\r\n", ch );
          send_to_char( "  components teachers\r\n",                    ch );
          send_to_char( "Affect having the fields: <location> <modfifier> [duration] [bitvector]\r\n", ch );
          send_to_char( "(See AFFECTTYPES for location, and AFFECTED_BY for bitvector)\r\n", ch );
        }
      send_to_char( "Skill being any skill or spell.\r\n",              ch );
      return;
    }

  if ( GetTrustLevel(ch) > LEVEL_SUB_IMPLEM
       &&  !str_cmp( arg1, "save" )
       &&       !str_cmp( argument, "table" ) )
    {
      if ( !str_cmp( arg2, "skill" ) )
        {
          send_to_char( "Saving skill table...\r\n", ch );
          save_skill_table();
          return;
        }
      if ( !str_cmp( arg2, "herb" ) )
        {
          send_to_char( "Saving herb table...\r\n", ch );
          save_herb_table();
          return;
        }
    }
  if ( GetTrustLevel(ch) > LEVEL_SUB_IMPLEM
       &&  !str_cmp( arg1, "create" )
       && (!str_cmp( arg2, "skill" ) || !str_cmp( arg2, "herb" )) )
    {
      struct skill_type *skill;
      short type = SKILL_UNKNOWN;

      if ( !str_cmp( arg2, "herb" ) )
        {
          type = SKILL_HERB;
          if ( top_herb >= MAX_HERB )
            {
              ch_printf( ch, "The current top herb is %d, which is the maximum.  "
                         "To add more herbs,\r\nMAX_HERB will have to be "
			 "raised in mud.h, and the mud recompiled.\r\n",
                         top_sn );
              return;
            }
        }
      else
        if ( top_sn >= MAX_SKILL )
          {
            ch_printf( ch, "The current top sn is %d, which is the maximum.  "
                       "To add more skills,\r\nMAX_SKILL will have to be "
                       "raised in mud.h, and the mud recompiled.\r\n",
                       top_sn );
            return;
          }

      CREATE( skill, struct skill_type, 1 );

      if ( type == SKILL_HERB )
        {
          int max, x;

          herb_table[top_herb++] = skill;
          for ( max = x = 0; x < top_herb-1; x++ )
            if ( herb_table[x] && herb_table[x]->slot > max )
              max = herb_table[x]->slot;
          skill->slot = max+1;
        }
      else
        skill_table[top_sn++] = skill;

      skill->name = str_dup( argument );
      skill->fun_name = str_dup( "" );
      skill->noun_damage = str_dup( "" );
      skill->msg_off = str_dup( "" );
      skill->spell_fun = spell_smaug;
      skill->type = type;
      send_to_char( "Done.\r\n", ch );
      return;
    }

  if ( arg1[0] == 'h' )
    sn = atoi( arg1+1 );
  else
    sn = atoi( arg1 );
  if ( GetTrustLevel(ch) > LEVEL_GREATER
       && ((arg1[0] == 'h' && is_number(arg1+1) && (sn=atoi(arg1+1))>=0)
           ||  (is_number(arg1) && (sn=atoi(arg1)) >= 0)) )
    {
      struct skill_type *skill;

      if ( arg1[0] == 'h' )
        {
          if ( sn >= top_herb )
            {
              send_to_char( "Herb number out of range.\r\n", ch );
              return;
            }
          skill = herb_table[sn];
        }
      else
        {
          if ( (skill=get_skilltype(sn)) == NULL )
            {
              send_to_char( "Skill number out of range.\r\n", ch );
              return;
            }
          sn %= 1000;
        }

      if ( !str_cmp( arg2, "difficulty" ) )
        {
          skill->difficulty = atoi( argument );
          send_to_char( "Ok.\r\n", ch );
          return;
        }
      if ( !str_cmp( arg2, "participants" ) )
        {
          skill->participants = atoi( argument );
          send_to_char( "Ok.\r\n", ch );
          return;
        }
      if ( !str_cmp( arg2, "alignment" ) )
        {
          skill->alignment = atoi( argument );
          send_to_char( "Ok.\r\n", ch );
          return;
        }
      if ( !str_cmp( arg2, "damtype" ) )
        {
          int x = get_spelldamage( argument );

	  if ( x == -1 )
            send_to_char( "Not a spell damage type.\r\n", ch );
          else
            {
              SET_SDAM( skill, x );
              send_to_char( "Ok.\r\n", ch );
            }
          return;
        }
      if ( !str_cmp( arg2, "acttype" ) )
        {
          int x = get_spellaction( argument );

          if ( x == -1 )
            send_to_char( "Not a spell action type.\r\n", ch );
          else
            {
              SET_SACT( skill, x );
              send_to_char( "Ok.\r\n", ch );
            }
          return;
        }
      if ( !str_cmp( arg2, "classtype" ) )
        {
          int x = get_spellclass( argument );

          if ( x == -1 )
            send_to_char( "Not a spell class type.\r\n", ch );
          else
            {
              SET_SCLA( skill, x );
              send_to_char( "Ok.\r\n", ch );
            }
          return;
        }
      if ( !str_cmp( arg2, "powertype" ) )
        {
          int x = get_spellpower( argument );

          if ( x == -1 )
            send_to_char( "Not a spell power type.\r\n", ch );
          else
            {
              SET_SPOW( skill, x );
	      send_to_char( "Ok.\r\n", ch );
            }
          return;
        }
      if ( !str_cmp( arg2, "flag" ) )
        {
          int x = get_spellflag( argument );

          if ( x == -1 )
            send_to_char( "Not a spell flag.\r\n", ch );
          else
            {
              TOGGLE_BIT( skill->flags, 1 << (x+11) );
              send_to_char( "Ok.\r\n", ch );
            }
          return;
        }
      if ( !str_cmp( arg2, "saves" ) )
        {
          int x = get_spellsave( argument );

          if ( x == -1 )
            send_to_char( "Not a saving type.\r\n", ch );
          else
            {
              skill->saves = x;
              send_to_char( "Ok.\r\n", ch );
            }
          return;
        }

      if ( !str_cmp( arg2, "code" ) )
        {
          SPELL_FUN *spellfun;
          DO_FUN    *dofun;

          if ( !str_prefix( "spell_", argument )
               && (spellfun=spell_function(argument)) != spell_notfound )
            {
              skill->spell_fun = spellfun;
              skill->skill_fun = NULL;
              DISPOSE( skill->fun_name );
              skill->fun_name = str_dup( argument );
            }
          else if ( !str_prefix( "do_", argument )
		    && (dofun=skill_function(argument)) != skill_notfound )
            {
              skill->skill_fun = dofun;
              skill->spell_fun = NULL;
              DISPOSE( skill->fun_name );
              skill->fun_name = str_dup( argument );
            }
          else
            {
              send_to_char( "Not a spell or skill.\r\n", ch );
              return;
            }

          send_to_char( "Ok.\r\n", ch );
          return;
        }

      if ( !str_cmp( arg2, "target" ) )
        {
          int x = get_spelltarget( argument );

          if ( x == -1 )
            send_to_char( "Not a valid target type.\r\n", ch );
          else
            {
              skill->target = x;
              send_to_char( "Ok.\r\n", ch );
            }
          return;
        }
      if ( !str_cmp( arg2, "minpos" ) )
        {
          skill->minimum_position = URANGE( POS_DEAD, atoi( argument ), POS_DRAG );
          send_to_char( "Ok.\r\n", ch );
          return;
        }
      if ( !str_cmp( arg2, "minlevel" ) )
        {
          skill->min_level = URANGE( 1, atoi( argument ), MAX_ABILITY_LEVEL );
          send_to_char( "Ok.\r\n", ch );
          return;
        }
      if ( !str_cmp( arg2, "slot" ) )
        {
          skill->slot = URANGE( 0, atoi( argument ), 30000 );
	  send_to_char( "Ok.\r\n", ch );
          return;
        }
      if ( !str_cmp( arg2, "mana" ) )
        {
          skill->min_mana = URANGE( 0, atoi( argument ), 2000 );
          send_to_char( "Ok.\r\n", ch );
          return;
        }
      if ( !str_cmp( arg2, "beats" ) )
        {
          skill->beats = URANGE( 0, atoi( argument ), 120 );
          send_to_char( "Ok.\r\n", ch );
          return;
        }
      if ( !str_cmp( arg2, "guild" ) )
        {
          skill->guild = atoi( argument );
          send_to_char( "Ok.\r\n", ch );
          return;
        }
      if ( !str_cmp( arg2, "value" ) )
        {
          skill->value = atoi( argument );
          send_to_char( "Ok.\r\n", ch );
          return;
        }
      if ( !str_cmp( arg2, "type" ) )
        {
          skill->type = get_skill( argument );
          send_to_char( "Ok.\r\n", ch );
          return;
        }
      if ( !str_cmp( arg2, "rmaffect" ) )
        {
          SMAUG_AFF *aff = skill->affects;
          SMAUG_AFF *aff_next;
          int num = atoi( argument );
          int cnt = 1;

          if ( !aff )
            {
              send_to_char( "This spell has no special affects to remove.\r\n", ch );
              return;
            }
	  if ( num == 1 )
            {
              skill->affects = aff->next;
              DISPOSE( aff->duration );
              DISPOSE( aff->modifier );
              DISPOSE( aff );
              send_to_char( "Removed.\r\n", ch );
              return;
            }
          for ( ; aff; aff = aff->next )
            {
              if ( ++cnt == num && (aff_next=aff->next) != NULL )
                {
                  aff->next = aff_next->next;
                  DISPOSE( aff_next->duration );
                  DISPOSE( aff_next->modifier );
                  DISPOSE( aff_next );
                  send_to_char( "Removed.\r\n", ch );
                  return;
                }
            }
          send_to_char( "Not found.\r\n", ch );
          return;
        }
      /*
       * affect <location> <modifier> <duration> <bitvector>
       */
      if ( !str_cmp( arg2, "affect" ) )
        {
          char location[MAX_INPUT_LENGTH];
          char modifier[MAX_INPUT_LENGTH];
          char duration[MAX_INPUT_LENGTH];
          char bitvector[MAX_INPUT_LENGTH];
          int loc, bit, tmpbit;
          SMAUG_AFF *aff;

          argument = one_argument( argument, location );
          argument = one_argument( argument, modifier );
          argument = one_argument( argument, duration );

          if ( location[0] == '!' )
            loc = get_affecttype( location+1 ) + REVERSE_APPLY;
          else
            loc = get_affecttype( location );
          if ( (loc % REVERSE_APPLY) < 0
	       ||   (loc % REVERSE_APPLY) >= MAX_APPLY_TYPE )
            {
              send_to_char( "Unknown affect location.  See AFFECTTYPES.\r\n", ch );
              return;
            }
          bit = 0;
          while ( argument[0] != 0 )
            {
              argument = one_argument( argument, bitvector );
              if ( (tmpbit=get_affectedflag( bitvector )) == -1 )
                ch_printf( ch, "Unknown bitvector: %s.  See AFFECTED_BY\r\n", bitvector );
              else
                bit |= (1 << tmpbit);
            }
          CREATE( aff, SMAUG_AFF, 1 );
          if ( !str_cmp( duration, "0" ) )
            duration[0] = '\0';
          if ( !str_cmp( modifier, "0" ) )
            modifier[0] = '\0';
          aff->duration = str_dup( duration );
          aff->location = loc;
          aff->modifier = str_dup( modifier );
          aff->bitvector = bit;
          aff->next = skill->affects;
          skill->affects = aff;
          send_to_char( "Ok.\r\n", ch );
          return;
        }
      if ( !str_cmp( arg2, "level" ) )
        {
          skill->min_level = URANGE( 1, atoi( argument ), MAX_ABILITY_LEVEL );
          send_to_char( "Ok.\r\n", ch );
          return;
        }
      if ( !str_cmp( arg2, "adept" ) )
        {
          return;
        }
      if ( !str_cmp( arg2, "name" ) )
        {
          DISPOSE(skill->name);
          skill->name = str_dup( argument );
          send_to_char( "Ok.\r\n", ch );
          return;
        }
      if ( !str_cmp( arg2, "dammsg" ) )
        {
          DISPOSE(skill->noun_damage);
          if ( !str_cmp( argument, "clear" ) )
            skill->noun_damage = str_dup( "" );
          else
            skill->noun_damage = str_dup( argument );
          send_to_char( "Ok.\r\n", ch );
          return;
        }
      if ( !str_cmp( arg2, "wearoff" ) )
        {
          DISPOSE(skill->msg_off);
          if ( str_cmp( argument, "clear" ) )
            skill->msg_off = str_dup( argument );
          send_to_char( "Ok.\r\n", ch );
          return;
        }
      if ( !str_cmp( arg2, "hitchar" ) )
        {
          if ( skill->hit_char )
            DISPOSE(skill->hit_char);
          if ( str_cmp( argument, "clear" ) )
            skill->hit_char = str_dup( argument );
          send_to_char( "Ok.\r\n", ch );
          return;
        }
      if ( !str_cmp( arg2, "hitvict" ) )
        {
          if ( skill->hit_vict )
            DISPOSE(skill->hit_vict);
          if ( str_cmp( argument, "clear" ) )
            skill->hit_vict = str_dup( argument );
          send_to_char( "Ok.\r\n", ch );
          return;
        }
      if ( !str_cmp( arg2, "hitroom" ) )
        {
          if ( skill->hit_room )
            DISPOSE(skill->hit_room);
          if ( str_cmp( argument, "clear" ) )
            skill->hit_room = str_dup( argument );
          send_to_char( "Ok.\r\n", ch );
          return;
        }
      if ( !str_cmp( arg2, "misschar" ) )
        {
          if ( skill->miss_char )
            DISPOSE(skill->miss_char);
          if ( str_cmp( argument, "clear" ) )
            skill->miss_char = str_dup( argument );
          send_to_char( "Ok.\r\n", ch );
          return;
        }
      if ( !str_cmp( arg2, "missvict" ) )
        {
          if ( skill->miss_vict )
            DISPOSE(skill->miss_vict);
          if ( str_cmp( argument, "clear" ) )
            skill->miss_vict = str_dup( argument );
          send_to_char( "Ok.\r\n", ch );
          return;
        }
      if ( !str_cmp( arg2, "missroom" ) )
        {
          if ( skill->miss_room )
            DISPOSE(skill->miss_room);
          if ( str_cmp( argument, "clear" ) )
            skill->miss_room = str_dup( argument );
          send_to_char( "Ok.\r\n", ch );
          return;
        }
      if ( !str_cmp( arg2, "diechar" ) )
        {
          if ( skill->die_char )
            DISPOSE(skill->die_char);
          if ( str_cmp( argument, "clear" ) )
            skill->die_char = str_dup( argument );
          send_to_char( "Ok.\r\n", ch );
          return;
        }
      if ( !str_cmp( arg2, "dievict" ) )
        {
          if ( skill->die_vict )
            DISPOSE(skill->die_vict);
          if ( str_cmp( argument, "clear" ) )
            skill->die_vict = str_dup( argument );
          send_to_char( "Ok.\r\n", ch );
          return;
        }
      if ( !str_cmp( arg2, "dieroom" ) )
        {
          if ( skill->die_room )
            DISPOSE(skill->die_room);
          if ( str_cmp( argument, "clear" ) )
            skill->die_room = str_dup( argument );
          send_to_char( "Ok.\r\n", ch );
          return;
        }
      if ( !str_cmp( arg2, "immchar" ) )
        {
          if ( skill->imm_char )
            DISPOSE(skill->imm_char);
          if ( str_cmp( argument, "clear" ) )
            skill->imm_char = str_dup( argument );
          send_to_char( "Ok.\r\n", ch );
          return;
        }
      if ( !str_cmp( arg2, "immvict" ) )
        {
          if ( skill->imm_vict )
            DISPOSE(skill->imm_vict);
          if ( str_cmp( argument, "clear" ) )
            skill->imm_vict = str_dup( argument );
          send_to_char( "Ok.\r\n", ch );
          return;
        }
      if ( !str_cmp( arg2, "immroom" ) )
        {
          if ( skill->imm_room )
            DISPOSE(skill->imm_room);
          if ( str_cmp( argument, "clear" ) )
            skill->imm_room = str_dup( argument );
          send_to_char( "Ok.\r\n", ch );
          return;
        }
      if ( !str_cmp( arg2, "dice" ) )
        {
          if ( skill->dice )
            DISPOSE(skill->dice);
          if ( str_cmp( argument, "clear" ) )
            skill->dice = str_dup( argument );
          send_to_char( "Ok.\r\n", ch );
          return;
        }
      if ( !str_cmp( arg2, "components" ) )
        {
          if ( skill->components )
            DISPOSE(skill->components);
          if ( str_cmp( argument, "clear" ) )
            skill->components = str_dup( argument );
          send_to_char( "Ok.\r\n", ch );
          return;
        }
      if ( !str_cmp( arg2, "teachers" ) )
        {
          if ( skill->teachers )
            DISPOSE(skill->teachers);
          if ( str_cmp( argument, "clear" ) )
            skill->teachers = str_dup( argument );
          send_to_char( "Ok.\r\n", ch );
          return;
        }
      do_sset( ch, "" );
      return;
    }

  if ( ( victim = get_char_world( ch, arg1 ) ) == NULL )
    {
      if ( (sn = skill_lookup(arg1)) >= 0 )
        {
          sprintf(arg1, "%d %s %s", sn, arg2, argument);
          do_sset(ch, arg1);
        }
      else
        send_to_char( "They aren't here.\r\n", ch );
      return;

      send_to_char( "Only on NPC's.\r\n", ch );
      return;
    }

  if ( IsNpc(victim) )
    {
      send_to_char( "Not on NPC's.\r\n", ch );
      return;
    }

  if ( GetTrustLevel(ch) < sysdata.level_mset_player && victim != ch)
    {
      send_to_char( "You can't do that.\r\n", ch );
      return;
    }

  fAll = !str_cmp( arg2, "all" );
  sn   = 0;
  if ( !fAll && ( sn = skill_lookup( arg2 ) ) < 0 )
    {
      send_to_char( "No such skill or spell.\r\n", ch );
      return;
    }

  /*
   * Snarf the value.
   */
  if ( !is_number( argument ) )
    {
      send_to_char( "Value must be numeric.\r\n", ch );
      return;
    }

  value = atoi( argument );
  if ( value < 0 || value > 100 )
    {
      send_to_char( "Value range is 0 to 100.\r\n", ch );
      return;
    }

  if ( fAll )
    {
      for ( sn = 0; sn < top_sn; sn++ )
        {
          /* Fix by Narn to prevent ssetting skills the player shouldn't have. */
          if (skill_table[sn]->guild < 0 || skill_table[sn]->guild >= MAX_ABILITY )
            continue;
          if ( skill_table[sn]->name
               && ( GetAbilityLevel( victim, skill_table[sn]->guild ) >= skill_table[sn]->min_level
                    || value == 0 ) )
            victim->pcdata->learned[sn] = value;
        }
    }
  else
    {
      victim->pcdata->learned[sn] = value;
    }
}
