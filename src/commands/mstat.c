#include <string.h>
#include <time.h>
#include "mud.h"
#include "character.h"

void do_mstat( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Affect *paf = NULL;
  Character *victim = NULL;
  Skill *skill = NULL;
  int x = 0;

  SetCharacterColor( AT_PLAIN, ch );

  OneArgument( argument, arg );

  if ( arg[0] == '\0' )
    {
      SendToCharacter( "Mstat whom?\r\n", ch );
      return;
    }

  if ( arg[0] != '\'' && arg[0] != '"' && strlen(argument) > strlen(arg) )
    strcpy( arg, argument );

  if ( ( victim = get_char_world( ch, arg ) ) == NULL )
    {
      SendToCharacter( "They aren't here.\r\n", ch );
      return;
    }

  if ( ( ( GetTrustLevel( ch ) < LEVEL_GREATER ) && !IsNpc(victim) ) || ( ( GetTrustLevel( ch ) < GetTrustLevel( victim ) ) && !IsNpc(victim) ) )
    {
      SetCharacterColor( AT_IMMORT, ch );
      SendToCharacter( "Their godly glow prevents you from getting a good look.\r\n", ch );
      return;
    }

  ChPrintf( ch, "Name: %s     Organization: %s\r\n",
             victim->name,
             ( IsNpc( victim ) || !victim->pcdata->clan ) ? "(none)"
             : victim->pcdata->clan->name );

  if( GetTrustLevel(ch) >= LEVEL_GREATER && !IsNpc(victim) && victim->desc )
    ChPrintf( ch, "Host: %s   Descriptor: %d   Trust: %d   AuthedBy: %s\r\n",
               victim->desc->remote.hostname, victim->desc->descriptor,
               victim->trust, victim->pcdata->authed_by[0] != '\0'
               ? victim->pcdata->authed_by : "(unknown)" );

  if ( !IsNpc(victim) && victim->pcdata->release_date != 0 )
    ChPrintf(ch, "Helled until %24.24s by %s.\r\n",
              ctime(&victim->pcdata->release_date),
              victim->pcdata->helled_by);

  ChPrintf( ch, "Vnum: %d   Sex: %s   Room: %d   Count: %d  Killed: %d\r\n",
             IsNpc(victim) ? victim->Prototype->vnum : 0,
             victim->sex == SEX_MALE    ? "male"   :
             victim->sex == SEX_FEMALE  ? "female" : "neutral",
             victim->in_room == NULL    ?        0 : victim->in_room->vnum,
             IsNpc(victim) ? victim->Prototype->count : 1,
             IsNpc(victim) ? victim->Prototype->killed
             : victim->pcdata->mdeaths + victim->pcdata->pdeaths
             );

  ChPrintf( ch, "Str: %d  Int: %d  Wis: %d  Dex: %d  Con: %d  Cha: %d  Lck: %d  Frc: %d\r\n",
             GetCurrentStrength(victim),
             GetCurrentIntelligence(victim),
             GetCurrentWisdom(victim),
             GetCurrentDexterity(victim),
             GetCurrentConstitution(victim),
             GetCurrentCharisma(victim),
             GetCurrentLuck(victim),
             GetCurrentForce(victim) );

  ChPrintf( ch, "Hps: %d/%d  Force: %d/%d   Move: %d/%d\r\n",
             victim->hit,         victim->max_hit,
             victim->mana,        victim->max_mana,
             victim->move,        victim->max_move );

  if ( !IsNpc( victim ) )
    {
      int ability;

      for ( ability = 0 ; ability < MAX_ABILITY ; ability++ )
        ChPrintf( ch, "%-15s   Level: %-3d   Max: %-3d   Exp: %-10ld   Next: %-10ld\r\n",
                   ability_name[ability], GetAbilityLevel( victim, ability ), max_level(victim, ability),
		   GetAbilityXP( victim, ability ),
		   GetRequiredXpForLevel( GetAbilityLevel( victim, ability ) + 1 ) );
    }

  ChPrintf( ch,
             "Top Level: %d     Race: %d  Align: %d  AC: %d  Gold: %d\r\n",
             victim->top_level,  victim->race,   victim->alignment,
             GetArmorClass(victim),      victim->gold );

  if (  victim->race  < MAX_NPC_RACE  && victim->race  >= 0 )
    ChPrintf( ch, "Race: %s\r\n",
               npc_race[victim->race] );

  ChPrintf( ch, "Hitroll: %d   Damroll: %d   Position: %d   Wimpy: %d \r\n",
             GetHitRoll(victim), GetDamageRoll(victim),
             victim->position,    victim->wimpy );
  ChPrintf( ch, "Fighting: %s    Master: %s    Leader: %s\r\n",
             victim->fighting ? victim->fighting->who->name : "(none)",
             victim->master      ? victim->master->name   : "(none)",
             victim->leader      ? victim->leader->name   : "(none)" );

  if ( !IsNpc(victim) )
    ChPrintf( ch,
               "Thirst: %d   Full: %d   Drunk: %d\r\n",
               victim->pcdata->condition[COND_THIRST],
               victim->pcdata->condition[COND_FULL],
               victim->pcdata->condition[COND_DRUNK] );
  else
    ChPrintf( ch, "Hit dice: %dd%d+%d.  Damage dice: %dd%d+%d.\r\n",
               victim->Prototype->hitnodice,
               victim->Prototype->hitsizedice,
               victim->Prototype->hitplus,
               victim->Prototype->damnodice,
               victim->Prototype->damsizedice,
               victim->Prototype->damplus );

  ChPrintf( ch, "MentalState: %d   EmotionalState: %d\r\n",
             victim->mental_state, victim->emotional_state );
  ChPrintf( ch, "Saving throws: %d %d %d %d %d.\r\n",
             victim->saving.poison_death,
             victim->saving.wand,
             victim->saving.para_petri,
             victim->saving.breath,
             victim->saving.spell_staff  );
  ChPrintf( ch, "Carry figures: items (%d/%d)  weight (%d/%d)   Numattacks: %d\r\n",
             victim->carry_number, GetCarryCapacityNumber(victim), victim->carry_weight, GetCarryCapacityWeight(victim), victim->numattacks );

  if ( IsNpc( victim ) )
    {
      ChPrintf( ch, "Act flags: %s\r\n", FlagString(victim->act, act_flags) );
      ChPrintf( ch, "VIP flags: %s\r\n", FlagString(victim->vip_flags, planet_flags) );
    }
  else
    {
      ChPrintf( ch, "Years: %d   Seconds Played: %d   Timer: %d   Act: %d\r\n",
                 GetAge( victim ), (int) victim->pcdata->played, victim->timer, victim->act );

      ChPrintf( ch, "Player flags: %s\r\n",
                 FlagString(victim->act, plr_flags) );
      ChPrintf( ch, "Pcflags: %s\r\n",
                 FlagString(victim->pcdata->flags, pc_flags) );
      ChPrintf( ch, "Wanted flags: %s\r\n",
                 FlagString(victim->pcdata->wanted_flags, planet_flags) );
    }

  ChPrintf( ch, "Affected by: %s\r\n",
             FlagString( victim->affected_by, affected_flags ) );
  ChPrintf( ch, "Speaks: %d   Speaking: %d\r\n",
             victim->speaks, victim->speaking );
  SendToCharacter( "Languages: ", ch );

  for ( x = 0; lang_array[x] != LANG_UNKNOWN; x++ )
    {
      if ( CharacterKnowsLanguage( victim, lang_array[x], victim )
	   || (IsNpc(victim) && victim->speaks == 0) )
	{
	  if ( IsBitSet(lang_array[x], victim->speaking)
	       || (IsNpc(victim) && !victim->speaking) )
	    {
	      SetCharacterColor( AT_RED, ch );
	    }

        SendToCharacter( lang_names[x], ch );
        SendToCharacter( " ", ch );
        SetCharacterColor( AT_PLAIN, ch );
      }
    else if ( IsBitSet(lang_array[x], victim->speaking)
	      || (IsNpc(victim) && !victim->speaking) )
      {
	SetCharacterColor( AT_PINK, ch );
	SendToCharacter( lang_names[x], ch );
	SendToCharacter( " ", ch );
	SetCharacterColor( AT_PLAIN, ch );
      }
    }

  SendToCharacter( "\r\n", ch );

  if ( victim->pcdata && victim->pcdata->bestowments
       && victim->pcdata->bestowments[0] != '\0' )
    {
      ChPrintf( ch, "Bestowments: %s\r\n", victim->pcdata->bestowments );
    }

  ChPrintf( ch, "Short description: %s\r\nLong  description: %s",
             victim->short_descr,
             victim->long_descr[0] != '\0' ? victim->long_descr : "(none)\r\n" );
  if ( IsNpc(victim) && ( victim->spec_fun || victim->spec_2 ) )
    {
      ChPrintf( ch, "Mobile has spec fun: %s %s\r\n",
		 lookup_spec( victim->spec_fun ),
		 victim->spec_2 ? lookup_spec( victim->spec_2 ) : "" );
    }

  ChPrintf( ch, "Body Parts : %s\r\n",
             FlagString(victim->xflags, part_flags) );
  ChPrintf( ch, "Resistant  : %s\r\n",
             FlagString(victim->resistant, ris_flags) );
  ChPrintf( ch, "Immune     : %s\r\n",
             FlagString(victim->immune, ris_flags) );
  ChPrintf( ch, "Susceptible: %s\r\n",
             FlagString(victim->susceptible, ris_flags) );
  ChPrintf( ch, "Attacks    : %s\r\n",
             FlagString(victim->attacks, attack_flags) );
  ChPrintf( ch, "Defenses   : %s\r\n",
             FlagString(victim->defenses, defense_flags) );

  for ( paf = victim->first_affect; paf; paf = paf->next )
    {
      if ( (skill=get_skilltype(paf->type)) != NULL )
	{
	  ChPrintf( ch,
		     "%s: '%s' modifies %s by %d for %d rounds with bits %s.\r\n",
		     skill_tname[skill->type],
		     skill->name,
		     affect_loc_name( paf->location ),
		     paf->modifier,
		     paf->duration,
		     FlagString( paf->bitvector, affected_flags )
		     );
	}
    }
}
