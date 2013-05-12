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
 *              Commands for personal player settings/statictics           *
 ****************************************************************************/

#include <sys/types.h>
#include <ctype.h>
#include <stdio.h>
#include <string.h>
#include <time.h>
#include "mud.h"

/*
 *  Locals
 */
char *tiny_affect_loc_name(int location);

void do_gold(CHAR_DATA * ch, char *argument)
{
  set_char_color( AT_GOLD, ch );
  ch_printf( ch,  "You have %d credits", ch->gold );
  if( ch->pcdata )
    ch_printf( ch, ", and %d credits in the bank", ch->pcdata->bank );
  ch_printf( ch, ".\r\n" );
  return;
}


/*
 * New score command by Haus
 */
void do_score(CHAR_DATA * ch, char *argument)
{
  char            buf[MAX_STRING_LENGTH];
  AFFECT_DATA    *paf;
  int iLang, drug;

  if (IS_NPC(ch))
    {
      do_oldscore(ch, argument);
      return;
    }
  set_char_color(AT_SCORE, ch);

  ch_printf(ch, "\r\n&CScore for %s.\r\n", ch->pcdata->title);
  set_char_color(AT_SCORE, ch);
  if ( get_trust( ch ) != ch->top_level )
    ch_printf( ch, "&cYou are trusted at level &C%d.\r\n", get_trust( ch ) );

  send_to_char("&C----------------------------------------------------------------------------\r\n", ch);

  ch_printf(ch,   "&cRace: %-17.10s                &cLog In:  &C%s\r",
            capitalize(get_race(ch)), ( IS_NPC(ch) ? "(null)" : ctime(&(ch->pcdata->logon)) ) );

  ch_printf(ch,   "&cHitroll: &C%-2.2d  &cDamroll: &C%-2.2d   &cArmor: &C%-4d        &cSaved:  &C%s\r",
            GET_HITROLL(ch), GET_DAMROLL(ch), GET_AC(ch),
            (ch->pcdata && ch->pcdata->save_time) ? ctime(&(ch->pcdata->save_time)) : "no\n" );

  ch_printf(ch,   "&cAlign: &C%-5d    &cWimpy: &C%-3d                    &cTime:   &C%s\r",
            ch->alignment, ch->wimpy  , ctime(&current_time) );

  if ( get_level( ch, FORCE_ABILITY ) > 1
       || IS_IMMORTAL(ch) )
    ch_printf(ch, "&cHit Points: &C%d &cof &C%d     &cMove: &C%d &cof &C%d     &cForce: &C%d &cof &C%d\r\n",
              ch->hit, ch->max_hit, ch->move, ch->max_move, ch->mana, ch->max_mana );
  else
    ch_printf(ch, "&cHit Points: &C%d &cof &C%d     &cMove: &C%d &cof &C%d\r\n",
              ch->hit, ch->max_hit, ch->move, ch->max_move);

  ch_printf(ch, "&cStr: &C%2d  &cDex: &C%2d  &cCon: &C%2d  &cInt: &C%2d  &cWis: &C%2d  &cCha: &C%2d  &cLck: &C??  &cFrc: &C??\r\n",
            get_curr_str(ch), get_curr_dex(ch),get_curr_con(ch),get_curr_int(ch),get_curr_wis(ch),get_curr_cha(ch));


  send_to_char("&C----------------------------------------------------------------------------\r\n", ch);

  {
    int ability;

    for ( ability = 0 ; ability < MAX_RL_ABILITY ; ability++ )
      if ( ability != FORCE_ABILITY || get_level( ch, FORCE_ABILITY ) > 1 )
        ch_printf( ch, "&c%-15s   &CLevel: %-3d   Max: %-3d   Exp: %-10ld   Next: %-10ld\r\n",
                   ability_name[ability], get_level( ch, ability ), max_level(ch, ability),
		   get_exp( ch, ability ),
                   exp_level( get_level( ch, ability ) + 1 ) );
      else
        ch_printf( ch, "&c%-15s   &CLevel: %-3d   Max: ???   Exp: ???          Next: ???\r\n",
                   ability_name[ability], get_level( ch, ability ), get_exp( ch, ability ) );
  }

  send_to_char("&C----------------------------------------------------------------------------\r\n", ch);



  ch_printf(ch, "&cCREDITS: &C%-10d   &cBANK: &C%-10d    &cPkills: &C%-5.5d   &cMkills: &C%-5.5d\r\n",
            ch->gold, ch->pcdata->bank, ch->pcdata->pkills, ch->pcdata->mkills);

  ch_printf(ch, "&cWeight: &C%5.5d &c(&Cmax %7.7d&c)    Items: &C%5.5d &c(&Cmax %5.5d&c)\r\n",
            ch->carry_weight, can_carry_w(ch) , ch->carry_number, can_carry_n(ch));

  ch_printf(ch, "&cPager: &C(%c) %3d   &cAutoExit(&C%c&c)  AutoLoot(&C%c&c)  Autosac(&C%c&c)\r\n",
            IS_SET(ch->pcdata->flags, PCFLAG_PAGERON) ? 'X' : ' ',
            ch->pcdata->pagerlen, IS_SET(ch->act, PLR_AUTOEXIT) ? 'X' : ' ',
            IS_SET(ch->act, PLR_AUTOLOOT) ? 'X' : ' ', IS_SET(ch->act, PLR_AUTOSAC) ? 'X' : ' ');

  switch (ch->position)
    {
    case POS_DEAD:
      sprintf(buf, "&CYou are slowly decomposing. ");
      break;
    case POS_MORTAL:
      sprintf(buf, "&CYou are mortally wounded. ");
      break;
    case POS_INCAP:
      sprintf(buf, "&CYou are incapacitated. ");
      break;
    case POS_STUNNED:
      sprintf(buf, "&CYou are stunned. ");
      break;
    case POS_SLEEPING:
      sprintf(buf, "&CYou are sleeping. ");
      break;
    case POS_RESTING:
      sprintf(buf, "&CYou are resting. ");
      break;
    case POS_STANDING:
      sprintf(buf, "&CYou are standing. ");
      break;
    case POS_FIGHTING:
      sprintf(buf, "&CYou are fighting. " );
      break;
    case POS_MOUNTED:
      sprintf(buf, "&CYou are mounted. ");
      break;
    case POS_SITTING:
      sprintf(buf, "&CYou are sitting. ");
      break;
    }

  send_to_char( buf, ch );

  if (!IS_NPC(ch) && ch->pcdata->condition[COND_DRUNK] > 10)
    send_to_char("&CYou are drunk.\r\n", ch);
  if (!IS_NPC(ch) && ch->pcdata->condition[COND_THIRST] == 0)
    send_to_char("&CYou are in danger of dehydrating.\r\n", ch);
  if (!IS_NPC(ch) && ch->pcdata->condition[COND_FULL] == 0)
    send_to_char("&CYou are starving to death.\r\n", ch);
  if ( ch->position != POS_SLEEPING )
    switch( ch->mental_state / 10 )
      {
      default:   send_to_char( "&CYou're completely messed up!\r\n", ch );      break;
      case -10:  send_to_char( "&CYou're barely conscious.\r\n", ch );  break;
      case  -9:  send_to_char( "&CYou can barely keep your eyes open.\r\n", ch );       break;
      case  -8:  send_to_char( "&CYou're extremely drowsy.\r\n", ch );  break;
      case  -7:  send_to_char( "&CYou feel very unmotivated.\r\n", ch );        break;
      case  -6:  send_to_char( "&CYou feel sedated.\r\n", ch );         break;
      case  -5:  send_to_char( "&CYou feel sleepy.\r\n", ch );          break;
      case  -4:  send_to_char( "&CYou feel tired.\r\n", ch );           break;
      case  -3:  send_to_char( "&CYou could use a rest.\r\n", ch );             break;
      case  -2:  send_to_char( "&CYou feel a little under the weather.\r\n", ch );      break;
      case  -1:  send_to_char( "&CYou feel fine.\r\n", ch );            break;
      case   0:  send_to_char( "&CYou feel great.\r\n", ch );           break;
      case   1:  send_to_char( "&CYou feel energetic.\r\n", ch );       break;
      case   2:  send_to_char( "&CYour mind is racing.\r\n", ch );      break;
      case   3:  send_to_char( "&CYou can't think straight.\r\n", ch ); break;
      case   4:  send_to_char( "&CYour mind is going 100 miles an hour.\r\n", ch );     break;
      case   5:  send_to_char( "&CYou're high as a kite.\r\n", ch );    break;
      case   6:  send_to_char( "&CYour mind and body are slipping apart.\r\n", ch );    break;
      case   7:  send_to_char( "&CReality is slipping away.\r\n", ch ); break;
      case   8:  send_to_char( "&CYou have no idea what is real, and what is not.\r\n", ch );   break;
      case   9:  send_to_char( "&CYou feel immortal.\r\n", ch );        break;
      case  10:  send_to_char( "&CYou are a Supreme Entity.\r\n", ch ); break;
      }
  else
    if ( ch->mental_state >45 )
      send_to_char( "&CYour sleep is filled with strange and vivid dreams.\r\n", ch );
    else
      if ( ch->mental_state >25 )
        send_to_char( "&CYour sleep is uneasy.\r\n", ch );
      else
        if ( ch->mental_state <-35 )
          send_to_char( "&CYou are deep in a much needed sleep.\r\n", ch );
        else
          if ( ch->mental_state <-25 )
            send_to_char( "&CYou are in deep slumber.\r\n", ch );

  if ( !IS_NPC(ch) )
    {
      if (ch->pcdata->target && ch->pcdata->target[0] != '\0' )
        {
          sprintf( buf,
                   "&cYour current alias focus is : &C%s.\r\n", ch->pcdata->target);
          send_to_char( buf, ch );
        }
      else
        send_to_char( "&cYou have no current target.\r\n", ch);
    }

  send_to_char("&cSPICE Level/Addiction: &C", ch );
  for ( drug = 0; drug <= 9; drug++ )
    if ( ch->pcdata->drug_level[drug] > 0 || ch->pcdata->drug_level[drug] > 0 )
      {
        ch_printf( ch, "%s&c(&C%d&c/&C%d&c) ", get_spicetype_name(drug),
                   ch->pcdata->drug_level[drug],
                   ch->pcdata->addiction[drug] );
      }
  send_to_char("\r\n&cLanguages: &c", ch );
  for ( iLang = 0; lang_array[iLang] != LANG_UNKNOWN; iLang++ )
    if ( knows_language( ch, lang_array[iLang], ch )
         ||  (IS_NPC(ch) && ch->speaks == 0) )
      {
        if ( lang_array[iLang] & ch->speaking
             ||  (IS_NPC(ch) && !ch->speaking) )
          set_char_color( AT_RED, ch );
        send_to_char( lang_names[iLang], ch );
        send_to_char( " ", ch );
        set_char_color( AT_SCORE, ch );
      }

  send_to_char( "\r\n", ch );
  ch_printf( ch, "&cWANTED ON: &C%s\r\n",
             flag_string(ch->pcdata->wanted_flags, planet_flags) );

  if ( ch->pcdata->bestowments && ch->pcdata->bestowments[0] != '\0' )
    ch_printf( ch, "&cYou are bestowed with the command(s): &C%s.\r\n",
               ch->pcdata->bestowments );

  if ( ch->pcdata->clan )
    {
      send_to_char( "&C----------------------------------------------------------------------------\r\n", ch);
      ch_printf(ch, "&cORGANIZATION: &C%-35s &cSALARY: &C%-10d    &cPkills/Deaths: &C%3.3d&c/&C%3.3d",
                ch->pcdata->clan->name, ch->pcdata->salary, ch->pcdata->clan->pkills, ch->pcdata->clan->pdeaths) ;
      send_to_char( "\r\n", ch );
    }
  if (IS_IMMORTAL(ch))
    {
      send_to_char( "&C----------------------------------------------------------------------------\r\n", ch);

      ch_printf(ch, "&cIMMORTAL DATA:  Wizinvis [&C%s&c]  Wizlevel (&C%d&c)\r\n",
                IS_SET(ch->act, PLR_WIZINVIS) ? "X" : " ", ch->pcdata->wizinvis );

      ch_printf(ch, "&cBamfin:  &C%s\r\n", (ch->pcdata->bamfin[0] != '\0')
                ? ch->pcdata->bamfin : "%s appears in a swirling mist.", ch->name);
      ch_printf(ch, "&cBamfout: &C%s\r\n", (ch->pcdata->bamfout[0] != '\0')
                ? ch->pcdata->bamfout : "%s leaves in a swirling mist.", ch->name);


      /* Area Loaded info - Scryn 8/11*/
      if (ch->pcdata->area)
        {
          ch_printf(ch, "&cVnums:   Room (&C%-5.5d &c- &C%-5.5d&c)   Object (&C%-5.5d &c- &C%-5.5d&c)   Mob (&C%-5.5d &c- &C%-5.5d&c)\r\n",
                    ch->pcdata->area->low_r_vnum, ch->pcdata->area->hi_r_vnum,
                    ch->pcdata->area->low_o_vnum, ch->pcdata->area->hi_o_vnum,
                    ch->pcdata->area->low_m_vnum, ch->pcdata->area->hi_m_vnum);
          ch_printf(ch, "&cArea Loaded [&C%s&c]\r\n", (IS_SET (ch->pcdata->area->status, AREA_LOADED)) ? "yes" : "no");
        }
    }
  if (ch->first_affect)
    {
      int i;
      SKILLTYPE *sktmp;

      i = 0;
      send_to_char( "&C----------------------------------------------------------------------------\r\n", ch);
      send_to_char("&cAFFECT DATA:                            &C", ch);
      for (paf = ch->first_affect; paf; paf = paf->next)
        {
          if ( (sktmp=get_skilltype(paf->type)) == NULL )
            continue;
          if (ch->top_level < 20)
            {
              ch_printf(ch, "&c[&C%-34.34s&c]    ", sktmp->name);
              if (i == 0)
                i = 2;
              if ((++i % 3) == 0)
                send_to_char("\r\n", ch);
            }
          else
            {
              if (paf->modifier == 0)
                ch_printf(ch, "&c[&C%-24.24s&c;&C%5d rds&c]    ",
                          sktmp->name,
                          paf->duration);
              else
                if (paf->modifier > 999)
                  ch_printf(ch, "&c[&C%-15.15s&c; &C%7.7s;%5d rds&c]    ",
                            sktmp->name,
                            tiny_affect_loc_name(paf->location),
                            paf->duration);
                else
                  ch_printf(ch, "&c[&C%-11.11s&c;&C%+-3.3d %7.7s&c;&C%5d rds&c]    ",
                            sktmp->name,
                            paf->modifier,
                            tiny_affect_loc_name(paf->location),
                            paf->duration);
              if (i == 0)
                i = 1;
              if ((++i % 2) == 0)
                send_to_char("\r\n", ch);
            }
        }
    }
  send_to_char("\r\n", ch);
  return;
}

