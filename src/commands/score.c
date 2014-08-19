#include <time.h>
#include "mud.h"
#include "character.h"

static char *tiny_affect_loc_name(int location);

void do_score(Character * ch, char *argument)
{
  char            buf[MAX_STRING_LENGTH];
  Affect    *paf;
  int iLang, drug;

  if (IsNpc(ch))
    {
      do_oldscore(ch, argument);
      return;
    }
  SetCharacterColor(AT_SCORE, ch);

  ChPrintf(ch, "\r\n&CScore for %s.\r\n", ch->pcdata->title);
  SetCharacterColor(AT_SCORE, ch);
  if ( GetTrustLevel( ch ) != ch->top_level )
    ChPrintf( ch, "&cYou are trusted at level &C%d.\r\n", GetTrustLevel( ch ) );

  SendToCharacter("&C----------------------------------------------------------------------------\r\n", ch);

  ChPrintf(ch,   "&cRace: %-17.10s                &cLog In:  &C%s\r",
            Capitalize(get_race(ch)), ( IsNpc(ch) ? "(null)" : ctime(&(ch->pcdata->logon)) ) );

  ChPrintf(ch,   "&cHitroll: &C%-2.2d  &cDamroll: &C%-2.2d   &cArmor: &C%-4d        &cSaved:  &C%s\r",
            GetHitRoll(ch), GetDamageRoll(ch), GetArmorClass(ch),
            (ch->pcdata && ch->pcdata->save_time) ? ctime(&(ch->pcdata->save_time)) : "no\n" );

  ChPrintf(ch,   "&cAlign: &C%-5d    &cWimpy: &C%-3d                    &cTime:   &C%s\r",
            ch->alignment, ch->wimpy  , ctime(&current_time) );

  if ( IsJedi( ch ) || IsImmortal(ch) )
    ChPrintf(ch, "&cHit Points: &C%d &cof &C%d     &cMove: &C%d &cof &C%d     &cForce: &C%d &cof &C%d\r\n",
              ch->hit, ch->max_hit, ch->move, ch->max_move, ch->mana, ch->max_mana );
  else
    ChPrintf(ch, "&cHit Points: &C%d &cof &C%d     &cMove: &C%d &cof &C%d\r\n",
              ch->hit, ch->max_hit, ch->move, ch->max_move);

  ChPrintf(ch, "&cStr: &C%2d  &cDex: &C%2d  &cCon: &C%2d  &cInt: &C%2d  &cWis: &C%2d  &cCha: &C%2d  &cLck: &C??  &cFrc: &C??\r\n",
            GetCurrentStrength(ch), GetCurrentDexterity(ch),GetCurrentConstitution(ch),GetCurrentIntelligence(ch),GetCurrentWisdom(ch),GetCurrentCharisma(ch));


  SendToCharacter("&C----------------------------------------------------------------------------\r\n", ch);

  {
    int ability;

    for ( ability = 0 ; ability < MAX_RL_ABILITY ; ability++ )
      {
	if ( ability != FORCE_ABILITY || IsJedi(ch) )
	  {
	    char maxbuf[MAX_STRING_LENGTH];

	    if(ability == FORCE_ABILITY)
	      {
		sprintf(maxbuf, "%s", "???");
	      }
	    else
	      {
		sprintf(maxbuf, "%d", max_level(ch, ability));
	      }

	    ChPrintf( ch, "&c%-15s   &CLevel: %-3d   Max: %-3s   Exp: %-10ld   Next: %-10ld\r\n",
		       Capitalize(ability_name[ability]),
		       GetAbilityLevel( ch, ability ), maxbuf,
		       GetAbilityXP( ch, ability ),
		       exp_level( GetAbilityLevel( ch, ability ) + 1 ) );
	  }
	else
	  {
	    ChPrintf( ch, "&c%-15s   &CLevel: %-3d   Max: ???   Exp: ???          Next: ???\r\n",
		       Capitalize(ability_name[ability]), GetAbilityLevel( ch, ability ), GetAbilityXP( ch, ability ) );
	  }
      }
  }

  SendToCharacter("&C----------------------------------------------------------------------------\r\n", ch);



  ChPrintf(ch, "&cCREDITS: &C%-10d   &cBANK: &C%-10d    &cPkills: &C%-5.5d   &cMkills: &C%-5.5d\r\n",
            ch->gold, ch->pcdata->bank, ch->pcdata->pkills, ch->pcdata->mkills);

  ChPrintf(ch, "&cWeight: &C%5.5d &c(&Cmax %7.7d&c)    Items: &C%5.5d &c(&Cmax %5.5d&c)\r\n",
            ch->carry_weight, GetCarryCapacityWeight(ch) , ch->carry_number, GetCarryCapacityNumber(ch));

  ChPrintf(ch, "&cPager: &C(%c) %3d   &cAutoExit(&C%c&c)  AutoLoot(&C%c&c)  Autosac(&C%c&c)\r\n",
            IsBitSet(ch->pcdata->flags, PCFLAG_PAGERON) ? 'X' : ' ',
            ch->pcdata->pagerlen, IsBitSet(ch->act, PLR_AUTOEXIT) ? 'X' : ' ',
            IsBitSet(ch->act, PLR_AUTOLOOT) ? 'X' : ' ', IsBitSet(ch->act, PLR_AUTOSAC) ? 'X' : ' ');

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

  SendToCharacter( buf, ch );

  if (!IsNpc(ch) && ch->pcdata->condition[COND_DRUNK] > 10)
    SendToCharacter("&CYou are drunk.\r\n", ch);
  if (!IsNpc(ch) && ch->pcdata->condition[COND_THIRST] == 0)
    SendToCharacter("&CYou are in danger of dehydrating.\r\n", ch);
  if (!IsNpc(ch) && ch->pcdata->condition[COND_FULL] == 0)
    SendToCharacter("&CYou are starving to death.\r\n", ch);
  if ( ch->position != POS_SLEEPING )
    switch( ch->mental_state / 10 )
      {
      default:   SendToCharacter( "&CYou're completely messed up!\r\n", ch );      break;
      case -10:  SendToCharacter( "&CYou're barely conscious.\r\n", ch );  break;
      case  -9:  SendToCharacter( "&CYou can barely keep your eyes open.\r\n", ch );       break;
      case  -8:  SendToCharacter( "&CYou're extremely drowsy.\r\n", ch );  break;
      case  -7:  SendToCharacter( "&CYou feel very unmotivated.\r\n", ch );        break;
      case  -6:  SendToCharacter( "&CYou feel sedated.\r\n", ch );         break;
      case  -5:  SendToCharacter( "&CYou feel sleepy.\r\n", ch );          break;
      case  -4:  SendToCharacter( "&CYou feel tired.\r\n", ch );           break;
      case  -3:  SendToCharacter( "&CYou could use a rest.\r\n", ch );             break;
      case  -2:  SendToCharacter( "&CYou feel a little under the weather.\r\n", ch );      break;
      case  -1:  SendToCharacter( "&CYou feel fine.\r\n", ch );            break;
      case   0:  SendToCharacter( "&CYou feel great.\r\n", ch );           break;
      case   1:  SendToCharacter( "&CYou feel energetic.\r\n", ch );       break;
      case   2:  SendToCharacter( "&CYour mind is racing.\r\n", ch );      break;
      case   3:  SendToCharacter( "&CYou can't think straight.\r\n", ch ); break;
      case   4:  SendToCharacter( "&CYour mind is going 100 miles an hour.\r\n", ch );     break;
      case   5:  SendToCharacter( "&CYou're high as a kite.\r\n", ch );    break;
      case   6:  SendToCharacter( "&CYour mind and body are slipping apart.\r\n", ch );    break;
      case   7:  SendToCharacter( "&CReality is slipping away.\r\n", ch ); break;
      case   8:  SendToCharacter( "&CYou have no idea what is real, and what is not.\r\n", ch );   break;
      case   9:  SendToCharacter( "&CYou feel immortal.\r\n", ch );        break;
      case  10:  SendToCharacter( "&CYou are a Supreme Entity.\r\n", ch ); break;
      }
  else
    if ( ch->mental_state >45 )
      SendToCharacter( "&CYour sleep is filled with strange and vivid dreams.\r\n", ch );
    else
      if ( ch->mental_state >25 )
        SendToCharacter( "&CYour sleep is uneasy.\r\n", ch );
      else
        if ( ch->mental_state <-35 )
          SendToCharacter( "&CYou are deep in a much needed sleep.\r\n", ch );
        else
          if ( ch->mental_state <-25 )
            SendToCharacter( "&CYou are in deep slumber.\r\n", ch );

  if ( !IsNpc(ch) )
    {
      if (ch->pcdata->target && ch->pcdata->target[0] != '\0' )
	{
          sprintf( buf,
                   "&cYour current alias focus is : &C%s.\r\n", ch->pcdata->target);
          SendToCharacter( buf, ch );
        }
      else
        SendToCharacter( "&cYou have no current target.\r\n", ch);
    }

  SendToCharacter("&cSPICE Level/Addiction: &C", ch );
  for ( drug = 0; drug <= 9; drug++ )
    if ( ch->pcdata->drug_level[drug] > 0 || ch->pcdata->drug_level[drug] > 0 )
      {
        ChPrintf( ch, "%s&c(&C%d&c/&C%d&c) ", GetSpiceTypeName(drug),
                   ch->pcdata->drug_level[drug],
                   ch->pcdata->addiction[drug] );
      }
  SendToCharacter("\r\n&cLanguages: &c", ch );
  for ( iLang = 0; lang_array[iLang] != LANG_UNKNOWN; iLang++ )
    if ( CharacterKnowsLanguage( ch, lang_array[iLang], ch )
         ||  (IsNpc(ch) && ch->speaks == 0) )
      {
        if ( lang_array[iLang] & ch->speaking
             ||  (IsNpc(ch) && !ch->speaking) )
          SetCharacterColor( AT_RED, ch );
        SendToCharacter( lang_names[iLang], ch );
        SendToCharacter( " ", ch );
        SetCharacterColor( AT_SCORE, ch );
      }

  SendToCharacter( "\r\n", ch );
  ChPrintf( ch, "&cWANTED ON: &C%s\r\n",
             FlagString(ch->pcdata->wanted_flags, planet_flags) );

  if ( ch->pcdata->bestowments && ch->pcdata->bestowments[0] != '\0' )
    ChPrintf( ch, "&cYou are bestowed with the command(s): &C%s.\r\n",
               ch->pcdata->bestowments );

  if ( ch->pcdata->clan )
    {
      SendToCharacter( "&C----------------------------------------------------------------------------\r\n", ch);
      ChPrintf(ch, "&cORGANIZATION: &C%-35s &cSALARY: &C%-10d    &cPkills/Deaths: &C%3.3d&c/&C%3.3d",
                ch->pcdata->clan->name, ch->pcdata->salary, ch->pcdata->clan->pkills, ch->pcdata->clan->pdeaths) ;
      SendToCharacter( "\r\n", ch );
    }
  if (IsImmortal(ch))
    {
      SendToCharacter( "&C----------------------------------------------------------------------------\r\n", ch);

      ChPrintf(ch, "&cIMMORTAL DATA:  Wizinvis [&C%s&c]  Wizlevel (&C%d&c)\r\n",
                IsBitSet(ch->act, PLR_WIZINVIS) ? "X" : " ", ch->pcdata->wizinvis );

      ChPrintf(ch, "&cBamfin:  &C%s\r\n", (ch->pcdata->bamfin[0] != '\0')
                ? ch->pcdata->bamfin : "%s appears in a swirling mist.", ch->name);
      ChPrintf(ch, "&cBamfout: &C%s\r\n", (ch->pcdata->bamfout[0] != '\0')
                ? ch->pcdata->bamfout : "%s leaves in a swirling mist.", ch->name);


      /* Area Loaded info - Scryn 8/11*/
      if (ch->pcdata->area)
        {
          ChPrintf(ch, "&cVnums:   Room (&C%-5.5d &c- &C%-5.5d&c)   Object (&C%-5.5d &c- &C%-5.5d&c)   Mob (&C%-5.5d &c- &C%-5.5d&c)\r\n",
                    ch->pcdata->area->low_r_vnum, ch->pcdata->area->hi_r_vnum,
                    ch->pcdata->area->low_o_vnum, ch->pcdata->area->hi_o_vnum,
                    ch->pcdata->area->low_m_vnum, ch->pcdata->area->hi_m_vnum);
          ChPrintf(ch, "&cArea Loaded [&C%s&c]\r\n", (IsBitSet (ch->pcdata->area->status, AREA_LOADED)) ? "yes" : "no");
        }
    }
  if (ch->first_affect)
    {
      int i;
      Skill *sktmp;

      i = 0;
      SendToCharacter( "&C----------------------------------------------------------------------------\r\n", ch);
      SendToCharacter("&cAFFECT DATA:                            &C", ch);
      for (paf = ch->first_affect; paf; paf = paf->next)
        {
          if ( (sktmp=get_skilltype(paf->type)) == NULL )
            continue;
          if (ch->top_level < 20)
            {
              ChPrintf(ch, "&c[&C%-34.34s&c]    ", Capitalize(sktmp->name));

              if (i == 0)
                i = 2;
              if ((++i % 3) == 0)
                SendToCharacter("\r\n", ch);
            }
          else
            {
              if (paf->modifier == 0)
                ChPrintf(ch, "&c[&C%-24.24s&c;&C%5d rds&c]    ",
                          Capitalize(sktmp->name),
                          paf->duration);
              else
                if (paf->modifier > 999)
		  ChPrintf(ch, "&c[&C%-15.15s&c; &C%7.7s;%5d rds&c]    ",
                            Capitalize(sktmp->name),
                            tiny_affect_loc_name(paf->location),
                            paf->duration);
                else
                  ChPrintf(ch, "&c[&C%-11.11s&c;&C%+-3.3d %7.7s&c;&C%5d rds&c]    ",
                            Capitalize(sktmp->name),
                            paf->modifier,
                            tiny_affect_loc_name(paf->location),
                            paf->duration);
              if (i == 0)
                i = 1;
              if ((++i % 2) == 0)
                SendToCharacter("\r\n", ch);
            }
        }
    }
  SendToCharacter("\r\n", ch);
}

static char *tiny_affect_loc_name(int location)
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

  Bug("Affect_location_name: unknown location %d.", location);
  return "(?)";
}
