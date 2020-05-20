#include <cstring>
#include "mud.hpp"
#include "character.hpp"
#include "editor.hpp"
#include "clan.hpp"
#include "area.hpp"
#include "pcdata.hpp"
#include "log.hpp"
#include "protomob.hpp"
#include "systemdata.hpp"
#include "race.hpp"
#include "repos/clanrepository.hpp"
#include "repos/playerrepository.hpp"

void do_mset( Character *ch, std::string argument )
{
    std::string arg1;
    std::string arg2;
    std::string arg3;
    char buf[MAX_STRING_LENGTH] = {'\0'};
    char outbuf[MAX_STRING_LENGTH] = {'\0'};
    int  num = 0, size = 0, plus = 0;
    char char1 = 0, char2 = 0;
    Character *victim = NULL;
    int value = 0;
    int minattr = 0, maxattr = 0;
    bool lockvictim = false;
    std::string origarg = argument;

    if ( IsNpc( ch ) )
    {
        ch->Echo("Mob's can't mset\r\n");
        return;
    }

    if ( !ch->Desc )
    {
        ch->Echo("You have no descriptor\r\n");
        return;
    }

    switch( ch->SubState )
    {
    default:
        break;

    case SUB_MOB_DESC:
        victim = (Character*)EditorUserData(ch);

        if ( CharacterDiedRecently(victim) )
        {
            ch->Echo("Your victim died!\r\n");
            StopEditing( ch );
            return;
        }

        victim->Description = CopyEditBuffer( ch );

        if ( IsNpc(victim) && IsBitSet( victim->Flags, ACT_PROTOTYPE ) )
        {
            victim->Prototype->Description = victim->Description;
        }

        StopEditing( ch );
        ch->SubState = (CharacterSubState)ch->tempnum;
        return;
    }

    victim = NULL;
    lockvictim = false;
    SmashTilde( argument );

    if ( ch->SubState == SUB_REPEATCMD )
    {
        victim = (Character*)ch->dest_buf;

        if ( CharacterDiedRecently(victim) )
        {
            ch->Echo("Your victim died!\r\n");
            victim = NULL;
            argument = "done";
        }

        if ( argument.empty() || !StrCmp( argument, " " )
             || !StrCmp( argument, "stat" ) )
        {
            if ( victim )
                do_mstat( ch, victim->Name );
            else
                ch->Echo("No victim selected. Type '?' for help.\r\n");

            return;
        }

        if ( !StrCmp( argument, "done" ) || !StrCmp( argument, "off" ) )
        {
            ch->Echo("Mset mode off.\r\n");
            ch->SubState = SUB_NONE;
            ch->dest_buf = nullptr;

            ch->PCData->SubPrompt.erase();

            return;
        }
    }

    if ( victim )
    {
        lockvictim = true;
        arg1 = victim->Name;
        argument = OneArgument( argument, arg2 );
        arg3 = argument;
    }
    else
    {
        lockvictim = false;
        argument = OneArgument( argument, arg1 );
        argument = OneArgument( argument, arg2 );
        arg3 = argument;
    }

    if ( arg1.empty() || ( arg2.empty() && ch->SubState != SUB_REPEATCMD)
         || !StrCmp( arg1, "?" ) )
    {
        if ( ch->SubState == SUB_REPEATCMD )
        {
            if ( victim )
                ch->Echo("Syntax: <field>  <value>\r\n");
            else
                ch->Echo("Syntax: <victim> <field>  <value>\r\n");
        }
        else
            ch->Echo("Syntax: mset <victim> <field>  <value>\r\n");

        ch->Echo("\r\n");
        ch->Echo("Field being one of:\r\n");
        ch->Echo("  str int wis dex con cha lck frc sex\r\n");
        ch->Echo("  credits hp force move align race\r\n");
        ch->Echo("  hitroll damroll armor affected level\r\n");
        ch->Echo("  thirst drunk full blood flags\r\n");
        ch->Echo("  pos defpos\r\n");
        ch->Echo("  sav1 sav2 sav4 sav4 sav5 (see SAVINGTHROWS)\r\n");
        ch->Echo("  resistant immune susceptible (see RIS)\r\n");
        ch->Echo("  attack defense NumberOfAttacks\r\n");
        ch->Echo("  speaking speaks (see LANGUAGES)\r\n");
        ch->Echo("  name short long description title spec spec2\r\n");
        ch->Echo("  clan vip wanted\r\n");
        ch->Echo("\r\n");
        ch->Echo("For editing index/prototype mobiles:\r\n");
        ch->Echo("  hitnumdie hitsizedie HitPlus (hit points)\r\n");
        ch->Echo("  damnumdie damsizedie DamPlus (damage roll)\r\n");
        return;
    }

    if ( !victim && GetTrustLevel( ch ) <= LEVEL_IMMORTAL )
    {
        if ( ( victim = GetCharacterInRoom( ch, arg1 ) ) == NULL )
        {
            ch->Echo("They aren't here.\r\n");
            return;
        }
    }
    else
        if ( !victim )
        {
            if ( ( victim = GetCharacterAnywhere( ch, arg1 ) ) == NULL )
            {
                ch->Echo("No one like that in all the realms.\r\n");
                return;
            }
        }

    if ( GetTrustLevel(ch) < SysData.LevelToMsetPlayers && (victim != ch) && !IsNpc( victim ) )
    {
        ch->Echo("You can't do that!\r\n");
        FreeMemory(ch->dest_buf);
        return;
    }

    if ( GetTrustLevel( ch ) < GetTrustLevel( victim ) && !IsNpc( victim ) )
    {
        ch->Echo("You can't do that!\r\n");
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

    value = IsNumber( arg3 ) ? ToLong( arg3 ) : -1;

    if ( ToLong(arg3) < -1 && value == -1 )
        value = ToLong(arg3);

    if ( !StrCmp( arg2, "str" ) )
    {
        if ( !CanModifyCharacter( ch, victim ) )
            return;

        if ( value < minattr || value > maxattr )
        {
            ch->Echo("Strength range is %d to %d.\r\n", minattr, maxattr );
            return;
        }

        victim->PermStats.Str = value;

        if ( IsNpc(victim) && IsBitSet( victim->Flags, ACT_PROTOTYPE ) )
            victim->Prototype->Stats.Str = value;

        return;
    }

    if ( !StrCmp( arg2, "int" ) )
    {
        if ( !CanModifyCharacter( ch, victim ) )
            return;

        if ( value < minattr || value > maxattr )
        {
            ch->Echo("Intelligence range is %d to %d.\r\n", minattr, maxattr );
            return;
        }

        victim->PermStats.Int = value;

        if ( IsNpc(victim) && IsBitSet( victim->Flags, ACT_PROTOTYPE ) )
            victim->Prototype->Stats.Int = value;

        return;
    }

    if ( !StrCmp( arg2, "wis" ) )
    {
        if ( !CanModifyCharacter( ch, victim ) )
            return;

        if ( value < minattr || value > maxattr )
        {
            ch->Echo("Wisdom range is %d to %d.\r\n", minattr, maxattr );
            return;
        }

        victim->PermStats.Wis = value;

        if ( IsNpc(victim) && IsBitSet( victim->Flags, ACT_PROTOTYPE ) )
            victim->Prototype->Stats.Wis = value;

        return;
    }

    if ( !StrCmp( arg2, "dex" ) )
    {
        if ( !CanModifyCharacter( ch, victim ) )
            return;

        if ( value < minattr || value > maxattr )
        {
            ch->Echo("Dexterity range is %d to %d.\r\n", minattr, maxattr );
            return;
        }

        victim->PermStats.Dex = value;

        if ( IsNpc(victim) && IsBitSet( victim->Flags, ACT_PROTOTYPE ) )
            victim->Prototype->Stats.Dex = value;

        return;
    }

    if ( !StrCmp( arg2, "con" ) )
    {
        if ( !CanModifyCharacter( ch, victim ) )
            return;

        if ( value < minattr || value > maxattr )
        {
            ch->Echo("Constitution range is %d to %d.\r\n", minattr, maxattr );
            return;
        }

        victim->PermStats.Con = value;

        if ( IsNpc(victim) && IsBitSet( victim->Flags, ACT_PROTOTYPE ) )
            victim->Prototype->Stats.Con = value;

        return;
    }

    if ( !StrCmp( arg2, "cha" ) )
    {
        if ( !CanModifyCharacter( ch, victim ) )
            return;

        if ( value < minattr || value > maxattr )
        {
            ch->Echo("Charisma range is %d to %d.\r\n", minattr, maxattr );
            return;
        }

        victim->PermStats.Cha = value;

        if ( IsNpc(victim) && IsBitSet( victim->Flags, ACT_PROTOTYPE ) )
            victim->Prototype->Stats.Cha = value;

        return;
    }

    if ( !StrCmp( arg2, "lck" ) )
    {
        if ( !CanModifyCharacter( ch, victim ) )
            return;

        if ( value < minattr || value > maxattr )
        {
            ch->Echo("Luck range is %d to %d.\r\n", minattr, maxattr );
            return;
        }

        victim->PermStats.Lck = value;

        if ( IsNpc(victim) && IsBitSet( victim->Flags, ACT_PROTOTYPE ) )
            victim->Prototype->Stats.Lck = value;

        return;
    }

    if ( !StrCmp( arg2, "frc" ) )
    {
        if ( !CanModifyCharacter( ch, victim ) )
            return;

        if ( value < minattr || value > 20 )
        {
            ch->Echo("Frc range is %d to %d.\r\n", minattr, 20 );
            return;
        }
        victim->PermStats.Frc = value;
        if ( IsNpc(victim) && IsBitSet( victim->Flags, ACT_PROTOTYPE ) )
            victim->Prototype->Stats.Frc = value;
        return;
    }

    if ( !StrCmp( arg2, "sav1" ) )
    {
        if ( !CanModifyCharacter( ch, victim ) )
            return;
        if ( value < -30 || value > 30 )
        {
            ch->Echo("Saving throw range vs poison is -30 to 30.\r\n");
            return;
        }
        victim->Saving.PoisonDeath = value;
        if ( IsNpc(victim) && IsBitSet( victim->Flags, ACT_PROTOTYPE ) )
            victim->Prototype->Saving.PoisonDeath = value;
        return;
    }

    if ( !StrCmp( arg2, "sav2" ) )
    {
        if ( !CanModifyCharacter( ch, victim ) )
            return;
        if ( value < -30 || value > 30 )
        {
            ch->Echo("Saving throw range vs wands is -30 to 30.\r\n");
            return;
        }
        victim->Saving.Wand = value;
        if ( IsNpc(victim) && IsBitSet( victim->Flags, ACT_PROTOTYPE ) )
            victim->Prototype->Saving.Wand = value;
        return;
    }

    if ( !StrCmp( arg2, "sav3" ) )
    {
        if ( !CanModifyCharacter( ch, victim ) )
            return;
        if ( value < -30 || value > 30 )
        {
            ch->Echo("Saving throw range vs para is -30 to 30.\r\n");
            return;
        }
        victim->Saving.ParaPetri = value;
        if ( IsNpc(victim) && IsBitSet( victim->Flags, ACT_PROTOTYPE ) )
            victim->Prototype->Saving.ParaPetri = value;
        return;
    }

    if ( !StrCmp( arg2, "sav4" ) )
    {
        if ( !CanModifyCharacter( ch, victim ) )
            return;
        if ( value < -30 || value > 30 )
        {
            ch->Echo("Saving throw range vs bad breath is -30 to 30.\r\n");
            return;
        }
        victim->Saving.Breath = value;
        if ( IsNpc(victim) && IsBitSet( victim->Flags, ACT_PROTOTYPE ) )
            victim->Prototype->Saving.Breath = value;
        return;
    }

    if ( !StrCmp( arg2, "sav5" ) )
    {
        if ( !CanModifyCharacter( ch, victim ) )
            return;
        if ( value < -30 || value > 30 )
        {
            ch->Echo("Saving throw range vs force powers is -30 to 30.\r\n");
            return;
        }
        victim->Saving.SpellStaff = value;
        if ( IsNpc(victim) && IsBitSet( victim->Flags, ACT_PROTOTYPE ) )
            victim->Prototype->Saving.SpellStaff = value;
        return;
    }

    if ( !StrCmp( arg2, "sex" ) )
    {
        if ( !CanModifyCharacter( ch, victim ) )
            return;

        if ( value < 0 || value > 2 )
        {
            ch->Echo("Sex range is 0 to 2.\r\n");
            return;
        }

        victim->Sex = (SexType)value;

        if ( IsNpc(victim) && IsBitSet( victim->Flags, ACT_PROTOTYPE ) )
            victim->Prototype->Sex = (SexType)value;

        return;
    }

    if ( !StrCmp( arg2, "race" ) )
    {
        if ( !CanModifyCharacter( ch, victim ) )
            return;
        value = GetNpcRace( arg3 );
        if ( value < 0 )
            value = ToLong( arg3 );
        if ( !IsNpc(victim) && (value < 0 || value >= MAX_RACE) )
        {
            ch->Echo("Race range is 0 to %d.\n", MAX_RACE-1 );
            return;
        }
        if ( IsNpc(victim) && (value < 0 || value >= MAX_NPC_RACE) )
        {
            ch->Echo("Race range is 0 to %d.\n", MAX_NPC_RACE-1 );
            return;
        }
        victim->Race = value;
        if ( IsNpc(victim) && IsBitSet( victim->Flags, ACT_PROTOTYPE ) )
            victim->Prototype->Race = value;
        return;
    }

    if ( !StrCmp( arg2, "armor" ) )
    {
        if ( !CanModifyCharacter( ch, victim ) )
            return;
        if ( value < -300 || value > 300 )
        {
            ch->Echo("AC range is -300 to 300.\r\n");
            return;
        }
        victim->ArmorClass = value;
        if ( IsNpc(victim) && IsBitSet( victim->Flags, ACT_PROTOTYPE ) )
            victim->Prototype->ArmorClass = value;
        return;
    }

    if ( !StrCmp( arg2, "level" ) )
    {
        if ( !CanModifyCharacter( ch, victim ) )
            return;
        if ( !IsNpc(victim) )
        {
            ch->Echo("Not on PC's.\r\n");
            return;
        }

        if ( value < 0 || value > LEVEL_AVATAR + 5 )
        {
            ch->Echo("Level range is 0 to %d.\r\n", LEVEL_AVATAR + 5 );
            return;
        }
        {
            int ability;

            for ( ability = 0 ; ability < MAX_ABILITY ; ability++ )
            {
                SetAbilityLevel( victim, ability, value );
            }
        }

        victim->TopLevel = value;
        victim->ArmorClass = 100-value*2.5;
        victim->HitRoll = value/5;
        victim->DamRoll = value/5;

        if ( IsNpc(victim) && IsBitSet( victim->Flags, ACT_PROTOTYPE ) )
        {
            victim->Prototype->Level = value;
            victim->Prototype->ArmorClass = 100-value*2.5;
            victim->Prototype->HitRoll = victim->HitRoll;
            victim->Prototype->DamRoll = victim->DamRoll;
        }
        sprintf(outbuf,"%s damnumdie %d",arg1.c_str(), value/10);
        do_mset( ch, outbuf );
        sprintf(outbuf,"%s damsizedie %d",arg1.c_str(), 4);
        do_mset( ch, outbuf );
        sprintf(outbuf,"%s DamPlus %d",arg1.c_str(), 2);
        do_mset( ch, outbuf );
        sprintf(outbuf,"%s hitnumdie %d",arg1.c_str(), value/5);
        do_mset( ch, outbuf );
        sprintf(outbuf,"%s hitsizedie %d",arg1.c_str(), 10);
        do_mset( ch, outbuf );
        sprintf(outbuf,"%s HitPlus %d",arg1.c_str(), value*10 );
        do_mset( ch, outbuf );

        return;
    }

    if ( !StrCmp( arg2, "NumberOfAttacks" ) )
    {
        if ( !CanModifyCharacter( ch, victim ) )
            return;
        if ( !IsNpc(victim) )
        {
            ch->Echo("Not on PC's.\r\n");
            return;
        }

        if ( value < 0 || value > 20 )
        {
            ch->Echo("Attacks range is 0 to 20.\r\n");
            return;
        }
        victim->NumberOfAttacks = value;
        if ( IsNpc(victim) && IsBitSet( victim->Flags, ACT_PROTOTYPE ) )
            victim->Prototype->NumberOfAttacks = value;
        return;
    }

    if ( !StrCmp( arg2, "credits" ) )
    {
        if ( !CanModifyCharacter( ch, victim ) )
            return;
        victim->Gold = value;
        if ( IsNpc(victim) && IsBitSet( victim->Flags, ACT_PROTOTYPE ) )
            victim->Prototype->Gold = value;
        return;
    }

    if ( !StrCmp( arg2, "hitroll" ) )
    {
        if ( !CanModifyCharacter( ch, victim ) )
            return;
        victim->HitRoll = urange(0, value, 85);
        if ( IsNpc(victim) && IsBitSet( victim->Flags, ACT_PROTOTYPE ) )
            victim->Prototype->HitRoll = victim->HitRoll;
        return;
    }

    if ( !StrCmp( arg2, "damroll" ) )
    {
        if ( !CanModifyCharacter( ch, victim ) )
            return;
        victim->DamRoll = urange(0, value, 65);
        if ( IsNpc(victim) && IsBitSet( victim->Flags, ACT_PROTOTYPE ) )
            victim->Prototype->DamRoll = victim->DamRoll;
        return;
    }

    if ( !StrCmp( arg2, "hp" ) )
    {
        if ( !CanModifyCharacter( ch, victim ) )
            return;

        if ( value < 1 || value > SHRT_MAX )
        {
            ch->Echo("Hp range is 1 to %s hit points.\r\n",
                     PunctuateNumber( SHRT_MAX ).c_str() );
            return;
        }

        victim->HitPoints.Max = value;
        return;
    }

    if ( !StrCmp( arg2, "force" ) )
    {
        if ( !CanModifyCharacter( ch, victim ) )
            return;

        if ( value < 0 || value > SHRT_MAX )
        {
            ch->Echo("Force range is 0 to %s force points.\r\n",
                     PunctuateNumber( SHRT_MAX ).c_str() );
            return;
        }
        victim->Mana.Max = value;
        return;
    }

    if ( !StrCmp( arg2, "move" ) )
    {
        if ( !CanModifyCharacter( ch, victim ) )
            return;
        if ( value < 0 || value > SHRT_MAX )
        {
            ch->Echo("Move range is 0 to %s move points.\r\n",
                     PunctuateNumber( SHRT_MAX ).c_str() );
            return;
        }
        victim->Fatigue.Max = value;
        return;
    }

    if ( !StrCmp( arg2, "align" ) )
    {
        if ( !CanModifyCharacter( ch, victim ) )
            return;
        if ( value < -1000 || value > 1000 )
        {
            ch->Echo("Alignment range is -1000 to 1000.\r\n");
            return;
        }
        victim->Alignment = value;
        if ( IsNpc(victim) && IsBitSet( victim->Flags, ACT_PROTOTYPE ) )
            victim->Prototype->Alignment = value;
        return;
    }

    if ( !StrCmp( arg2, "password" ) )
    {
        if ( GetTrustLevel( ch ) < LEVEL_SUB_IMPLEM )
        {
            ch->Echo("You can't do that.\r\n");
            return;
        }

        if ( IsNpc( victim ) )
        {
            ch->Echo("Mobs don't have passwords.\r\n");
            return;
        }

        if ( arg3.size() < 5 )
        {
            ch->Echo("New password must be at least five characters long.\r\n" );
            return;
        }

        victim->PCData->Password = EncodeString( arg3 );

        if ( SysData.SaveFlags.test( Flag::AutoSave::ChangePassword ) )
        {
            PlayerCharacters->Save( victim );
        }

        ch->Echo("Ok.\r\n");
        victim->Echo("Your password has been changed by %s.\r\n", ch->Name.c_str() );
        return;
    }

    if ( !StrCmp( arg2, "mentalstate" ) )
    {
        if ( value < -100 || value > 100 )
        {
            ch->Echo("Value must be in range -100 to +100.\r\n");
            return;
        }
        victim->MentalState = value;
        return;
    }

    if ( !StrCmp( arg2, "emotion" ) )
    {
        if ( value < -100 || value > 100 )
        {
            ch->Echo("Value must be in range -100 to +100.\r\n");
            return;
        }
        victim->EmotionalState = value;
        return;
    }

    if ( !StrCmp( arg2, "thirst" ) )
    {
        if ( IsNpc(victim) )
        {
            ch->Echo("Not on NPC's.\r\n");
            return;
        }

        if ( value < 0 || value > 100 )
        {
            ch->Echo("Thirst range is 0 to 100.\r\n");
            return;
        }

        victim->PCData->Condition[COND_THIRST] = value;
        return;
    }

    if ( !StrCmp( arg2, "drunk" ) )
    {
        if ( IsNpc(victim) )
        {
            ch->Echo("Not on NPC's.\r\n");
            return;
        }

        if ( value < 0 || value > 100 )
        {
            ch->Echo("Drunk range is 0 to 100.\r\n");
            return;
        }

        victim->PCData->Condition[COND_DRUNK] = value;
        return;
    }

    if ( !StrCmp( arg2, "full" ) )
    {
        if ( IsNpc(victim) )
        {
            ch->Echo("Not on NPC's.\r\n");
            return;
        }

        if ( value < 0 || value > 100 )
        {
            ch->Echo("Full range is 0 to 100.\r\n");
            return;
        }

        victim->PCData->Condition[COND_FULL] = value;
        return;
    }

    if ( !StrCmp( arg2, "blood" ) )
    {
        if ( IsNpc(victim) )
        {
            ch->Echo("Not on NPC's.\r\n");
            return;
        }

        if ( value < 0 || value > MAX_LEVEL+10 )
        {
            ch->Echo("Blood range is 0 to %d.\r\n", MAX_LEVEL+10 );
            return;
        }

        victim->PCData->Condition[COND_BLOODTHIRST] = value;
        return;
    }

    if ( !StrCmp( arg2, "name" ) )
    {
        if ( !CanModifyCharacter( ch, victim ) )
            return;
        if ( !IsNpc(victim) && GetTrustLevel( ch ) < LEVEL_IMPLEMENTOR )
        {
            ch->Echo("Not on PC's.\r\n");
            return;
        }

        victim->Name = arg3;

        if ( IsNpc(victim) && IsBitSet( victim->Flags, ACT_PROTOTYPE ) )
        {
            victim->Prototype->Name = victim->Name;
        }
        return;
    }

    if ( !StrCmp( arg2, "minsnoop" ) )
    {
        if ( GetTrustLevel( ch ) < LEVEL_SUB_IMPLEM )
        {
            ch->Echo("You can't do that.\r\n");
            return;
        }
        if ( IsNpc(victim) )
        {
            ch->Echo("Not on NPC's.\r\n");
            return;
        }
        if ( victim->PCData )
        {
            victim->PCData->MinSnoop = value;
            return;
        }
    }

    if ( !StrCmp( arg2, "clan" ) )
    {
        std::shared_ptr<Clan> clan;

        if ( GetTrustLevel( ch ) < LEVEL_GREATER )
        {
            ch->Echo("You can't do that.\r\n");
            return;
        }
        if ( IsNpc(victim) )
        {
            ch->Echo("Not on NPC's.\r\n");
            return;
        }

        if ( arg3.empty() )
        {
            if( !(clan = victim->PCData->ClanInfo.Clan ) )
            {
                ch->Echo("%s isn't clanned.\r\n", victim->Name.c_str() );
                return;
            }

            RemoveClanMember( victim );
            victim->PCData->ClanInfo.ClanName.erase();
            victim->PCData->ClanInfo.Clan = NULL;
            ch->Echo("Removed from clan.\r\nBe sure to remove any bestowments they have been given.\r\n");
            Clans->Save(clan);
            PlayerCharacters->Save( victim );
            return;
        }

        clan = GetClan( arg3 );

        if ( !clan )
        {
            ch->Echo("No such clan.\r\n");
            return;
        }

        victim->PCData->ClanInfo.ClanName = clan->Name;
        victim->PCData->ClanInfo.Clan = clan;

        ch->Echo("Done.\r\n" );
        UpdateClanMember( victim );
        Clans->Save(clan);
        PlayerCharacters->Save( victim );
        return;
    }


    if ( !StrCmp( arg2, "short" ) )
    {
        victim->ShortDescr = arg3;

        if ( IsNpc(victim) && IsBitSet( victim->Flags, ACT_PROTOTYPE ) )
        {
            victim->Prototype->ShortDescr = victim->ShortDescr;
        }
        return;
    }

    if ( !StrCmp( arg2, "long" ) )
    {
        strcpy( buf, arg3.c_str() );
        strcat( buf, "\r\n" );
        victim->LongDescr = buf;

        if ( IsNpc(victim) && IsBitSet( victim->Flags, ACT_PROTOTYPE ) )
        {
            victim->Prototype->LongDescr = victim->LongDescr;
        }
        return;
    }

    if ( !StrCmp( arg2, "description" ) )
    {
        if ( arg3[0] )
        {
            victim->Description = arg3;

            if ( IsNpc( victim ) && IsBitSet( victim->Flags, ACT_PROTOTYPE ) )
            {
                victim->Prototype->Description = victim->Description;
            }
            return;
        }
        CHECK_SUBRESTRICTED( ch );

        if ( ch->SubState == SUB_REPEATCMD )
            ch->tempnum = SUB_REPEATCMD;
        else
            ch->tempnum = SUB_NONE;

        ch->SubState = SUB_MOB_DESC;
        StartEditing( ch, victim->Description, victim, do_mset );
        EditorDescPrintf( ch, "Mobile %ld (%s) description",
                          victim->Prototype->Vnum, victim->Name.c_str() );
        return;
    }

    if ( !StrCmp( arg2, "title" ) )
    {
        if ( IsNpc(victim) )
        {
            ch->Echo("Not on NPC's.\r\n");
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
            ch->Echo("Not on PC's.\r\n");
            return;
        }

        if ( !StrCmp( arg3, "none" ) )
        {
            victim->spec_fun = NULL;
            ch->Echo("Special function removed.\r\n");
            if ( IsNpc(victim) && IsBitSet( victim->Flags, ACT_PROTOTYPE ) )
                victim->Prototype->spec_fun = victim->spec_fun;
            return;
        }

        if ( ( victim->spec_fun = SpecialLookup( arg3 ) ) == 0 )
        {
            ch->Echo("No such spec fun.\r\n");
            return;
        }
        if ( IsNpc(victim) && IsBitSet( victim->Flags, ACT_PROTOTYPE ) )
            victim->Prototype->spec_fun = victim->spec_fun;
        return;
    }

    if ( !StrCmp( arg2, "spec2" ) )
    {
        if ( !CanModifyCharacter( ch, victim ) )
            return;
        if ( !IsNpc(victim) )
        {
            ch->Echo("Not on PC's.\r\n");
            return;
        }

        if ( !StrCmp( arg3, "none" ) )
        {
            victim->spec_2 = NULL;
            ch->Echo("Special function removed.\r\n");
            if ( IsNpc(victim) && IsBitSet( victim->Flags, ACT_PROTOTYPE ) )
                victim->Prototype->spec_2 = victim->spec_2;
            return;
        }

        if ( ( victim->spec_2 = SpecialLookup( arg3 ) ) == 0 )
        {
            ch->Echo("No such spec fun.\r\n");
            return;
        }
        if ( IsNpc(victim) && IsBitSet( victim->Flags, ACT_PROTOTYPE ) )
            victim->Prototype->spec_2 = victim->spec_2;
        return;
    }
    if ( !StrCmp( arg2, "whoCloak" ) )
    {
        if ( IsNpc(victim) )
        {
            ch->Echo("Not on NPC's.\r\n");
            return;
        }

        if ( (victim->PCData) && (victim->PCData->WhoCloak) )
        {
            victim->PCData->WhoCloak = false;
            ch->Echo("This user will no longer be cloaked.\r\n");
            return;
        }
        if ( (victim->PCData) && (!(victim->PCData->WhoCloak)) )
        {
            victim->PCData->WhoCloak = true;
            ch->Echo("This user will now be cloaked on the who list!\r\n");
            return;
        }
        ch->Echo("Error setting whoCloak.");
        return;
    }

    if ( !StrCmp( arg2, "flags" ) )
    {
        if ( !IsNpc( victim ) && GetTrustLevel( ch ) < LEVEL_GREATER )
        {
            ch->Echo("You can only modify a mobile's flags.\r\n");
            return;
        }

        if ( !CanModifyCharacter( ch, victim ) )
            return;

        if ( argument.empty() )
        {
            ch->Echo("Usage: mset <victim> flags <flag> [flag]...\r\n");
            ch->Echo("sentinel, scavenger, aggressive, stayarea, wimpy, practice, immortal,\r\n");
            ch->Echo("deadly, mountable, guardian, nokill, scholar, noassist, droid, nocorpse,\r\n");
            return;
        }

        while ( !argument.empty() )
        {
            bool pcflag = false;
            argument = OneArgument( argument, arg3 );
            value = IsNpc( victim) ? GetMobFlag( arg3 ) : GetPlayerFlag( arg3 );

            if ( !IsNpc( victim ) && ( value < 0 || value > 31 ) )
            {
                pcflag = true;
                value = GetPcFlag( arg3 );
            }
            if ( value < 0 || value > 31 )
                ch->Echo("Unknown flag: %s\r\n", arg3.c_str() );
            else
            {
                if ( IsNpc(victim) && 1 << value == ACT_NPC )
                    ch->Echo("If that could be changed, it would cause many problems.\r\n");
                else
                    if ( IsNpc(victim) && 1 << value == ACT_POLYMORPHED )
                        ch->Echo("Changing that would be a _bad_ thing.\r\n");
                    else
                    {
                        if ( pcflag )
                            ToggleBit( victim->PCData->Flags, 1 << value );
                        else
                        {
                            ToggleBit( victim->Flags, 1 << value );
                            /* NPC check added by Gorog */
                            if ( IsNpc(victim) && (1 << value == ACT_PROTOTYPE) )
                                victim->Prototype->Flags = victim->Flags;
                        }
                    }
            }
        }
        if ( IsNpc(victim) && IsBitSet( victim->Flags, ACT_PROTOTYPE ) )
            victim->Prototype->Flags = victim->Flags;
        return;
    }

    if ( !StrCmp( arg2, "wanted" ) )
    {
        if ( IsNpc( victim ) )
        {
            ch->Echo("Wanted flags are for players only.\r\n");
            return;
        }

        if ( GetTrustLevel( ch ) < LEVEL_GREATER )
        {
            ch->Echo("You are not a high enough level to do that.\r\n");
            return;
        }

        if ( !CanModifyCharacter( ch, victim ) )
            return;

        if ( argument.empty() )
        {
            ch->Echo("Usage: mset <victim> wanted <planet> [planet]...\r\n");
            return;
        }

        while ( !argument.empty() )
        {
            argument = OneArgument( argument, arg3 );
            size_t bit = GetWantedFlag( arg3 );

            if ( bit >= Flag::MAX )
                ch->Echo("Unknown flag: %s\r\n", arg3.c_str() );
            else
                victim->PCData->WantedOn.flip( bit );
        }
        return;
    }

    if ( !StrCmp( arg2, "vip" ) )
    {
        if ( !IsNpc( victim ))
        {
            ch->Echo("VIP flags are for mobs only.\r\n");
            return;
        }

        if ( !CanModifyCharacter( ch, victim ) )
            return;

        if ( argument.empty() )
        {
            ch->Echo("Usage: mset <victim> vip <planet> [planet]...\r\n");
            return;
        }

        while ( !argument.empty() )
        {
            argument = OneArgument( argument, arg3 );
            value = GetVipFlag( arg3 );
            if ( value < 0 || value > 31 )
                ch->Echo("Unknown flag: %s\r\n", arg3.c_str() );
            else
                victim->VipFlags.flip(value);
        }
        if ( IsNpc(victim) && IsBitSet( victim->Flags, ACT_PROTOTYPE ) )
            victim->Prototype->VipFlags = victim->VipFlags;
        return;
    }

    if ( !StrCmp( arg2, "affected" ) )
    {
        if ( !IsNpc( victim ) && GetTrustLevel( ch ) < LEVEL_CREATOR )
        {
            ch->Echo("You can only modify a mobile's flags.\r\n");
            return;
        }

        if ( !CanModifyCharacter( ch, victim ) )
            return;

        if ( argument.empty() )
        {
            ch->Echo("Usage: mset <victim> affected <flag> [flag]...\r\n");
            return;
        }

        while ( !argument.empty() )
        {
            argument = OneArgument( argument, arg3 );
            value = GetAffectFlag( arg3 );

            if ( value < 0 || static_cast<size_t>(value) >= Flag::MAX )
                ch->Echo("Unknown flag: %s\r\n", arg3.c_str() );
            else
                victim->AffectedBy.flip(value);
        }

        if ( IsNpc( victim ) && IsBitSet( victim->Flags, ACT_PROTOTYPE ) )
            victim->Prototype->AffectedBy = victim->AffectedBy;

        return;
    }

    /*
     * save some more finger-leather for setting RIS stuff
     */
    if ( !StrCmp( arg2, "r" ) )
    {
        if ( !IsNpc( victim ) && GetTrustLevel( ch ) < LEVEL_CREATOR )
        {
            ch->Echo("You can only modify a mobile's ris.\r\n");
            return;
        }
        if ( !CanModifyCharacter( ch, victim ) )
            return;

        sprintf(outbuf,"%s resistant %s", arg1.c_str(), arg3.c_str());
        do_mset( ch, outbuf );
        return;
    }
    if ( !StrCmp( arg2, "i" ) )
    {
        if ( !IsNpc( victim ) && GetTrustLevel( ch ) < LEVEL_CREATOR )
        {
            ch->Echo("You can only modify a mobile's ris.\r\n");
            return;
        }
        if ( !CanModifyCharacter( ch, victim ) )
            return;


        sprintf(outbuf,"%s immune %s", arg1.c_str(), arg3.c_str());
        do_mset( ch, outbuf );
        return;
    }
    if ( !StrCmp( arg2, "s" ) )
    {
        if ( !IsNpc( victim ) && GetTrustLevel( ch ) < LEVEL_CREATOR )
        {
            ch->Echo("You can only modify a mobile's ris.\r\n");
            return;
        }
        if ( !CanModifyCharacter( ch, victim ) )
            return;

        sprintf(outbuf,"%s susceptible %s", arg1.c_str(), arg3.c_str());
        do_mset( ch, outbuf );
        return;
    }
    if ( !StrCmp( arg2, "ri" ) )
    {
        if ( !IsNpc( victim ) && GetTrustLevel( ch ) < LEVEL_CREATOR )
        {
            ch->Echo("You can only modify a mobile's ris.\r\n");
            return;
        }
        if ( !CanModifyCharacter( ch, victim ) )
            return;

        sprintf(outbuf,"%s resistant %s", arg1.c_str(), arg3.c_str());
        do_mset( ch, outbuf );
        sprintf(outbuf,"%s immune %s", arg1.c_str(), arg3.c_str());
        do_mset( ch, outbuf );
        return;
    }

    if ( !StrCmp( arg2, "rs" ) )
    {
        if ( !IsNpc( victim ) && GetTrustLevel( ch ) < LEVEL_CREATOR )
        {
            ch->Echo("You can only modify a mobile's ris.\r\n");
            return;
        }
        if ( !CanModifyCharacter( ch, victim ) )
            return;

        sprintf(outbuf,"%s resistant %s",arg1.c_str(), arg3.c_str());
        do_mset( ch, outbuf );
        sprintf(outbuf,"%s susceptible %s",arg1.c_str(), arg3.c_str());
        do_mset( ch, outbuf );
        return;
    }
    if ( !StrCmp( arg2, "is" ) )
    {
        if ( !IsNpc( victim ) && GetTrustLevel( ch ) < LEVEL_CREATOR )
        {
            ch->Echo("You can only modify a mobile's ris.\r\n");
            return;
        }
        if ( !CanModifyCharacter( ch, victim ) )
            return;

        sprintf(outbuf,"%s immune %s",arg1.c_str(), arg3.c_str());
        do_mset( ch, outbuf );
        sprintf(outbuf,"%s susceptible %s",arg1.c_str(), arg3.c_str());
        do_mset( ch, outbuf );
        return;
    }
    if ( !StrCmp( arg2, "ris" ) )
    {
        if ( !IsNpc( victim ) && GetTrustLevel( ch ) < LEVEL_CREATOR )
        {
            ch->Echo("You can only modify a mobile's ris.\r\n");
            return;
        }
        if ( !CanModifyCharacter( ch, victim ) )
            return;

        sprintf(outbuf,"%s resistant %s",arg1.c_str(), arg3.c_str());
        do_mset( ch, outbuf );
        sprintf(outbuf,"%s immune %s",arg1.c_str(), arg3.c_str());
        do_mset( ch, outbuf );
        sprintf(outbuf,"%s susceptible %s",arg1.c_str(), arg3.c_str());
        do_mset( ch, outbuf );
        return;
    }

    if ( !StrCmp( arg2, "resistant" ) )
    {
        if ( !IsNpc( victim ) && GetTrustLevel( ch ) < LEVEL_CREATOR )
        {
            ch->Echo("You can only modify a mobile's resistancies.\r\n");
            return;
        }
        if ( !CanModifyCharacter( ch, victim ) )
            return;

        if ( argument.empty() )
        {
            ch->Echo("Usage: mset <victim> resistant <flag> [flag]...\r\n");
            return;
        }

        while ( !argument.empty() )
        {
            argument = OneArgument( argument, arg3 );
            value = GetResistanceFlag( arg3 );

            if ( value < 0 || static_cast<size_t>(value) >= Flag::MAX )
                ch->Echo("Unknown flag: %s\r\n", arg3.c_str() );
            else
                victim->Resistant.flip(value);
        }
        
        if ( IsNpc( victim ) && IsBitSet( victim->Flags, ACT_PROTOTYPE ) )
            victim->Prototype->Resistant = victim->Resistant;
        return;
    }

    if ( !StrCmp( arg2, "immune" ) )
    {
        if ( !IsNpc( victim ) && GetTrustLevel( ch ) < LEVEL_CREATOR )
        {
            ch->Echo("You can only modify a mobile's immunities.\r\n");
            return;
        }

        if ( !CanModifyCharacter( ch, victim ) )
            return;

        if ( argument.empty() )
        {
            ch->Echo("Usage: mset <victim> immune <flag> [flag]...\r\n");
            return;
        }

        while ( !argument.empty() )
        {
            argument = OneArgument( argument, arg3 );
            value = GetResistanceFlag( arg3 );

            if ( value < 0 || static_cast<size_t>(value) >= Flag::MAX )
                ch->Echo("Unknown flag: %s\r\n", arg3.c_str() );
            else
                victim->Immune.flip(value);
        }

        if ( IsNpc( victim ) && IsBitSet( victim->Flags, ACT_PROTOTYPE ) )
            victim->Prototype->Immune = victim->Immune;
        return;
    }

    if ( !StrCmp( arg2, "susceptible" ) )
    {
        if ( !IsNpc( victim ) && GetTrustLevel( ch ) < LEVEL_CREATOR )
        {
            ch->Echo("You can only modify a mobile's susceptibilities.\r\n");
            return;
        }
        if ( !CanModifyCharacter( ch, victim ) )
            return;

        if ( argument.empty() )
        {
            ch->Echo("Usage: mset <victim> susceptible <flag> [flag]...\r\n");
            return;
        }

        while ( !argument.empty() )
        {
            argument = OneArgument( argument, arg3 );
            value = GetResistanceFlag( arg3 );
            if ( value < 0 || value > 31 )
                ch->Echo("Unknown flag: %s\r\n", arg3.c_str() );
            else
                victim->Susceptible.test(value);
        }

        if ( IsNpc( victim ) && IsBitSet( victim->Flags, ACT_PROTOTYPE ) )
            victim->Prototype->Susceptible = victim->Susceptible;

        return;
    }

    if ( !StrCmp( arg2, "attack" ) )
    {
        if ( !IsNpc( victim ) )
        {
            ch->Echo("You can only modify a mobile's attacks.\r\n");
            return;
        }
        if ( !CanModifyCharacter( ch, victim ) )
            return;

        if ( argument.empty() )
        {
            ch->Echo("Usage: mset <victim> attack <flag> [flag]...\r\n");
            ch->Echo("bite          claws        tail        sting      punch        kick\r\n");
            ch->Echo("trip          bash         stun        gouge      backstab\r\n");
            return;
        }

        while ( !argument.empty() )
        {
            argument = OneArgument( argument, arg3 );
            value = GetAttackFlag( arg3 );

            if ( value < 0 || static_cast<size_t>(value) >= Flag::MAX )
                ch->Echo("Unknown flag: %s\r\n", arg3.c_str() );
            else
                victim->AttackFlags.flip(value);
        }
        if ( IsNpc( victim ) && IsBitSet( victim->Flags, ACT_PROTOTYPE ) )
            victim->Prototype->AttackFlags = victim->AttackFlags;
        return;
    }

    if ( !StrCmp( arg2, "defense" ) )
    {
        if ( !IsNpc( victim ) )
        {
            ch->Echo("You can only modify a mobile's defenses.\r\n");
            return;
        }
        if ( !CanModifyCharacter( ch, victim ) )
            return;

        if ( argument.empty() )
        {
            ch->Echo("Usage: mset <victim> defense <flag> [flag]...\r\n");
            ch->Echo("parry        dodge\r\n");
            return;
        }

        while ( !argument.empty() )
        {
            argument = OneArgument( argument, arg3 );
            value = GetDefenseFlag( arg3 );

            if ( value < 0 || static_cast<size_t>(value) >= Flag::MAX )
                ch->Echo("Unknown flag: %s\r\n", arg3.c_str() );
            else
                victim->DefenseFlags.flip(value);
        }
        if ( IsNpc( victim ) && IsBitSet( victim->Flags, ACT_PROTOTYPE ) )
            victim->Prototype->DefenseFlags = victim->DefenseFlags;
        return;
    }

    if ( !StrCmp( arg2, "pos" ) )
    {
        if ( !IsNpc(victim) )
        {
            ch->Echo("Mobiles only.\r\n");
            return;
        }

        if ( !CanModifyCharacter( ch, victim ) )
            return;

        if ( value < 0 || value > POS_STANDING )
        {
            ch->Echo("Position range is 0 to %d.\r\n", POS_STANDING );
            return;
        }

        victim->Position = (PositionType)value;

        if ( IsNpc( victim ) && IsBitSet( victim->Flags, ACT_PROTOTYPE ) )
            victim->Prototype->Position = victim->Position;

        ch->Echo("Done.\r\n");
        return;
    }

    if ( !StrCmp( arg2, "defpos" ) )
    {
        if ( !IsNpc(victim) )
        {
            ch->Echo("Mobiles only.\r\n");
            return;
        }

        if ( !CanModifyCharacter( ch, victim ) )
            return;

        if ( value < 0 || value > POS_STANDING )
        {
            ch->Echo("Position range is 0 to %d.\r\n", POS_STANDING );
            return;
        }

        victim->DefaultPosition = (PositionType)value;

        if ( IsNpc( victim ) && IsBitSet( victim->Flags, ACT_PROTOTYPE ) )
            victim->Prototype->DefaultPosition = victim->DefaultPosition;

        ch->Echo("Done.\r\n");
        return;
    }

    /*
     * save some finger-leather
     */
    if ( !StrCmp( arg2, "hitdie" ) )
    {
        if ( !IsNpc(victim) )
        {
            ch->Echo("Mobiles only.\r\n");
            return;
        }
        if ( !CanModifyCharacter( ch, victim ) )
            return;

        sscanf(arg3.c_str(),"%d %c %d %c %d",&num,&char1,&size,&char2,&plus);
        sprintf(outbuf,"%s hitnumdie %d",arg1.c_str(), num);
        do_mset( ch, outbuf );

        sprintf(outbuf,"%s hitsizedie %d",arg1.c_str(), size);
        do_mset( ch, outbuf );

        sprintf(outbuf,"%s HitPlus %d",arg1.c_str(), plus);
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
            ch->Echo("Mobiles only.\r\n");
            return;
        }
        if ( !CanModifyCharacter( ch, victim ) )
            return;

        sscanf(arg3.c_str(),"%d %c %d %c %d",&num,&char1,&size,&char2,&plus);
        sprintf(outbuf,"%s damnumdie %d",arg1.c_str(), num);
        do_mset( ch, outbuf );
        sprintf(outbuf,"%s damsizedie %d",arg1.c_str(), size);
        do_mset( ch, outbuf );
        sprintf(outbuf,"%s DamPlus %d",arg1.c_str(), plus);
        do_mset( ch, outbuf );
        return;
    }

    if ( !StrCmp( arg2, "hitnumdie" ) )
    {
        if ( !IsNpc(victim) )
        {
            ch->Echo("Mobiles only.\r\n");
            return;
        }
        if ( !CanModifyCharacter( ch, victim ) )
            return;
        if ( value < 0 || value > SHRT_MAX )
        {
            ch->Echo("Number of hitpoint dice range is 0 to %s.\r\n",
                     PunctuateNumber( SHRT_MAX ).c_str() );
            return;
        }
        if ( IsNpc( victim ) && IsBitSet( victim->Flags, ACT_PROTOTYPE ) )
            victim->Prototype->HitNoDice = value;
        ch->Echo("Done.\r\n");
        return;
    }

    if ( !StrCmp( arg2, "hitsizedie" ) )
    {
        if ( !IsNpc(victim) )
        {
            ch->Echo("Mobiles only.\r\n");
            return;
        }
        if ( !CanModifyCharacter( ch, victim ) )
            return;
        if ( value < 0 || value > SHRT_MAX )
        {
            ch->Echo("Hitpoint dice size range is 0 to %s.\r\n",
                     PunctuateNumber( SHRT_MAX ).c_str() );
            return;
        }
        if ( IsNpc( victim ) && IsBitSet( victim->Flags, ACT_PROTOTYPE ) )
            victim->Prototype->HitSizeDice = value;
        ch->Echo("Done.\r\n");
        return;
    }

    if ( !StrCmp( arg2, "HitPlus" ) )
    {
        if ( !IsNpc(victim) )
        {
            ch->Echo("Mobiles only.\r\n");
            return;
        }
        if ( !CanModifyCharacter( ch, victim ) )
            return;
        if ( value < 0 || value > SHRT_MAX )
        {
            ch->Echo("Hitpoint bonus range is 0 to %s.\r\n",
                     PunctuateNumber( SHRT_MAX ).c_str() );
            return;
        }
        if ( IsNpc( victim ) && IsBitSet( victim->Flags, ACT_PROTOTYPE ) )
            victim->Prototype->HitPlus = value;
        ch->Echo("Done.\r\n");
        return;
    }

    if ( !StrCmp( arg2, "damnumdie" ) )
    {
        if ( !IsNpc(victim) )
        {
            ch->Echo("Mobiles only.\r\n");
            return;
        }
        if ( !CanModifyCharacter( ch, victim ) )
            return;
        if ( value < 0 || value > 100 )
        {
            ch->Echo("Number of damage dice range is 0 to 100.\r\n");
            return;
        }
        if ( IsNpc( victim ) && IsBitSet( victim->Flags, ACT_PROTOTYPE ) )
            victim->Prototype->DamNoDice = value;
        ch->Echo("Done.\r\n");
        return;
    }

    if ( !StrCmp( arg2, "damsizedie" ) )
    {
        if ( !IsNpc(victim) )
        {
            ch->Echo("Mobiles only.\r\n");
            return;
        }
        if ( !CanModifyCharacter( ch, victim ) )
            return;

        if ( value < 0 || value > 100 )
        {
            ch->Echo("Damage dice size range is 0 to 100.\r\n");
            return;
        }
        if ( IsNpc( victim ) && IsBitSet( victim->Flags, ACT_PROTOTYPE ) )
            victim->Prototype->DamSizeDice = value;
        ch->Echo("Done.\r\n");
        return;
    }

    if ( !StrCmp( arg2, "DamPlus" ) )
    {
        if ( !IsNpc(victim) )
        {
            ch->Echo("Mobiles only.\r\n");
            return;
        }
        if ( !CanModifyCharacter( ch, victim ) )
            return;
        if ( value < 0 || value > 1000 )
        {
            ch->Echo("Damage bonus range is 0 to 1000.\r\n");
            return;
        }

        if ( IsNpc( victim ) && IsBitSet( victim->Flags, ACT_PROTOTYPE ) )
            victim->Prototype->DamPlus = value;
        ch->Echo("Done.\r\n");
        return;

    }


    if ( !StrCmp( arg2, "speaks" ) )
    {
        if ( !CanModifyCharacter( ch, victim ) )
            return;

        if ( argument.empty() )
        {
            ch->Echo("Usage: mset <victim> speaks <language> [language] ...\r\n");
            return;
        }

        while ( !argument.empty() )
        {
            argument = OneArgument( argument, arg3 );
            value = GetLanguage( arg3 );
            if ( value == LANG_UNKNOWN )
                ch->Echo("Unknown language: %s\r\n", arg3.c_str() );
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
                        ch->Echo("Players may not know %s.\r\n", arg3.c_str() );
                        continue;
                    }
                }
            ToggleBit( victim->Speaks, value );
        }
        if ( !IsNpc( victim ) )
        {
            RemoveBit( victim->Speaks, RaceTable[victim->Race].Language );
            if ( !CharacterKnowsLanguage( victim, victim->Speaking, victim ) )
                victim->Speaking = RaceTable[victim->Race].Language;
        }
        else
            if ( IsBitSet( victim->Flags, ACT_PROTOTYPE ) )
                victim->Prototype->Speaks = victim->Speaks;
        ch->Echo("Done.\r\n");
        return;
    }

    if ( !StrCmp( arg2, "speaking" ) )
    {
        if ( !IsNpc( victim ) )
        {
            ch->Echo("Players must choose the language they speak themselves.\r\n");
            return;
        }

        if ( !CanModifyCharacter( ch, victim ) )
            return;

        if ( argument.empty() )
        {
            ch->Echo("Usage: mset <victim> speaking <language> [language]...\r\n");
            return;
        }

        while ( !argument.empty() )
        {
            argument = OneArgument( argument, arg3 );
            value = GetLanguage( arg3 );
            if ( value == LANG_UNKNOWN )
                ch->Echo("Unknown language: %s\r\n", arg3.c_str() );
            else
                ToggleBit( victim->Speaking, value );
        }
        if ( IsNpc(victim) && IsBitSet( victim->Flags, ACT_PROTOTYPE ) )
            victim->Prototype->Speaking = victim->Speaking;
        ch->Echo("Done.\r\n");
        return;
    }

    /*
     * Generate usage message.
     */
    if ( ch->SubState == SUB_REPEATCMD )
    {
        ch->SubState = SUB_RESTRICTED;
        Interpret( ch, origarg );
        ch->SubState = SUB_REPEATCMD;
        ch->LastCommand = do_mset;
    }
    else
        do_mset( ch, "" );
}