/*
 * Return ascii name of an affect location.
 */
char           *
tiny_affect_loc_name(int location)
{
  switch (location) {
  case APPLY_NONE:              return "NIL";
  case APPLY_STR:                       return " STR  ";
  case APPLY_DEX:                       return " DEX  ";
  case APPLY_INT:                       return " INT  ";
  case APPLY_WIS:                       return " WIS  ";
  case APPLY_CON:                       return " CON  ";
  case APPLY_CHA:                       return " CHA  ";
  case APPLY_LCK:                       return " LCK  ";
  case APPLY_SEX:                       return " SEX  ";
  case APPLY_LEVEL:             return " LVL  ";
  case APPLY_AGE:                       return " AGE  ";
  case APPLY_MANA:              return " MANA ";
  case APPLY_HIT:                       return " HV   ";
  case APPLY_MOVE:              return " MOVE ";
  case APPLY_GOLD:              return " GOLD ";
  case APPLY_EXP:                       return " EXP  ";
  case APPLY_AC:                        return " AC   ";
  case APPLY_HITROLL:           return " HITRL";
  case APPLY_DAMROLL:           return " DAMRL";
  case APPLY_SAVING_POISON:     return "SV POI";
  case APPLY_SAVING_ROD:                return "SV ROD";
  case APPLY_SAVING_PARA:               return "SV PARA";
  case APPLY_SAVING_BREATH:     return "SV BRTH";
  case APPLY_SAVING_SPELL:      return "SV SPLL";
  case APPLY_HEIGHT:            return "HEIGHT";
  case APPLY_WEIGHT:            return "WEIGHT";
  case APPLY_AFFECT:            return "AFF BY";
  case APPLY_RESISTANT:         return "RESIST";
  case APPLY_IMMUNE:            return "IMMUNE";
  case APPLY_SUSCEPTIBLE:               return "SUSCEPT";
  case APPLY_WEAPONSPELL:               return " WEAPON";
  case APPLY_BACKSTAB:          return "BACKSTB";
  case APPLY_PICK:              return " PICK  ";
  case APPLY_TRACK:             return " TRACK ";
  case APPLY_STEAL:             return " STEAL ";
  case APPLY_SNEAK:             return " SNEAK ";
  case APPLY_HIDE:              return " HIDE  ";
  case APPLY_PALM:              return " PALM  ";
  case APPLY_DETRAP:            return " DETRAP";
  case APPLY_DODGE:             return " DODGE ";
  case APPLY_PEEK:              return " PEEK  ";
  case APPLY_SCAN:              return " SCAN  ";
  case APPLY_GOUGE:             return " GOUGE ";
  case APPLY_SEARCH:            return " SEARCH";
  case APPLY_MOUNT:             return " MOUNT ";
  case APPLY_DISARM:            return " DISARM";
  case APPLY_KICK:              return " KICK  ";
  case APPLY_PARRY:             return " PARRY ";
  case APPLY_BASH:              return " BASH  ";
  case APPLY_STUN:              return " STUN  ";
  case APPLY_PUNCH:             return " PUNCH ";
  case APPLY_CLIMB:             return " CLIMB ";
  case APPLY_GRIP:              return " GRIP  ";
  case APPLY_SCRIBE:            return " SCRIBE";
  case APPLY_BREW:              return " BREW  ";
  case APPLY_WEARSPELL:         return " WEAR  ";
  case APPLY_REMOVESPELL:               return " REMOVE";
  case APPLY_EMOTION:           return "EMOTION";
  case APPLY_MENTALSTATE:               return " MENTAL";
  case APPLY_STRIPSN:           return " DISPEL";
  case APPLY_REMOVE:            return " REMOVE";
  case APPLY_DIG:                       return " DIG   ";
  case APPLY_FULL:              return " HUNGER";
  case APPLY_THIRST:            return " THIRST";
  case APPLY_DRUNK:             return " DRUNK ";
  case APPLY_BLOOD:             return " BLOOD ";
  case APPLY_SNIPE:             return " SNIPE ";
  }

  bug("Affect_location_name: unknown location %d.", location);
  return "(?)";
}

