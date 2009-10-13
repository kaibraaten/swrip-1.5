/***************************************************************************
*                   Star Wars: Rise in Power MUD Codebase                  *
*--------------------------------------------------------------------------*
* SWRiP Code Additions and changes from the SWReality and Smaug Code       *
* copyright (c) 2001 by Mark Miller (Darrik Vequir)                        *
*--------------------------------------------------------------------------*
* Star Wars Reality Code Additions and changes from the Smaug Code         *
* copyright (c) 1997 by Sean Cooper                                        *
* -------------------------------------------------------------------------*
* Starwars and Starwars Names copyright(c) Lucas Film Ltd.                 *
*--------------------------------------------------------------------------*
* SMAUG 1.0 (C) 1994, 1995, 1996 by Derek Snider                           *
* SMAUG code team: Thoric, Altrag, Blodkai, Narn, Haus,                    *
* Scryn, Rennard, Swordbearer, Gorog, Grishnakh and Tricops                *
* ------------------------------------------------------------------------ *
* Merc 2.1 Diku Mud improvments copyright (C) 1992, 1993 by Michael        *
* Chastain, Michael Quan, and Mitchell Tse.                                *
* Original Diku Mud copyright (C) 1990, 1991 by Sebastian Hammer,          *
* Michael Seifert, Hans Henrik St{rfeldt, Tom Madsen, and Katja Nyboe.     *
* ------------------------------------------------------------------------ *
*			     Player skills module			   *
****************************************************************************/

#include <sys/types.h>
#include <stdio.h>
#include <string.h>
#include <time.h>
#include "mud.h"
#include "bet.h"

char * const spell_flag[] =
{ "water", "earth", "air", "astral", "area", "distant", "reverse",
"save_half_dam", "save_negates", "accumulative", "recastable", "noscribe",
"nobrew", "group", "object", "character", "secretskill", "pksensitive" };

char * const spell_saves[] =
{ "none", "poison_death", "wands", "para_petri", "breath", "spell_staff" };

char * const spell_damage[] =
{ "none", "fire", "cold", "electricity", "energy", "acid", "poison", "drain" };

char * const spell_action[] =
{ "none", "create", "destroy", "resist", "suscept", "divinate", "obscure",
"change" };

char * const spell_power[] =
{ "none", "minor", "greater", "major" };

char * const spell_class[] =
{ "none", "lunar", "solar", "travel", "summon", "life", "death", "illusion" };

char * const target_type[] =
{ "ignore", "offensive", "defensive", "self", "objinv" };


void show_char_to_char( CHAR_DATA *list, CHAR_DATA *ch );
void show_list_to_char( OBJ_DATA *list, CHAR_DATA *ch, bool fShort, 
	bool fShowN );

int ris_save( CHAR_DATA *ch, int chance, int ris );
bool check_illegal_psteal( CHAR_DATA *ch, CHAR_DATA *victim );

/* from magic.c */
void failed_casting( struct skill_type *skill, CHAR_DATA *ch,
		     CHAR_DATA *victim, OBJ_DATA *obj );

int     xp_compute      args( ( CHAR_DATA *gch, CHAR_DATA *victim ) );

ROOM_INDEX_DATA *generate_exit( ROOM_INDEX_DATA *in_room, EXIT_DATA **pexit );

/*
 * Dummy function
 */
void skill_notfound( CHAR_DATA *ch, char *argument )
{
    send_to_char( "Huh?\n\r", ch );
    return;
}


int get_ssave( char *name )
{
    int x;

    for ( x = 0; x < sizeof(spell_saves) / sizeof(spell_saves[0]); x++ )
      if ( !str_cmp( name, spell_saves[x] ) )
        return x;
    return -1;
}

int get_starget( char *name )
{
    int x;

    for ( x = 0; x < sizeof(target_type) / sizeof(target_type[0]); x++ )
      if ( !str_cmp( name, target_type[x] ) )
        return x;
    return -1;
}

int get_sflag( char *name )
{
    int x;

    for ( x = 0; x < sizeof(spell_flag) / sizeof(spell_flag[0]); x++ )
      if ( !str_cmp( name, spell_flag[x] ) )
        return x;
    return -1;
}

int get_sdamage( char *name )
{
    int x;

    for ( x = 0; x < sizeof(spell_damage) / sizeof(spell_damage[0]); x++ )
      if ( !str_cmp( name, spell_damage[x] ) )
        return x;
    return -1;
}

int get_saction( char *name )
{
    int x;

    for ( x = 0; x < sizeof(spell_action) / sizeof(spell_action[0]); x++ )
      if ( !str_cmp( name, spell_action[x] ) )
        return x;
    return -1;
}

int get_spower( char *name )
{
    int x;

    for ( x = 0; x < sizeof(spell_power) / sizeof(spell_power[0]); x++ )
      if ( !str_cmp( name, spell_power[x] ) )
        return x;
    return -1;
}

int get_sclass( char *name )
{
    int x;

    for ( x = 0; x < sizeof(spell_class) / sizeof(spell_class[0]); x++ )
      if ( !str_cmp( name, spell_class[x] ) )
        return x;
    return -1;
}

bool is_legal_kill(CHAR_DATA *ch, CHAR_DATA *vch)
{
  if ( IS_NPC(ch) || IS_NPC(vch) )
    return TRUE;
  if ( is_safe(ch,vch) )
    return FALSE;
  return TRUE;
}


extern char *target_name;	/* from magic.c */

/*
 * Perform a binary search on a section of the skill table
 * Each different section of the skill table is sorted alphabetically
 * Only match skills player knows				-Thoric
 */
bool check_skill( CHAR_DATA *ch, char *command, char *argument )
{
    int sn;
    int first = gsn_first_skill;
    int top   = gsn_first_weapon-1;
    struct timeval time_used;
    int mana;
    
    /* bsearch for the skill */
    for (;;)
    {
	sn = (first + top) >> 1;

	if ( LOWER(command[0]) == LOWER(skill_table[sn]->name[0])
	&&  !str_prefix(command, skill_table[sn]->name)
	&&  (skill_table[sn]->skill_fun || skill_table[sn]->spell_fun != spell_null)
	&&  (IS_NPC(ch)
	||  ( ch->pcdata->learned[sn] > 0 )) )
		break;
	if (first >= top)
	    return FALSE;
    	if (strcmp( command, skill_table[sn]->name) < 1)
	    top = sn - 1;
    	else
	    first = sn + 1;
    }

    if ( !check_pos( ch, skill_table[sn]->minimum_position ) )
	return TRUE;

    if ( IS_NPC(ch)
    &&  (IS_AFFECTED( ch, AFF_CHARM ) || IS_AFFECTED( ch, AFF_POSSESS )) )
    {
	send_to_char( "For some reason, you seem unable to perform that...\n\r", ch );
	act( AT_GREY,"$n looks around.", ch, NULL, NULL, TO_ROOM );
	return TRUE;
    }

    /* check if mana is required */
    if ( skill_table[sn]->min_mana )
    {
	mana = IS_NPC(ch) ? 0 : skill_table[sn]->min_mana;

	if ( !IS_NPC(ch) && ch->mana < mana )
	{
	    send_to_char( "You need to rest before using the Force any more.\n\r", ch );
	    return TRUE;
	}
    }
    else
    {
	mana = 0;
    }
    
    /*
     * Is this a real do-fun, or a really a spell?
     */
    if ( !skill_table[sn]->skill_fun )
    {
	ch_ret retcode = rNONE;
	void *vo = NULL;
	CHAR_DATA *victim = NULL;
	OBJ_DATA *obj = NULL;

	target_name = "";

	switch ( skill_table[sn]->target )
	{
	default:
	    bug( "Check_skill: bad target for sn %d.", sn );
	    send_to_char( "Something went wrong...\n\r", ch );
	    return TRUE;

	case TAR_IGNORE:
	    vo = NULL;
	    if ( argument[0] == '\0' )
	    {
		if ( (victim=who_fighting(ch)) != NULL )
		    target_name = victim->name;
	    }
	    else
		target_name = argument;
	    break;

	case TAR_CHAR_OFFENSIVE:
	    if ( argument[0] == '\0'
	    &&  (victim=who_fighting(ch)) == NULL )
	    {
		ch_printf( ch, "%s who?\n\r", capitalize( skill_table[sn]->name ) );
		return TRUE;
	    }
	    else
	    if ( argument[0] != '\0'
	    &&  (victim=get_char_room(ch, argument)) == NULL )
	    {
		send_to_char( "They aren't here.\n\r", ch );
		return TRUE;
	    }
	    if ( is_safe( ch, victim ) )
		return TRUE;
	    vo = (void *) victim;
	    break;

	case TAR_CHAR_DEFENSIVE:
	    if ( argument[0] != '\0'
	    &&  (victim=get_char_room(ch, argument)) == NULL )
	    {
		send_to_char( "They aren't here.\n\r", ch );
		return TRUE;
	    }
	    if ( !victim )
		victim = ch;
	    vo = (void *) victim;
	    break;

	case TAR_CHAR_SELF:
	    vo = (void *) ch;
	    break;

	case TAR_OBJ_INV:
	    if ( (obj=get_obj_carry(ch, argument)) == NULL )
	    {
		send_to_char( "You can't find that.\n\r", ch );
		return TRUE;
	    }
	    vo = (void *) obj;
	    break;
	}

	/* waitstate */
	WAIT_STATE( ch, skill_table[sn]->beats );
	/* check for failure */
	if ( (number_percent( ) + skill_table[sn]->difficulty * 5)
	   > (IS_NPC(ch) ? 75 : ch->pcdata->learned[sn]) )
	{
	    failed_casting( skill_table[sn], ch, vo, obj );
	    learn_from_failure( ch, sn );
	    if ( mana )
	    {
		  ch->mana -= mana/2;
	    }
	    return TRUE;
	}
	if ( mana )
	{
		ch->mana -= mana;
	}
	start_timer(&time_used);
	retcode = (*skill_table[sn]->spell_fun) ( sn, ch->top_level, ch, vo );
	end_timer(&time_used);
	update_userec(&time_used, &skill_table[sn]->userec);
	
	if ( retcode == rCHAR_DIED || retcode == rERROR )
	    return TRUE;

	if ( char_died(ch) )
	    return TRUE;

	if ( retcode == rSPELL_FAILED )
	{
	    learn_from_failure( ch, sn );
	    retcode = rNONE;
	}
	else
	    learn_from_success( ch, sn );

	if ( skill_table[sn]->target == TAR_CHAR_OFFENSIVE
	&&   victim != ch
	&&  !char_died(victim) )
	{
	    CHAR_DATA *vch;
	    CHAR_DATA *vch_next;

	    for ( vch = ch->in_room->first_person; vch; vch = vch_next )
	    {
		vch_next = vch->next_in_room;
		if ( victim == vch && !victim->fighting && victim->master != ch )
		{
		    retcode = multi_hit( victim, ch, TYPE_UNDEFINED );
		    break;
		}
	    }
	}
	return TRUE;
    }

    if ( mana )
    {
	  ch->mana -= mana;
    }
    ch->prev_cmd = ch->last_cmd;    /* haus, for automapping */
    ch->last_cmd = skill_table[sn]->skill_fun;
    start_timer(&time_used);
    (*skill_table[sn]->skill_fun) ( ch, argument );
    end_timer(&time_used);
    update_userec(&time_used, &skill_table[sn]->userec);

    tail_chain( );
    return TRUE;
}

/*
 * Lookup a skills information
 * High god command
 */
