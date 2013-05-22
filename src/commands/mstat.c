#include <string.h>
#include <time.h>
#include "mud.h"
#include "character.h"

void do_mstat( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  AFFECT_DATA *paf = NULL;
  CHAR_DATA *victim = NULL;
  SKILLTYPE *skill = NULL;
  int x = 0;

  set_char_color( AT_PLAIN, ch );

  one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Mstat whom?\r\n", ch );
      return;
    }

  if ( arg[0] != '\'' && arg[0] != '"' && strlen(argument) > strlen(arg) )
    strcpy( arg, argument );

  if ( ( victim = get_char_world( ch, arg ) ) == NULL )
    {
      send_to_char( "They aren't here.\r\n", ch );
      return;
    }

  if ( ( ( get_trust( ch ) < LEVEL_GOD ) && !IS_NPC(victim) ) || ( ( get_trust( ch ) < get_trust( victim ) ) && !IS_NPC(victim) ) )
    {
      set_char_color( AT_IMMORT, ch );
      send_to_char( "Their godly glow prevents you from getting a good look.\r\n", ch );
      return;
    }

  ch_printf( ch, "Name: %s     Organization: %s\r\n",
             victim->name,
             ( IS_NPC( victim ) || !victim->pcdata->clan ) ? "(none)"
             : victim->pcdata->clan->name );

  if( get_trust(ch) >= LEVEL_GOD && !IS_NPC(victim) && victim->desc )
    ch_printf( ch, "Host: %s   Descriptor: %d   Trust: %d   AuthedBy: %s\r\n",
               victim->desc->host, victim->desc->descriptor,
               victim->trust, victim->pcdata->authed_by[0] != '\0'
               ? victim->pcdata->authed_by : "(unknown)" );

  if ( !IS_NPC(victim) && victim->pcdata->release_date != 0 )
    ch_printf(ch, "Helled until %24.24s by %s.\r\n",
              ctime(&victim->pcdata->release_date),
              victim->pcdata->helled_by);

  ch_printf( ch, "Vnum: %d   Sex: %s   Room: %d   Count: %d  Killed: %d\r\n",
             IS_NPC(victim) ? victim->pIndexData->vnum : 0,
             victim->sex == SEX_MALE    ? "male"   :
             victim->sex == SEX_FEMALE  ? "female" : "neutral",
             victim->in_room == NULL    ?        0 : victim->in_room->vnum,
             IS_NPC(victim) ? victim->pIndexData->count : 1,
             IS_NPC(victim) ? victim->pIndexData->killed
             : victim->pcdata->mdeaths + victim->pcdata->pdeaths
             );

  ch_printf( ch, "Str: %d  Int: %d  Wis: %d  Dex: %d  Con: %d  Cha: %d  Lck: %d  Frc: %d\r\n",
             get_curr_str(victim),
             get_curr_int(victim),
             get_curr_wis(victim),
             get_curr_dex(victim),
             get_curr_con(victim),
             get_curr_cha(victim),
             get_curr_lck(victim),
             get_curr_frc(victim) );

  ch_printf( ch, "Hps: %d/%d  Force: %d/%d   Move: %d/%d\r\n",
             victim->hit,         victim->max_hit,
             victim->mana,        victim->max_mana,
             victim->move,        victim->max_move );

  if ( !IS_NPC( victim ) )
    {
      int ability;

      for ( ability = 0 ; ability < MAX_ABILITY ; ability++ )
        ch_printf( ch, "%-15s   Level: %-3d   Max: %-3d   Exp: %-10ld   Next: %-10ld\r\n",
                   ability_name[ability], get_level( victim, ability ), max_level(victim, ability),
		   get_exp( victim, ability ),
		   exp_level( get_level( victim, ability ) + 1 ) );
    }

  ch_printf( ch,
             "Top Level: %d     Race: %d  Align: %d  AC: %d  Gold: %d\r\n",
             victim->top_level,  victim->race,   victim->alignment,
             GET_AC(victim),      victim->gold );

  if (  victim->race  < MAX_NPC_RACE  && victim->race  >= 0 )
    ch_printf( ch, "Race: %s\r\n",
               npc_race[victim->race] );

  ch_printf( ch, "Hitroll: %d   Damroll: %d   Position: %d   Wimpy: %d \r\n",
             GET_HITROLL(victim), GET_DAMROLL(victim),
             victim->position,    victim->wimpy );
  ch_printf( ch, "Fighting: %s    Master: %s    Leader: %s\r\n",
             victim->fighting ? victim->fighting->who->name : "(none)",
             victim->master      ? victim->master->name   : "(none)",
             victim->leader      ? victim->leader->name   : "(none)" );
  ch_printf( ch, "Questpoints: %d    Current QuestMob: %d    Current QuestObj: %d\r\n",
             victim->questpoints, victim->questmob, victim->questobj );

  if ( !IS_NPC(victim) )
    ch_printf( ch,
               "Thirst: %d   Full: %d   Drunk: %d     Glory: %d/%d\r\n",
               victim->pcdata->condition[COND_THIRST],
               victim->pcdata->condition[COND_FULL],
               victim->pcdata->condition[COND_DRUNK],
               victim->pcdata->quest_curr,
               victim->pcdata->quest_accum );
  else
    ch_printf( ch, "Hit dice: %dd%d+%d.  Damage dice: %dd%d+%d.\r\n",
               victim->pIndexData->hitnodice,
               victim->pIndexData->hitsizedice,
               victim->pIndexData->hitplus,
               victim->pIndexData->damnodice,
               victim->pIndexData->damsizedice,
               victim->pIndexData->damplus );

  ch_printf( ch, "MentalState: %d   EmotionalState: %d\r\n",
             victim->mental_state, victim->emotional_state );
  ch_printf( ch, "Saving throws: %d %d %d %d %d.\r\n",
             victim->saving_poison_death,
             victim->saving_wand,
             victim->saving_para_petri,
             victim->saving_breath,
             victim->saving_spell_staff  );
  ch_printf( ch, "Carry figures: items (%d/%d)  weight (%d/%d)   Numattacks: %d\r\n",
             victim->carry_number, can_carry_n(victim), victim->carry_weight, can_carry_w(victim), victim->numattacks );

  if ( IS_NPC( victim ) )
    {
      ch_printf( ch, "Act flags: %s\r\n", flag_string(victim->act, act_flags) );
      ch_printf( ch, "VIP flags: %s\r\n", flag_string(victim->vip_flags, planet_flags) );
    }
  else
    {
      ch_printf( ch, "Years: %d   Seconds Played: %d   Timer: %d   Act: %d\r\n",
                 get_age( victim ), (int) victim->pcdata->played, victim->timer, victim->act );

      ch_printf( ch, "Player flags: %s\r\n",
                 flag_string(victim->act, plr_flags) );
      ch_printf( ch, "Pcflags: %s\r\n",
                 flag_string(victim->pcdata->flags, pc_flags) );
      ch_printf( ch, "Wanted flags: %s\r\n",
                 flag_string(victim->pcdata->wanted_flags, planet_flags) );
    }

  ch_printf( ch, "Affected by: %s\r\n",
             affect_bit_name( victim->affected_by ) );
  ch_printf( ch, "Speaks: %d   Speaking: %d\r\n",
             victim->speaks, victim->speaking );
  send_to_char( "Languages: ", ch );

  for ( x = 0; lang_array[x] != LANG_UNKNOWN; x++ )
    {
      if ( knows_language( victim, lang_array[x], victim )
	   || (IS_NPC(victim) && victim->speaks == 0) )
	{
	  if ( IS_SET(lang_array[x], victim->speaking)
	       || (IS_NPC(victim) && !victim->speaking) )
	    {
	      set_char_color( AT_RED, ch );
	    }

        send_to_char( lang_names[x], ch );
        send_to_char( " ", ch );
        set_char_color( AT_PLAIN, ch );
      }
    else if ( IS_SET(lang_array[x], victim->speaking)
	      || (IS_NPC(victim) && !victim->speaking) )
      {
	set_char_color( AT_PINK, ch );
	send_to_char( lang_names[x], ch );
	send_to_char( " ", ch );
	set_char_color( AT_PLAIN, ch );
      }
    }

  send_to_char( "\r\n", ch );

  if ( victim->pcdata && victim->pcdata->bestowments
       && victim->pcdata->bestowments[0] != '\0' )
    {
      ch_printf( ch, "Bestowments: %s\r\n", victim->pcdata->bestowments );
    }

  ch_printf( ch, "Short description: %s\r\nLong  description: %s",
             victim->short_descr,
             victim->long_descr[0] != '\0' ? victim->long_descr : "(none)\r\n" );
  if ( IS_NPC(victim) && ( victim->spec_fun || victim->spec_2 ) )
    {
      ch_printf( ch, "Mobile has spec fun: %s %s\r\n",
		 lookup_spec( victim->spec_fun ),
		 victim->spec_2 ? lookup_spec( victim->spec_2 ) : "" );
    }

  ch_printf( ch, "Body Parts : %s\r\n",
             flag_string(victim->xflags, part_flags) );
  ch_printf( ch, "Resistant  : %s\r\n",
             flag_string(victim->resistant, ris_flags) );
  ch_printf( ch, "Immune     : %s\r\n",
             flag_string(victim->immune, ris_flags) );
  ch_printf( ch, "Susceptible: %s\r\n",
             flag_string(victim->susceptible, ris_flags) );
  ch_printf( ch, "Attacks    : %s\r\n",
             flag_string(victim->attacks, attack_flags) );
  ch_printf( ch, "Defenses   : %s\r\n",
             flag_string(victim->defenses, defense_flags) );

  for ( paf = victim->first_affect; paf; paf = paf->next )
    {
      if ( (skill=get_skilltype(paf->type)) != NULL )
	{
	  ch_printf( ch,
		     "%s: '%s' modifies %s by %d for %d rounds with bits %s.\r\n",
		     skill_tname[skill->type],
		     skill->name,
		     affect_loc_name( paf->location ),
		     paf->modifier,
		     paf->duration,
		     affect_bit_name( paf->bitvector )
		     );
	}
    }
}