const char *get_race( CHAR_DATA *ch)
{
  if ( ch->race < MAX_NPC_RACE && ch->race >= 0)
    return ( npc_race[ch->race] );
  return ("Unknown");
}

void do_oldscore( CHAR_DATA *ch, char *argument )
{
  AFFECT_DATA *paf;
  SKILLTYPE   *skill;

  if ( IS_AFFECTED(ch, AFF_POSSESS) )
    {
      send_to_char("You can't do that in your current state of mind!\r\n", ch);
      return;
    }

  set_char_color( AT_SCORE, ch );
  ch_printf( ch,
             "You are %s%s, level %d.\r\n",
             ch->name,
             IS_NPC(ch) ? "" : ch->pcdata->title,
             ch->top_level );

  if ( get_trust( ch ) != ch->top_level )
    ch_printf( ch, "You are trusted at level %d.\r\n",
               get_trust( ch ) );

  if ( IS_SET(ch->act, ACT_MOBINVIS) )
    ch_printf( ch, "You are mobinvis at level %d.\r\n",
               ch->mobinvis);


  ch_printf( ch,
             "You have %d/%d hit, %d/%d movement.\r\n",
             ch->hit,  ch->max_hit,
             ch->move, ch->max_move);

  ch_printf( ch,
             "You are carrying %d/%d items with weight %d/%d kg.\r\n",
             ch->carry_number, can_carry_n(ch),
             ch->carry_weight, can_carry_w(ch) );

  ch_printf( ch,
             "Str: %d  Int: %d  Wis: %d  Dex: %d  Con: %d  Cha: %d  Lck: ??  Frc: ??\r\n",
             get_curr_str(ch),
             get_curr_int(ch),
             get_curr_wis(ch),
             get_curr_dex(ch),
             get_curr_con(ch),
             get_curr_cha(ch) );

  ch_printf( ch,
             "You have have %d credits.\r\n" , ch->gold );

  if ( !IS_NPC(ch) )
    ch_printf( ch,
               "You have achieved %d glory during your life, and currently have %d.\r\n",
               ch->pcdata->quest_accum, ch->pcdata->quest_curr );

  ch_printf( ch,
             "Autoexit: %s   Autoloot: %s   Autosac: %s   Autocred: %s\r\n",
             (!IS_NPC(ch) && IS_SET(ch->act, PLR_AUTOEXIT)) ? "yes" : "no",
             (!IS_NPC(ch) && IS_SET(ch->act, PLR_AUTOLOOT)) ? "yes" : "no",
             (!IS_NPC(ch) && IS_SET(ch->act, PLR_AUTOSAC) ) ? "yes" : "no",
             (!IS_NPC(ch) && IS_SET(ch->act, PLR_AUTOGOLD)) ? "yes" : "no" );

  ch_printf( ch, "Wimpy set to %d hit points.\r\n", ch->wimpy );

  if ( !IS_NPC(ch) && ch->pcdata->condition[COND_DRUNK]   > 10 )
    send_to_char( "You are drunk.\r\n",   ch );
  if ( !IS_NPC(ch) && ch->pcdata->condition[COND_THIRST] ==  0 )
    send_to_char( "You are thirsty.\r\n", ch );
  if ( !IS_NPC(ch) && ch->pcdata->condition[COND_FULL]   ==  0 )
    send_to_char( "You are hungry.\r\n",  ch );

  switch( ch->mental_state / 10 )
    {
    default:   send_to_char( "You're completely messed up!\r\n", ch ); break;
    case -10:  send_to_char( "You're barely conscious.\r\n", ch ); break;
    case  -9:  send_to_char( "You can barely keep your eyes open.\r\n", ch ); break;
    case  -8:  send_to_char( "You're extremely drowsy.\r\n", ch ); break;
    case  -7:  send_to_char( "You feel very unmotivated.\r\n", ch ); break;
    case  -6:  send_to_char( "You feel sedated.\r\n", ch ); break;
    case  -5:  send_to_char( "You feel sleepy.\r\n", ch ); break;
    case  -4:  send_to_char( "You feel tired.\r\n", ch ); break;
    case  -3:  send_to_char( "You could use a rest.\r\n", ch ); break;
    case  -2:  send_to_char( "You feel a little under the weather.\r\n", ch ); break;
    case  -1:  send_to_char( "You feel fine.\r\n", ch ); break;
    case   0:  send_to_char( "You feel great.\r\n", ch ); break;
    case   1:  send_to_char( "You feel energetic.\r\n", ch ); break;
    case   2:  send_to_char( "Your mind is racing.\r\n", ch ); break;
    case   3:  send_to_char( "You can't think straight.\r\n", ch ); break;
    case   4:  send_to_char( "Your mind is going 100 miles an hour.\r\n", ch ); break;
    case   5:  send_to_char( "You're high as a kite.\r\n", ch ); break;
    case   6:  send_to_char( "Your mind and body are slipping appart.\r\n", ch ); break;
    case   7:  send_to_char( "Reality is slipping away.\r\n", ch ); break;
    case   8:  send_to_char( "You have no idea what is real, and what is not.\r\n", ch ); break;
    case   9:  send_to_char( "You feel immortal.\r\n", ch ); break;
    case  10:  send_to_char( "You are a Supreme Entity.\r\n", ch ); break;
    }

  switch ( ch->position )
    {
    case POS_DEAD:
      send_to_char( "You are DEAD!!\r\n",               ch );
      break;
    case POS_MORTAL:
      send_to_char( "You are mortally wounded.\r\n",    ch );
      break;
    case POS_INCAP:
      send_to_char( "You are incapacitated.\r\n",       ch );
      break;
    case POS_STUNNED:
      send_to_char( "You are stunned.\r\n",             ch );
      break;
    case POS_SLEEPING:
      send_to_char( "You are sleeping.\r\n",            ch );
      break;
    case POS_RESTING:
      send_to_char( "You are resting.\r\n",             ch );
      break;
    case POS_STANDING:
      send_to_char( "You are standing.\r\n",            ch );
      break;
    case POS_FIGHTING:
      send_to_char( "You are fighting.\r\n",            ch );
      break;
    case POS_MOUNTED:
      send_to_char( "Mounted.\r\n",                     ch );
      break;
    case POS_SHOVE:
      send_to_char( "Being shoved.\r\n",                ch );
      break;
    case POS_DRAG:
      send_to_char( "Being dragged.\r\n",               ch );
      break;
    }

  if ( ch->top_level >= 25 )
    ch_printf( ch, "AC: %d.  ", GET_AC(ch) );

  send_to_char( "You are ", ch );
  if ( GET_AC(ch) >=  101 ) send_to_char( "WORSE than naked!\r\n", ch );
  else if ( GET_AC(ch) >=   80 ) send_to_char( "naked.\r\n",            ch );
  else if ( GET_AC(ch) >=   60 ) send_to_char( "wearing clothes.\r\n",  ch );
  else if ( GET_AC(ch) >=   40 ) send_to_char( "slightly armored.\r\n", ch );
  else if ( GET_AC(ch) >=   20 ) send_to_char( "somewhat armored.\r\n", ch );
  else if ( GET_AC(ch) >=    0 ) send_to_char( "armored.\r\n",          ch );
  else if ( GET_AC(ch) >= - 20 ) send_to_char( "well armored.\r\n",     ch );
  else if ( GET_AC(ch) >= - 40 ) send_to_char( "strongly armored.\r\n", ch );
  else if ( GET_AC(ch) >= - 60 ) send_to_char( "heavily armored.\r\n",  ch );
  else if ( GET_AC(ch) >= - 80 ) send_to_char( "superbly armored.\r\n", ch );
  else if ( GET_AC(ch) >= -100 ) send_to_char( "divinely armored.\r\n", ch );
  else                           send_to_char( "invincible!\r\n",       ch );

  if ( ch->top_level >= 15 )
    ch_printf( ch, "Hitroll: %d  Damroll: %d.\r\n",
               GET_HITROLL(ch), GET_DAMROLL(ch) );

  if ( ch->top_level >= 10 )
    ch_printf( ch, "Alignment: %d.  ", ch->alignment );

  send_to_char( "You are ", ch );
  if ( ch->alignment >  900 ) send_to_char( "angelic.\r\n", ch );
  else if ( ch->alignment >  700 ) send_to_char( "saintly.\r\n", ch );
  else if ( ch->alignment >  350 ) send_to_char( "good.\r\n",    ch );
  else if ( ch->alignment >  100 ) send_to_char( "kind.\r\n",    ch );
  else if ( ch->alignment > -100 ) send_to_char( "neutral.\r\n", ch );
  else if ( ch->alignment > -350 ) send_to_char( "mean.\r\n",    ch );
  else if ( ch->alignment > -700 ) send_to_char( "evil.\r\n",    ch );
  else if ( ch->alignment > -900 ) send_to_char( "demonic.\r\n", ch );
  else                             send_to_char( "satanic.\r\n", ch );

  if ( ch->first_affect )
    {
      send_to_char( "You are affected by:\r\n", ch );
      for ( paf = ch->first_affect; paf; paf = paf->next )
        if ( (skill=get_skilltype(paf->type)) != NULL )
          {
            ch_printf( ch, "Spell: '%s'", skill->name );

            if ( ch->top_level >= 20 )
              ch_printf( ch,
                         " modifies %s by %d for %d rounds",
                         affect_loc_name( paf->location ),
                         paf->modifier,
                         paf->duration );

            send_to_char( ".\r\n", ch );
          }
    }

  if ( !IS_NPC( ch ) && IS_IMMORTAL( ch ) )
    {
      ch_printf( ch, "WizInvis level: %d   WizInvis is %s\r\n",
                 ch->pcdata->wizinvis,
                 IS_SET( ch->act, PLR_WIZINVIS ) ? "ON" : "OFF" );
      if ( ch->pcdata->r_range_lo && ch->pcdata->r_range_hi )
        ch_printf( ch, "Room Range: %d - %d\r\n", ch->pcdata->r_range_lo,
                   ch->pcdata->r_range_hi       );
      if ( ch->pcdata->o_range_lo && ch->pcdata->o_range_hi )
        ch_printf( ch, "Obj Range : %d - %d\r\n", ch->pcdata->o_range_lo,
                   ch->pcdata->o_range_hi       );
      if ( ch->pcdata->m_range_lo && ch->pcdata->m_range_hi )
        ch_printf( ch, "Mob Range : %d - %d\r\n", ch->pcdata->m_range_lo,
                   ch->pcdata->m_range_hi       );
    }

  return;
}

