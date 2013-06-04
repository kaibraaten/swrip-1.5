#include <string.h>
#include "mud.h"

/*
 * Lookup a skills information
 * High god command
 */
void do_slookup( Character *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  char arg[MAX_INPUT_LENGTH];
  int sn;
  SKILLTYPE *skill = NULL;

  one_argument( argument, arg );
  if ( arg[0] == '\0' )
    {
      send_to_char( "Slookup what?\r\n", ch );
      return;
    }

  if ( !str_cmp( arg, "all" ) )
    {
      for ( sn = 0; sn < top_sn && skill_table[sn] && skill_table[sn]->name; sn++ )
        pager_printf( ch, "Sn: %4d Slot: %4d Skill/spell: '%-20s' Damtype: %s\r\n",
                      sn, skill_table[sn]->slot, skill_table[sn]->name,
                      get_spelldamage_name(SPELL_DAMAGE( skill_table[sn] )) );
    }
  else
    if ( !str_cmp( arg, "herbs" ) )
      {
	for ( sn = 0; sn < top_herb && herb_table[sn] && herb_table[sn]->name; sn++ )
          pager_printf( ch, "%d) %s\r\n", sn, herb_table[sn]->name );
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
                send_to_char( "Invalid herb.\r\n", ch );
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
                  send_to_char( "Invalid sn.\r\n", ch );
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
                  send_to_char( "No such skill, spell, proficiency or tongue.\r\n", ch );
                  return;
                }
        if ( !skill )
          {
            send_to_char( "Not created yet.\r\n", ch );
            return;
          }

	ch_printf( ch, "Sn: %4d Slot: %4d %s: '%-20s'\r\n",
                   sn, skill->slot, skill_tname[skill->type], skill->name );
        if ( skill->flags )
          {
            size_t x = 0;

            ch_printf( ch, "Damtype: %s  Acttype: %s   Classtype: %s   Powertype: %s\r\n",
                       get_spelldamage_name( SPELL_DAMAGE( skill ) ),
                       get_spellaction_name( SPELL_ACTION( skill ) ),
                       get_spellclass_name( SPELL_CLASS( skill ) ),
                       get_spellpower_name( SPELL_POWER( skill ) ) );

            strcpy( buf, "Flags:" );

            for ( x = 11; x < 32; x++ )
              if ( SPELL_FLAG( skill, 1 << x ) )
                {
                  strcat( buf, " " );
                  strcat( buf, get_spellflag_name( x-11 ) );
                }

            strcat( buf, "\r\n" );
            send_to_char( buf, ch );
          }

        ch_printf( ch, "Saves: %s\r\n", get_spellsaves_name( skill->saves ) );

        if ( skill->difficulty != '\0' )
          ch_printf( ch, "Difficulty: %d\r\n", (int) skill->difficulty );

        ch_printf( ch, "Type: %s  Target: %s  Minpos: %d  Mana: %d  Beats: %d\r\n",
                   skill_tname[skill->type],
                   get_spelltarget_name(URANGE(TAR_IGNORE, skill->target, TAR_OBJ_INV)),
                   skill->minimum_position,
                   skill->min_mana,
                   skill->beats );
        ch_printf( ch, "Flags: %d  Guild: %s (%d)  Code: %s\r\n",
                   skill->flags,
                   ability_name[skill->guild], skill->guild,
                   skill->skill_fun || skill->spell_fun ? skill->fun_name : "(none set)");

        ch_printf( ch, "Dammsg: %s\r\nWearoff: %s\n",
                   skill->noun_damage,
                   skill->msg_off ? skill->msg_off : "(none set)" );

	if ( skill->dice && skill->dice[0] != '\0' )
          ch_printf( ch, "Dice: %s\r\n", skill->dice );
        if ( skill->teachers && skill->teachers[0] != '\0' )
          ch_printf( ch, "Teachers: %s\r\n", skill->teachers );
        if ( skill->components && skill->components[0] != '\0' )
          ch_printf( ch, "Components: %s\r\n", skill->components );
        if ( skill->participants )
          ch_printf( ch, "Participants: %d\r\n", (int) skill->participants );
        if ( skill->userec.num_uses )
          send_timer(&skill->userec, ch);
        for ( aff = skill->affects; aff; aff = aff->next )
          {
            if ( aff == skill->affects )
              send_to_char( "\r\n", ch );
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
                  if ( IS_SET(aff->bitvector, 1 << x) )
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
            send_to_char( buf, ch );
            if ( !aff->next )
              send_to_char( "\r\n", ch );
          }
        if ( skill->hit_char && skill->hit_char[0] != '\0' )
          ch_printf( ch, "Hitchar   : %s\r\n", skill->hit_char );
        if ( skill->hit_vict && skill->hit_vict[0] != '\0' )
          ch_printf( ch, "Hitvict   : %s\r\n", skill->hit_vict );
        if ( skill->hit_room && skill->hit_room[0] != '\0' )
          ch_printf( ch, "Hitroom   : %s\r\n", skill->hit_room );
        if ( skill->miss_char && skill->miss_char[0] != '\0' )
          ch_printf( ch, "Misschar  : %s\r\n", skill->miss_char );
        if ( skill->miss_vict && skill->miss_vict[0] != '\0' )
          ch_printf( ch, "Missvict  : %s\r\n", skill->miss_vict );
        if ( skill->miss_room && skill->miss_room[0] != '\0' )
          ch_printf( ch, "Missroom  : %s\r\n", skill->miss_room );
        if ( skill->die_char && skill->die_char[0] != '\0' )
          ch_printf( ch, "Diechar   : %s\r\n", skill->die_char );
        if ( skill->die_vict && skill->die_vict[0] != '\0' )
          ch_printf( ch, "Dievict   : %s\r\n", skill->die_vict );
        if ( skill->die_room && skill->die_room[0] != '\0' )
          ch_printf( ch, "Dieroom   : %s\r\n", skill->die_room );
        if ( skill->imm_char && skill->imm_char[0] != '\0' )
          ch_printf( ch, "Immchar   : %s\r\n", skill->imm_char );
        if ( skill->imm_vict && skill->imm_vict[0] != '\0' )
          ch_printf( ch, "Immvict   : %s\r\n", skill->imm_vict );
        if ( skill->imm_room && skill->imm_room[0] != '\0' )
          ch_printf( ch, "Immroom   : %s\r\n", skill->imm_room );
        if ( skill->type != SKILL_HERB && skill->guild >= 0 && skill->guild < MAX_ABILITY)
          {
            sprintf(buf, "guild: %s   Align: %4d   lvl: %3d\r\n",
                    ability_name[skill->guild], skill->alignment,    skill->min_level );
            send_to_char( buf, ch );
          }
        send_to_char( "\r\n", ch );
      }
}