void do_slookup( CHAR_DATA *ch, char *argument )
{
    char buf[MAX_STRING_LENGTH];
    char arg[MAX_INPUT_LENGTH];
    int sn;
    SKILLTYPE *skill = NULL;

    one_argument( argument, arg );
    if ( arg[0] == '\0' )
    {
	send_to_char( "Slookup what?\n\r", ch );
	return;
    }

    if ( !str_cmp( arg, "all" ) )
    {
	for ( sn = 0; sn < top_sn && skill_table[sn] && skill_table[sn]->name; sn++ )
	    pager_printf( ch, "Sn: %4d Slot: %4d Skill/spell: '%-20s' Damtype: %s\n\r",
		sn, skill_table[sn]->slot, skill_table[sn]->name,
		spell_damage[SPELL_DAMAGE( skill_table[sn] )] );
    }
    else
    if ( !str_cmp( arg, "herbs" ) )
    {
	for ( sn = 0; sn < top_herb && herb_table[sn] && herb_table[sn]->name; sn++ )
	   pager_printf( ch, "%d) %s\n\r", sn, herb_table[sn]->name );
    }
    else
    {
	SMAUG_AFF *aff;
	int cnt = 0;

	if ( arg[0] == 'h' && is_number(arg+1) )
	{
	    sn = atoi(arg+1);
	    if ( !IS_VALID_HERB(sn) )
	    {
		send_to_char( "Invalid herb.\n\r", ch );
		return;
	    }
	    skill = herb_table[sn];
	}
	else
	if ( is_number(arg) )
	{
	    sn = atoi(arg);
	    if ( (skill=get_skilltype(sn)) == NULL )
	    {
		send_to_char( "Invalid sn.\n\r", ch );
		return;
	    }
	    sn %= 1000;
	}
	else
	if ( ( sn = skill_lookup( arg ) ) >= 0 )
	    skill = skill_table[sn];
	else
	if ( ( sn = herb_lookup( arg ) ) >= 0 )
	    skill = herb_table[sn];
	else
	{
	    send_to_char( "No such skill, spell, proficiency or tongue.\n\r", ch );
	    return;
	}
	if ( !skill )
	{
	    send_to_char( "Not created yet.\n\r", ch );
	    return;
	}

	ch_printf( ch, "Sn: %4d Slot: %4d %s: '%-20s'\n\r",
	    sn, skill->slot, skill_tname[skill->type], skill->name );
	if ( skill->flags )
	{
	    int x;

	    ch_printf( ch, "Damtype: %s  Acttype: %s   Classtype: %s   Powertype: %s\n\r",
		spell_damage[SPELL_DAMAGE( skill )],
		spell_action[SPELL_ACTION( skill )],
		spell_class[SPELL_CLASS( skill )],
		spell_power[SPELL_POWER( skill )] );
	    strcpy( buf, "Flags:" );
	    for ( x = 11; x < 32; x++ )
	      if ( SPELL_FLAG( skill, 1 << x ) )
	      {
		strcat( buf, " " );
		strcat( buf, spell_flag[x-11] );
	      }
	    strcat( buf, "\n\r" );
	    send_to_char( buf, ch );
	}
	ch_printf( ch, "Saves: %s\n\r", spell_saves[(int) skill->saves] );

	if ( skill->difficulty != '\0' )
	    ch_printf( ch, "Difficulty: %d\n\r", (int) skill->difficulty );

	ch_printf( ch, "Type: %s  Target: %s  Minpos: %d  Mana: %d  Beats: %d\n\r",
		skill_tname[skill->type],
		target_type[URANGE(TAR_IGNORE, skill->target, TAR_OBJ_INV)],
		skill->minimum_position,
		skill->min_mana,
		skill->beats );
	ch_printf( ch, "Flags: %d  Guild: %d  Code: %s\n\r",
		skill->flags,
		skill->guild,
		skill->skill_fun ? skill_name(skill->skill_fun)
					   : spell_name(skill->spell_fun));
	ch_printf( ch, "Dammsg: %s\n\rWearoff: %s\n",
		skill->noun_damage,
		skill->msg_off ? skill->msg_off : "(none set)" );
	if ( skill->dice && skill->dice[0] != '\0' )
	    ch_printf( ch, "Dice: %s\n\r", skill->dice );
	if ( skill->teachers && skill->teachers[0] != '\0' )
	    ch_printf( ch, "Teachers: %s\n\r", skill->teachers );
	if ( skill->components && skill->components[0] != '\0' )
	    ch_printf( ch, "Components: %s\n\r", skill->components );
	if ( skill->participants )
	    ch_printf( ch, "Participants: %d\n\r", (int) skill->participants );
	if ( skill->userec.num_uses )
	    send_timer(&skill->userec, ch);
	for ( aff = skill->affects; aff; aff = aff->next )
	{
	    if ( aff == skill->affects )
	      send_to_char( "\n\r", ch );
	    sprintf( buf, "Affect %d", ++cnt );
	    if ( aff->location )
	    {
		strcat( buf, " modifies " );
		strcat( buf, a_types[aff->location % REVERSE_APPLY] );
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
		  if ( IS_SET(aff->bitvector, 1 << x) )
		  {
		      strcat( buf, " " );
		      strcat( buf, a_flags[x] );
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
	    strcat( buf, "\n\r" );
	    send_to_char( buf, ch );
	    if ( !aff->next )
	      send_to_char( "\n\r", ch );
	}
	if ( skill->hit_char && skill->hit_char[0] != '\0' )
	    ch_printf( ch, "Hitchar   : %s\n\r", skill->hit_char );
	if ( skill->hit_vict && skill->hit_vict[0] != '\0' )
	    ch_printf( ch, "Hitvict   : %s\n\r", skill->hit_vict );
	if ( skill->hit_room && skill->hit_room[0] != '\0' )
	    ch_printf( ch, "Hitroom   : %s\n\r", skill->hit_room );
	if ( skill->miss_char && skill->miss_char[0] != '\0' )
	    ch_printf( ch, "Misschar  : %s\n\r", skill->miss_char );
	if ( skill->miss_vict && skill->miss_vict[0] != '\0' )
	    ch_printf( ch, "Missvict  : %s\n\r", skill->miss_vict );
	if ( skill->miss_room && skill->miss_room[0] != '\0' )
	    ch_printf( ch, "Missroom  : %s\n\r", skill->miss_room );
	if ( skill->die_char && skill->die_char[0] != '\0' )
	    ch_printf( ch, "Diechar   : %s\n\r", skill->die_char );
	if ( skill->die_vict && skill->die_vict[0] != '\0' )
	    ch_printf( ch, "Dievict   : %s\n\r", skill->die_vict );
	if ( skill->die_room && skill->die_room[0] != '\0' )
	    ch_printf( ch, "Dieroom   : %s\n\r", skill->die_room );
	if ( skill->imm_char && skill->imm_char[0] != '\0' )
	    ch_printf( ch, "Immchar   : %s\n\r", skill->imm_char );
	if ( skill->imm_vict && skill->imm_vict[0] != '\0' )
	    ch_printf( ch, "Immvict   : %s\n\r", skill->imm_vict );
	if ( skill->imm_room && skill->imm_room[0] != '\0' )
	    ch_printf( ch, "Immroom   : %s\n\r", skill->imm_room );
	if ( skill->type != SKILL_HERB && skill->guild >= 0 && skill->guild < MAX_ABILITY)
	{
		sprintf(buf, "guild: %s   Align: %4d   lvl: %3d\n\r",
				ability_name[skill->guild], skill->alignment,    skill->min_level );
            send_to_char( buf, ch );
	}
	send_to_char( "\n\r", ch );
    }

    return;
}

/*
 * Set a skill's attributes or what skills a player has.
 * High god command, with support for creating skills/spells/herbs/etc
 */
void do_sset( CHAR_DATA *ch, char *argument )
{
    char arg1 [MAX_INPUT_LENGTH];
    char arg2 [MAX_INPUT_LENGTH];
    CHAR_DATA *victim;
    int value;
    int sn;
    bool fAll;

    argument = one_argument( argument, arg1 );
    argument = one_argument( argument, arg2 );

    if ( arg1[0] == '\0' || arg2[0] == '\0' || argument[0] == '\0' )
    {
	send_to_char( "Syntax: sset <victim> <skill> <value>\n\r",	ch );
	send_to_char( "or:     sset <victim> all     <value>\n\r",	ch );
	if ( get_trust(ch) > LEVEL_SUB_IMPLEM )
	{
	  send_to_char( "or:     sset save skill table\n\r",		ch );
	  send_to_char( "or:     sset save herb table\n\r",		ch );
	  send_to_char( "or:     sset create skill 'new skill'\n\r",	ch );
	  send_to_char( "or:     sset create herb 'new herb'\n\r",	ch );
	}
	if ( get_trust(ch) > LEVEL_GREATER )
	{
	  send_to_char( "or:     sset <sn>     <field> <value>\n\r",	ch );
	  send_to_char( "\n\rField being one of:\n\r",			ch );
	  send_to_char( "  name code target minpos slot mana beats dammsg wearoff guild minlevel\n\r", ch );
	  send_to_char( "  type damtype acttype classtype powertype flag dice value difficulty affect\n\r", ch );
	  send_to_char( "  rmaffect level adept hit miss die imm (char/vict/room)\n\r", ch );
	  send_to_char( "  components teachers\n\r",			ch );
	  send_to_char( "Affect having the fields: <location> <modfifier> [duration] [bitvector]\n\r", ch );
	  send_to_char( "(See AFFECTTYPES for location, and AFFECTED_BY for bitvector)\n\r", ch );
	}
	send_to_char( "Skill being any skill or spell.\n\r",		ch );
	return;
    }

    if ( get_trust(ch) > LEVEL_SUB_IMPLEM
    &&  !str_cmp( arg1, "save" )
    &&	!str_cmp( argument, "table" ) )
    {
	if ( !str_cmp( arg2, "skill" ) )
	{
	    send_to_char( "Saving skill table...\n\r", ch );
	    save_skill_table();
	    return;
	}
	if ( !str_cmp( arg2, "herb" ) )
	{
	    send_to_char( "Saving herb table...\n\r", ch );
	    save_herb_table();
	    return;
	}
    }
    if ( get_trust(ch) > LEVEL_SUB_IMPLEM
    &&  !str_cmp( arg1, "create" )
    && (!str_cmp( arg2, "skill" ) || !str_cmp( arg2, "herb" )) )
    {
	struct skill_type *skill;
	sh_int type = SKILL_UNKNOWN;

	if ( !str_cmp( arg2, "herb" ) )
	{
	    type = SKILL_HERB;
	    if ( top_herb >= MAX_HERB )
	    {
		ch_printf( ch, "The current top herb is %d, which is the maximum.  "
			   "To add more herbs,\n\rMAX_HERB will have to be "
			   "raised in mud.h, and the mud recompiled.\n\r",
			   top_sn );
		return;
	    }
	}
	else
	if ( top_sn >= MAX_SKILL )
	{
	    ch_printf( ch, "The current top sn is %d, which is the maximum.  "
			   "To add more skills,\n\rMAX_SKILL will have to be "
			   "raised in mud.h, and the mud recompiled.\n\r",
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
	skill->noun_damage = str_dup( "" );
	skill->msg_off = str_dup( "" );
	skill->spell_fun = spell_smaug;
	skill->type = type;
	send_to_char( "Done.\n\r", ch );
	return;
    }

    if ( arg1[0] == 'h' )
	sn = atoi( arg1+1 );
    else
	sn = atoi( arg1 );
    if ( get_trust(ch) > LEVEL_GREATER
    && ((arg1[0] == 'h' && is_number(arg1+1) && (sn=atoi(arg1+1))>=0)
    ||  (is_number(arg1) && (sn=atoi(arg1)) >= 0)) )
    {
	struct skill_type *skill;

	if ( arg1[0] == 'h' )
	{
	    if ( sn >= top_herb )
	    {
		send_to_char( "Herb number out of range.\n\r", ch );
		return;
	    }
	    skill = herb_table[sn];
	}
	else
	{
	    if ( (skill=get_skilltype(sn)) == NULL )
	    {
		send_to_char( "Skill number out of range.\n\r", ch );
		return;
	    }
	    sn %= 1000;
	}

	if ( !str_cmp( arg2, "difficulty" ) )
	{
	    skill->difficulty = atoi( argument );
	    send_to_char( "Ok.\n\r", ch );
	    return;
	}
	if ( !str_cmp( arg2, "participants" ) )
	{
	    skill->participants = atoi( argument );
	    send_to_char( "Ok.\n\r", ch );
	    return;
	}
	if ( !str_cmp( arg2, "alignment" ) )
	{
	    skill->alignment = atoi( argument );
	    send_to_char( "Ok.\n\r", ch );
	    return;
	}
	if ( !str_cmp( arg2, "damtype" ) )
	{
	    int x = get_sdamage( argument );

	    if ( x == -1 )
		send_to_char( "Not a spell damage type.\n\r", ch );
	    else
	    {
		SET_SDAM( skill, x );
		send_to_char( "Ok.\n\r", ch );
	    }
	    return;
	}
	if ( !str_cmp( arg2, "acttype" ) )
	{
	    int x = get_saction( argument );

	    if ( x == -1 )
		send_to_char( "Not a spell action type.\n\r", ch );
	    else
	    {
		SET_SACT( skill, x );
		send_to_char( "Ok.\n\r", ch );
	    }
	    return;
	}
	if ( !str_cmp( arg2, "classtype" ) )
	{
	    int x = get_sclass( argument );

	    if ( x == -1 )
		send_to_char( "Not a spell class type.\n\r", ch );
	    else
	    {
		SET_SCLA( skill, x );
		send_to_char( "Ok.\n\r", ch );
	    }
	    return;
	}
	if ( !str_cmp( arg2, "powertype" ) )
	{
	    int x = get_spower( argument );

	    if ( x == -1 )
		send_to_char( "Not a spell power type.\n\r", ch );
	    else
	    {
		SET_SPOW( skill, x );
		send_to_char( "Ok.\n\r", ch );
	    }
	    return;
	}
	if ( !str_cmp( arg2, "flag" ) )
	{
	    int x = get_sflag( argument );

	    if ( x == -1 )
		send_to_char( "Not a spell flag.\n\r", ch );
	    else
	    {
		TOGGLE_BIT( skill->flags, 1 << (x+11) );
		send_to_char( "Ok.\n\r", ch );
	    }
	    return;
	}
	if ( !str_cmp( arg2, "saves" ) )
	{
	    int x = get_ssave( argument );

	    if ( x == -1 )
		send_to_char( "Not a saving type.\n\r", ch );
	    else
	    {
		skill->saves = x;
		send_to_char( "Ok.\n\r", ch );
	    }
	    return;
	}

	if ( !str_cmp( arg2, "code" ) )
	{
	    SPELL_FUN *spellfun;
	    DO_FUN    *dofun;
		
	    if ( (spellfun=spell_function(argument)) != spell_notfound )
	    {
		skill->spell_fun = spellfun;
		skill->skill_fun = NULL;
	    }
	    else
	    if ( (dofun=skill_function(argument)) != skill_notfound )
	    {
		skill->skill_fun = dofun;
		skill->spell_fun = NULL;
	    }
	    else
	    {
		send_to_char( "Not a spell or skill.\n\r", ch );
		return;
	    }
	    send_to_char( "Ok.\n\r", ch );
	    return;
	}

	if ( !str_cmp( arg2, "target" ) )
	{
	    int x = get_starget( argument );

	    if ( x == -1 )
		send_to_char( "Not a valid target type.\n\r", ch );
	    else
	    {
		skill->target = x;
		send_to_char( "Ok.\n\r", ch );
	    }
	    return;
	}
	if ( !str_cmp( arg2, "minpos" ) )
	{
	    skill->minimum_position = URANGE( POS_DEAD, atoi( argument ), POS_DRAG );
	    send_to_char( "Ok.\n\r", ch );
	    return;
	}
	if ( !str_cmp( arg2, "minlevel" ) )
	{
	    skill->min_level = URANGE( 1, atoi( argument ), MAX_SKILL_LEVEL );
	    send_to_char( "Ok.\n\r", ch );
	    return;
	}
	if ( !str_cmp( arg2, "slot" ) )
	{
	    skill->slot = URANGE( 0, atoi( argument ), 30000 );
	    send_to_char( "Ok.\n\r", ch );
	    return;
	}
	if ( !str_cmp( arg2, "mana" ) )
	{
	    skill->min_mana = URANGE( 0, atoi( argument ), 2000 );
	    send_to_char( "Ok.\n\r", ch );
	    return;
	}
	if ( !str_cmp( arg2, "beats" ) )
	{
	    skill->beats = URANGE( 0, atoi( argument ), 120 );
	    send_to_char( "Ok.\n\r", ch );
	    return;
	}
	if ( !str_cmp( arg2, "guild" ) )
	{
	    skill->guild = atoi( argument );
	    send_to_char( "Ok.\n\r", ch );
	    return;
	}
	if ( !str_cmp( arg2, "value" ) )
	{
	    skill->value = atoi( argument );
	    send_to_char( "Ok.\n\r", ch );
	    return;
	}
	if ( !str_cmp( arg2, "type" ) )
	{
	    skill->type = get_skill( argument );
	    send_to_char( "Ok.\n\r", ch );
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
		send_to_char( "This spell has no special affects to remove.\n\r", ch );
		return;
	    }
	    if ( num == 1 )
	    {
		skill->affects = aff->next;
		DISPOSE( aff->duration );
		DISPOSE( aff->modifier );
		DISPOSE( aff );
		send_to_char( "Removed.\n\r", ch );
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
		    send_to_char( "Removed.\n\r", ch );
		    return;
		}
	    }
	    send_to_char( "Not found.\n\r", ch );
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
		loc = get_atype( location+1 ) + REVERSE_APPLY;
	    else
		loc = get_atype( location );
	    if ( (loc % REVERSE_APPLY) < 0
	    ||   (loc % REVERSE_APPLY) >= MAX_APPLY_TYPE )
	    {
		send_to_char( "Unknown affect location.  See AFFECTTYPES.\n\r", ch );
		return;
	    }
	    bit = 0;
	    while ( argument[0] != 0 )
	    {
		argument = one_argument( argument, bitvector );
		if ( (tmpbit=get_aflag( bitvector )) == -1 )
		  ch_printf( ch, "Unknown bitvector: %s.  See AFFECTED_BY\n\r", bitvector );
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
	    send_to_char( "Ok.\n\r", ch );
	    return;
	}
	if ( !str_cmp( arg2, "level" ) )
	{
	    skill->min_level = URANGE( 1, atoi( argument ), MAX_SKILL_LEVEL );
	    send_to_char( "Ok.\n\r", ch );
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
	    send_to_char( "Ok.\n\r", ch );
	    return;
	}
	if ( !str_cmp( arg2, "dammsg" ) )
	{
	    DISPOSE(skill->noun_damage);
	    if ( !str_cmp( argument, "clear" ) )
	      skill->noun_damage = str_dup( "" );
	    else
	      skill->noun_damage = str_dup( argument );
	    send_to_char( "Ok.\n\r", ch );
	    return;
	}
	if ( !str_cmp( arg2, "wearoff" ) )
	{
	    DISPOSE(skill->msg_off);
	    if ( str_cmp( argument, "clear" ) )
	      skill->msg_off = str_dup( argument );
	    send_to_char( "Ok.\n\r", ch );
	    return;
	}
	if ( !str_cmp( arg2, "hitchar" ) )
	{
	    if ( skill->hit_char )
	      DISPOSE(skill->hit_char);
	    if ( str_cmp( argument, "clear" ) )
	      skill->hit_char = str_dup( argument );
	    send_to_char( "Ok.\n\r", ch );
	    return;
	}
	if ( !str_cmp( arg2, "hitvict" ) )
	{
	    if ( skill->hit_vict )
	      DISPOSE(skill->hit_vict);
	    if ( str_cmp( argument, "clear" ) )
	      skill->hit_vict = str_dup( argument );
	    send_to_char( "Ok.\n\r", ch );
	    return;
	}
	if ( !str_cmp( arg2, "hitroom" ) )
	{
	    if ( skill->hit_room )
	      DISPOSE(skill->hit_room);
	    if ( str_cmp( argument, "clear" ) )
	      skill->hit_room = str_dup( argument );
	    send_to_char( "Ok.\n\r", ch );
	    return;
	}
	if ( !str_cmp( arg2, "misschar" ) )
	{
	    if ( skill->miss_char )
	      DISPOSE(skill->miss_char);
	    if ( str_cmp( argument, "clear" ) )
	      skill->miss_char = str_dup( argument );
	    send_to_char( "Ok.\n\r", ch );
	    return;
	}
	if ( !str_cmp( arg2, "missvict" ) )
	{
	    if ( skill->miss_vict )
	      DISPOSE(skill->miss_vict);
	    if ( str_cmp( argument, "clear" ) )
	      skill->miss_vict = str_dup( argument );
	    send_to_char( "Ok.\n\r", ch );
	    return;
	}
	if ( !str_cmp( arg2, "missroom" ) )
	{
	    if ( skill->miss_room )
	      DISPOSE(skill->miss_room);
	    if ( str_cmp( argument, "clear" ) )
	      skill->miss_room = str_dup( argument );
	    send_to_char( "Ok.\n\r", ch );
	    return;
	}
	if ( !str_cmp( arg2, "diechar" ) )
	{
	    if ( skill->die_char )
	      DISPOSE(skill->die_char);
	    if ( str_cmp( argument, "clear" ) )
	      skill->die_char = str_dup( argument );
	    send_to_char( "Ok.\n\r", ch );
	    return;
	}
	if ( !str_cmp( arg2, "dievict" ) )
	{
	    if ( skill->die_vict )
	      DISPOSE(skill->die_vict);
	    if ( str_cmp( argument, "clear" ) )
	      skill->die_vict = str_dup( argument );
	    send_to_char( "Ok.\n\r", ch );
	    return;
	}
	if ( !str_cmp( arg2, "dieroom" ) )
	{
	    if ( skill->die_room )
	      DISPOSE(skill->die_room);
	    if ( str_cmp( argument, "clear" ) )
	      skill->die_room = str_dup( argument );
	    send_to_char( "Ok.\n\r", ch );
	    return;
	}
	if ( !str_cmp( arg2, "immchar" ) )
	{
	    if ( skill->imm_char )
	      DISPOSE(skill->imm_char);
	    if ( str_cmp( argument, "clear" ) )
	      skill->imm_char = str_dup( argument );
	    send_to_char( "Ok.\n\r", ch );
	    return;
	}
	if ( !str_cmp( arg2, "immvict" ) )
	{
	    if ( skill->imm_vict )
	      DISPOSE(skill->imm_vict);
	    if ( str_cmp( argument, "clear" ) )
	      skill->imm_vict = str_dup( argument );
	    send_to_char( "Ok.\n\r", ch );
	    return;
	}
	if ( !str_cmp( arg2, "immroom" ) )
	{
	    if ( skill->imm_room )
	      DISPOSE(skill->imm_room);
	    if ( str_cmp( argument, "clear" ) )
	      skill->imm_room = str_dup( argument );
	    send_to_char( "Ok.\n\r", ch );
	    return;
	}
	if ( !str_cmp( arg2, "dice" ) )
	{
	    if ( skill->dice )
	      DISPOSE(skill->dice);
	    if ( str_cmp( argument, "clear" ) )
	      skill->dice = str_dup( argument );
	    send_to_char( "Ok.\n\r", ch );
	    return;
	}
	if ( !str_cmp( arg2, "components" ) )
	{
	    if ( skill->components )
	      DISPOSE(skill->components);
	    if ( str_cmp( argument, "clear" ) )
	      skill->components = str_dup( argument );
	    send_to_char( "Ok.\n\r", ch );
	    return;
	}
	if ( !str_cmp( arg2, "teachers" ) )
	{
	    if ( skill->teachers )
	      DISPOSE(skill->teachers);
	    if ( str_cmp( argument, "clear" ) )
	      skill->teachers = str_dup( argument );
	    send_to_char( "Ok.\n\r", ch );
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
	    send_to_char( "They aren't here.\n\r", ch );
	return;
    
	send_to_char( "Only on NPC's.\n\r", ch );
	return;
    }

    if ( IS_NPC(victim) )
    {
	send_to_char( "Not on NPC's.\n\r", ch );
	return;
    }
    
    if ( get_trust(ch) < sysdata.level_mset_player && victim != ch)
    {
	send_to_char( "You can't do that.\n\r", ch );
	return;
    }
    	
    fAll = !str_cmp( arg2, "all" );
    sn   = 0;
    if ( !fAll && ( sn = skill_lookup( arg2 ) ) < 0 )
    {
	send_to_char( "No such skill or spell.\n\r", ch );
	return;
    }

    /*
     * Snarf the value.
     */
    if ( !is_number( argument ) )
    {
	send_to_char( "Value must be numeric.\n\r", ch );
	return;
    }

    value = atoi( argument );
    if ( value < 0 || value > 100 )
    {
	send_to_char( "Value range is 0 to 100.\n\r", ch );
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
            && ( victim->skill_level[skill_table[sn]->guild] >= skill_table[sn]->min_level 
                      || value == 0 ) )
              victim->pcdata->learned[sn] = value;
	}
    }
    else
	victim->pcdata->learned[sn] = value;

    return;
}


void learn_from_success( CHAR_DATA *ch, int sn )
{
    int adept, gain, sklvl, learn, percent, chance;

    if ( IS_NPC(ch) || ch->pcdata->learned[sn] <= 0 )
      return;
    
    if ( sn == skill_lookup( "meditate" ) && ch->skill_level[FORCE_ABILITY] < 2 )
      if ( ch->pcdata->learned[sn] < 50 )
         gain_exp( ch, 25, FORCE_ABILITY );
                 
    sklvl = skill_table[sn]->min_level;
    
    if (skill_table[sn]->guild < 0 || skill_table[sn]->guild >= MAX_ABILITY )
            return;
            
    adept = ( ch->skill_level[skill_table[sn]->guild] - skill_table[sn]->min_level )* 5 + 50;
    adept = UMIN(adept, 100);
 
    if ( ch->pcdata->learned[sn] >= adept )
       return;
    
    if ( sklvl == 0 || sklvl > ch->skill_level[skill_table[sn]->guild] )
      sklvl = ch->skill_level[skill_table[sn]->guild];
    if ( ch->pcdata->learned[sn] < 100 )
    {
	chance = ch->pcdata->learned[sn] + (5 * skill_table[sn]->difficulty);
	percent = number_percent();
	if ( percent >= chance )
	  learn = 2;
	else
	if ( chance - percent > 25 )
	  return;
	else
	  learn = 1;
	ch->pcdata->learned[sn] = UMIN( adept, ch->pcdata->learned[sn] + learn );
	if ( ch->pcdata->learned[sn] == 100 )	 /* fully learned! */
	{
	    gain = 50 * sklvl;
     	    set_char_color( AT_WHITE, ch );
	    ch_printf( ch, "You are now an adept of %s!  You gain %d bonus experience!\n\r",
		skill_table[sn]->name, gain );
	}
	else
	{
	    gain = 10 * sklvl;
            if ( !ch->fighting && sn != gsn_hide && sn != gsn_sneak )
	    {
		set_char_color( AT_WHITE, ch );
		ch_printf( ch, "You gain %d experience points from your success!\n\r", gain );
	    }
	}
	gain_exp( ch, gain, skill_table[sn]->guild );
    }
}


void learn_from_failure( CHAR_DATA *ch, int sn )
{
}

void do_gouge( CHAR_DATA *ch, char *argument )
{
    CHAR_DATA *victim;
    AFFECT_DATA af;
    sh_int dam;
    int percent;

    if ( IS_NPC(ch) && IS_AFFECTED( ch, AFF_CHARM ) )
    {
	send_to_char( "You can't concentrate enough for that.\n\r", ch );
	return;
    }

    if ( !IS_NPC(ch) && !ch->pcdata->learned[gsn_gouge] )
    {
	send_to_char("You do not yet know of this skill.\n\r", ch );
	return;
    }

    if ( ch->mount )
    {
	send_to_char( "You can't get close enough while mounted.\n\r", ch );
	return;
    }

    if ( ( victim = who_fighting( ch ) ) == NULL )
    {
	send_to_char( "You aren't fighting anyone.\n\r", ch );
	return;
    }

    percent = number_percent( ) - (get_curr_lck(ch) - 13);

    if ( IS_NPC(ch) || percent < ch->pcdata->learned[gsn_gouge] )
    {
	dam = number_range( 1, ch->skill_level[COMBAT_ABILITY] );
	global_retcode = damage( ch, victim, dam, gsn_gouge );
	if ( global_retcode == rNONE )
	{
		if ( !IS_AFFECTED( victim, AFF_BLIND ) )
		{
		  af.type      = gsn_blindness;
		  af.location  = APPLY_HITROLL;
		  af.modifier  = -6;
		  af.duration  = 3 + (ch->skill_level[COMBAT_ABILITY] / 20);
		  af.bitvector = AFF_BLIND;
		  affect_to_char( victim, &af );
		  act( AT_SKILL, "You can't see a thing!", victim, NULL, NULL, TO_CHAR );
		}
		WAIT_STATE( ch,     PULSE_VIOLENCE );
		WAIT_STATE( victim, PULSE_VIOLENCE );
		/* Taken out by request - put back in by Thoric
		 * This is how it was designed.  You'd be a tad stunned
		 * if someone gouged you in the eye.
		 */
	}
	else
	if ( global_retcode == rVICT_DIED )
	{
		act( AT_BLOOD, "Your fingers plunge into your victim's brain, causing immediate death!",
		     ch, NULL, NULL, TO_CHAR );
	}
	if ( global_retcode != rCHAR_DIED && global_retcode != rBOTH_DIED )
	  learn_from_success( ch, gsn_gouge );
    }
    else
    {
	WAIT_STATE( ch, skill_table[gsn_gouge]->beats );
	global_retcode = damage( ch, victim, 0, gsn_gouge );
	learn_from_failure( ch, gsn_gouge );
    }

    return;
}

void do_detrap( CHAR_DATA *ch, char *argument )
{
    char arg  [MAX_INPUT_LENGTH];
    OBJ_DATA *obj;
    OBJ_DATA *trap;
    int percent;
    bool found;

    switch( ch->substate )
    {
	default:
	    if ( IS_NPC(ch) && IS_AFFECTED( ch, AFF_CHARM ) )
	    {
		send_to_char( "You can't concentrate enough for that.\n\r", ch );
		return;
	    }
	    argument = one_argument( argument, arg );
	    if ( !IS_NPC(ch) && !ch->pcdata->learned[gsn_detrap] )
	    {
		send_to_char("You do not yet know of this skill.\n\r", ch );
		return;
	    }
	    if ( arg[0] == '\0' )
	    {
		send_to_char( "Detrap what?\n\r", ch );
		return;
	    }
	    if ( ms_find_obj(ch) )
		return;
	    found = FALSE;
	    if ( ch->mount )
	    {
		send_to_char( "You can't do that while mounted.\n\r", ch );
		return;
	    }
	    if ( !ch->in_room->first_content )
	    {
	       send_to_char( "You can't find that here.\n\r", ch );
	       return;
	    }
	    for ( obj = ch->in_room->first_content; obj; obj = obj->next_content )
	    {
	       if ( can_see_obj( ch, obj ) && nifty_is_name( arg, obj->name ) )
	       {
		  found = TRUE;
		  break;
	       }
	    }
	    if ( !found )
	    {
	       send_to_char( "You can't find that here.\n\r", ch );
	       return;
	    }
	    act( AT_ACTION, "You carefully begin your attempt to remove a trap from $p...", ch, obj, NULL, TO_CHAR );
	    act( AT_ACTION, "$n carefully attempts to remove a trap from $p...", ch, obj, NULL, TO_ROOM );
	    ch->dest_buf = str_dup( obj->name );
	    add_timer( ch, TIMER_DO_FUN, 3, do_detrap, 1 );
/*	    WAIT_STATE( ch, skill_table[gsn_detrap]->beats ); */
	    return;
	case 1:
	    if ( !ch->dest_buf )
	    {
		send_to_char( "Your detrapping was interrupted!\n\r", ch );
		bug( "do_detrap: ch->dest_buf NULL!", 0 );
		return;
	    }
	    strcpy( arg, ch->dest_buf );
	    DISPOSE( ch->dest_buf );
	    DISPOSE(ch->dest_buf);
	    ch->substate = SUB_NONE;
	    break;
	case SUB_TIMER_DO_ABORT:
	    DISPOSE(ch->dest_buf);
	    ch->substate = SUB_NONE;
	    send_to_char( "You carefully stop what you were doing.\n\r", ch );
	    return;
    }

    if ( !ch->in_room->first_content )
    {
       send_to_char( "You can't find that here.\n\r", ch );
       return;
    }
    for ( obj = ch->in_room->first_content; obj; obj = obj->next_content )
    {
       if ( can_see_obj( ch, obj ) && nifty_is_name( arg, obj->name ) )
       {
	  found = TRUE;
	  break;
       }
    }
    if ( !found )
    {
       send_to_char( "You can't find that here.\n\r", ch );
       return;
    }
    if ( (trap = get_trap( obj )) == NULL )
    {
       send_to_char( "You find no trap on that.\n\r", ch );
       return;
    }

    percent  = number_percent( ) - ( ch->skill_level[SMUGGLING_ABILITY] / 20 ) 
               - (get_curr_lck(ch) - 16);

    separate_obj(obj);
    if ( !IS_NPC(ch) || percent > ch->pcdata->learned[gsn_detrap] )
    {
       send_to_char( "Ooops!\n\r", ch );
       spring_trap( ch, trap );
       learn_from_failure( ch, gsn_detrap );
       return;
    }

    extract_obj( trap );

    send_to_char( "You successfully remove a trap.\n\r", ch );
    learn_from_success( ch, gsn_detrap );
    return;
}

void do_dig( CHAR_DATA *ch, char *argument )
{
    char arg [MAX_INPUT_LENGTH];
    OBJ_DATA *obj;
    OBJ_DATA *startobj;
    bool found, shovel;
    EXIT_DATA *pexit;
   
    switch( ch->substate )
    {
	default:
	  if ( IS_NPC(ch)  && IS_AFFECTED( ch, AFF_CHARM ) )
	  {
	    send_to_char( "You can't concentrate enough for that.\n\r", ch );
	    return;
	  }
          if ( ch->mount )
	  {
	    send_to_char( "You can't do that while mounted.\n\r", ch );
	    return;
	  }
	  one_argument( argument, arg );
	  if ( arg[0] != '\0' )
	  {
	      if ( ( pexit = find_door( ch, arg, TRUE ) ) == NULL
	      &&     get_dir(arg) == -1 )
	      {
		  send_to_char( "What direction is that?\n\r", ch );
		  return;
	      }
	      if ( pexit )
	      {
		  if ( !IS_SET(pexit->exit_info, EX_DIG)
		  &&   !IS_SET(pexit->exit_info, EX_CLOSED) )
		  {
		      send_to_char( "There is no need to dig out that exit.\n\r", ch );
		      return;
		  }
	      }
	  }
	  else
	  {
	      switch( ch->in_room->sector_type )
	      {
		  case SECT_CITY:
		  case SECT_INSIDE:
		    send_to_char( "The floor is too hard to dig through.\n\r", ch );
		    return;
		  case SECT_WATER_SWIM:
		  case SECT_WATER_NOSWIM:
		  case SECT_UNDERWATER:
		    send_to_char( "You cannot dig here.\n\r", ch );
		    return;
		  case SECT_AIR:
		    send_to_char( "What?  In the air?!\n\r", ch );
		    return;
	      }
	  }
	  add_timer( ch, TIMER_DO_FUN, UMIN(skill_table[gsn_dig]->beats / 10, 3), 	
		do_dig, 1);
	  ch->dest_buf = str_dup( arg );
	  send_to_char( "You begin digging...\n\r", ch );
 	  act( AT_PLAIN, "$n begins digging...", ch, NULL, NULL, TO_ROOM );
	  return;

	case 1:
	  if ( !ch->dest_buf )
	  {
	      send_to_char( "Your digging was interrupted!\n\r", ch );
	      act( AT_PLAIN, "$n's digging was interrupted!", ch, NULL, NULL, TO_ROOM );
	      bug( "do_dig: dest_buf NULL", 0 );
	      return;
	  }
	  strcpy( arg, ch->dest_buf );  
	  DISPOSE( ch->dest_buf );	
	  break;

	case SUB_TIMER_DO_ABORT:
	  DISPOSE( ch->dest_buf );
	  ch->substate = SUB_NONE;
	  send_to_char( "You stop digging...\n\r", ch );
	  act( AT_PLAIN, "$n stops digging...", ch, NULL, NULL, TO_ROOM );
	  return;
    }

    ch->substate = SUB_NONE;

    /* not having a shovel makes it harder to succeed */
    shovel = FALSE;
    for ( obj = ch->first_carrying; obj; obj = obj->next_content )
      if ( obj->item_type == ITEM_SHOVEL )
      {
	  shovel = TRUE;
	  break;
      }

    /* dig out an EX_DIG exit... */
    if ( arg[0] != '\0' )
    {
	if ( ( pexit = find_door( ch, arg, TRUE ) ) != NULL
	&&     IS_SET( pexit->exit_info, EX_DIG )
	&&     IS_SET( pexit->exit_info, EX_CLOSED ) )
	{
	    /* 4 times harder to dig open a passage without a shovel */
	    if ( (number_percent() * (shovel ? 1 : 4)) <
		 (IS_NPC(ch) ? 80 : ch->pcdata->learned[gsn_dig]) )
	    {
		REMOVE_BIT( pexit->exit_info, EX_CLOSED );
		send_to_char( "You dig open a passageway!\n\r", ch );
		act( AT_PLAIN, "$n digs open a passageway!", ch, NULL, NULL, TO_ROOM );
		learn_from_success( ch, gsn_dig );
		return;
	    }
	}
	learn_from_failure( ch, gsn_dig );
	send_to_char( "Your dig did not discover any exit...\n\r", ch );
	act( AT_PLAIN, "$n's dig did not discover any exit...", ch, NULL, NULL, TO_ROOM );
	return;
    }

    startobj = ch->in_room->first_content;
    found = FALSE;
    
    for ( obj = startobj; obj; obj = obj->next_content )
    {
	/* twice as hard to find something without a shovel */
	if ( IS_OBJ_STAT( obj, ITEM_BURRIED )
	&&  (number_percent() * (shovel ? 1 : 2)) <
	    (IS_NPC(ch) ? 80 : ch->pcdata->learned[gsn_dig]) )
	{
	  found = TRUE;
	  break;
	}
    }

    if ( !found )
    {
	send_to_char( "Your dig uncovered nothing.\n\r", ch );
	act( AT_PLAIN, "$n's dig uncovered nothing.", ch, NULL, NULL, TO_ROOM );
	learn_from_failure( ch, gsn_dig );
	return;
    }

    separate_obj(obj);
    REMOVE_BIT( obj->extra_flags, ITEM_BURRIED );
    act( AT_SKILL, "Your dig uncovered $p!", ch, obj, NULL, TO_CHAR );
    act( AT_SKILL, "$n's dig uncovered $p!", ch, obj, NULL, TO_ROOM );
    learn_from_success( ch, gsn_dig );
    
    return;
} 

    
void do_search( CHAR_DATA *ch, char *argument )
{
    char arg  [MAX_INPUT_LENGTH];
    OBJ_DATA *obj;
    OBJ_DATA *container;
    OBJ_DATA *startobj;
    int percent, door;
    bool found, room;

    door = -1;
    switch( ch->substate )
    {
	default:
	    if ( IS_NPC(ch) && IS_AFFECTED( ch, AFF_CHARM ) )
	    {
		send_to_char( "You can't concentrate enough for that.\n\r", ch );
		return;
	    }
	    if ( ch->mount )
	    {
		send_to_char( "You can't do that while mounted.\n\r", ch );
		return;
	    }
	    argument = one_argument( argument, arg );
	    if ( arg[0] != '\0' && (door = get_door( arg )) == -1 )
	    {
		container = get_obj_here( ch, arg );
		if ( !container )
		{
		  send_to_char( "You can't find that here.\n\r", ch );
		  return;
		}
		if ( container->item_type != ITEM_CONTAINER )
		{
		  send_to_char( "You can't search in that!\n\r", ch );
		  return;
		}
		if ( IS_SET(container->value[1], CONT_CLOSED) )
		{
		  send_to_char( "It is closed.\n\r", ch );
		  return;
		}
	    }
	    add_timer( ch, TIMER_DO_FUN, UMIN(skill_table[gsn_search]->beats / 10, 3),
		       do_search, 1 );
	    send_to_char( "You begin your search...\n\r", ch );
	    ch->dest_buf = str_dup( arg );
	    return;

	case 1:
	    if ( !ch->dest_buf )
	    {
		send_to_char( "Your search was interrupted!\n\r", ch );
		bug( "do_search: dest_buf NULL", 0 );
		return;
	    }
	    strcpy( arg, ch->dest_buf );
	    DISPOSE( ch->dest_buf );
	    break;
	case SUB_TIMER_DO_ABORT:
	    DISPOSE( ch->dest_buf );
	    ch->substate = SUB_NONE;
	    send_to_char( "You stop your search...\n\r", ch );
	    return;
    }
    ch->substate = SUB_NONE;
    if ( arg[0] == '\0' )
    {
	room = TRUE;
	startobj = ch->in_room->first_content;
    }
    else
    {
	if ( (door = get_door( arg )) != -1 )
	  startobj = NULL;
	else
	{
	    container = get_obj_here( ch, arg );
	    if ( !container )
	    {
		send_to_char( "You can't find that here.\n\r", ch );
		return;
	    }
	    startobj = container->first_content;
	}
    }

    found = FALSE;

    if ( (!startobj && door == -1) || IS_NPC(ch) )
    {
	send_to_char( "You find nothing.\n\r", ch );
	learn_from_failure( ch, gsn_search );
	return;
    }

    percent  = number_percent( );

    if ( door != -1 )
    {
	EXIT_DATA *pexit;
	
	if ( (pexit = get_exit( ch->in_room, door )) != NULL
	&&   IS_SET( pexit->exit_info, EX_SECRET )
	&&   IS_SET( pexit->exit_info, EX_xSEARCHABLE )
	&&   percent < (IS_NPC(ch) ? 80 : ch->pcdata->learned[gsn_search]) )
	{
	    act( AT_SKILL, "Your search reveals the $d!", ch, NULL, pexit->keyword, TO_CHAR );
	    act( AT_SKILL, "$n finds the $d!", ch, NULL, pexit->keyword, TO_ROOM );
	    REMOVE_BIT( pexit->exit_info, EX_SECRET );
	    learn_from_success( ch, gsn_search );
	    return;
	}
    }
    else
    for ( obj = startobj; obj; obj = obj->next_content )
    {
       if ( IS_OBJ_STAT( obj, ITEM_HIDDEN )
       &&   percent < ch->pcdata->learned[gsn_search] )
       {
	  found = TRUE;
	  break;
       }
    }

    if ( !found )
    {
       send_to_char( "You find nothing.\n\r", ch );
       learn_from_failure( ch, gsn_search );
       return;
    }

    separate_obj(obj);
    REMOVE_BIT( obj->extra_flags, ITEM_HIDDEN );
    act( AT_SKILL, "Your search reveals $p!", ch, obj, NULL, TO_CHAR );
    act( AT_SKILL, "$n finds $p!", ch, obj, NULL, TO_ROOM );
    learn_from_success( ch, gsn_search );
    return;
}


void do_steal( CHAR_DATA *ch, char *argument )
{
    char buf  [MAX_STRING_LENGTH];
    char arg1 [MAX_INPUT_LENGTH];
    char arg2 [MAX_INPUT_LENGTH];
    CHAR_DATA *victim, *mst;
    OBJ_DATA *obj , *obj_next;
    int percent, xp;

    argument = one_argument( argument, arg1 );
    argument = one_argument( argument, arg2 );

    if ( ch->mount )
    {
	send_to_char( "You can't do that while mounted.\n\r", ch );
	return;
    }

    if ( arg1[0] == '\0' || arg2[0] == '\0' )
    {
	send_to_char( "Steal what from whom?\n\r", ch );
	return;
    }

    if ( ms_find_obj(ch) )
	return;

    if ( ( victim = get_char_room( ch, arg2 ) ) == NULL )
    {
	send_to_char( "They aren't here.\n\r", ch );
	return;
    }

    if ( victim == ch )
    {
	send_to_char( "That's pointless.\n\r", ch );
	return;
    }

    if ( IS_SET( ch->in_room->room_flags, ROOM_SAFE ) )
    {
	set_char_color( AT_MAGIC, ch );
	send_to_char( "This isn't a good place to do that.\n\r", ch );
	return;
    }

    if ( check_illegal_psteal( ch, victim ) )
    {
	send_to_char( "You can't steal from that player.\n\r", ch );
	return;
    }
    
    WAIT_STATE( ch, skill_table[gsn_steal]->beats );
    percent  = number_percent( ) + ( IS_AWAKE(victim) ? 10 : -50 )
	       - (get_curr_lck(ch) - 15) + (get_curr_lck(victim) - 13) 
	       + times_killed( ch, victim )*7;

    if ( ( IS_SET( victim->immune, RIS_STEAL ) ) || 
       ( victim->position != POS_STUNNED && (victim->position == POS_FIGHTING
    ||   percent > ( IS_NPC(ch) ? 90 : ch->pcdata->learned[gsn_steal] ) ) ) )
    {
	/*
	 * Failure.
	 */
	send_to_char( "Oops...\n\r", ch );
	act( AT_ACTION, "$n tried to steal from you!\n\r", ch, NULL, victim, TO_VICT    );
	act( AT_ACTION, "$n tried to steal from $N.\n\r",  ch, NULL, victim, TO_NOTVICT );

	if (IS_NPC(victim))
	{
	  sprintf( buf, "%s is a bloody thief!", ch->name );
	  do_yell( victim, buf );
	}

	learn_from_failure( ch, gsn_steal );
	if ( !IS_NPC(ch) )
	{
	    if ( legal_loot( ch, victim ) )
	    {
	      if ( IS_NPC(victim) )
		global_retcode = multi_hit( victim, ch, TYPE_UNDEFINED );
	    }
	    else
	    {
		/* log_string( buf ); */
		if ( IS_NPC( ch ) )
		{
		  if ( (mst = ch->master) == NULL )
		    return;
		}
		else
		  mst = ch;
		if ( IS_NPC( mst ) )
		  return;

	    }
	}

	return;
    }
    
    if ( IS_NPC(victim) )
       add_kill( ch, victim );  /* makes it harder to steal from same char */

    if ( !str_cmp( arg1, "credits"  )
    ||   !str_cmp( arg1, "credit" )
    ||   !str_cmp( arg1, "money"  ) )
    {
	int amount;

	amount = (int) (victim->gold * number_range(1, 10) / 100);
	if ( amount <= 0 )
	{
	    send_to_char( "You couldn't get any credits.\n\r", ch );
	    learn_from_failure( ch, gsn_steal );
	    return;
	}

	ch->gold     += amount;
	victim->gold -= amount;
	ch_printf( ch, "Aha!  You got %d credits.\n\r", amount );
       if ( !IS_NPC(victim) || (ch->pcdata->learned[gsn_steal] < 50 ) )
	learn_from_success( ch, gsn_steal );
	
       if ( IS_NPC( victim ) );
        {
          xp = UMIN( amount*10 , ( exp_level( ch->skill_level[SMUGGLING_ABILITY]+1 ) - exp_level( ch->skill_level[SMUGGLING_ABILITY])  ) / 35  );    
          xp = UMIN( xp , xp_compute( ch, victim ) );
          gain_exp( ch, xp , SMUGGLING_ABILITY);  
          ch_printf( ch, "&WYou gain %ld smuggling experience!\n\r", xp );
        }
	return;
    }

    if ( ( obj = get_obj_carry( victim, arg1 ) ) == NULL )
    {
        if ( victim->position <= POS_SLEEPING )
        {   
           if ( ( obj = get_obj_wear( victim, arg1 ) ) != NULL ) 
           {
             if ( (obj_next=get_eq_char(victim, obj->wear_loc)) != obj )
             {
	       ch_printf( ch, "They are wearing %s on top of %s.\n\r", obj_next->short_descr, obj->short_descr);
	       send_to_char( "You'll have to steal that first.\n\r", ch );	
	       learn_from_failure( ch, gsn_steal );
	       return;
             }
             else
               unequip_char( victim, obj );
           }
        }
           
	send_to_char( "You can't seem to find it.\n\r", ch );
	learn_from_failure( ch, gsn_steal );
	return;
    }

    if ( !can_drop_obj( ch, obj )
    ||   IS_OBJ_STAT(obj, ITEM_INVENTORY)
    ||	 IS_OBJ_STAT(obj, ITEM_PROTOTYPE))
    {
	send_to_char( "You can't manage to pry it away.\n\r", ch );
	learn_from_failure( ch, gsn_steal );
	return;
    }

    if ( ch->carry_number + (get_obj_number(obj)/obj->count) > can_carry_n( ch ) )
    {
	send_to_char( "You have your hands full.\n\r", ch );
	learn_from_failure( ch, gsn_steal );
	return;
    }

    if ( ch->carry_weight + (get_obj_weight(obj)/obj->count) > can_carry_w( ch ) )
    {
	send_to_char( "You can't carry that much weight.\n\r", ch );
	learn_from_failure( ch, gsn_steal );
	return;
    }

    send_to_char( "Ok.\n\r", ch );
    if ( IS_NPC(victim)  || ch->pcdata->learned[gsn_steal] )
      learn_from_success( ch, gsn_steal );
    if ( IS_NPC( victim ) );
    {
      xp = UMIN( obj->cost*10 , ( exp_level( ch->skill_level[SMUGGLING_ABILITY]+1) - exp_level( ch->skill_level[SMUGGLING_ABILITY])  ) / 10  );    
      xp = UMIN( xp , xp_compute( ch, victim ) );
      gain_exp( ch, xp, SMUGGLING_ABILITY );  
      ch_printf( ch, "&WYou gain %ld smuggling experience!\n\r", xp );
    }
    separate_obj( obj );
    obj_from_char( obj );
    obj_to_char( obj, ch );
     
    return;
}


void do_backstab( CHAR_DATA *ch, char *argument )
{
    char arg[MAX_INPUT_LENGTH];
    CHAR_DATA *victim;
    OBJ_DATA *obj;
    int percent;

    if ( IS_NPC(ch) && IS_AFFECTED( ch, AFF_CHARM ) )
    {
	send_to_char( "You can't do that right now.\n\r", ch );
	return;
    }

    one_argument( argument, arg );

    if ( ch->mount )
    {
	send_to_char( "You can't get close enough while mounted.\n\r", ch );
	return;
    }

    if ( arg[0] == '\0' )
    {
	send_to_char( "Backstab whom?\n\r", ch );
	return;
    }

    if ( ( victim = get_char_room( ch, arg ) ) == NULL )
    {
	send_to_char( "They aren't here.\n\r", ch );
	return;
    }

    if ( victim == ch )
    {
	send_to_char( "How can you sneak up on yourself?\n\r", ch );
	return;
    }

    if ( is_safe( ch, victim ) )
      return;

    /* Added stabbing weapon. -Narn */
    if ( ( obj = get_eq_char( ch, WEAR_WIELD ) ) == NULL
    ||   ( obj->value[3] != WEAPON_VIBRO_BLADE ) )
    {
	send_to_char( "You need to wield a stabbing weapon.\n\r", ch );
	return;
    }

    if ( victim->fighting )
    {
	send_to_char( "You can't backstab someone who is in combat.\n\r", ch );
	return;
    }

    /* Can backstab a char even if it's hurt as long as it's sleeping. -Narn */
    /* Or if it can't see you. -Ulysses */
    if ( victim->hit < victim->max_hit
      && ( IS_AWAKE(victim) && can_see(victim,ch) ) )
    {
    act( AT_PLAIN, "$N is hurt and suspicious ... you can't sneak up.",
	    ch, NULL, victim, TO_CHAR );
	return;
    }

    percent = number_percent( ) - (get_curr_lck(ch) - 14) 
	      + (get_curr_lck(victim) - 13);

    WAIT_STATE( ch, skill_table[gsn_backstab]->beats );
    if ( !IS_AWAKE(victim)
    ||   IS_NPC(ch)
    ||   percent < ch->pcdata->learned[gsn_backstab] )
    {
	learn_from_success( ch, gsn_backstab );
	global_retcode = multi_hit( ch, victim, gsn_backstab );

    }
    else
    {
	learn_from_failure( ch, gsn_backstab );
	global_retcode = damage( ch, victim, 0, gsn_backstab );
    }
    return;
}


void do_rescue( CHAR_DATA *ch, char *argument )
{
    char arg[MAX_INPUT_LENGTH];
    CHAR_DATA *victim;
    CHAR_DATA *fch;
    int percent;

    if ( IS_NPC(ch) && IS_AFFECTED( ch, AFF_CHARM ) )
    {
	send_to_char( "You can't concentrate enough for that.\n\r", ch );
	return;
    }

    one_argument( argument, arg );
    if ( arg[0] == '\0' )
    {
	send_to_char( "Rescue whom?\n\r", ch );
	return;
    }

    if ( ( victim = get_char_room( ch, arg ) ) == NULL )
    {
	send_to_char( "They aren't here.\n\r", ch );
	return;
    }

    if ( victim == ch )
    {
	send_to_char( "You try and rescue yourself, but fail miserably.\n\r", ch );
	return;
    }

    if ( ch->mount )
    {
	send_to_char( "You can't do that while mounted.\n\r", ch );
	return;
    }

    if ( !IS_NPC(ch) && IS_NPC(victim) )
    {
	send_to_char( "Doesn't need your help!\n\r", ch );
	return;
    }

    if ( ( fch = who_fighting( victim) ) == NULL )
    {
	send_to_char( "They are not fighting right now.\n\r", ch );
	return;
    }

    if ( ch == fch )
    {
	send_to_char( "Rescue them from yourself?\n\r", ch );
	return;
    }
        
    ch->alignment = ch->alignment + 5;
    ch->alignment = URANGE( -1000, ch->alignment, 1000 );
    
    percent = number_percent( ) - (get_curr_lck(ch) - 14) 
	      - (get_curr_lck(victim) - 16);

    WAIT_STATE( ch, skill_table[gsn_rescue]->beats );
    if ( !IS_NPC(ch) && percent > ch->pcdata->learned[gsn_rescue] )
    {
	send_to_char( "You fail the rescue.\n\r", ch );
	act( AT_SKILL, "$n tries to rescue you!", ch, NULL, victim, TO_VICT   );
	act( AT_SKILL, "$n tries to rescue $N!", ch, NULL, victim, TO_NOTVICT );
	learn_from_failure( ch, gsn_rescue );
	return;
    }

    act( AT_SKILL, "You rescue $N!",  ch, NULL, victim, TO_CHAR    );
    act( AT_SKILL, "$n rescues you!", ch, NULL, victim, TO_VICT    );
    act( AT_SKILL, "$n moves in front of $N!",  ch, NULL, victim, TO_NOTVICT );
    
    ch->alignment = ch->alignment + 50;
    ch->alignment = URANGE( -1000, ch->alignment, 1000 );
    
    learn_from_success( ch, gsn_rescue );
    stop_fighting( fch, FALSE );
    stop_fighting( victim, FALSE );
    if ( ch->fighting )
      stop_fighting( ch, FALSE );

    /* check_killer( ch, fch ); */
    set_fighting( ch, fch );
    set_fighting( fch, ch );
    return;
}



void do_kick( CHAR_DATA *ch, char *argument )
{
    CHAR_DATA *victim;
    char logbuf[MAX_STRING_LENGTH];

    if ( IS_NPC(ch) && IS_AFFECTED( ch, AFF_CHARM ) )
    {
	send_to_char( "You can't concentrate enough for that.\n\r", ch );
	return;
    }

    if ( ( victim = who_fighting( ch ) ) == NULL )
    {
	send_to_char( "You aren't fighting anyone.\n\r", ch );
	return;
    }
    
    if ( IS_SET(victim->act, PLR_AFK))
    {
      sprintf( logbuf , "%s just attacked %s with an afk flag on!." , ch->name, victim->name );
      log_string( logbuf );
    }
    

    WAIT_STATE( ch, skill_table[gsn_kick]->beats );
    if ( IS_NPC(ch) || number_percent( ) < ch->pcdata->learned[gsn_kick] )
    {
	learn_from_success( ch, gsn_kick );
	global_retcode = damage( ch, victim, number_range( 1, ch->skill_level[COMBAT_ABILITY] ), gsn_kick );
    }
    else
    {
	learn_from_failure( ch, gsn_kick );
	global_retcode = damage( ch, victim, 0, gsn_kick );
    }
    return;
}

void do_punch( CHAR_DATA *ch, char *argument )
{
    CHAR_DATA *victim;
    char arg[MAX_INPUT_LENGTH];

    if ( IS_NPC(ch) && IS_AFFECTED( ch, AFF_CHARM ) )
    {
	send_to_char( "You can't concentrate enough for that.\n\r", ch );
	return;
    }

    if ( !IS_NPC(ch)
    &&   ch->pcdata->learned[gsn_punch] <= 0 )
    {
	send_to_char(
	    "Your mind races as you realize you have no idea how to do that.\n\r", ch );
	return;
    }

    if ( ( victim = who_fighting( ch ) ) == NULL )
    {

      one_argument( argument, arg );

      if ( arg[0] == '\0' )
      {
	send_to_char( "Punch whom?\n\r", ch );
	return;
      }

      if ( ( victim = get_char_room( ch, arg ) ) == NULL )
      {
	send_to_char( "They aren't here.\n\r", ch );
	return;
      }

      if ( !IS_NPC(victim) )
      {
	send_to_char( "You must MURDER a player.\n\r", ch );
	return;
      }

      if ( victim == ch )
      {
	send_to_char( "You punch yourself.  Ouch!\n\r", ch );
	multi_hit( ch, ch, TYPE_UNDEFINED );
	return;
      }

      if ( is_safe( ch, victim ) )
	return;

      if ( IS_AFFECTED(ch, AFF_CHARM) && ch->master == victim )
      {
        act( AT_PLAIN, "$N is your beloved master.", ch, NULL, victim, TO_CHAR );
	return;
      }

      if ( victim->vip_flags != 0 )
        ch->alignment -= 10;
    }

    WAIT_STATE( ch, skill_table[gsn_punch]->beats );
    if ( IS_NPC(ch) || number_percent( ) < ch->pcdata->learned[gsn_punch] )
    {
	learn_from_success( ch, gsn_punch );
	global_retcode = damage( ch, victim, number_range( 1, ch->skill_level[COMBAT_ABILITY] ), gsn_punch );
    }
    else
    {
	learn_from_failure( ch, gsn_punch );
	global_retcode = damage( ch, victim, 0, gsn_punch );
    }
    return;
}


void do_bite( CHAR_DATA *ch, char *argument )
{
/*
    CHAR_DATA *victim;
    char logbuf[MAX_STRING_LENGTH];

    if ( IS_NPC(ch) && IS_AFFECTED( ch, AFF_CHARM ) )
    {
	send_to_char( "You can't concentrate enough for that.\n\r", ch );
	return;
    }

    if ( ( victim = who_fighting( ch ) ) == NULL )
    {
	send_to_char( "You aren't fighting anyone.\n\r", ch );
	return;
    }
    
    if ( IS_SET(victim->act, PLR_AFK))
    {
      sprintf( logbuf , "%s just attacked %s with an afk flag on!." , ch->name, victim->name );
      log_string( logbuf );
    }
    

    WAIT_STATE( ch, skill_table[gsn_bite]->beats );
    if ( IS_NPC(ch) || number_percent( ) < ch->pcdata->learned[gsn_bite] )
    {
	learn_from_success( ch, gsn_bite ); 
	global_retcode = damage( ch, victim, number_range( 1, ch->skill_level[COMBAT_ABILITY] ), gsn_bite );
    }
    else
    {
	learn_from_failure( ch, gsn_bite );
	global_retcode = damage( ch, victim, 0, gsn_bite );
    }
    */
    return;


}


void do_claw( CHAR_DATA *ch, char *argument )
{

    /*
    CHAR_DATA *victim;
    char logbuf[MAX_STRING_LENGTH];

    if ( IS_NPC(ch) && IS_AFFECTED( ch, AFF_CHARM ) )
    {
	send_to_char( "You can't concentrate enough for that.\n\r", ch );
	return;
    }

    if ( ( victim = who_fighting( ch ) ) == NULL )
    {
	send_to_char( "You aren't fighting anyone.\n\r", ch );
	return;
    }
    
    if ( IS_SET(victim->act, PLR_AFK))
    {
      sprintf( logbuf , "%s just attacked %s with an afk flag on!." , ch->name, victim->name );
      log_string( logbuf );
    }
    

    WAIT_STATE( ch, skill_table[gsn_claw]->beats );
    if ( IS_NPC(ch) || number_percent( ) < ch->pcdata->learned[gsn_claw] )
    {
	learn_from_success( ch, gsn_claw ); 
	global_retcode = damage( ch, victim, number_range( 1, ch->skill_level[COMBAT_ABILITY] ), gsn_claw );
    }
    else
    {
	learn_from_failure( ch, gsn_claw );
	global_retcode = damage( ch, victim, 0, gsn_claw );
    }
    */
    return;

}


void do_sting( CHAR_DATA *ch, char *argument )
{
  /*  CHAR_DATA *victim;
    char logbuf[MAX_STRING_LENGTH];

    if ( IS_NPC(ch) && IS_AFFECTED( ch, AFF_CHARM ) )
    {
	send_to_char( "You can't concentrate enough for that.\n\r", ch );
	return;
    }

    if ( ( victim = who_fighting( ch ) ) == NULL )
    {
	send_to_char( "You aren't fighting anyone.\n\r", ch );
	return;
    }
    
    if ( IS_SET(victim->act, PLR_AFK))
    {
      sprintf( logbuf , "%s just attacked %s with an afk flag on!." , ch->name, victim->name );
      log_string( logbuf );
    }
    

    WAIT_STATE( ch, skill_table[gsn_sting]->beats );
    if ( IS_NPC(ch) || number_percent( ) < ch->pcdata->learned[gsn_sting] )
    {
	learn_from_success( ch, gsn_sting ); 
	global_retcode = damage( ch, victim, number_range( 1, ch->skill_level[COMBAT_ABILITY] ), gsn_sting );
    }
    else
    {
	learn_from_failure( ch, gsn_sting );
	global_retcode = damage( ch, victim, 0, gsn_sting );
    }
    
    */
    return;

}


void do_tail( CHAR_DATA *ch, char *argument )
{/*
    CHAR_DATA *victim;
    char logbuf[MAX_STRING_LENGTH];

    if ( IS_NPC(ch) && IS_AFFECTED( ch, AFF_CHARM ) )
    {
	send_to_char( "You can't concentrate enough for that.\n\r", ch );
	return;
    }

    if ( ( victim = who_fighting( ch ) ) == NULL )
    {
	send_to_char( "You aren't fighting anyone.\n\r", ch );
	return;
    }
    
    if ( IS_SET(victim->act, PLR_AFK))
    {
      sprintf( logbuf , "%s just attacked %s with an afk flag on!." , ch->name, victim->name );
      log_string( logbuf );
    }
    

    WAIT_STATE( ch, skill_table[gsn_tail]->beats );
    if ( IS_NPC(ch) || number_percent( ) < ch->pcdata->learned[gsn_tail] )
    {
	learn_from_success( ch, gsn_tail ); 
	global_retcode = damage( ch, victim, number_range( 1, ch->skill_level[COMBAT_ABILITY] ), gsn_tail );
    }
    else
    {
	learn_from_failure( ch, gsn_tail );
	global_retcode = damage( ch, victim, 0, gsn_tail );
    }
    */
    return;

}


void do_bash( CHAR_DATA *ch, char *argument )
{
    CHAR_DATA *victim;
    int chance;

    if ( IS_NPC(ch) && IS_AFFECTED( ch, AFF_CHARM ) )
    {
	send_to_char( "You can't concentrate enough for that.\n\r", ch );
	return;
    }

    if ( !IS_NPC(ch)
    &&  ch->pcdata->learned[gsn_bash] <= 0  )
    {
	send_to_char(
	    "Your mind races as you realize you have no idea how to do that.\n\r", ch );
	return;
    }

    if ( ( victim = who_fighting( ch ) ) == NULL )
    {
	send_to_char( "You aren't fighting anyone.\n\r", ch );
	return;
    }

   chance = (((get_curr_dex(victim) + get_curr_str(victim))
	   -   (get_curr_dex(ch)     + get_curr_str(ch))) * 10) + 10;
    if ( !IS_NPC(ch) && !IS_NPC(victim) )
      chance += 25;
    if ( victim->fighting && victim->fighting->who != ch )
      chance += 19;
    WAIT_STATE( ch, skill_table[gsn_bash]->beats );
    if ( IS_NPC(ch)
    || (number_percent( ) + chance) < ch->pcdata->learned[gsn_bash] )
    {
	learn_from_success( ch, gsn_bash );
	/* do not change anything here!  -Thoric */
	WAIT_STATE( ch,     2 * PULSE_VIOLENCE );
	WAIT_STATE( victim, 2 * PULSE_VIOLENCE );
	victim->position = POS_SITTING;
	global_retcode = damage( ch, victim, number_range( 1, ch->skill_level[COMBAT_ABILITY]  ), gsn_bash );
    }
    else
    {
	WAIT_STATE( ch,     2 * PULSE_VIOLENCE );
	learn_from_failure( ch, gsn_bash );
	global_retcode = damage( ch, victim, 0, gsn_bash );
    }
    return;
}


void do_stun( CHAR_DATA *ch, char *argument )
{
    CHAR_DATA *victim;
    AFFECT_DATA af;
    int chance;
    bool fail;

    if ( IS_NPC(ch) && IS_AFFECTED( ch, AFF_CHARM ) )
    {
	send_to_char( "You can't concentrate enough for that.\n\r", ch );
	return;
    }

    if ( !IS_NPC(ch)
    &&  ch->pcdata->learned[gsn_stun] <= 0  )
    {
	send_to_char(
	    "Your mind races as you realize you have no idea how to do that.\n\r", ch );
	return;
    }

    if ( ( victim = who_fighting( ch ) ) == NULL )
    {
	send_to_char( "You aren't fighting anyone.\n\r", ch );
	return;
    }

    if ( ch->move < 16 )
    {
	set_char_color( AT_SKILL, ch );
	send_to_char( "You are far too tired to do that.\n\r", ch );
	return;		/* missing return fixed March 11/96 */
    }

    WAIT_STATE( ch, skill_table[gsn_stun]->beats );
    fail = FALSE;
    chance = ris_save( victim, ch->skill_level[COMBAT_ABILITY] , RIS_PARALYSIS );
    if ( chance == 1000 )
      fail = TRUE;
    else
      fail = saves_para_petri( chance, victim );

    chance = (((get_curr_dex(victim) + get_curr_str(victim))
	   -   (get_curr_dex(ch)     + get_curr_str(ch))) * 10) + 10;
    /* harder for player to stun another player */
    if ( !IS_NPC(ch) && !IS_NPC(victim) )
      chance += sysdata.stun_plr_vs_plr;
    else
      chance += sysdata.stun_regular;
    if ( !fail
    && (  IS_NPC(ch)
    || (number_percent( ) + chance) < ch->pcdata->learned[gsn_stun] ) )
    {
	learn_from_success( ch, gsn_stun );
	/*    DO *NOT* CHANGE!    -Thoric    */
	ch->move -= 15;
	WAIT_STATE( ch,     2 * PULSE_VIOLENCE );
	WAIT_STATE( victim, PULSE_VIOLENCE );
	act( AT_SKILL, "$N smashes into you, leaving you stunned!", victim, NULL, ch, TO_CHAR );
	act( AT_SKILL, "You smash into $N, leaving $M stunned!", ch, NULL, victim, TO_CHAR );
	act( AT_SKILL, "$n smashes into $N, leaving $M stunned!", ch, NULL, victim, TO_NOTVICT );
	if ( !IS_AFFECTED( victim, AFF_PARALYSIS ) )
	{
	  af.type      = gsn_stun;
	  af.location  = APPLY_AC;
	  af.modifier  = 20;
	  af.duration  = 3;
	  af.bitvector = AFF_PARALYSIS;
	  affect_to_char( victim, &af );
	  update_pos( victim );
	}
    }
    else
    {
	WAIT_STATE( ch,     2 * PULSE_VIOLENCE );
	ch->move -= 5;
	learn_from_failure( ch, gsn_stun );
	act( AT_SKILL, "$N charges at you screaming, but you dodge out of the way.", victim, NULL, ch, TO_CHAR );
	act( AT_SKILL, "Your attempt to stun $N leaves you racing past $E as $e laughs.", ch, NULL, victim, TO_CHAR );
	act( AT_SKILL, "$n charges screaming at $N, but keeps going right on past.", ch, NULL, victim, TO_NOTVICT );
    }
    return;
}


void do_feed( CHAR_DATA *ch, char *argument )
{
	  send_to_char( "It is not of your nature to feed on living creatures.\n\r", ch );
	  return;
}


/*
 * Disarm a creature.
 * Caller must check for successful attack.
 * Check for loyalty flag (weapon disarms to inventory) for pkillers -Blodkai
 */
void disarm( CHAR_DATA *ch, CHAR_DATA *victim )
{
    OBJ_DATA *obj, *tmpobj;

    if ( ( obj = get_eq_char( victim, WEAR_WIELD ) ) == NULL )
	return;

    if ( ( tmpobj = get_eq_char( victim, WEAR_DUAL_WIELD ) ) != NULL
    &&     number_bits( 1 ) == 0 )
	obj = tmpobj;

    if ( get_eq_char( ch, WEAR_WIELD ) == NULL && number_bits( 1 ) == 0 )
    {
	learn_from_failure( ch, gsn_disarm );
	return;
    }

    if ( IS_NPC( ch ) && !can_see_obj( ch, obj ) && number_bits( 1 ) == 0)
    {
	learn_from_failure( ch, gsn_disarm );
	return;
    }
 
    if ( check_grip( ch, victim ) )
    {
	learn_from_failure( ch, gsn_disarm );
	return;
    }

    act( AT_SKILL, "$n DISARMS you!", ch, NULL, victim, TO_VICT    );
    act( AT_SKILL, "You disarm $N!",  ch, NULL, victim, TO_CHAR    );
    act( AT_SKILL, "$n disarms $N!",  ch, NULL, victim, TO_NOTVICT );
    learn_from_success( ch, gsn_disarm );

    if ( obj == get_eq_char( victim, WEAR_WIELD )
    &&  (tmpobj = get_eq_char( victim, WEAR_DUAL_WIELD)) != NULL )
       tmpobj->wear_loc = WEAR_WIELD;

    obj_from_char( obj );
    obj_to_room( obj, victim->in_room );

    return;
}


void do_disarm( CHAR_DATA *ch, char *argument )
{
    CHAR_DATA *victim;
    OBJ_DATA *obj;
    int percent;

    if ( IS_NPC(ch) && IS_AFFECTED( ch, AFF_CHARM ) )
    {
	send_to_char( "You can't concentrate enough for that.\n\r", ch );
	return;
    }

    if ( !IS_NPC(ch)
    &&   ch->pcdata->learned[gsn_disarm] <= 0  )
    {
	send_to_char( "You don't know how to disarm opponents.\n\r", ch );
	return;
    }

    if ( get_eq_char( ch, WEAR_WIELD ) == NULL )
    {
	send_to_char( "You must wield a weapon to disarm.\n\r", ch );
	return;
    }

    if ( ( victim = who_fighting( ch ) ) == NULL )
    {
	send_to_char( "You aren't fighting anyone.\n\r", ch );
	return;
    }

    if ( ( obj = get_eq_char( victim, WEAR_WIELD ) ) == NULL )
    {
	send_to_char( "Your opponent is not wielding a weapon.\n\r", ch );
	return;
    }

    WAIT_STATE( ch, skill_table[gsn_disarm]->beats );
    percent = number_percent( ) + victim->skill_level[COMBAT_ABILITY]  - ch->skill_level[COMBAT_ABILITY] 
	      - (get_curr_lck(ch) - 15) + (get_curr_lck(victim) - 15);
    if ( !can_see_obj( ch, obj ) )
      percent += 10;
    if ( IS_NPC(ch) || percent < ch->pcdata->learned[gsn_disarm] * 2 / 3 )
	disarm( ch, victim );
    else
    {
	send_to_char( "You failed.\n\r", ch );
	learn_from_failure( ch, gsn_disarm );
    }
    return;
}


/*
 * Trip a creature.
 * Caller must check for successful attack.
 */
void trip( CHAR_DATA *ch, CHAR_DATA *victim )
{
    if ( IS_AFFECTED( victim, AFF_FLYING )
    ||   IS_AFFECTED( victim, AFF_FLOATING ) )
      return;
    if ( victim->mount )
    {
	if ( IS_AFFECTED( victim->mount, AFF_FLYING )
	||   IS_AFFECTED( victim->mount, AFF_FLOATING ) )
	  return;
	act( AT_SKILL, "$n trips your mount and you fall off!", ch, NULL, victim, TO_VICT    );
	act( AT_SKILL, "You trip $N's mount and $N falls off!", ch, NULL, victim, TO_CHAR    );
	act( AT_SKILL, "$n trips $N's mount and $N falls off!", ch, NULL, victim, TO_NOTVICT );
	REMOVE_BIT( victim->mount->act, ACT_MOUNTED );
	victim->mount = NULL;
	WAIT_STATE( ch,     2 * PULSE_VIOLENCE );
	WAIT_STATE( victim, 2 * PULSE_VIOLENCE );
	victim->position = POS_RESTING;
	return;		
    }
    if ( victim->wait == 0 )
    {
	act( AT_SKILL, "$n trips you and you go down!", ch, NULL, victim, TO_VICT    );
	act( AT_SKILL, "You trip $N and $N goes down!", ch, NULL, victim, TO_CHAR    );
	act( AT_SKILL, "$n trips $N and $N goes down!", ch, NULL, victim, TO_NOTVICT );

	WAIT_STATE( ch,     2 * PULSE_VIOLENCE );
	WAIT_STATE( victim, 2 * PULSE_VIOLENCE );
	victim->position = POS_RESTING;
    }

    return;
}


void do_pick( CHAR_DATA *ch, char *argument )
{
    char arg[MAX_INPUT_LENGTH];
    CHAR_DATA *gch;
    OBJ_DATA *obj;
    EXIT_DATA *pexit;
    SHIP_DATA *ship;
    
    if ( IS_NPC(ch) && IS_AFFECTED( ch, AFF_CHARM ) )
    {
	send_to_char( "You can't concentrate enough for that.\n\r", ch );
	return;
    }

    one_argument( argument, arg );

    if ( arg[0] == '\0' )
    {
	send_to_char( "Pick what?\n\r", ch );
	return;
    }

    if ( ms_find_obj(ch) )
	return;

    if ( ch->mount )
    {
	send_to_char( "You can't do that while mounted.\n\r", ch );
	return;
    }

    WAIT_STATE( ch, skill_table[gsn_pick_lock]->beats );

    /* look for guards */
    for ( gch = ch->in_room->first_person; gch; gch = gch->next_in_room )
    {
	if ( IS_NPC(gch) && IS_AWAKE(gch) && ch->skill_level[SMUGGLING_ABILITY]   < gch->top_level )
	{
	act( AT_PLAIN, "$N is standing too close to the lock.",
		ch, NULL, gch, TO_CHAR );
	    return;
	}
    }

    
    if ( ( pexit = find_door( ch, arg, TRUE ) ) != NULL )
    {
	/* 'pick door' */
/*	ROOM_INDEX_DATA *to_room; */ /* Unused */
	EXIT_DATA *pexit_rev;

	if ( !IS_SET(pexit->exit_info, EX_CLOSED) )
	    { send_to_char( "It's not closed.\n\r",        ch ); return; }
	if ( pexit->key < 0 )
	    { send_to_char( "It can't be picked.\n\r",     ch ); return; }
	if ( !IS_SET(pexit->exit_info, EX_LOCKED) )
	    { send_to_char( "It's already unlocked.\n\r",  ch ); return; }
	if ( IS_SET(pexit->exit_info, EX_PICKPROOF) )
	{
	   send_to_char( "You failed.\n\r", ch );
	   learn_from_failure( ch, gsn_pick_lock );
	   check_room_for_traps( ch, TRAP_PICK | trap_door[pexit->vdir] );
	   return;
	}
        
        if ( !IS_NPC(ch) && number_percent( ) > ch->pcdata->learned[gsn_pick_lock] )
        {
	  send_to_char( "You failed.\n\r", ch);
	  learn_from_failure( ch, gsn_pick_lock );
	  return;
        }

	REMOVE_BIT(pexit->exit_info, EX_LOCKED);
	send_to_char( "*Click*\n\r", ch );
	act( AT_ACTION, "$n picks the $d.", ch, NULL, pexit->keyword, TO_ROOM );
	learn_from_success( ch, gsn_pick_lock );
	/* pick the other side */
	if ( ( pexit_rev = pexit->rexit ) != NULL
	&&   pexit_rev->to_room == ch->in_room )
	{
	    REMOVE_BIT( pexit_rev->exit_info, EX_LOCKED );
	}
	check_room_for_traps( ch, TRAP_PICK | trap_door[pexit->vdir] );
        return;
    }

    if ( ( obj = get_obj_here( ch, arg ) ) != NULL )
    {
	if ( obj->item_type != ITEM_CONTAINER )
	    { send_to_char( "You can't pick that.\n\r", ch ); return; }
	if ( !IS_SET(obj->value[1], CONT_CLOSED) )
	    { send_to_char( "It's not closed.\n\r",        ch ); return; }
	if ( obj->value[2] < 0 )
	    { send_to_char( "It can't be unlocked.\n\r",   ch ); return; }
	if ( !IS_SET(obj->value[1], CONT_LOCKED) )
	    { send_to_char( "It's already unlocked.\n\r",  ch ); return; }
	if ( IS_SET(obj->value[1], CONT_PICKPROOF) )
	{
	   send_to_char( "You failed.\n\r", ch );
	   learn_from_failure( ch, gsn_pick_lock );
	   check_for_trap( ch, obj, TRAP_PICK );
	   return;
	}
                  
        if ( !IS_NPC(ch) && number_percent( ) > ch->pcdata->learned[gsn_pick_lock] )
        {
	  send_to_char( "You failed.\n\r", ch);
	  learn_from_failure( ch, gsn_pick_lock );
	  return;
        }

	separate_obj( obj );
	REMOVE_BIT(obj->value[1], CONT_LOCKED);
	send_to_char( "*Click*\n\r", ch );
	act( AT_ACTION, "$n picks $p.", ch, obj, NULL, TO_ROOM );
	learn_from_success( ch, gsn_pick_lock );
	check_for_trap( ch, obj, TRAP_PICK );
	return;
    }
    
    if ( ( ship = ship_in_room(ch->in_room, arg ) ) != NULL )
    {
              DESCRIPTOR_DATA *d;
             
             if ( check_pilot( ch , ship ) )
    	     {
    	            send_to_char("&RWhat would be the point of that!\n\r",ch);
    	            return;
    	     }
    	        
	     if ( ship->shipstate != SHIP_LANDED && ship->shipstate != SHIP_DISABLED )
   	     {
        	send_to_char( "&RThat ship has already started to launch",ch);
        	return;
   	     }
   
   	     WAIT_STATE( ch, skill_table[gsn_pickshiplock]->beats );

   	     if ( IS_NPC(ch) || !ch->pcdata || number_percent( ) > ch->pcdata->learned[gsn_pickshiplock] )
             {
		send_to_char( "You failed.\n\r", ch);
		learn_from_failure( ch, gsn_pickshiplock );
            if ( ship->alarm == 0 )
                return;
                if ( !str_cmp("Public",ship->owner) )
                    return;
            for ( d = first_descriptor; d; d = d->next )
            {
                CHAR_DATA *victim;
                bool victim_comlink;
                OBJ_DATA *obj;
                victim = d->original ? d->original : d->character;

                if ( d->connected != CON_PLAYING )
                  continue;
            
                if ( !check_pilot(victim,ship) )
                    continue;
                
                victim_comlink = FALSE;
                if ( IS_IMMORTAL(victim) )
                    victim_comlink = TRUE;
                for ( obj = victim->last_carrying; obj; obj = obj->prev_content )
                {
                    if ( obj->pIndexData->item_type == ITEM_COMLINK )
                        victim_comlink = TRUE;
                }
                if ( !victim_comlink )
                    continue;
            
                if ( !IS_NPC( victim ) && victim->switched
                && !IS_SET(victim->switched->act, ACT_POLYMORPHED)
                && !IS_AFFECTED(victim->switched, AFF_POSSESS) )
                    continue;
                else if ( !IS_NPC( victim ) && victim->switched
                && (IS_SET(victim->switched->act, ACT_POLYMORPHED)
                || IS_AFFECTED(victim->switched, AFF_POSSESS) ) )
                    victim = victim->switched;
            
                if ( !IS_AWAKE(victim) || IS_SET(victim->in_room->room_flags,ROOM_SILENCE) )
                    continue;
            
                if ( d->connected == CON_EDITING )
                    continue;
            
                ch_printf(victim,"&R[alarm] Attempt to pick %s.\n\r",ship->name);
            }
		return;
             }
 	     
   	     if ( !ship->hatchopen)
             {
   		ship->hatchopen = TRUE;
   		act( AT_PLAIN, "You pick the lock and open the hatch on $T.", ch, NULL, ship->name, TO_CHAR );
   		act( AT_PLAIN, "$n picks open the hatch on $T.", ch, NULL, ship->name, TO_ROOM );
   		echo_to_room( AT_YELLOW , get_room_index(ship->entrance) , "The hatch opens from the outside." );
   		learn_from_success( ch, gsn_pickshiplock );
            if ( ship->alarm == 0 )
                return;
                if ( !str_cmp("Public",ship->owner) )
                    return;
            for ( d = first_descriptor; d; d = d->next )
            {
                CHAR_DATA *victim;
                bool victim_comlink;
                OBJ_DATA *obj;
                victim = d->original ? d->original : d->character;

                if ( d->connected != CON_PLAYING )
                  continue;
            
                if ( !check_pilot(victim,ship) )
                    continue;
                
                victim_comlink = FALSE;
                if ( IS_IMMORTAL(victim) )
                    victim_comlink = TRUE;
                for ( obj = victim->last_carrying; obj; obj = obj->prev_content )
                {
                    if ( obj->pIndexData->item_type == ITEM_COMLINK )
                        victim_comlink = TRUE;
                }
                if ( !victim_comlink )
                    continue;
            
                if ( !IS_NPC( victim ) && victim->switched
                && !IS_SET(victim->switched->act, ACT_POLYMORPHED)
                && !IS_AFFECTED(victim->switched, AFF_POSSESS) )
                    continue;
                else if ( !IS_NPC( victim ) && victim->switched
                && (IS_SET(victim->switched->act, ACT_POLYMORPHED)
                || IS_AFFECTED(victim->switched, AFF_POSSESS) ) )
                    victim = victim->switched;
            
                if ( !IS_AWAKE(victim) || IS_SET(victim->in_room->room_flags,ROOM_SILENCE) )
                    continue;
            
                if ( d->connected == CON_EDITING )
                    continue;
            
                ch_printf(victim,"&R[alarm] %s has been picked!\n\r",ship->name);
            }
	     }
       	     return;
    }

    ch_printf( ch, "You see no %s here.\n\r", arg );
    return;
}



void do_sneak( CHAR_DATA *ch, char *argument )
{
    AFFECT_DATA af;

    if ( IS_NPC(ch) && IS_AFFECTED( ch, AFF_CHARM ) )
    {
	send_to_char( "You can't concentrate enough for that.\n\r", ch );
	return;
    }

    if ( ch->mount )
    {
	send_to_char( "You can't do that while mounted.\n\r", ch );
	return;
    }

    send_to_char( "You attempt to move silently.\n\r", ch );
    affect_strip( ch, gsn_sneak );

    if ( IS_NPC(ch) || number_percent( ) < ch->pcdata->learned[gsn_sneak] )
    {
	af.type      = gsn_sneak;
	af.duration  = ch->skill_level[SMUGGLING_ABILITY]  * DUR_CONV;
	af.location  = APPLY_NONE;
	af.modifier  = 0;
	af.bitvector = AFF_SNEAK;
	affect_to_char( ch, &af );
	learn_from_success( ch, gsn_sneak );
    }
    else
	learn_from_failure( ch, gsn_sneak );

    return;
}



void do_hide( CHAR_DATA *ch, char *argument )
{
    if ( IS_NPC(ch) && IS_AFFECTED( ch, AFF_CHARM ) )
    {
	send_to_char( "You can't concentrate enough for that.\n\r", ch );
	return;
    }

    if ( ch->mount )
    {
	send_to_char( "You can't do that while mounted.\n\r", ch );
	return;
    }

    send_to_char( "You make an attempt at stealth.\n\r", ch );

    if ( IS_AFFECTED(ch, AFF_HIDE) )
	REMOVE_BIT(ch->affected_by, AFF_HIDE);

    if ( IS_NPC(ch) || number_percent( ) < ch->pcdata->learned[gsn_hide] )
    {
	SET_BIT(ch->affected_by, AFF_HIDE);
	learn_from_success( ch, gsn_hide );
    }
    else
	learn_from_failure( ch, gsn_hide );
    return;
}

bool permsneak( CHAR_DATA *ch )
{
	switch(ch->race)
	{
		case RACE_SHISTAVANEN:
		  return TRUE;
		  break;
		case RACE_DEFEL:
		  return TRUE;
		  break;
		case RACE_BOTHAN:
		  return TRUE;
		  break;
		case RACE_TOGARIAN:
		  return TRUE;
		  break;
		case RACE_DUG:
		  return TRUE;
		  break;
		case RACE_COYNITE:
		  return TRUE;
		  break;
		default:
		  return FALSE;
	}
	return FALSE;
}


/*
 * Contributed by Alander.
 */
void do_visible( CHAR_DATA *ch, char *argument )
{
    affect_strip ( ch, gsn_invis			);
    affect_strip ( ch, gsn_mass_invis			);
    affect_strip ( ch, gsn_sneak			);
    if (ch->race != RACE_DEFEL) /* Defel has perm hide */
    REMOVE_BIT   ( ch->affected_by, AFF_HIDE		);
    REMOVE_BIT   ( ch->affected_by, AFF_INVISIBLE	);
    if ( !permsneak(ch) ) /* Noghri has perm sneak */
    REMOVE_BIT   ( ch->affected_by, AFF_SNEAK		);
    send_to_char( "Ok.\n\r", ch );
    return;
}


void do_recall( CHAR_DATA *ch, char *argument )
{
    ROOM_INDEX_DATA *location;
    CHAR_DATA *opponent;

    location = NULL;

    location = get_room_index( wherehome(ch) ); 
    
    if ( get_trust( ch ) < LEVEL_IMMORTAL )
    {
        AREA_DATA * pArea;
    
        if ( !ch->pcdata || !(pArea=ch->pcdata->area) )
        {
	   send_to_char( "Only builders can recall.\n\r", ch );
	   return;
        }   
        
        if  ( ch->in_room->vnum < pArea->low_r_vnum
        || ch->in_room->vnum > pArea->hi_r_vnum )
        {
	   send_to_char( "You can only recall from your assigned area.\n\r", ch );
	   return;
        }   
    }
    
    if ( !location )
    {
	send_to_char( "You are completely lost.\n\r", ch );
	return;
    }

    if ( ch->in_room == location )
	return;

/*    if ( IS_SET(ch->in_room->room_flags, ROOM_NO_RECALL) )
    {
	send_to_char( "For some strange reason... nothing happens.\n\r", ch );
	return;
    }*/

    if ( IS_SET(ch->affected_by, AFF_CURSE) )
    {
        send_to_char("You are cursed and cannot recall!\n\r", ch );
        return;
    }

    if ( ( opponent = who_fighting( ch ) ) != NULL )
    {

	if ( number_bits( 1 ) == 0 || ( !IS_NPC( opponent ) && number_bits( 3 ) > 1 ) )
	{
	    WAIT_STATE( ch, 4 );
	    ch_printf( ch, "You failed!\n\r" );
	    return;
	}

	ch_printf( ch, "You recall from combat!\n\r" );
	stop_fighting( ch, TRUE );
    }

    act( AT_ACTION, "$n disappears in a swirl of the Force.", ch, NULL, NULL, TO_ROOM );
    char_from_room( ch );
    char_to_room( ch, location );
    if ( ch->mount )
    {
	char_from_room( ch->mount );
	char_to_room( ch->mount, location );
    }
    act( AT_ACTION, "$n appears in a swirl of the Force.", ch, NULL, NULL, TO_ROOM );
    do_look( ch, "auto" );

    return;
}


void do_aid( CHAR_DATA *ch, char *argument )
{
    char arg[MAX_INPUT_LENGTH];
    CHAR_DATA *victim;
    int percent;

    if ( IS_NPC(ch) && IS_AFFECTED( ch, AFF_CHARM ) )
    {
	send_to_char( "You can't concentrate enough for that.\n\r", ch );
	return;
    }

    one_argument( argument, arg );
    if ( arg[0] == '\0' )
    {
	send_to_char( "Aid whom?\n\r", ch );
	return;
    }

    if ( ( victim = get_char_room( ch, arg ) ) == NULL )
    {
	send_to_char( "They aren't here.\n\r", ch );
	return;
    }

    if ( ch->mount )
    {
	send_to_char( "You can't do that while mounted.\n\r", ch );
	return;
    }

    if ( victim == ch )
    {
	send_to_char( "Aid yourself?\n\r", ch );
	return;
    }

    if ( victim->position > POS_STUNNED )
    {
	act( AT_PLAIN, "$N doesn't need your help.", ch, NULL, victim,
	     TO_CHAR);
	return;
    }

    if ( victim->hit <= -400 )
    {
	act( AT_PLAIN, "$N's condition is beyond your aiding ability.", ch,
	     NULL, victim, TO_CHAR);
	return;
    }

    ch->alignment = ch->alignment + 20;
    ch->alignment = URANGE( -1000, ch->alignment, 1000 );

    percent = number_percent( ) - (get_curr_lck(ch) - 13);
    WAIT_STATE( ch, skill_table[gsn_aid]->beats );
    if ( !IS_NPC(ch) && percent > ch->pcdata->learned[gsn_aid] )
    {
	send_to_char( "You fail.\n\r", ch );
	learn_from_failure( ch, gsn_aid );
	return;
    }
    
    ch->alignment = ch->alignment + 20;
    ch->alignment = URANGE( -1000, ch->alignment, 1000 );
    
    act( AT_SKILL, "You aid $N!",  ch, NULL, victim, TO_CHAR    );
    act( AT_SKILL, "$n aids $N!",  ch, NULL, victim, TO_NOTVICT );
    learn_from_success( ch, gsn_aid );
    if ( victim->hit < 1 )
      victim->hit = 1;

    update_pos( victim );
    act( AT_SKILL, "$n aids you!", ch, NULL, victim, TO_VICT    );
    return;
}


void do_mount( CHAR_DATA *ch, char *argument )
{
    CHAR_DATA *victim;

    if ( !IS_NPC(ch)
    &&   ch->pcdata->learned[gsn_mount] <= 0  )
    {
	send_to_char(
	    "I don't think that would be a good idea...\n\r", ch );
	return;
    }

    if ( ch->mount )
    {
	send_to_char( "You're already mounted!\n\r", ch );
	return;
    }

    if ( ( victim = get_char_room( ch, argument ) ) == NULL )
    {
	send_to_char( "You can't find that here.\n\r", ch );
	return;
    }

    if ( !IS_NPC(victim) || !IS_SET(victim->act, ACT_MOUNTABLE ) )
    {
	send_to_char( "You can't mount that!\n\r", ch );
	return;
    }

    if ( IS_SET(victim->act, ACT_MOUNTED ) )
    {
	send_to_char( "That mount already has a rider.\n\r", ch );
	return;
    }

    if ( victim->position < POS_STANDING )
    {
	send_to_char( "Your mount must be standing.\n\r", ch );
	return;
    }

    if ( victim->position == POS_FIGHTING || victim->fighting )
    {
	send_to_char( "Your mount is moving around too much.\n\r", ch );
	return;
    }

    WAIT_STATE( ch, skill_table[gsn_mount]->beats );
    if ( IS_NPC(ch) || number_percent( ) < ch->pcdata->learned[gsn_mount] )
    {
	SET_BIT( victim->act, ACT_MOUNTED );
	ch->mount = victim;
	act( AT_SKILL, "You mount $N.", ch, NULL, victim, TO_CHAR );
	act( AT_SKILL, "$n skillfully mounts $N.", ch, NULL, victim, TO_NOTVICT );
	act( AT_SKILL, "$n mounts you.", ch, NULL, victim, TO_VICT );
	learn_from_success( ch, gsn_mount );
	ch->position = POS_MOUNTED;
    }
    else
    {
	act( AT_SKILL, "You unsuccessfully try to mount $N.", ch, NULL, victim, TO_CHAR );
	act( AT_SKILL, "$n unsuccessfully attempts to mount $N.", ch, NULL, victim, TO_NOTVICT );
	act( AT_SKILL, "$n tries to mount you.", ch, NULL, victim, TO_VICT );
	learn_from_failure( ch, gsn_mount );
    }
    return;
}


void do_dismount( CHAR_DATA *ch, char *argument )
{
    CHAR_DATA *victim;

    if ( (victim = ch->mount) == NULL )
    {
	send_to_char( "You're not mounted.\n\r", ch );
	return;	
    }

    WAIT_STATE( ch, skill_table[gsn_mount]->beats );
    if ( IS_NPC(ch) || number_percent( ) < ch->pcdata->learned[gsn_mount] )
    {
	act( AT_SKILL, "You dismount $N.", ch, NULL, victim, TO_CHAR );
	act( AT_SKILL, "$n skillfully dismounts $N.", ch, NULL, victim, TO_NOTVICT );
	act( AT_SKILL, "$n dismounts you.  Whew!", ch, NULL, victim, TO_VICT );
	REMOVE_BIT( victim->act, ACT_MOUNTED );
	ch->mount = NULL;
	ch->position = POS_STANDING;
	learn_from_success( ch, gsn_mount );
    }
    else
    {
	act( AT_SKILL, "You fall off while dismounting $N.  Ouch!", ch, NULL, victim, TO_CHAR );
	act( AT_SKILL, "$n falls off of $N while dismounting.", ch, NULL, victim, TO_NOTVICT );
	act( AT_SKILL, "$n falls off your back.", ch, NULL, victim, TO_VICT );
	learn_from_failure( ch, gsn_mount );
	REMOVE_BIT( victim->act, ACT_MOUNTED );
	ch->mount = NULL;
	ch->position = POS_SITTING;
	global_retcode = damage( ch, ch, 1, TYPE_UNDEFINED );
    }
    return;
}


/**************************************************************************/


/*
 * Check for parry.
 */
bool check_parry( CHAR_DATA *ch, CHAR_DATA *victim )
{
    int chances;
    OBJ_DATA *wield;

    if ( !IS_AWAKE(victim) )
	return FALSE;

    if ( IS_NPC(victim) && !IS_SET(victim->defenses, DFND_PARRY) )
      return FALSE;

    if ( IS_NPC(victim) )
    {
	/* Tuan was here.  :)   *** so was Durga :p *** */
	chances	= UMIN( 60, victim->skill_level[COMBAT_ABILITY]  );
    }
    else
    {
	if ( ( wield = get_eq_char( victim, WEAR_WIELD ) ) == NULL ||
            ( wield->value[3] != WEAPON_LIGHTSABER ) )
	{
	   if ( ( wield = get_eq_char( victim, WEAR_DUAL_WIELD ) ) == NULL ||
            ( wield->value[3] != WEAPON_LIGHTSABER ) )
              return FALSE;
	}
	chances = (int) (victim->pcdata->learned[gsn_parry] );
    }
    
    chances = URANGE ( 10 , chances , 90 );
 
    if ( number_range( 1, 100 ) > chances )
    {
	learn_from_failure( victim, gsn_parry );
	return FALSE;
    }
    if ( !IS_NPC(victim)
         && !IS_SET( victim->pcdata->flags, PCFLAG_GAG) ) /*SB*/
    act( AT_SKILL, "You parry $n's attack.",  ch, NULL, victim, TO_VICT    );

    if ( !IS_NPC(ch)
         && !IS_SET( ch->pcdata->flags, PCFLAG_GAG) )  /* SB */   
    act( AT_SKILL, "$N parries your attack.", ch, NULL, victim, TO_CHAR    );

    learn_from_success( victim, gsn_parry );
    return TRUE;
}



/*
 * Check for dodge.
 */
bool check_dodge( CHAR_DATA *ch, CHAR_DATA *victim )
{
    int chances;

    if ( !IS_AWAKE(victim) )
	return FALSE;

    if ( IS_NPC(victim) && !IS_SET(victim->defenses, DFND_DODGE) )
      return FALSE;

    if ( IS_NPC(victim) )
	chances  = UMIN( 60, victim->top_level );
    else
        chances  = (int) (victim->pcdata->learned[gsn_dodge] / 2);

    chances += 5*(get_curr_dex(victim) - 20);

    if ( number_range( 1, 100 ) > chances )
    {
	learn_from_failure( victim, gsn_dodge );
        return FALSE;
    }

    if ( !IS_NPC(victim) && !IS_SET( victim->pcdata->flags, PCFLAG_GAG) )    
    act( AT_SKILL, "You dodge $n's attack.", ch, NULL, victim, TO_VICT    );
    
    if ( !IS_NPC(ch) && !IS_SET( ch->pcdata->flags, PCFLAG_GAG) ) 
    act( AT_SKILL, "$N dodges your attack.", ch, NULL, victim, TO_CHAR    );

    learn_from_success( victim, gsn_dodge );
    return TRUE;
}

void do_poison_weapon( CHAR_DATA *ch, char *argument )
{
  OBJ_DATA *obj;
  OBJ_DATA *pobj;
  OBJ_DATA *wobj;
  char      arg [ MAX_INPUT_LENGTH ];
  int       percent;

  if ( !IS_NPC( ch )
  &&  ch->pcdata->learned[gsn_poison_weapon] <= 0  )
    {
    send_to_char( "What do you think you are, a thief?\n\r", ch );
    return;
    }

  one_argument( argument, arg );

    if ( arg[0] == '\0' )
    {
	send_to_char( "What are you trying to poison?\n\r",    ch );
	return;
    }
    if ( ch->fighting )
    {
	send_to_char( "While you're fighting?  Nice try.\n\r", ch );
	return;
    }
    if ( ms_find_obj(ch) )
	return;

    if ( !( obj = get_obj_carry( ch, arg ) ) )
    {
	send_to_char( "You do not have that weapon.\n\r",      ch );
	return;
    }
    if ( obj->item_type != ITEM_WEAPON )
    {
	send_to_char( "That item is not a weapon.\n\r",        ch );
	return;
    }
    if ( obj->value[3] != WEAPON_VIBRO_BLADE && obj->value[3] != WEAPON_FORCE_PIKE )
    {
	send_to_char( "You can not apply poison to that.\n\r",        ch );
	return;
    }

    if ( IS_OBJ_STAT( obj, ITEM_POISONED ) )
    {
	send_to_char( "That weapon is already poisoned.\n\r",  ch );
	return;
    }
    /* Now we have a valid weapon...check to see if we have the powder. */
    for ( pobj = ch->first_carrying; pobj; pobj = pobj->next_content )
    {
	if ( pobj->pIndexData->vnum == OBJ_VNUM_BLACK_POWDER )
	break;
    }
    if ( !pobj )
    {
	send_to_char( "You do not have the black poison powder.\n\r", ch );
	return;
    }
    /* Okay, we have the powder...do we have water? */
    for ( wobj = ch->first_carrying; wobj; wobj = wobj->next_content )
    {
	if ( wobj->item_type == ITEM_DRINK_CON
	&& wobj->value[1]  >  0
	&& wobj->value[2]  == 0 )
	break;
    }
    if ( !wobj )
    {
	send_to_char( "You have no water to mix with the powder.\n\r", ch );
	return;
    }
    /* And does the thief have steady enough hands? */
    if ( !IS_NPC( ch )
    &&  ( ch->pcdata->condition[COND_DRUNK] > 0 ) ) 
    {
	send_to_char("Your hands aren't steady enough to properly mix the poison.\n\r", ch );
	return;
    }
    WAIT_STATE( ch, skill_table[gsn_poison_weapon]->beats );
  
    percent = (number_percent( ) - get_curr_lck(ch) - 14);

    /* Check the skill percentage */
    separate_obj( pobj );
    separate_obj( wobj );
    if ( !IS_NPC( ch )
    && percent > ch->pcdata->learned[gsn_poison_weapon] )
    {
	set_char_color( AT_RED, ch );
	send_to_char( "You failed and spill some on yourself.  Ouch!\n\r", ch );
	set_char_color( AT_GREY, ch );
	damage( ch, ch, ch->skill_level[HUNTING_ABILITY] , gsn_poison_weapon );
	act(AT_RED, "$n spills the poison all over!", ch, NULL, NULL, TO_ROOM );
	extract_obj( pobj );
	extract_obj( wobj );
	learn_from_failure( ch, gsn_poison_weapon );
	return;
    }
    separate_obj( obj );
    /* Well, I'm tired of waiting.  Are you? */
    act(AT_RED, "You mix $p in $P, creating a deadly poison!", ch, pobj, wobj, TO_CHAR );
    act(AT_RED, "$n mixes $p in $P, creating a deadly poison!",ch, pobj, wobj, TO_ROOM );
    act(AT_GREEN, "You pour the poison over $p, which glistens wickedly!",ch, obj, NULL, TO_CHAR  );
    act(AT_GREEN, "$n pours the poison over $p, which glistens wickedly!",ch, obj, NULL, TO_ROOM  );
    SET_BIT( obj->extra_flags, ITEM_POISONED );
    obj->cost *= ch->skill_level[HUNTING_ABILITY]/2;
    /* Set an object timer.  Don't want proliferation of poisoned weapons */
    obj->timer = 10 + ch->skill_level[HUNTING_ABILITY] ;

    if ( IS_OBJ_STAT( obj, ITEM_BLESS ) )
    obj->timer *= 2;

    if ( IS_OBJ_STAT( obj, ITEM_MAGIC ) )
    obj->timer *= 2;

    /* WHAT?  All of that, just for that one bit?  How lame. ;) */
   act(AT_BLUE, "The remainder of the poison eats through $p.", ch, wobj, NULL, TO_CHAR );
   act(AT_BLUE, "The remainder of the poison eats through $p.", ch, wobj, NULL, TO_ROOM );
   extract_obj( pobj );
   extract_obj( wobj );
   learn_from_success( ch, gsn_poison_weapon );
   return;
}


/* Re-worked by Sadiq to allow PCs to scribe up to 3 spells on a single *

 * scroll. Second and third spells progressive increase the chance of   *

 * destroying the scroll.  --Sadiq                                      */



void do_scribe( CHAR_DATA *ch, char *argument )

{

    OBJ_DATA *scroll;

    int sn;

    char buf1[MAX_STRING_LENGTH];

    char buf2[MAX_STRING_LENGTH];

    char buf3[MAX_STRING_LENGTH];

    int mana;

 

    if ( IS_NPC(ch) )

        return;

    if ( argument[0] == '\0' || !str_cmp(argument, "") )

    {

        send_to_char( "Scribe what?\n\r", ch );

        return;

    }

 

    if ( ms_find_obj(ch) )

        return;

 

    if ( (sn = find_spell( ch, argument, TRUE )) < 0 && (sn = find_skill( ch, argument, TRUE )) )

    {

         send_to_char( "You have not learned that spell.\n\r", ch );

         return;

    }

 

    if ( skill_table[sn]->spell_fun == spell_null )

    {

        send_to_char( "That's not a spell!\n\r", ch );

        return;

    }

 

    if ( SPELL_FLAG(skill_table[sn], SF_NOSCRIBE) )

    {

        send_to_char( "You cannot scribe that spell.\n\r", ch );

        return;

    }

 

    mana = IS_NPC(ch) ? 0 : skill_table[sn]->min_mana;

 

    mana *=5;

 

    if ( !IS_NPC(ch) && ch->mana < mana )

    {

        send_to_char( "You don't have enough mana.\n\r", ch );

         return;

    }

 

     if ( ( scroll = get_eq_char( ch, WEAR_HOLD ) ) == NULL )

     {

        send_to_char( "You must be holding a blank scroll to scribe it.\n\r", ch );

        return;

     }

 

     if( scroll->pIndexData->vnum != OBJ_VNUM_SCROLL_SCRIBING )

     {

        send_to_char( "You must be holding a blank scroll to scribe it.\n\r", ch );

        return;

     }

 

     if ( ( scroll->value[1] != -1 ) && ( scroll->value[2] != -1)

     && ( scroll->value[3] != -1)

     && ( scroll->pIndexData->vnum == OBJ_VNUM_SCROLL_SCRIBING ) )

     {

        send_to_char( "That scroll has already contains as much magic as it can hold.\n\r", ch);

        return;

     }

 

     if ( !process_spell_components( ch, sn ) )

     {

        learn_from_failure( ch, gsn_scribe );

        ch->mana -= (mana / 2);

        return;

     }

 

     if ( !IS_NPC(ch) && number_percent( ) > ch->pcdata->learned[gsn_scribe] )

     {

       set_char_color ( AT_MAGIC, ch );

       send_to_char("The magic surges outof control and destroys the scroll!.\n\r", ch);

       learn_from_failure( ch, gsn_scribe );

       ch->mana -= (mana / 2);

       extract_obj(scroll);

         return;

     }

 

    if ( scroll->value[1] == -1 )

     {

     scroll->value[1] = sn;

     scroll->value[0] = ch->top_level;

     sprintf(buf1, "scribed book" );

     STRFREE(scroll->short_descr);

     scroll->short_descr = STRALLOC( aoran(buf1) );

     sprintf(buf2, "A scribed book lies in the dust." );

     STRFREE(scroll->description);

     scroll->description = STRALLOC(buf2);

     sprintf(buf3, "scroll scribing scribed book %s", skill_table[sn]->name);

     STRFREE(scroll->name);

     scroll->name = STRALLOC(buf3);

 

     act( AT_MAGIC, "$n writes a book.",   ch, scroll, NULL, TO_ROOM );

     act( AT_MAGIC, "You write $p.",   ch, scroll, NULL, TO_CHAR );

 

     learn_from_success( ch, gsn_scribe );

     ch->mana -= mana;

     return;

     }



    if ( scroll->value[2] == -1 )

     {

      if ( number_percent( ) > 50 )

       {

        set_char_color ( AT_MAGIC, ch );

        send_to_char("The magic surges out of control and destroys the book!.\n\r", ch);

        learn_from_failure( ch, gsn_scribe );

        ch->mana -= (mana / 2);

        extract_obj(scroll);

        return;

       }

      if (scroll->value[0] > ch->top_level )

       {

        scroll->value[0] = ch->top_level;

       }

      

      scroll->value[2] = sn;

      set_char_color(AT_MAGIC, ch);

      ch_printf( ch, "You imbue the scroll with %s.\n\r", skill_table[sn]->name);

      learn_from_success(ch, gsn_scribe);

      ch->mana -= mana;

      return;

     }



    if ( scroll->value[3] == -1 )

     {

      if ( number_percent( ) > 30 )

       {

        set_char_color ( AT_MAGIC, ch );

        send_to_char("The magic surges outof control and destroys the scroll!.\n\r", ch);

        learn_from_failure( ch, gsn_scribe );

        ch->mana -= (mana / 2);

        extract_obj(scroll);

        return;

       }

      if (scroll->value[0] > ch->top_level )

       {

        scroll->value[0] = ch->top_level;

       }

      

      scroll->value[3] = sn;

      set_char_color(AT_MAGIC, ch);

      ch_printf( ch, "You imbue the scroll with %s.\n\r", skill_table[sn]->name);

      learn_from_success(ch, gsn_scribe);

      ch->mana -= mana;

      return;

     }

 }

void do_brew( CHAR_DATA *ch, char *argument )
{
}

bool check_grip( CHAR_DATA *ch, CHAR_DATA *victim )
{
    int chance;

    if ( !IS_AWAKE(victim) )
	return FALSE;

    if ( IS_NPC(victim) && !IS_SET(victim->defenses, DFND_GRIP) )
      return FALSE;

    if ( IS_NPC(victim) )
	chance  = UMIN( 60, 2 * victim->top_level );
    else
        chance  = (int) (victim->pcdata->learned[gsn_grip] / 2);

    /* Consider luck as a factor */
    chance += (2 * (get_curr_lck(victim) - 13 ) );

    if ( number_percent( ) >= chance + victim->top_level - ch->top_level )
    {
	learn_from_failure( victim, gsn_grip );
        return FALSE;
    }
    act( AT_SKILL, "You evade $n's attempt to disarm you.", ch, NULL, victim, TO_VICT    );
    act( AT_SKILL, "$N holds $S weapon strongly, and is not disarmed.", 
  	 ch, NULL, victim, TO_CHAR    );
    learn_from_success( victim, gsn_grip );
    return TRUE;
}

void do_circle( CHAR_DATA *ch, char *argument )
{
    char arg[MAX_INPUT_LENGTH];
    CHAR_DATA *victim;
    OBJ_DATA *obj;
    int percent;

    if ( IS_NPC(ch) && IS_AFFECTED( ch, AFF_CHARM ) )
    {
	send_to_char( "You can't concentrate enough for that.\n\r", ch );
	return;
    }

    one_argument( argument, arg );

    if ( ch->mount )
    {
	send_to_char( "You can't circle while mounted.\n\r", ch );
	return;
    }

    if ( arg[0] == '\0' )
    {
	send_to_char( "Circle around whom?\n\r", ch );
	return;
    }

    if ( ( victim = get_char_room( ch, arg ) ) == NULL )
    {
	send_to_char( "They aren't here.\n\r", ch );
	return;
    }

    if ( victim == ch )
    {
	send_to_char( "How can you sneak up on yourself?\n\r", ch );
	return;
    }

    if ( is_safe( ch, victim ) )
      return;

    if ( ( obj = get_eq_char( ch, WEAR_WIELD ) ) == NULL
    ||   ( obj->value[3] != 11 && obj->value[3] != 2 ) )
    {
	send_to_char( "You need to wield a piercing or stabbing weapon.\n\r", ch );
	return;
    }

    if ( !ch->fighting )
    { 
	send_to_char( "You can't circle when you aren't fighting.\n\r", ch);
	return;
    }

    if ( !victim->fighting )
    {
	send_to_char( "You can't circle around a person who is not fighting.\n\r", ch );
	return;
    }

    if ( victim->num_fighting < 2 )
    {
    act( AT_PLAIN, "You can't circle around them without a distraction.",
	    ch, NULL, victim, TO_CHAR );
	return;
    }

    percent = number_percent( ) - (get_curr_lck(ch) - 16) 
	      + (get_curr_lck(victim) - 13);
    
     WAIT_STATE( ch, skill_table[gsn_circle]->beats );
    if ( percent < (IS_NPC(ch) ? (ch->skill_level[HUNTING_ABILITY]  * 1.5) : ch->pcdata->learned[gsn_circle]) )
    {
	learn_from_success( ch, gsn_circle );
	global_retcode = multi_hit( ch, victim, gsn_circle );
		
    }
    else
    {
	learn_from_failure( ch, gsn_circle );
	global_retcode = damage( ch, victim, 0, gsn_circle );
    }
    return;
}

/* Berserk and HitAll. -- Altrag */
void do_berserk( CHAR_DATA *ch, char *argument )
{
  sh_int percent;
  AFFECT_DATA af;
  
  if ( !ch->fighting )
  {
    send_to_char( "But you aren't fighting!\n\r", ch );
    return;
  }
  
  if ( IS_AFFECTED(ch, AFF_BERSERK) )
  {
    send_to_char( "Your rage is already at its peak!\n\r", ch );
    return;
  }
  
  percent = IS_NPC(ch) ? 80 : ch->pcdata->learned[gsn_berserk];
  WAIT_STATE(ch, skill_table[gsn_berserk]->beats);
  if ( !chance(ch, percent) )
  {
    send_to_char( "You couldn't build up enough rage.\n\r", ch);
    learn_from_failure(ch, gsn_berserk);
    return;
  }
  af.type = gsn_berserk;
  /* Hmmm.. 10-20 combat rounds at level 50.. good enough for most mobs,
     and if not they can always go berserk again.. shrug.. maybe even
     too high. -- Altrag */
  af.duration = number_range(ch->top_level/5, ch->top_level*2/5);
  /* Hmm.. you get stronger when yer really enraged.. mind over matter
     type thing.. */
  af.location = APPLY_STR;
  af.modifier = 1;
  af.bitvector = AFF_BERSERK;
  affect_to_char(ch, &af);
  send_to_char( "You start to lose control..\n\r", ch );
  learn_from_success(ch, gsn_berserk);
  return;
}

/* External from fight.c */
ch_ret one_hit	args( ( CHAR_DATA *ch, CHAR_DATA *victim, int dt ) );
void do_hitall( CHAR_DATA *ch, char *argument )
{
  CHAR_DATA *vch;
  CHAR_DATA *vch_next;
  sh_int nvict = 0;
  sh_int nhit = 0;
  sh_int percent;
  char logbuf[MAX_STRING_LENGTH];
  
  if ( IS_SET(ch->in_room->room_flags, ROOM_SAFE) )
  {
    send_to_char( "You cannot do that here.\n\r", ch);
    return;
  }

  if ( !ch->in_room->first_person )
  {
    send_to_char( "There's no one here!\n\r", ch );
    return;
  }
  percent = IS_NPC(ch) ? 80 : ch->pcdata->learned[gsn_hitall];
  for ( vch = ch->in_room->first_person; vch; vch = vch_next )
  {
    vch_next = vch->next_in_room;
    if ( is_same_group(ch, vch) || !is_legal_kill(ch, vch) ||
        !can_see(ch, vch) || is_safe(ch, vch) )
      continue;
    if ( ++nvict > ch->skill_level[COMBAT_ABILITY]  / 5 )
      break;
      
    if ( IS_SET(vch->act, PLR_AFK))
    {
      sprintf( logbuf , "%s just attacked %s with HITALL with an afk flag on!." , ch->name, vch->name );
      log_string( logbuf );
    }

    if ( chance(ch, percent) )
    {
      nhit++;
      global_retcode = one_hit(ch, vch, TYPE_UNDEFINED);
    }
    else
      global_retcode = damage(ch, vch, 0, TYPE_UNDEFINED);
    /* Fireshield, etc. could kill ch too.. :>.. -- Altrag */
    if ( global_retcode == rCHAR_DIED || global_retcode == rBOTH_DIED
    ||   char_died(ch) )
      return;
  }
  if ( !nvict )
  {
    send_to_char( "There's no one here!\n\r", ch );
    return;
  }
  ch->move = UMAX(0, ch->move-nvict*3+nhit);
  if ( nhit )
    learn_from_success(ch, gsn_hitall);
  else
    learn_from_failure(ch, gsn_hitall);
  return;
}
    
  

bool check_illegal_psteal( CHAR_DATA *ch, CHAR_DATA *victim )
{
    return FALSE;
}

void do_scan( CHAR_DATA *ch, char *argument )
{
  ROOM_INDEX_DATA *was_in_room;
  ROOM_INDEX_DATA *to_room;
  EXIT_DATA *pexit;
  sh_int dir = -1;
  sh_int dist;
  sh_int max_dist = 5;

  if ( argument[0] == '\0' )
  {
    send_to_char( "Scan in a direction...\n\r", ch );
    return;
  }

  if ( ( dir = get_door( argument ) ) == -1 )
  {
    send_to_char( "Scan in WHAT direction?\n\r", ch );
    return;
  }

  was_in_room = ch->in_room;
  act( AT_GREY, "Scanning $t...", ch, dir_name[dir], NULL, TO_CHAR );
  act( AT_GREY, "$n scans $t.", ch, dir_name[dir], NULL, TO_ROOM );

  if ( IS_NPC( ch ) 
	|| ( number_percent() > ch->pcdata->learned[gsn_scan] ) )  
  {
    act( AT_GREY, "You stop scanning $t as your vision blurs.", ch,
	dir_name[dir], NULL, TO_CHAR );
    learn_from_failure( ch, gsn_scan );
    return;
  }

  
  if ( ( pexit = get_exit( ch->in_room, dir ) ) == NULL )
  {
    act( AT_GREY, "You can't see $t.", ch, dir_name[dir], NULL, TO_CHAR );
    return;
  }

  if ( ch->top_level < 50 ) max_dist--;
  if ( ch->top_level < 20 ) max_dist--;

  for ( dist = 1; dist <= max_dist; )
  {
    if ( IS_SET( pexit->exit_info, EX_CLOSED ) )
    {
      if ( IS_SET( pexit->exit_info, EX_SECRET ) )
	act( AT_GREY, "Your view $t is blocked by a wall.", ch,
	  dir_name[dir], NULL, TO_CHAR );
       else
        act( AT_GREY, "Your view $t is blocked by a door.", ch, 
	  dir_name[dir], NULL, TO_CHAR );
      break;
    }
    
    to_room = NULL;
    if ( pexit->distance > 1 )
       to_room = generate_exit( ch->in_room , &pexit );
    
    if ( to_room == NULL )
       to_room = pexit->to_room;
    
    if ( room_is_private( ch, to_room )
	&& get_trust(ch) < LEVEL_GREATER )
    {
      act( AT_GREY, "Your view $t is blocked by a private room.", ch, 
	dir_name[dir], NULL, TO_CHAR );
      break;
    }
    char_from_room( ch );
    char_to_room( ch, to_room );    
    set_char_color( AT_RMNAME, ch );
    send_to_char( ch->in_room->name, ch );
    send_to_char( "\n\r", ch );
    show_list_to_char( ch->in_room->first_content, ch, FALSE, FALSE );
    show_char_to_char( ch->in_room->first_person, ch );

    switch( ch->in_room->sector_type )
    {
      default: dist++; break;
      case SECT_AIR:
	       if ( number_percent() < 80 ) dist++; break;
      case SECT_INSIDE:
      case SECT_FIELD:
      case SECT_UNDERGROUND:
	       dist++; break;
      case SECT_FOREST:
      case SECT_CITY:
      case SECT_DESERT:
      case SECT_HILLS:
	       dist += 2; break;
      case SECT_WATER_SWIM:
      case SECT_WATER_NOSWIM:
	       dist += 3; break;
      case SECT_MOUNTAIN:
      case SECT_UNDERWATER:
      case SECT_OCEANFLOOR:
      	       dist += 4; break;
    }

    if ( dist >= max_dist )
    {
      act( AT_GREY, "Your vision blurs with distance and you see no "
	"farther $t.", ch, dir_name[dir], NULL, TO_CHAR );
      break;
    }
    if ( ( pexit = get_exit( ch->in_room, dir ) ) == NULL )
    {
      act( AT_GREY, "Your view $t is blocked by a wall.", ch, 
	dir_name[dir], NULL, TO_CHAR );
      break;
    }
  }
  
  char_from_room( ch );
  char_to_room( ch, was_in_room );
  learn_from_success( ch, gsn_scan );

  return;
}
 
 void do_skin( CHAR_DATA *ch, char *argument)
 {
     OBJ_DATA *korps;
     OBJ_DATA *corpse;
     OBJ_DATA *obj;
     OBJ_DATA *skin;
     bool found;
     char *name;
     char buf[MAX_STRING_LENGTH];
     found = FALSE;
  
     if ( argument[0] == '\0' )
     { 
         send_to_char( "Whose corpse do you wish to skin?\n\r", ch );
         return;
     }
     if ( (corpse=get_obj_here(ch, argument)) == NULL )
     {
 	send_to_char( "You cannot find that here.\n\r", ch );
 	return;
     }
     if ( (obj=get_eq_char(ch, WEAR_WIELD)) == NULL )
     {
         send_to_char( "You have no weapon with which to perform this deed.\n\r", ch );
         return;
     }
     if ( corpse->item_type != ITEM_CORPSE_PC )
     {
         send_to_char( "You can only skin bodies.\n\r", ch);
         return;
     }
 
     if ( corpse->value[1] == 1 )
     {
         send_to_char( "This corpse has already been skinned.\n\r", ch );
         return;
     }
 
 
     if ( obj->value[3] != 1
     &&   obj->value[3] != 2
     &&   obj->value[3] != 3
     &&   obj->value[3] != 11 )
     {
         send_to_char( "There is nothing you can do with this corpse.\n\r", ch );
         return;
     }
     if ( get_obj_index( OBJ_VNUM_SKIN ) == NULL )
     {
       bug( "Vnum 23 (OBJ_VNUM_SKIN) not found for do_skin!", 0);
       return;
     }
 
     learn_from_success( ch, gsn_punch );
 
     act( AT_BLOOD, "$n strips the skin from $p.", ch, corpse, NULL, TO_ROOM);
     act( AT_BLOOD, "You strip the skin from $p.", ch, corpse, NULL, TO_CHAR);
     korps = corpse;
 //  korps               = create_object( get_obj_index(OBJ_VNUM_CORPSE_PC), 0 );
     skin                = create_object( get_obj_index(OBJ_VNUM_SKIN), 0 );
     name                = IS_NPC(ch) ? korps->short_descr : corpse->short_descr;
     sprintf( buf, skin->short_descr, name );
     STRFREE( skin->short_descr );
     skin->short_descr = STRALLOC( buf );
     sprintf( buf, skin->description, name );
     STRFREE( skin->description );
     skin->description = STRALLOC( buf );
 
     sprintf( buf, "The skinned bones of %s", name );
     STRFREE( corpse->name );
     corpse->name = STRALLOC( buf );
     sprintf( buf, "The skinned bones of %s", name );
     STRFREE( corpse->description );
     corpse->description = STRALLOC( buf );
     sprintf( buf, "The skinned bones of %s", name );
     STRFREE( corpse->short_descr );
     corpse->short_descr = STRALLOC( buf );
     corpse->value[1] = 1;
     corpse->value[2] = -1;
     corpse->timer = -1;
     
     obj_to_char( skin, ch );
     return;
}
  
void do_slice( CHAR_DATA *ch, char *argument )
{
}

/* Allows PCs to learn spells embedded in object. Should prove interesting. - Samson 8-9-98 */
void do_study( CHAR_DATA *ch, char *argument ) /* study by Absalom */
{
    char arg[MAX_INPUT_LENGTH];
    OBJ_DATA *obj;
    int sn = 0, bookskills = 0, book;

    one_argument( argument, arg );

    if ( arg[0] == '\0' )
    {
	send_to_char( "Study what?\n\r", ch );
	return;
    }

    if ( ( obj = get_obj_carry( ch, arg ) ) == NULL )
    {
	send_to_char( "You do not have that item.\n\r", ch );
	return;
    }

    if ( obj->item_type != ITEM_STAFF && obj->item_type != ITEM_WAND &&
	obj->item_type != ITEM_SCROLL )
    {
	send_to_char( "You can only study scrolls, wands, and staves.\n\r", ch );
	return;
    }

    act( AT_MAGIC, "$n studies $p.", ch, obj, NULL, TO_ROOM );
    act( AT_MAGIC, "You study $p.", ch, obj, NULL, TO_CHAR );

    if (obj->item_type == ITEM_STAFF || obj->item_type == ITEM_WAND 
     || obj->item_type == ITEM_SCROLL || obj->item_type == ITEM_BOOK)
    {
    	if( obj->value[1] >= 0 )
    	  bookskills++;
    	if( obj->value[2] >= 0 )
    	  bookskills++;
    	if( obj->value[3] >= 0 )
    	  bookskills++;
	book = number_range( 1, bookskills );
	sn = obj->value[book];
	
	if ( sn < 0 || sn >= MAX_SKILL )
	{
	  bug( "Do_study: bad sn %d.", sn );
	  return;
	}
	WAIT_STATE( ch, skill_table[gsn_study]->beats );
	if ( number_percent() >= 55 + ch->pcdata->learned[gsn_study] * 4/5)
	{
	  send_to_char("You cannot glean any knowledge from it.\n\r",ch);
	  learn_from_failure( ch, gsn_study );
	  return;
	}
	if( ch->pcdata->learned[sn] <= 0 )
	  act( AT_MAGIC, "You have begun learning the ability to $t!", ch ,skill_table[sn]->name, NULL, TO_CHAR);
	else if( ch->pcdata->learned[sn] < 15 )
	  act( AT_MAGIC, "You have learned a bit more of the ability to $t!", ch ,skill_table[sn]->name, NULL, TO_CHAR);
	else
	  act( AT_MAGIC, "You have absorbed everything the book teachs you on the ability to $t!", ch ,skill_table[sn]->name, NULL, TO_CHAR);
	
	ch->pcdata->learned[sn] += URANGE( 0, 20-ch->pcdata->learned[sn], 5);
	ch->pcdata->learned[sn] += 5;
	learn_from_success( ch, gsn_study );
        return;
    }

  return;

/*
    if (obj->item_type == ITEM_SCROLL)
    {
	sn = obj->value[1];
	if ( sn < 0 || sn >= MAX_SKILL || skill_table[sn]->spell_fun == spell_null )
	{
	  bug( "Do_study: bad sn %d.", sn );
	  return;
	}
	if ( number_percent() >= 15 + ch->pcdata->learned[gsn_study] * 4/5)
	{
	  send_to_char("You cannot glean any knowledge from it.\n\r",ch);
	  learn_from_failure( ch, gsn_study );
	  act( AT_FIRE, "$p burns brightly and is gone.", ch, obj, NULL, TO_CHAR );
	  separate_obj( obj );	
	  extract_obj( obj );
	  return;
	}
	if ( ch->pcdata->learned[sn])
	{
	  send_to_char("You already know that spell!\n\r",ch);
	  return;
	}
	ch->pcdata->learned[sn] = 1;
	act( AT_MAGIC, "You have learned the art of $t!", ch, skill_table[sn]->name, NULL, TO_CHAR);
	learn_from_success( ch, gsn_study );
	act( AT_FIRE, "$p burns brightly and is gone.", ch, obj, NULL, TO_CHAR );
	separate_obj( obj );
	extract_obj( obj );
	return;
    }
*/
}