/*                                                              -Thoric
 * Display your current exp, level, and surrounding level exp requirements
 */
void do_level( CHAR_DATA *ch, char *argument )
{
  int ability;

  for ( ability = 0 ; ability < MAX_RL_ABILITY ; ability++ )
    if ( ability != FORCE_ABILITY || get_level( ch, FORCE_ABILITY ) > 1 )
      ch_printf( ch, "%-15s   Level: %-3d   Max: %-3d   Exp: %-10ld   Next: %-10ld\r\n",
                 ability_name[ability], get_level( ch, ability ), max_level(ch, ability),
		 get_exp( ch, ability ),
                 exp_level( get_level( ch, ability ) + 1 ) );
    else
      ch_printf( ch, "%-15s   Level: %-3d   Max: ???   Exp: ???          Next: ???\r\n",
                 ability_name[ability], get_level( ch, ability ), get_exp( ch, ability ) );
}


void do_affected ( CHAR_DATA *ch, char *argument )
{
  char arg [MAX_INPUT_LENGTH];
  AFFECT_DATA *paf;
  SKILLTYPE *skill;

  if ( IS_NPC(ch) )
    return;

  argument = one_argument( argument, arg );

  if ( !str_cmp( arg, "by" ) )
    {
      set_char_color( AT_BLUE, ch );
      send_to_char( "\r\nImbued with:\r\n", ch );
      set_char_color( AT_SCORE, ch );
      ch_printf( ch, "%s\r\n", affect_bit_name( ch->affected_by ) );
      if ( ch->top_level >= 20 )
        {
          send_to_char( "\r\n", ch );
          if ( ch->resistant > 0 )
            {
              set_char_color ( AT_BLUE, ch );
              send_to_char( "Resistances:  ", ch );
              set_char_color( AT_SCORE, ch );
              ch_printf( ch, "%s\r\n", flag_string(ch->resistant, ris_flags) );
            }
          if ( ch->immune > 0 )
            {
              set_char_color( AT_BLUE, ch );
              send_to_char( "Immunities:   ", ch);
              set_char_color( AT_SCORE, ch );
              ch_printf( ch, "%s\r\n", flag_string(ch->immune, ris_flags) );
            }
          if ( ch->susceptible > 0 )
            {
              set_char_color( AT_BLUE, ch );
              send_to_char( "Suscepts:     ", ch );
              set_char_color( AT_SCORE, ch );
              ch_printf( ch, "%s\r\n", flag_string(ch->susceptible, ris_flags) );
            }
        }
      return;
    }

  if ( !ch->first_affect )
    {
      set_char_color( AT_SCORE, ch );
      send_to_char( "\r\nNo cantrip or skill affects you.\r\n", ch );
    }
  else
    {
      send_to_char( "\r\n", ch );
      for (paf = ch->first_affect; paf; paf = paf->next)
        if ( (skill=get_skilltype(paf->type)) != NULL )
          {
            set_char_color( AT_BLUE, ch );
            send_to_char( "Affected:  ", ch );
            set_char_color( AT_SCORE, ch );
            if ( ch->top_level >= 20 )
              {
                if (paf->duration < 25 ) set_char_color( AT_WHITE, ch );
                if (paf->duration < 6  ) set_char_color( AT_WHITE + AT_BLINK, ch );
                ch_printf( ch, "(%5d)   ", paf->duration );
              }
            ch_printf( ch, "%-18s\r\n", skill->name );
          }
    }
  return;
}

