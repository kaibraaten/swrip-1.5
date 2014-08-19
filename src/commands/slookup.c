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
  Skill *skill = NULL;

  OneArgument( argument, arg );
  if ( arg[0] == '\0' )
    {
      SendToCharacter( "Slookup what?\r\n", ch );
      return;
    }

  if ( !StrCmp( arg, "all" ) )
    {
      for ( sn = 0; sn < top_sn && skill_table[sn] && skill_table[sn]->name; sn++ )
        PagerPrintf( ch, "Sn: %4d Slot: %4d Skill/spell: '%-20s' Damtype: %s\r\n",
                      sn, skill_table[sn]->slot, skill_table[sn]->name,
                      GetSpellDamageName(SPELL_DAMAGE( skill_table[sn] )) );
    }
  else
    if ( !StrCmp( arg, "herbs" ) )
      {
	for ( sn = 0; sn < top_herb && herb_table[sn] && herb_table[sn]->name; sn++ )
          PagerPrintf( ch, "%d) %s\r\n", sn, herb_table[sn]->name );
      }
    else
      {
        SmaugAffect *aff;
        int cnt = 0;

        if ( arg[0] == 'h' && IsNumber(arg+1) )
          {
            sn = atoi(arg+1);
            if ( !IS_VALID_HERB(sn) )
              {
                SendToCharacter( "Invalid herb.\r\n", ch );
                return;
              }
            skill = herb_table[sn];
          }
        else
          if ( IsNumber(arg) )
            {
              sn = atoi(arg);
              if ( (skill=get_skilltype(sn)) == NULL )
                {
                  SendToCharacter( "Invalid sn.\r\n", ch );
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
                  SendToCharacter( "No such skill, spell, proficiency or tongue.\r\n", ch );
                  return;
                }
        if ( !skill )
          {
            SendToCharacter( "Not created yet.\r\n", ch );
            return;
          }

	ChPrintf( ch, "Sn: %4d Slot: %4d %s: '%-20s'\r\n",
                   sn, skill->slot, skill_tname[skill->type], skill->name );
        if ( skill->flags )
          {
            size_t x = 0;

            ChPrintf( ch, "Damtype: %s  Acttype: %s   Classtype: %s   Powertype: %s\r\n",
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

        ChPrintf( ch, "Saves: %s\r\n", GetSpellSavesName( skill->saves ) );

        if ( skill->difficulty != '\0' )
          ChPrintf( ch, "Difficulty: %d\r\n", (int) skill->difficulty );

        ChPrintf( ch, "Type: %s  Target: %s  Minpos: %d  Mana: %d  Beats: %d\r\n",
                   skill_tname[skill->type],
                   GetSpellTargetName(urange(TAR_IGNORE, skill->target, TAR_OBJ_INV)),
                   skill->minimum_position,
                   skill->min_mana,
                   skill->beats );
        ChPrintf( ch, "Flags: %d  Guild: %s (%d)  Code: %s\r\n",
                   skill->flags,
                   ability_name[skill->guild], skill->guild,
                   skill->skill_fun || skill->spell_fun ? skill->fun_name : "(none set)");

        ChPrintf( ch, "Dammsg: %s\r\nWearoff: %s\n",
                   skill->noun_damage,
                   skill->msg_off ? skill->msg_off : "(none set)" );

	if ( skill->dice && skill->dice[0] != '\0' )
          ChPrintf( ch, "Dice: %s\r\n", skill->dice );
        if ( skill->teachers && skill->teachers[0] != '\0' )
          ChPrintf( ch, "Teachers: %s\r\n", skill->teachers );
        if ( skill->components && skill->components[0] != '\0' )
          ChPrintf( ch, "Components: %s\r\n", skill->components );
        if ( skill->participants )
          ChPrintf( ch, "Participants: %d\r\n", (int) skill->participants );
        if ( skill->userec.num_uses )
          sStopTimer(&skill->userec, ch);
        for ( aff = skill->affects; aff; aff = aff->next )
          {
            if ( aff == skill->affects )
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
        if ( skill->hit_char && skill->hit_char[0] != '\0' )
          ChPrintf( ch, "Hitchar   : %s\r\n", skill->hit_char );
        if ( skill->hit_vict && skill->hit_vict[0] != '\0' )
          ChPrintf( ch, "Hitvict   : %s\r\n", skill->hit_vict );
        if ( skill->hit_room && skill->hit_room[0] != '\0' )
          ChPrintf( ch, "Hitroom   : %s\r\n", skill->hit_room );
        if ( skill->miss_char && skill->miss_char[0] != '\0' )
          ChPrintf( ch, "Misschar  : %s\r\n", skill->miss_char );
        if ( skill->miss_vict && skill->miss_vict[0] != '\0' )
          ChPrintf( ch, "Missvict  : %s\r\n", skill->miss_vict );
        if ( skill->miss_room && skill->miss_room[0] != '\0' )
          ChPrintf( ch, "Missroom  : %s\r\n", skill->miss_room );
        if ( skill->die_char && skill->die_char[0] != '\0' )
          ChPrintf( ch, "Diechar   : %s\r\n", skill->die_char );
        if ( skill->die_vict && skill->die_vict[0] != '\0' )
          ChPrintf( ch, "Dievict   : %s\r\n", skill->die_vict );
        if ( skill->die_room && skill->die_room[0] != '\0' )
          ChPrintf( ch, "Dieroom   : %s\r\n", skill->die_room );
        if ( skill->imm_char && skill->imm_char[0] != '\0' )
          ChPrintf( ch, "Immchar   : %s\r\n", skill->imm_char );
        if ( skill->imm_vict && skill->imm_vict[0] != '\0' )
          ChPrintf( ch, "Immvict   : %s\r\n", skill->imm_vict );
        if ( skill->imm_room && skill->imm_room[0] != '\0' )
          ChPrintf( ch, "Immroom   : %s\r\n", skill->imm_room );
        if ( skill->type != SKILL_HERB && skill->guild >= 0 && skill->guild < MAX_ABILITY)
          {
            sprintf(buf, "guild: %s   Align: %4d   lvl: %3d\r\n",
                    ability_name[skill->guild], skill->alignment,    skill->min_level );
            SendToCharacter( buf, ch );
          }
        SendToCharacter( "\r\n", ch );
      }
}
