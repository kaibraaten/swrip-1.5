#include <string.h>
#include "mud.h"
#include "character.h"
#include "editor.h"
#include "clan.h"

void do_mset( Character *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char arg3[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];
  char outbuf[MAX_STRING_LENGTH];
  int  num = 0, size = 0, plus = 0;
  char char1 = 0, char2 = 0;
  Character *victim = NULL;
  int value = 0;
  int minattr = 0, maxattr = 0;
  bool lockvictim = false;
  char *origarg = argument;

  if ( IsNpc( ch ) )
    {
      SendToCharacter( "Mob's can't mset\r\n", ch );
      return;
    }

  if ( !ch->desc )
    {
      SendToCharacter( "You have no descriptor\r\n", ch );
      return;
    }

  switch( ch->substate )
    {
    default:
      break;
    case SUB_MOB_DESC:
      if ( !ch->dest_buf )
        {
          SendToCharacter( "Fatal error: report to Darrik.\r\n", ch );
          Bug( "do_mset: sub_mob_desc: NULL ch->dest_buf", 0 );
          ch->substate = SUB_NONE;
          return;
        }

      victim = (Character*)ch->dest_buf;

      if ( CharacterDiedRecently(victim) )
        {
          SendToCharacter( "Your victim died!\r\n", ch );
          StopEditing( ch );
          return;
        }
      FreeMemory( victim->description );
      victim->description = CopyBuffer( ch );
      if ( IsNpc(victim) && IsBitSet( victim->act, ACT_PROTOTYPE ) )
        {
          FreeMemory( victim->Prototype->description );
          victim->Prototype->description = CopyString( victim->description );
        }
      StopEditing( ch );
      ch->substate = ch->tempnum;
      return;
    }

  victim = NULL;
  lockvictim = false;
  SmashTilde( argument );

  if ( ch->substate == SUB_REPEATCMD )
    {
      victim = (Character*)ch->dest_buf;

      if ( CharacterDiedRecently(victim) )
	{
          SendToCharacter( "Your victim died!\r\n", ch );
          victim = NULL;
          argument = "done";
        }
      if ( argument[0] == '\0' || !StrCmp( argument, " " )
           ||   !StrCmp( argument, "stat" ) )
        {
          if ( victim )
            do_mstat( ch, victim->name );
          else
            SendToCharacter( "No victim selected.  Type '?' for help.\r\n", ch );
          return;
        }
      if ( !StrCmp( argument, "done" ) || !StrCmp( argument, "off" ) )
        {
          SendToCharacter( "Mset mode off.\r\n", ch );
          ch->substate = SUB_NONE;
          FreeMemory(ch->dest_buf);
          if ( ch->pcdata && ch->pcdata->subprompt )
            FreeMemory( ch->pcdata->subprompt );
          return;
        }
    }
  if ( victim )
    {
      lockvictim = true;
      strcpy( arg1, victim->name );
      argument = OneArgument( argument, arg2 );
      strcpy( arg3, argument );
    }
  else
    {
      lockvictim = false;
      argument = OneArgument( argument, arg1 );
      argument = OneArgument( argument, arg2 );
      strcpy( arg3, argument );
    }

  if ( arg1[0] == '\0' || (arg2[0] == '\0' && ch->substate != SUB_REPEATCMD)
       ||   !StrCmp( arg1, "?" ) )
    {
      if ( ch->substate == SUB_REPEATCMD )
        {
          if ( victim )
	    SendToCharacter( "Syntax: <field>  <value>\r\n",               ch );
          else
            SendToCharacter( "Syntax: <victim> <field>  <value>\r\n",      ch );
        }
      else
        SendToCharacter( "Syntax: mset <victim> <field>  <value>\r\n",     ch );
      SendToCharacter( "\r\n",                                             ch );
      SendToCharacter( "Field being one of:\r\n",                  ch );
      SendToCharacter( "  str int wis dex con cha lck frc sex\r\n",        ch );
      SendToCharacter( "  credits hp force move align race\r\n",ch );
      SendToCharacter( "  hitroll damroll armor affected level\r\n",       ch );
      SendToCharacter( "  thirst drunk full blood flags\r\n",              ch );
      SendToCharacter( "  pos defpos part (see BODYPARTS)\r\n",            ch );
      SendToCharacter( "  sav1 sav2 sav4 sav4 sav5 (see SAVINGTHROWS)\r\n", ch );
      SendToCharacter( "  resistant immune susceptible (see RIS)\r\n",     ch );
      SendToCharacter( "  attack defense numattacks\r\n",          ch );
      SendToCharacter( "  speaking speaks (see LANGUAGES)\r\n",            ch );
      SendToCharacter( "  name short long description title spec spec2\r\n", ch );
      SendToCharacter( "  clan vip wanted\r\n",                  ch );
      SendToCharacter( "\r\n",                                             ch );
      SendToCharacter( "For editing index/prototype mobiles:\r\n", ch );
      SendToCharacter( "  hitnumdie hitsizedie hitplus (hit points)\r\n",ch );
      SendToCharacter( "  damnumdie damsizedie damplus (damage roll)\r\n",ch );
      SendToCharacter( "To toggle area flag: aloaded\r\n",ch);
      return;
    }

  if ( !victim && GetTrustLevel( ch ) <= LEVEL_IMMORTAL )
    {
      if ( ( victim = GetCharacterInRoom( ch, arg1 ) ) == NULL )
        {
          SendToCharacter( "They aren't here.\r\n", ch );
          return;
        }
    }
  else
    if ( !victim )
      {
        if ( ( victim = GetCharacterAnywhere( ch, arg1 ) ) == NULL )
          {
            SendToCharacter( "No one like that in all the realms.\r\n", ch );
            return;
          }
      }
  if ( GetTrustLevel(ch) < sysdata.level_mset_player && (victim != ch) && !IsNpc( victim ) )
    {
      SendToCharacter( "You can't do that!\r\n", ch );
      FreeMemory(ch->dest_buf);
      return;
    }
  if ( GetTrustLevel( ch ) < GetTrustLevel( victim ) && !IsNpc( victim ) )
    {
      SendToCharacter( "You can't do that!\r\n", ch );
      FreeMemory(ch->dest_buf);
      return;
    }
  if ( lockvictim )
    ch->dest_buf = victim;

  if ( IsNpc(victim) )
    {
      minattr = 1;
      maxattr = 25;
    }
  else
    {
      minattr = 1;
      maxattr = 25;
    }

  value = IsNumber( arg3 ) ? atoi( arg3 ) : -1;

  if ( atoi(arg3) < -1 && value == -1 )
    value = atoi(arg3);

  if ( !StrCmp( arg2, "str" ) )
    {
      if ( !CanModifyCharacter( ch, victim ) )
        return;
      if ( value < minattr || value > maxattr )
        {
          Echo( ch, "Strength range is %d to %d.\r\n", minattr, maxattr );
          return;
        }
      victim->stats.perm_str = value;
      if ( IsNpc(victim) && IsBitSet( victim->act, ACT_PROTOTYPE ) )
        victim->Prototype->stats.perm_str = value;
      return;
    }

  if ( !StrCmp( arg2, "int" ) )
    {
      if ( !CanModifyCharacter( ch, victim ) )
        return;
      if ( value < minattr || value > maxattr )
        {
          Echo( ch, "Intelligence range is %d to %d.\r\n", minattr, maxattr );
          return;
        }
      victim->stats.perm_int = value;
      if ( IsNpc(victim) && IsBitSet( victim->act, ACT_PROTOTYPE ) )
        victim->Prototype->stats.perm_int = value;
      return;
    }

  if ( !StrCmp( arg2, "wis" ) )
    {
      if ( !CanModifyCharacter( ch, victim ) )
        return;
      if ( value < minattr || value > maxattr )
        {
          Echo( ch, "Wisdom range is %d to %d.\r\n", minattr, maxattr );
          return;
        }
      victim->stats.perm_wis = value;
      if ( IsNpc(victim) && IsBitSet( victim->act, ACT_PROTOTYPE ) )
        victim->Prototype->stats.perm_wis = value;
      return;
    }

  if ( !StrCmp( arg2, "dex" ) )
    {
      if ( !CanModifyCharacter( ch, victim ) )
        return;
      if ( value < minattr || value > maxattr )
        {
          Echo( ch, "Dexterity range is %d to %d.\r\n", minattr, maxattr );
          return;
        }
      victim->stats.perm_dex = value;
      if ( IsNpc(victim) && IsBitSet( victim->act, ACT_PROTOTYPE ) )
        victim->Prototype->stats.perm_dex = value;
      return;
    }

  if ( !StrCmp( arg2, "con" ) )
    {
      if ( !CanModifyCharacter( ch, victim ) )
        return;
      if ( value < minattr || value > maxattr )
        {
          Echo( ch, "Constitution range is %d to %d.\r\n", minattr, maxattr );
          return;
        }
      victim->stats.perm_con = value;
      if ( IsNpc(victim) && IsBitSet( victim->act, ACT_PROTOTYPE ) )
        victim->Prototype->stats.perm_con = value;
      return;
    }

  if ( !StrCmp( arg2, "cha" ) )
    {
      if ( !CanModifyCharacter( ch, victim ) )
        return;
      if ( value < minattr || value > maxattr )
        {
          Echo( ch, "Charisma range is %d to %d.\r\n", minattr, maxattr );
          return;
        }
      victim->stats.perm_cha = value;
      if ( IsNpc(victim) && IsBitSet( victim->act, ACT_PROTOTYPE ) )
        victim->Prototype->stats.perm_cha = value;
      return;
    }

  if ( !StrCmp( arg2, "lck" ) )
    {
      if ( !CanModifyCharacter( ch, victim ) )
        return;
      if ( value < minattr || value > maxattr )
        {
          Echo( ch, "Luck range is %d to %d.\r\n", minattr, maxattr );
          return;
        }
      victim->stats.perm_lck = value;
      if ( IsNpc(victim) && IsBitSet( victim->act, ACT_PROTOTYPE ) )
        victim->Prototype->stats.perm_lck = value;
      return;
    }

  if ( !StrCmp( arg2, "frc" ) )
    {
      if ( !CanModifyCharacter( ch, victim ) )
        return;

      if ( value < minattr || value > 20 )
        {
          Echo( ch, "Frc range is %d to %d.\r\n", minattr, 20 );
          return;
        }
      victim->stats.perm_frc = value;
      if ( IsNpc(victim) && IsBitSet( victim->act, ACT_PROTOTYPE ) )
        victim->Prototype->stats.perm_frc = value;
      return;
    }

  if ( !StrCmp( arg2, "sav1" ) )
    {
      if ( !CanModifyCharacter( ch, victim ) )
        return;
      if ( value < -30 || value > 30 )
        {
          SendToCharacter( "Saving throw range vs poison is -30 to 30.\r\n", ch );
          return;
        }
      victim->saving.poison_death = value;
      if ( IsNpc(victim) && IsBitSet( victim->act, ACT_PROTOTYPE ) )
        victim->Prototype->saving.poison_death = value;
      return;
    }

  if ( !StrCmp( arg2, "sav2" ) )
    {
      if ( !CanModifyCharacter( ch, victim ) )
        return;
      if ( value < -30 || value > 30 )
        {
          SendToCharacter( "Saving throw range vs wands is -30 to 30.\r\n", ch );
          return;
        }
      victim->saving.wand = value;
      if ( IsNpc(victim) && IsBitSet( victim->act, ACT_PROTOTYPE ) )
        victim->Prototype->saving.wand = value;
      return;
    }

  if ( !StrCmp( arg2, "sav3" ) )
    {
      if ( !CanModifyCharacter( ch, victim ) )
        return;
      if ( value < -30 || value > 30 )
        {
          SendToCharacter( "Saving throw range vs para is -30 to 30.\r\n", ch );
          return;
        }
      victim->saving.para_petri = value;
      if ( IsNpc(victim) && IsBitSet( victim->act, ACT_PROTOTYPE ) )
        victim->Prototype->saving.para_petri = value;
      return;
    }

  if ( !StrCmp( arg2, "sav4" ) )
    {
      if ( !CanModifyCharacter( ch, victim ) )
        return;
      if ( value < -30 || value > 30 )
        {
          SendToCharacter( "Saving throw range vs bad breath is -30 to 30.\r\n", ch );
          return;
        }
      victim->saving.breath = value;
      if ( IsNpc(victim) && IsBitSet( victim->act, ACT_PROTOTYPE ) )
        victim->Prototype->saving.breath = value;
      return;
    }

  if ( !StrCmp( arg2, "sav5" ) )
    {
      if ( !CanModifyCharacter( ch, victim ) )
        return;
      if ( value < -30 || value > 30 )
        {
          SendToCharacter( "Saving throw range vs force powers is -30 to 30.\r\n", ch );
          return;
        }
      victim->saving.spell_staff = value;
      if ( IsNpc(victim) && IsBitSet( victim->act, ACT_PROTOTYPE ) )
        victim->Prototype->saving.spell_staff = value;
      return;
    }

  if ( !StrCmp( arg2, "sex" ) )
    {
      if ( !CanModifyCharacter( ch, victim ) )
        return;
      if ( value < 0 || value > 2 )
        {
          SendToCharacter( "Sex range is 0 to 2.\r\n", ch );
          return;
        }
      victim->sex = value;
      if ( IsNpc(victim) && IsBitSet( victim->act, ACT_PROTOTYPE ) )
        victim->Prototype->sex = value;
      return;
    }

  if ( !StrCmp( arg2, "race" ) )
    {
      if ( !CanModifyCharacter( ch, victim ) )
        return;
      value = GetNpcRace( arg3 );
      if ( value < 0 )
        value = atoi( arg3 );
      if ( !IsNpc(victim) && (value < 0 || value >= MAX_RACE) )
        {
          Echo( ch, "Race range is 0 to %d.\n", MAX_RACE-1 );
          return;
        }
      if ( IsNpc(victim) && (value < 0 || value >= MAX_NPC_RACE) )
        {
          Echo( ch, "Race range is 0 to %d.\n", MAX_NPC_RACE-1 );
          return;
        }
      victim->race = value;
      if ( IsNpc(victim) && IsBitSet( victim->act, ACT_PROTOTYPE ) )
        victim->Prototype->race = value;
      return;
    }

  if ( !StrCmp( arg2, "armor" ) )
    {
      if ( !CanModifyCharacter( ch, victim ) )
        return;
      if ( value < -300 || value > 300 )
        {
          SendToCharacter( "AC range is -300 to 300.\r\n", ch );
	  return;
        }
      victim->armor = value;
      if ( IsNpc(victim) && IsBitSet( victim->act, ACT_PROTOTYPE ) )
        victim->Prototype->ac = value;
      return;
    }

  if ( !StrCmp( arg2, "level" ) )
    {
      if ( !CanModifyCharacter( ch, victim ) )
        return;
      if ( !IsNpc(victim) )
        {
          SendToCharacter( "Not on PC's.\r\n", ch );
          return;
        }

      if ( value < 0 || value > LEVEL_AVATAR + 5 )
        {
          Echo( ch, "Level range is 0 to %d.\r\n", LEVEL_AVATAR + 5 );
          return;
        }
      {
        int ability;

        for ( ability = 0 ; ability < MAX_ABILITY ; ability++ )
	  {
	    SetAbilityLevel( victim, ability, value );
	  }
      }

      victim->top_level = value;
      victim->armor = 100-value*2.5;
      victim->hitroll = value/5;
      victim->damroll = value/5;

      if ( IsNpc(victim) && IsBitSet( victim->act, ACT_PROTOTYPE ) )
        {
          victim->Prototype->level = value;
          victim->Prototype->ac = 100-value*2.5;
          victim->Prototype->hitroll = victim->hitroll;
          victim->Prototype->damroll = victim->damroll;
        }
      sprintf(outbuf,"%s damnumdie %d",arg1, value/10);
      do_mset( ch, outbuf );
      sprintf(outbuf,"%s damsizedie %d",arg1, 4);
      do_mset( ch, outbuf );
      sprintf(outbuf,"%s damplus %d",arg1, 2);
      do_mset( ch, outbuf );
      sprintf(outbuf,"%s hitnumdie %d",arg1, value/5);
      do_mset( ch, outbuf );
      sprintf(outbuf,"%s hitsizedie %d",arg1, 10);
      do_mset( ch, outbuf );
      sprintf(outbuf,"%s hitplus %d",arg1, value*10 );
      do_mset( ch, outbuf );

      return;
    }

  if ( !StrCmp( arg2, "numattacks" ) )
    {
      if ( !CanModifyCharacter( ch, victim ) )
        return;
      if ( !IsNpc(victim) )
        {
          SendToCharacter( "Not on PC's.\r\n", ch );
          return;
        }

      if ( value < 0 || value > 20 )
        {
          SendToCharacter( "Attacks range is 0 to 20.\r\n", ch );
          return;
        }
      victim->numattacks = value;
      if ( IsNpc(victim) && IsBitSet( victim->act, ACT_PROTOTYPE ) )
        victim->Prototype->numattacks = value;
      return;
    }

  if ( !StrCmp( arg2, "credits" ) )
    {
      if ( !CanModifyCharacter( ch, victim ) )
        return;
      victim->gold = value;
      if ( IsNpc(victim) && IsBitSet( victim->act, ACT_PROTOTYPE ) )
        victim->Prototype->gold = value;
      return;
    }

  if ( !StrCmp( arg2, "hitroll" ) )
    {
      if ( !CanModifyCharacter( ch, victim ) )
        return;
      victim->hitroll = urange(0, value, 85);
      if ( IsNpc(victim) && IsBitSet( victim->act, ACT_PROTOTYPE ) )
        victim->Prototype->hitroll = victim->hitroll;
      return;
    }

  if ( !StrCmp( arg2, "damroll" ) )
    {
      if ( !CanModifyCharacter( ch, victim ) )
        return;
      victim->damroll = urange(0, value, 65);
      if ( IsNpc(victim) && IsBitSet( victim->act, ACT_PROTOTYPE ) )
        victim->Prototype->damroll = victim->damroll;
      return;
    }

  if ( !StrCmp( arg2, "hp" ) )
    {
      if ( !CanModifyCharacter( ch, victim ) )
        return;
      if ( value < 1 || value > SHRT_MAX )
        {
          Echo( ch, "Hp range is 1 to %s hit points.\r\n",
		PunctuateNumber( SHRT_MAX, NULL ) );
          return;
        }
      victim->max_hit = value;
      return;
    }

  if ( !StrCmp( arg2, "force" ) )
    {
      if ( !CanModifyCharacter( ch, victim ) )
        return;

      if ( value < 0 || value > SHRT_MAX )
        {
          Echo( ch, "Force range is 0 to %s force points.\r\n",
		PunctuateNumber( SHRT_MAX, NULL ) );
          return;
        }
      victim->max_mana = value;
      return;
    }

  if ( !StrCmp( arg2, "move" ) )
    {
      if ( !CanModifyCharacter( ch, victim ) )
        return;
      if ( value < 0 || value > SHRT_MAX )
        {
          Echo( ch, "Move range is 0 to %s move points.\r\n",
		PunctuateNumber( SHRT_MAX, NULL ) );
          return;
        }
      victim->max_move = value;
      return;
    }

  if ( !StrCmp( arg2, "align" ) )
    {
      if ( !CanModifyCharacter( ch, victim ) )
        return;
      if ( value < -1000 || value > 1000 )
        {
          SendToCharacter( "Alignment range is -1000 to 1000.\r\n", ch );
	  return;
        }
      victim->alignment = value;
      if ( IsNpc(victim) && IsBitSet( victim->act, ACT_PROTOTYPE ) )
        victim->Prototype->alignment = value;
      return;
    }

  if ( !StrCmp( arg2, "password" ) )
    {
      char *pwdnew;
      char *p;

      if ( GetTrustLevel( ch ) < LEVEL_SUB_IMPLEM )
        {
          SendToCharacter( "You can't do that.\r\n", ch );
          return;
        }
      if ( IsNpc( victim ) )
        {
          SendToCharacter( "Mobs don't have passwords.\r\n", ch );
          return;
        }

      if ( strlen(arg3) < 5 )
        {
	  Echo( ch, "New password must be at least five characters long.\r\n" );
          return;
        }

      /*
       * No tilde allowed because of player file format.
       */
      pwdnew = EncodeString( arg3 );
      for ( p = pwdnew; *p != '\0'; p++ )
        {
          if ( *p == '~' )
            {
              SendToCharacter(
                           "New password not acceptable, try again.\r\n", ch );
              return;
            }
        }

      FreeMemory( victim->pcdata->pwd );
      victim->pcdata->pwd = CopyString( pwdnew );
      if ( IsBitSet(sysdata.save_flags, SV_PASSCHG) )
        SaveCharacter( victim );
      SendToCharacter( "Ok.\r\n", ch );
      Echo( victim, "Your password has been changed by %s.\r\n", ch->name );
      return;
    }

  if ( !StrCmp( arg2, "mentalstate" ) )
    {
      if ( value < -100 || value > 100 )
        {
          SendToCharacter( "Value must be in range -100 to +100.\r\n", ch );
          return;
        }
      victim->mental_state = value;
      return;
    }

  if ( !StrCmp( arg2, "emotion" ) )
    {
      if ( value < -100 || value > 100 )
        {
          SendToCharacter( "Value must be in range -100 to +100.\r\n", ch );
          return;
        }
      victim->emotional_state = value;
      return;
    }

  if ( !StrCmp( arg2, "thirst" ) )
    {
      if ( IsNpc(victim) )
        {
          SendToCharacter( "Not on NPC's.\r\n", ch );
          return;
        }

      if ( value < 0 || value > 100 )
        {
          SendToCharacter( "Thirst range is 0 to 100.\r\n", ch );
	  return;
        }

      victim->pcdata->condition[COND_THIRST] = value;
      return;
    }

  if ( !StrCmp( arg2, "drunk" ) )
    {
      if ( IsNpc(victim) )
        {
          SendToCharacter( "Not on NPC's.\r\n", ch );
          return;
        }

      if ( value < 0 || value > 100 )
        {
          SendToCharacter( "Drunk range is 0 to 100.\r\n", ch );
          return;
        }

      victim->pcdata->condition[COND_DRUNK] = value;
      return;
    }

  if ( !StrCmp( arg2, "full" ) )
    {
      if ( IsNpc(victim) )
        {
          SendToCharacter( "Not on NPC's.\r\n", ch );
          return;
        }

      if ( value < 0 || value > 100 )
        {
          SendToCharacter( "Full range is 0 to 100.\r\n", ch );
          return;
        }

      victim->pcdata->condition[COND_FULL] = value;
      return;
    }

  if ( !StrCmp( arg2, "blood" ) )
    {
      if ( IsNpc(victim) )
        {
          SendToCharacter( "Not on NPC's.\r\n", ch );
          return;
        }

      if ( value < 0 || value > MAX_LEVEL+10 )
        {
          Echo( ch, "Blood range is 0 to %d.\r\n", MAX_LEVEL+10 );
          return;
        }

      victim->pcdata->condition[COND_BLOODTHIRST] = value;
      return;
    }

  if ( !StrCmp( arg2, "name" ) )
    {
      if ( !CanModifyCharacter( ch, victim ) )
        return;
      if ( !IsNpc(victim) && GetTrustLevel( ch ) < LEVEL_IMPLEMENTOR )
        {
          SendToCharacter( "Not on PC's.\r\n", ch );
          return;
        }

      FreeMemory( victim->name );
      victim->name = CopyString( arg3 );
      if ( IsNpc(victim) && IsBitSet( victim->act, ACT_PROTOTYPE ) )
        {
          FreeMemory( victim->Prototype->name );
          victim->Prototype->name = CopyString( victim->name );
        }
      return;
    }

  if ( !StrCmp( arg2, "minsnoop" ) )
    {
      if ( GetTrustLevel( ch ) < LEVEL_SUB_IMPLEM )
        {
          SendToCharacter( "You can't do that.\r\n", ch );
          return;
        }
      if ( IsNpc(victim) )
        {
	  SendToCharacter( "Not on NPC's.\r\n", ch );
          return;
        }
      if ( victim->pcdata )
        {
          victim->pcdata->min_snoop = value;
          return;
        }
    }

  if ( !StrCmp( arg2, "clan" ) )
    {
      Clan *clan;

      if ( GetTrustLevel( ch ) < LEVEL_GREATER )
        {
          SendToCharacter( "You can't do that.\r\n", ch );
          return;
        }
      if ( IsNpc(victim) )
        {
          SendToCharacter( "Not on NPC's.\r\n", ch );
          return;
        }

      if ( IsNullOrEmpty( arg3 ) )
        {
	  if( !(clan = victim->pcdata->ClanInfo.Clan ) )
	    {
	      Echo( ch, "%s isn't clanned.\r\n", victim->name );
	      return;
	    }

	  RemoveClanMember( victim );
          FreeMemory( victim->pcdata->ClanInfo.ClanName );
          victim->pcdata->ClanInfo.ClanName = CopyString( "" );
          victim->pcdata->ClanInfo.Clan = NULL;
          SendToCharacter( "Removed from clan.\r\nBe sure to remove any bestowments they have been given.\r\n", ch );
	  SaveClan( clan );
	  SaveCharacter( victim );
          return;
        }

      clan = GetClan( arg3 );

      if ( !clan )
        {
          SendToCharacter( "No such clan.\r\n", ch );
          return;
        }

      FreeMemory( victim->pcdata->ClanInfo.ClanName );
      victim->pcdata->ClanInfo.ClanName = CopyString( clan->Name );
      victim->pcdata->ClanInfo.Clan = clan;

      Echo( ch, "Done.\r\n" );
      UpdateClanMember( victim );
      SaveClan( clan );
      SaveCharacter( victim );
      return;
    }


  if ( !StrCmp( arg2, "short" ) )
    {
      FreeMemory( victim->short_descr );
      victim->short_descr = CopyString( arg3 );
      if ( IsNpc(victim) && IsBitSet( victim->act, ACT_PROTOTYPE ) )
        {
          FreeMemory( victim->Prototype->short_descr );
          victim->Prototype->short_descr = CopyString( victim->short_descr );
        }
      return;
    }

  if ( !StrCmp( arg2, "long" ) )
    {
      FreeMemory( victim->long_descr );
      strcpy( buf, arg3 );
      strcat( buf, "\r\n" );
      victim->long_descr = CopyString( buf );
      if ( IsNpc(victim) && IsBitSet( victim->act, ACT_PROTOTYPE ) )
        {
          FreeMemory( victim->Prototype->long_descr );
          victim->Prototype->long_descr = CopyString( victim->long_descr );
        }
      return;
    }

  if ( !StrCmp( arg2, "description" ) )
    {
      if ( arg3[0] )
        {
          FreeMemory( victim->description );
          victim->description = CopyString( arg3 );
          if ( IsNpc( victim ) && IsBitSet( victim->act, ACT_PROTOTYPE ) )
            {
              FreeMemory(victim->Prototype->description );
              victim->Prototype->description = CopyString( victim->description );
            }
          return;
        }
      CHECK_SUBRESTRICTED( ch );

      if ( ch->substate == SUB_REPEATCMD )
        ch->tempnum = SUB_REPEATCMD;
      else
        ch->tempnum = SUB_NONE;
      ch->substate = SUB_MOB_DESC;
      ch->dest_buf = victim;
      StartEditing( ch, victim->description );
      SetEditorDescription( ch, "Mobile %d (%s) description",
			    victim->Prototype->vnum, victim->name );
      return;
    }

  if ( !StrCmp( arg2, "title" ) )
    {
      if ( IsNpc(victim) )
        {
          SendToCharacter( "Not on NPC's.\r\n", ch );
          return;
        }

      SetCharacterTitle( victim, arg3 );
      return;
    }

  if ( !StrCmp( arg2, "spec" ) )
    {
      if ( !CanModifyCharacter( ch, victim ) )
        return;
      if ( !IsNpc(victim) )
        {
          SendToCharacter( "Not on PC's.\r\n", ch );
          return;
        }

      if ( !StrCmp( arg3, "none" ) )
        {
          victim->spec_fun = NULL;
          SendToCharacter( "Special function removed.\r\n", ch );
          if ( IsNpc(victim) && IsBitSet( victim->act, ACT_PROTOTYPE ) )
            victim->Prototype->spec_fun = victim->spec_fun;
          return;
        }

      if ( ( victim->spec_fun = SpecialLookup( arg3 ) ) == 0 )
        {
          SendToCharacter( "No such spec fun.\r\n", ch );
          return;
        }
      if ( IsNpc(victim) && IsBitSet( victim->act, ACT_PROTOTYPE ) )
        victim->Prototype->spec_fun = victim->spec_fun;
      return;
    }

  if ( !StrCmp( arg2, "spec2" ) )
    {
      if ( !CanModifyCharacter( ch, victim ) )
        return;
      if ( !IsNpc(victim) )
        {
          SendToCharacter( "Not on PC's.\r\n", ch );
          return;
        }

      if ( !StrCmp( arg3, "none" ) )
        {
          victim->spec_2 = NULL;
          SendToCharacter( "Special function removed.\r\n", ch );
          if ( IsNpc(victim) && IsBitSet( victim->act, ACT_PROTOTYPE ) )
            victim->Prototype->spec_2 = victim->spec_2;
          return;
        }

      if ( ( victim->spec_2 = SpecialLookup( arg3 ) ) == 0 )
        {
          SendToCharacter( "No such spec fun.\r\n", ch );
          return;
        }
      if ( IsNpc(victim) && IsBitSet( victim->act, ACT_PROTOTYPE ) )
        victim->Prototype->spec_2 = victim->spec_2;
      return;
    }
  if ( !StrCmp( arg2, "whoCloak" ) )
    {
      if ( IsNpc(victim) )
        {
          SendToCharacter( "Not on NPC's.\r\n", ch );
          return;
        }

      if ( (victim->pcdata) && (victim->pcdata->whoCloak) )
        {
          victim->pcdata->whoCloak = false;
          SendToCharacter( "This user will no longer be cloaked.\r\n", ch);
	  return;
        }
      if ( (victim->pcdata) && (!(victim->pcdata->whoCloak)) )
        {
          victim->pcdata->whoCloak = true;
          SendToCharacter( "This user will now be cloaked on the who list!\r\n", ch);
          return;
        }
      SendToCharacter( "Error setting whoCloak.", ch);
      return;
    }

  if ( !StrCmp( arg2, "flags" ) )
    {
      bool pcflag;
      if ( !IsNpc( victim ) && GetTrustLevel( ch ) < LEVEL_GREATER )
        {
          SendToCharacter( "You can only modify a mobile's flags.\r\n", ch );
          return;
        }

      if ( !CanModifyCharacter( ch, victim ) )
        return;
      if ( !argument || argument[0] == '\0' )
        {
          SendToCharacter( "Usage: mset <victim> flags <flag> [flag]...\r\n", ch );
          SendToCharacter( "sentinal, scavenger, aggressive, stayarea, wimpy, practice, immortal,\r\n", ch );
          SendToCharacter( "deadly, mountable, guardian, nokill, scholar, noassist, droid, nocorpse,\r\n", ch );
          return;
        }
      while ( argument[0] != '\0' )
        {
          pcflag = false;
          argument = OneArgument( argument, arg3 );
          value = IsNpc( victim) ? GetActFlag( arg3 ) : GetPlayerFlag( arg3 );

          if ( !IsNpc( victim ) && ( value < 0 || value > 31 ) )
            {
              pcflag = true;
              value = GetPcFlag( arg3 );
            }
          if ( value < 0 || value > 31 )
            Echo( ch, "Unknown flag: %s\r\n", arg3 );
	  else
            {
              if ( IsNpc(victim) && 1 << value == ACT_IsNpc )
                SendToCharacter( "If that could be changed, it would cause many problems.\r\n", ch );
              else
                if ( IsNpc(victim) && 1 << value == ACT_POLYMORPHED )
                  SendToCharacter( "Changing that would be a _bad_ thing.\r\n", ch);
                else
                  {
                    if ( pcflag )
                      ToggleBit( victim->pcdata->flags, 1 << value );
                    else
                      {
                        ToggleBit( victim->act, 1 << value );
                        /* NPC check added by Gorog */
                        if ( IsNpc(victim) && (1 << value == ACT_PROTOTYPE) )
                          victim->Prototype->act = victim->act;
                      }
                  }
            }
        }
      if ( IsNpc(victim) && IsBitSet( victim->act, ACT_PROTOTYPE ) )
        victim->Prototype->act = victim->act;
      return;
    }

  if ( !StrCmp( arg2, "wanted" ) )
    {
      if ( IsNpc( victim ) )
        {
          SendToCharacter( "Wanted flags are for players only.\r\n", ch );
          return;
        }

      if ( GetTrustLevel( ch ) < LEVEL_GREATER )
        {
          SendToCharacter( "You are not a high enough level to do that.\r\n", ch );
          return;
        }

      if ( !CanModifyCharacter( ch, victim ) )
        return;
      if ( !argument || argument[0] == '\0' )
        {
          SendToCharacter( "Usage: mset <victim> wanted <planet> [planet]...\r\n", ch );
	  return;
        }

      while ( argument[0] != '\0' )
        {
          argument = OneArgument( argument, arg3 );
          value = GetWantedFlag( arg3 );
          if ( value < 0 || value > 31 )
            Echo( ch, "Unknown flag: %s\r\n", arg3 );
          else
            ToggleBit( victim->pcdata->wanted_flags, 1 << value );
        }
      return;
    }

  if ( !StrCmp( arg2, "vip" ) )
    {
      if ( !IsNpc( victim ))
        {
          SendToCharacter( "VIP flags are for mobs only.\r\n", ch );
          return;
        }

      if ( !CanModifyCharacter( ch, victim ) )
        return;

      if ( !argument || argument[0] == '\0' )
        {
          SendToCharacter( "Usage: mset <victim> vip <planet> [planet]...\r\n", ch );
          return;
        }

      while ( argument[0] != '\0' )
        {
          argument = OneArgument( argument, arg3 );
          value = GetVipFlag( arg3 );
          if ( value < 0 || value > 31 )
            Echo( ch, "Unknown flag: %s\r\n", arg3 );
          else
            ToggleBit( victim->vip_flags, 1 << value );
        }
      if ( IsNpc(victim) && IsBitSet( victim->act, ACT_PROTOTYPE ) )
        victim->Prototype->vip_flags = victim->vip_flags;
      return;
    }

  if ( !StrCmp( arg2, "affected" ) )
    {
      if ( !IsNpc( victim ) && GetTrustLevel( ch ) < LEVEL_CREATOR )
        {
          SendToCharacter( "You can only modify a mobile's flags.\r\n", ch );
          return;
        }

      if ( !CanModifyCharacter( ch, victim ) )
        return;
      if ( !argument || argument[0] == '\0' )
        {
          SendToCharacter( "Usage: mset <victim> affected <flag> [flag]...\r\n", ch);
          return;
        }
      while ( argument[0] != '\0' )
        {
          argument = OneArgument( argument, arg3 );
          value = GetAffectedFlag( arg3 );
          if ( value < 0 || value > 31 )
            Echo( ch, "Unknown flag: %s\r\n", arg3 );
          else
            ToggleBit( victim->affected_by, 1 << value );
        }
      if ( IsNpc( victim ) && IsBitSet( victim->act, ACT_PROTOTYPE ) )
        victim->Prototype->affected_by = victim->affected_by;
      return;
    }

  /*
   * save some more finger-leather for setting RIS stuff
   */
  if ( !StrCmp( arg2, "r" ) )
    {
      if ( !IsNpc( victim ) && GetTrustLevel( ch ) < LEVEL_CREATOR )
        {
          SendToCharacter( "You can only modify a mobile's ris.\r\n", ch );
          return;
        }
      if ( !CanModifyCharacter( ch, victim ) )
        return;

      sprintf(outbuf,"%s resistant %s",arg1, arg3);
      do_mset( ch, outbuf );
      return;
    }
  if ( !StrCmp( arg2, "i" ) )
    {
      if ( !IsNpc( victim ) && GetTrustLevel( ch ) < LEVEL_CREATOR )
        {
          SendToCharacter( "You can only modify a mobile's ris.\r\n", ch );
          return;
        }
      if ( !CanModifyCharacter( ch, victim ) )
        return;


      sprintf(outbuf,"%s immune %s",arg1, arg3);
      do_mset( ch, outbuf );
      return;
    }
  if ( !StrCmp( arg2, "s" ) )
    {
      if ( !IsNpc( victim ) && GetTrustLevel( ch ) < LEVEL_CREATOR )
        {
          SendToCharacter( "You can only modify a mobile's ris.\r\n", ch );
          return;
        }
      if ( !CanModifyCharacter( ch, victim ) )
        return;

      sprintf(outbuf,"%s susceptible %s",arg1, arg3);
      do_mset( ch, outbuf );
      return;
    }
  if ( !StrCmp( arg2, "ri" ) )
    {
      if ( !IsNpc( victim ) && GetTrustLevel( ch ) < LEVEL_CREATOR )
        {
          SendToCharacter( "You can only modify a mobile's ris.\r\n", ch );
          return;
        }
      if ( !CanModifyCharacter( ch, victim ) )
        return;

      sprintf(outbuf,"%s resistant %s",arg1, arg3);
      do_mset( ch, outbuf );
      sprintf(outbuf,"%s immune %s",arg1, arg3);
      do_mset( ch, outbuf );
      return;
    }

  if ( !StrCmp( arg2, "rs" ) )
    {
      if ( !IsNpc( victim ) && GetTrustLevel( ch ) < LEVEL_CREATOR )
        {
          SendToCharacter( "You can only modify a mobile's ris.\r\n", ch );
          return;
        }
      if ( !CanModifyCharacter( ch, victim ) )
        return;

      sprintf(outbuf,"%s resistant %s",arg1, arg3);
      do_mset( ch, outbuf );
      sprintf(outbuf,"%s susceptible %s",arg1, arg3);
      do_mset( ch, outbuf );
      return;
    }
  if ( !StrCmp( arg2, "is" ) )
    {
      if ( !IsNpc( victim ) && GetTrustLevel( ch ) < LEVEL_CREATOR )
        {
          SendToCharacter( "You can only modify a mobile's ris.\r\n", ch );
          return;
        }
      if ( !CanModifyCharacter( ch, victim ) )
        return;

      sprintf(outbuf,"%s immune %s",arg1, arg3);
      do_mset( ch, outbuf );
      sprintf(outbuf,"%s susceptible %s",arg1, arg3);
      do_mset( ch, outbuf );
      return;
    }
  if ( !StrCmp( arg2, "ris" ) )
    {
      if ( !IsNpc( victim ) && GetTrustLevel( ch ) < LEVEL_CREATOR )
        {
          SendToCharacter( "You can only modify a mobile's ris.\r\n", ch );
          return;
        }
      if ( !CanModifyCharacter( ch, victim ) )
        return;

      sprintf(outbuf,"%s resistant %s",arg1, arg3);
      do_mset( ch, outbuf );
      sprintf(outbuf,"%s immune %s",arg1, arg3);
      do_mset( ch, outbuf );
      sprintf(outbuf,"%s susceptible %s",arg1, arg3);
      do_mset( ch, outbuf );
      return;
    }

  if ( !StrCmp( arg2, "resistant" ) )
    {
      if ( !IsNpc( victim ) && GetTrustLevel( ch ) < LEVEL_CREATOR )
        {
          SendToCharacter( "You can only modify a mobile's resistancies.\r\n", ch );
          return;
        }
      if ( !CanModifyCharacter( ch, victim ) )
        return;
      if ( !argument || argument[0] == '\0' )
        {
          SendToCharacter( "Usage: mset <victim> resistant <flag> [flag]...\r\n", ch );
          return;
        }
      while ( argument[0] != '\0' )
        {
          argument = OneArgument( argument, arg3 );
          value = GetResistanceFlag( arg3 );
          if ( value < 0 || value > 31 )
            Echo( ch, "Unknown flag: %s\r\n", arg3 );
          else
            ToggleBit( victim->resistant, 1 << value );
        }
      if ( IsNpc( victim ) && IsBitSet( victim->act, ACT_PROTOTYPE ) )
        victim->Prototype->resistant = victim->resistant;
      return;
    }

  if ( !StrCmp( arg2, "immune" ) )
    {
      if ( !IsNpc( victim ) && GetTrustLevel( ch ) < LEVEL_CREATOR )
        {
          SendToCharacter( "You can only modify a mobile's immunities.\r\n", ch );
          return;
        }

      if ( !CanModifyCharacter( ch, victim ) )
        return;
      if ( !argument || argument[0] == '\0' )
        {
          SendToCharacter( "Usage: mset <victim> immune <flag> [flag]...\r\n", ch );
          return;
        }
      while ( argument[0] != '\0' )
        {
          argument = OneArgument( argument, arg3 );
          value = GetResistanceFlag( arg3 );
          if ( value < 0 || value > 31 )
            Echo( ch, "Unknown flag: %s\r\n", arg3 );
          else
            ToggleBit( victim->immune, 1 << value );
        }
      if ( IsNpc( victim ) && IsBitSet( victim->act, ACT_PROTOTYPE ) )
        victim->Prototype->immune = victim->immune;
      return;
    }

  if ( !StrCmp( arg2, "susceptible" ) )
    {
      if ( !IsNpc( victim ) && GetTrustLevel( ch ) < LEVEL_CREATOR )
        {
          SendToCharacter( "You can only modify a mobile's susceptibilities.\r\n", ch );
          return;
        }
      if ( !CanModifyCharacter( ch, victim ) )
        return;
      if ( !argument || argument[0] == '\0' )
        {
          SendToCharacter( "Usage: mset <victim> susceptible <flag> [flag]...\r\n", ch );
          return;
        }
      while ( argument[0] != '\0' )
        {
          argument = OneArgument( argument, arg3 );
          value = GetResistanceFlag( arg3 );
          if ( value < 0 || value > 31 )
            Echo( ch, "Unknown flag: %s\r\n", arg3 );
          else
            ToggleBit( victim->susceptible, 1 << value );
        }
      if ( IsNpc( victim ) && IsBitSet( victim->act, ACT_PROTOTYPE ) )
	if ( IsNpc( victim ) && IsBitSet( victim->act, ACT_PROTOTYPE ) )
	  victim->Prototype->susceptible = victim->susceptible;
      return;
    }

  if ( !StrCmp( arg2, "part" ) )
    {
      if ( !IsNpc( victim ) && GetTrustLevel( ch ) < LEVEL_CREATOR )
        {
          SendToCharacter( "You can only modify a mobile's parts.\r\n", ch );
          return;
        }
      if ( !CanModifyCharacter( ch, victim ) )
        return;
      if ( !argument || argument[0] == '\0' )
        {
          SendToCharacter( "Usage: mset <victim> part <flag> [flag]...\r\n", ch );
          return;
        }
      while ( argument[0] != '\0' )
        {
          argument = OneArgument( argument, arg3 );
          value = GetBodyPartFlag( arg3 );
          if ( value < 0 || value > 31 )
            Echo( ch, "Unknown flag: %s\r\n", arg3 );
          else
            ToggleBit( victim->xflags, 1 << value );
        }
      if ( IsNpc( victim ) && IsBitSet( victim->act, ACT_PROTOTYPE ) )
        victim->Prototype->xflags = victim->xflags;
      return;
    }

  if ( !StrCmp( arg2, "attack" ) )
    {
      if ( !IsNpc( victim ) )
        {
          SendToCharacter( "You can only modify a mobile's attacks.\r\n", ch );
          return;
        }
      if ( !CanModifyCharacter( ch, victim ) )
        return;
      if ( !argument || argument[0] == '\0' )
        {
          SendToCharacter( "Usage: mset <victim> attack <flag> [flag]...\r\n", ch );
          SendToCharacter( "bite          claws        tail        sting      punch        kick\r\n",
			ch );
          SendToCharacter( "trip          bash         stun        gouge      backstab\r\n", ch );
          return;
        }
      while ( argument[0] != '\0' )
        {
          argument = OneArgument( argument, arg3 );
          value = GetAttackFlag( arg3 );
          if ( value < 0 || value > 31 )
            Echo( ch, "Unknown flag: %s\r\n", arg3 );
          else
            ToggleBit( victim->attacks, 1 << value );
        }
      if ( IsNpc( victim ) && IsBitSet( victim->act, ACT_PROTOTYPE ) )
        victim->Prototype->attacks = victim->attacks;
      return;
    }

  if ( !StrCmp( arg2, "defense" ) )
    {
      if ( !IsNpc( victim ) )
        {
          SendToCharacter( "You can only modify a mobile's defenses.\r\n", ch );
          return;
        }
      if ( !CanModifyCharacter( ch, victim ) )
        return;
      if ( !argument || argument[0] == '\0' )
        {
          SendToCharacter( "Usage: mset <victim> defense <flag> [flag]...\r\n", ch );
          SendToCharacter( "parry        dodge\r\n",ch );
          return;
        }
      while ( argument[0] != '\0' )
        {
          argument = OneArgument( argument, arg3 );
          value = GetDefenseFlag( arg3 );
          if ( value < 0 || value > 31 )
            Echo( ch, "Unknown flag: %s\r\n", arg3 );
          else
            ToggleBit( victim->defenses, 1 << value );
        }
      if ( IsNpc( victim ) && IsBitSet( victim->act, ACT_PROTOTYPE ) )
        victim->Prototype->defenses = victim->defenses;
      return;
    }

  if ( !StrCmp( arg2, "pos" ) )
    {
      if ( !IsNpc(victim) )
        {
          SendToCharacter( "Mobiles only.\r\n", ch );
          return;
        }
      if ( !CanModifyCharacter( ch, victim ) )
        return;
      if ( value < 0 || value > POS_STANDING )
        {
          Echo( ch, "Position range is 0 to %d.\r\n", POS_STANDING );
          return;
        }
      victim->position = value;
      if ( IsNpc( victim ) && IsBitSet( victim->act, ACT_PROTOTYPE ) )
        victim->Prototype->position = victim->position;
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "defpos" ) )
    {
      if ( !IsNpc(victim) )
        {
          SendToCharacter( "Mobiles only.\r\n", ch );
          return;
        }
      if ( !CanModifyCharacter( ch, victim ) )
        return;
      if ( value < 0 || value > POS_STANDING )
        {
          Echo( ch, "Position range is 0 to %d.\r\n", POS_STANDING );
          return;
        }
      victim->defposition = value;
      if ( IsNpc( victim ) && IsBitSet( victim->act, ACT_PROTOTYPE ) )
        victim->Prototype->defposition = victim->defposition;
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  /*
   * save some finger-leather
   */
  if ( !StrCmp( arg2, "hitdie" ) )
    {
      if ( !IsNpc(victim) )
        {
          SendToCharacter( "Mobiles only.\r\n", ch );
          return;
        }
      if ( !CanModifyCharacter( ch, victim ) )
        return;

      sscanf(arg3,"%d %c %d %c %d",&num,&char1,&size,&char2,&plus);
      sprintf(outbuf,"%s hitnumdie %d",arg1, num);
      do_mset( ch, outbuf );

      sprintf(outbuf,"%s hitsizedie %d",arg1, size);
      do_mset( ch, outbuf );

      sprintf(outbuf,"%s hitplus %d",arg1, plus);
      do_mset( ch, outbuf );
      return;
    }
  /*
   * save some more finger-leather
   */
  if ( !StrCmp( arg2, "damdie" ) )
    {
      if ( !IsNpc(victim) )
        {
          SendToCharacter( "Mobiles only.\r\n", ch );
          return;
        }
      if ( !CanModifyCharacter( ch, victim ) )
        return;

      sscanf(arg3,"%d %c %d %c %d",&num,&char1,&size,&char2,&plus);
      sprintf(outbuf,"%s damnumdie %d",arg1, num);
      do_mset( ch, outbuf );
      sprintf(outbuf,"%s damsizedie %d",arg1, size);
      do_mset( ch, outbuf );
      sprintf(outbuf,"%s damplus %d",arg1, plus);
      do_mset( ch, outbuf );
      return;
    }

  if ( !StrCmp( arg2, "hitnumdie" ) )
    {
      if ( !IsNpc(victim) )
        {
          SendToCharacter( "Mobiles only.\r\n", ch );
          return;
        }
      if ( !CanModifyCharacter( ch, victim ) )
        return;
      if ( value < 0 || value > SHRT_MAX )
        {
          Echo( ch, "Number of hitpoint dice range is 0 to %s.\r\n",
		PunctuateNumber( SHRT_MAX, NULL ) );
          return;
        }
      if ( IsNpc( victim ) && IsBitSet( victim->act, ACT_PROTOTYPE ) )
        victim->Prototype->hitnodice = value;
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "hitsizedie" ) )
    {
      if ( !IsNpc(victim) )
        {
          SendToCharacter( "Mobiles only.\r\n", ch );
          return;
        }
      if ( !CanModifyCharacter( ch, victim ) )
        return;
      if ( value < 0 || value > SHRT_MAX )
        {
          Echo( ch, "Hitpoint dice size range is 0 to %s.\r\n",
		PunctuateNumber( SHRT_MAX, NULL ) );
          return;
        }
      if ( IsNpc( victim ) && IsBitSet( victim->act, ACT_PROTOTYPE ) )
        victim->Prototype->hitsizedice = value;
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "hitplus" ) )
    {
      if ( !IsNpc(victim) )
        {
	  SendToCharacter( "Mobiles only.\r\n", ch );
          return;
        }
      if ( !CanModifyCharacter( ch, victim ) )
        return;
      if ( value < 0 || value > SHRT_MAX )
        {
          Echo( ch, "Hitpoint bonus range is 0 to %s.\r\n",
		PunctuateNumber( SHRT_MAX, NULL ) );
          return;
        }
      if ( IsNpc( victim ) && IsBitSet( victim->act, ACT_PROTOTYPE ) )
        victim->Prototype->hitplus = value;
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "damnumdie" ) )
    {
      if ( !IsNpc(victim) )
        {
          SendToCharacter( "Mobiles only.\r\n", ch );
          return;
        }
      if ( !CanModifyCharacter( ch, victim ) )
        return;
      if ( value < 0 || value > 100 )
        {
          SendToCharacter( "Number of damage dice range is 0 to 100.\r\n", ch );
          return;
        }
      if ( IsNpc( victim ) && IsBitSet( victim->act, ACT_PROTOTYPE ) )
        victim->Prototype->damnodice = value;
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "damsizedie" ) )
    {
      if ( !IsNpc(victim) )
        {
          SendToCharacter( "Mobiles only.\r\n", ch );
          return;
        }
      if ( !CanModifyCharacter( ch, victim ) )
        return;

      if ( value < 0 || value > 100 )
        {
          SendToCharacter( "Damage dice size range is 0 to 100.\r\n", ch );
          return;
        }
      if ( IsNpc( victim ) && IsBitSet( victim->act, ACT_PROTOTYPE ) )
        victim->Prototype->damsizedice = value;
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "damplus" ) )
    {
      if ( !IsNpc(victim) )
        {
          SendToCharacter( "Mobiles only.\r\n", ch );
          return;
        }
      if ( !CanModifyCharacter( ch, victim ) )
        return;
      if ( value < 0 || value > 1000 )
        {
          SendToCharacter( "Damage bonus range is 0 to 1000.\r\n", ch );
          return;
        }

      if ( IsNpc( victim ) && IsBitSet( victim->act, ACT_PROTOTYPE ) )
        victim->Prototype->damplus = value;
      SendToCharacter( "Done.\r\n", ch );
      return;

    }


  if ( !StrCmp( arg2, "aloaded" ) )
    {
      if ( IsNpc(victim) )
        {
          SendToCharacter( "Player Characters only.\r\n", ch );
          return;
        }

      if ( !CanModifyCharacter( ch, victim ) )
        return;

      if ( !IsBitSet(victim->pcdata->area->status, AREA_LOADED ) )
        {
          SetBit( victim->pcdata->area->status, AREA_LOADED );
          SendToCharacter( "Your area set to LOADED!\r\n", victim );
          if ( ch != victim )
            SendToCharacter( "Area set to LOADED!\r\n", ch );
          return;
        }
      else
        {
          RemoveBit( victim->pcdata->area->status, AREA_LOADED );
          SendToCharacter( "Your area set to NOT-LOADED!\r\n", victim );
          if ( ch != victim )
            SendToCharacter( "Area set to NON-LOADED!\r\n", ch );
          return;
        }
    }

  if ( !StrCmp( arg2, "speaks" ) )
    {
      if ( !CanModifyCharacter( ch, victim ) )
        return;
      if ( !argument || argument[0] == '\0' )
        {
          SendToCharacter( "Usage: mset <victim> speaks <language> [language] ...\r\n", ch );
          return;
        }
      while ( argument[0] != '\0' )
        {
          argument = OneArgument( argument, arg3 );
          value = GetLanguage( arg3 );
          if ( value == LANG_UNKNOWN )
            Echo( ch, "Unknown language: %s\r\n", arg3 );
          else
            if ( !IsNpc( victim ) )
              {
                int valid_langs = LANG_COMMON | LANG_WOOKIEE | LANG_TWI_LEK | LANG_RODIAN
                  | LANG_HUTT | LANG_MON_CALAMARI | LANG_NOGHRI | LANG_GAMORREAN
                  | LANG_JAWA | LANG_ADARIAN | LANG_EWOK | LANG_VERPINE | LANG_DEFEL
                  | LANG_TRANDOSHAN | LANG_CHADRA_FAN | LANG_QUARREN | LANG_SULLUSTAN
                  | LANG_FALLEEN | LANG_DEVARONIAN | LANG_GOTAL | LANG_ITHORIAN | LANG_BINARY;

                if ( !(value &= valid_langs) )
                  {
		    Echo( ch, "Players may not know %s.\r\n", arg3 );
                    continue;
                  }
              }
          ToggleBit( victim->speaks, value );
        }
      if ( !IsNpc( victim ) )
        {
          RemoveBit( victim->speaks, RaceTable[victim->race].language );
          if ( !CharacterKnowsLanguage( victim, victim->speaking, victim ) )
            victim->speaking = RaceTable[victim->race].language;
        }
      else
        if ( IsBitSet( victim->act, ACT_PROTOTYPE ) )
          victim->Prototype->speaks = victim->speaks;
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg2, "speaking" ) )
    {
      if ( !IsNpc( victim ) )
        {
          SendToCharacter( "Players must choose the language they speak themselves.\r\n", ch );
          return;
        }
      if ( !CanModifyCharacter( ch, victim ) )
        return;
      if ( !argument || argument[0] == '\0' )
        {
          SendToCharacter( "Usage: mset <victim> speaking <language> [language]...\r\n", ch );
          return;
        }
      while ( argument[0] != '\0' )
        {
          argument = OneArgument( argument, arg3 );
          value = GetLanguage( arg3 );
          if ( value == LANG_UNKNOWN )
            Echo( ch, "Unknown language: %s\r\n", arg3 );
          else
            ToggleBit( victim->speaking, value );
        }
      if ( IsNpc(victim) && IsBitSet( victim->act, ACT_PROTOTYPE ) )
        victim->Prototype->speaking = victim->speaking;
      SendToCharacter( "Done.\r\n", ch );
      return;
    }

  /*
   * Generate usage message.
   */
  if ( ch->substate == SUB_REPEATCMD )
    {
      ch->substate = SUB_RESTRICTED;
      Interpret( ch, origarg );
      ch->substate = SUB_REPEATCMD;
      ch->last_cmd = do_mset;
    }
  else
    do_mset( ch, "" );
}