void do_inventory( CHAR_DATA *ch, char *argument )
{
  set_char_color( AT_RED, ch );
  send_to_char( "You are carrying:\r\n", ch );
  show_list_to_char( ch->first_carrying, ch, TRUE, TRUE );
  return;
}


void do_equipment( CHAR_DATA *ch, char *argument )
{
  OBJ_DATA *obj;
  int iWear, dam;
  bool found;
  char buf[MAX_STRING_LENGTH];

  set_char_color( AT_RED, ch );
  send_to_char( "You are using:\r\n", ch );
  found = FALSE;
  set_char_color( AT_OBJECT, ch );
  for ( iWear = 0; iWear < MAX_WEAR; iWear++ )
    {
      for ( obj = ch->first_carrying; obj; obj = obj->next_content )
        if ( obj->wear_loc == iWear )
          {
            send_to_char( where_name[iWear], ch );
            if ( can_see_obj( ch, obj ) )
              {
                send_to_char( format_obj_to_char( obj, ch, TRUE ), ch );
                strcpy( buf , "" );
                switch ( obj->item_type )
                  {
                  default:
                    break;

                  case ITEM_ARMOR:
                    if ( obj->value[1] == 0 )
                      obj->value[1] = obj->value[0];
                    if ( obj->value[1] == 0 )
                      obj->value[1] = 1;
                    dam = (short) ((obj->value[0] * 10) / obj->value[1]);
                    if (dam >= 10) strcat( buf, " (superb) ");
                    else if (dam >=  7) strcat( buf, " (good) ");
                    else if (dam >=  5) strcat( buf, " (worn) ");
                    else if (dam >=  3) strcat( buf, " (poor) ");
                    else if (dam >=  1) strcat( buf, " (awful) ");
                    else if (dam ==  0) strcat( buf, " (broken) ");
                    send_to_char( buf, ch );
                    break;

                  case ITEM_WEAPON:
                    dam = INIT_WEAPON_CONDITION - obj->value[0];
                    if (dam < 2) strcat( buf, " (superb) ");
                    else if (dam < 4) strcat( buf, " (good) ");
                    else if (dam < 7) strcat( buf, " (worn) ");
                    else if (dam < 10) strcat( buf, " (poor) ");
                    else if (dam < 12) strcat( buf, " (awful) ");
                    else if (dam ==  12) strcat( buf, " (broken) ");
                    send_to_char( buf, ch );
                    if (obj->value[3] == WEAPON_BLASTER )
                      {
                        if (obj->blaster_setting == BLASTER_FULL)
                          ch_printf( ch, "FULL");
                        else if (obj->blaster_setting == BLASTER_HIGH)
                          ch_printf( ch, "HIGH");
                        else if (obj->blaster_setting == BLASTER_NORMAL)
                          ch_printf( ch, "NORMAL");
                        else if (obj->blaster_setting == BLASTER_HALF)
                          ch_printf( ch, "HALF");
                        else if (obj->blaster_setting == BLASTER_LOW)
                          ch_printf( ch, "LOW");
                        else if (obj->blaster_setting == BLASTER_STUN)
                          ch_printf( ch, "STUN");
                        ch_printf( ch, " %d", obj->value[4] );
                      }
                    else if (     ( obj->value[3] == WEAPON_LIGHTSABER ||
                                    obj->value[3] == WEAPON_VIBRO_BLADE
                                    || obj->value[3] == WEAPON_FORCE_PIKE
                                    || obj->value[3] == WEAPON_BOWCASTER ) )
                      {
                        ch_printf( ch, "%d", obj->value[4] );
                      }
                    break;
                  }
                send_to_char( "\r\n", ch );
              }
            else
              send_to_char( "something.\r\n", ch );
            found = TRUE;
          }
    }

  if ( !found )
    send_to_char( "Nothing.\r\n", ch );

  return;
}



void set_title( CHAR_DATA *ch, char *title )
{
  char buf[MAX_STRING_LENGTH];

  if ( IS_NPC(ch) )
    {
      bug( "Set_title: NPC.", 0 );
      return;
    }

  if ( isalpha(title[0]) || isdigit(title[0]) )
    {
      buf[0] = ' ';
      strcpy( buf+1, title );
    }
  else
    strcpy( buf, title );

  STRFREE( ch->pcdata->title );
  ch->pcdata->title = STRALLOC( buf );
  return;
}



void do_title( CHAR_DATA *ch, char *argument )
{
  if ( IS_NPC(ch) )
    return;

  if ( IS_SET( ch->pcdata->flags, PCFLAG_NOTITLE ))
    {
      send_to_char( "You try but the Force resists you.\r\n", ch );
      return;
    }


  if ( argument[0] == '\0' )
    {
      send_to_char( "Change your title to what?\r\n", ch );
      return;
    }

  if ((get_trust(ch) <= LEVEL_IMMORTAL) && (!nifty_is_name(ch->name, argument)))
    {
      send_to_char("You must include your name somewhere in your title!", ch);
      return;
    }
  if (strlen(argument) >40)
    {
      send_to_char("40 characters is maximum allowed for titles now.\r\n", ch);
      return;
    }
  smash_tilde( argument );
  strcat(argument, " &R&W^x");

  set_title( ch, argument );
  send_to_char( "Ok.\r\n", ch );
}


void do_homepage( CHAR_DATA *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];

  if ( IS_NPC(ch) )
    return;

  if ( argument[0] == '\0' )
    {
      if ( !ch->pcdata->homepage )
        ch->pcdata->homepage = str_dup( "" );
      ch_printf( ch, "Your homepage is: %s\r\n",
                 show_tilde( ch->pcdata->homepage ) );
      return;
    }

  if ( !str_cmp( argument, "clear" ) )
    {
      if ( ch->pcdata->homepage )
        DISPOSE(ch->pcdata->homepage);
      ch->pcdata->homepage = str_dup("");
      send_to_char( "Homepage cleared.\r\n", ch );
      return;
    }

  if ( strstr( argument, "://" ) )
    strcpy( buf, argument );
  else
    sprintf( buf, "http://%s", argument );
  if ( strlen(buf) > 70 )
    buf[70] = '\0';

  hide_tilde( buf );
  if ( ch->pcdata->homepage )
    DISPOSE(ch->pcdata->homepage);
  ch->pcdata->homepage = str_dup(buf);
  send_to_char( "Homepage set.\r\n", ch );
}



/*
 * Set your personal description                                -Thoric
 */
void do_description( CHAR_DATA *ch, char *argument )
{
  if ( IS_NPC( ch ) )
    {
      send_to_char( "Monsters are too dumb to do that!\r\n", ch );
      return;
    }

  if ( !ch->desc )
    {
      bug( "do_description: no descriptor", 0 );
      return;
    }

  switch( ch->substate )
    {
    default:
      bug( "do_description: illegal substate", 0 );
      return;

    case SUB_RESTRICTED:
      send_to_char( "You cannot use this command from within another command.\r\n", ch );
      return;

    case SUB_NONE:
      ch->substate = SUB_PERSONAL_DESC;
      ch->dest_buf = ch;
      start_editing( ch, ch->description );
      return;

    case SUB_PERSONAL_DESC:
      STRFREE( ch->description );
      ch->description = copy_buffer( ch );
      stop_editing( ch );
      return;
    }
}

/* Ripped off do_description for whois bio's -- Scryn*/
void do_bio( CHAR_DATA *ch, char *argument )
{
  if ( IS_NPC( ch ) )
    {
      send_to_char( "Mobs can't set bio's!\r\n", ch );
      return;
    }

  if ( !ch->desc )
    {
      bug( "do_bio: no descriptor", 0 );
      return;
    }

  switch( ch->substate )
    {
    default:
      bug( "do_bio: illegal substate", 0 );
      return;

    case SUB_RESTRICTED:
      send_to_char( "You cannot use this command from within another command.\r\n", ch );
      return;

    case SUB_NONE:
      ch->substate = SUB_PERSONAL_BIO;
      ch->dest_buf = ch;
      start_editing( ch, ch->pcdata->bio );
      return;

    case SUB_PERSONAL_BIO:
      STRFREE( ch->pcdata->bio );
      ch->pcdata->bio = copy_buffer( ch );
      stop_editing( ch );
      return;
    }
}



void do_report( CHAR_DATA *ch, char *argument )
{
  char buf[MAX_INPUT_LENGTH];

  if ( IS_AFFECTED(ch, AFF_POSSESS) )
    {
      send_to_char("You can't do that in your current state of mind!\r\n", ch);
      return;
    }


  ch_printf( ch,
             "You report: %d/%d hp %d/%d mv.\r\n",
             ch->hit,  ch->max_hit,
             ch->move, ch->max_move   );


  sprintf( buf, "$n reports: %d/%d hp %d/%d.",
           ch->hit,  ch->max_hit,
           ch->move, ch->max_move   );

  act( AT_REPORT, buf, ch, NULL, NULL, TO_ROOM );

  return;
}

void do_prompt( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];

  if ( IS_NPC(ch) )
    {
      send_to_char( "NPC's can't change their prompt..\r\n", ch );
      return;
    }
  smash_tilde( argument );
  one_argument( argument, arg );
  if ( !*arg )
    {
      send_to_char( "Set prompt to what? (try help prompt)\r\n", ch );
      return;
    }
  if (ch->pcdata->prompt)
    STRFREE(ch->pcdata->prompt);

  if ( strlen(argument) > 128 )
    argument[128] = '\0';

  /* Can add a list of pre-set prompts here if wanted.. perhaps
     'prompt 1' brings up a different, pre-set prompt */
  if ( !str_cmp(arg, "default") )
    ch->pcdata->prompt = STRALLOC("");
  else
    ch->pcdata->prompt = STRALLOC(argument);
  send_to_char( "Ok.\r\n", ch );
  return;
}

void set_target( CHAR_DATA *ch, char *target )
{
  char buf[MAX_STRING_LENGTH];

  strcpy( buf, target );

  if (ch->pcdata->target && ch->pcdata->target[0] != '\0')
    STRFREE( ch->pcdata->target );
  ch->pcdata->target = STRALLOC( buf );
  return;
}



void do_focusalias( CHAR_DATA *ch, char *argument)
{
  char arg[MAX_INPUT_LENGTH], buf[MAX_STRING_LENGTH];

  smash_tilde(argument);
  one_argument( argument, arg );

  if ( IS_NPC(ch) )
    {
      send_to_char("Alias focuses are for players!\r\n", ch);
      return;
    }

  if ( arg[0] == '\0' )
    {

      if ( ch->pcdata->target && ch->pcdata->target[0] != '\0' )
        {
          sprintf( buf, "Your current alias focus is : %s\r\n", ch->pcdata->target);
          send_to_char(buf,ch);
          return;
        }

      send_to_char("You have no current alias focus.\r\n",ch);
      return;

    }
  else
    {
      set_target( ch, arg );
      sprintf( buf, "Your new alias focus is : %s\r\n", ch->pcdata->target);
      send_to_char( buf, ch );
      return;
    }
}

void do_unfocusalias(CHAR_DATA *ch, char *argument)
{
  if ( IS_NPC(ch) )
    {
      send_to_char("Only players can have alias focuses!\r\n", ch);
      return;
    }

  if ( ch->pcdata->target && ch->pcdata->target[0] == '\0' )
    {
      send_to_char("Your alias focus is not defined at the moment.\r\n", ch);
      return;
    }

  send_to_char("You remove your current alias focus.\r\n", ch);
  ch->pcdata->target = STRALLOC("");
  return;

}
