#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "pcdata.hpp"

void do_oldscore( Character *ch, std::string argument )
{
  if ( IsAffectedBy(ch, AFF_POSSESS) )
    {
      ch->Echo("You can't do that in your current state of mind!\r\n");
      return;
    }

  SetCharacterColor( AT_SCORE, ch );
  ch->Echo("You are %s%s, level %d.\r\n",
           ch->Name.c_str(),
           IsNpc(ch) ? "" : ch->PCData->Title.c_str(),
           ch->TopLevel );

  if ( GetTrustLevel( ch ) != ch->TopLevel )
    ch->Echo("You are trusted at level %d.\r\n",
               GetTrustLevel( ch ) );

  if ( IsBitSet(ch->Flags, ACT_MOBINVIS) )
    ch->Echo("You are mobinvis at level %d.\r\n",
               ch->MobInvis);

  ch->Echo("You have %d/%d hit, %d/%d movement.\r\n",
           ch->Hit,  ch->MaxHit,
           ch->Move, ch->MaxMove);

  ch->Echo("You are carrying %d/%d items with weight %d/%d kg.\r\n",
           ch->CarryNumber, GetCarryCapacityNumber(ch),
           ch->CarryWeight, GetCarryCapacityWeight(ch) );

  ch->Echo("Str: %d  Int: %d  Wis: %d  Dex: %d  Con: %d  Cha: %d  Lck: ??  Frc: ??\r\n",
           GetCurrentStrength(ch),
           GetCurrentIntelligence(ch),
           GetCurrentWisdom(ch),
           GetCurrentDexterity(ch),
           GetCurrentConstitution(ch),
           GetCurrentCharisma(ch) );

  ch->Echo("You have have %d credits.\r\n" , ch->Gold );

  ch->Echo("Autoexit: %s   Autoloot: %s   Autosac: %s   Autocred: %s\r\n",
             (!IsNpc(ch) && IsBitSet(ch->Flags, PLR_AUTOEXIT)) ? "yes" : "no",
             (!IsNpc(ch) && IsBitSet(ch->Flags, PLR_AUTOLOOT)) ? "yes" : "no",
             (!IsNpc(ch) && IsBitSet(ch->Flags, PLR_AUTOSAC) ) ? "yes" : "no",
             (!IsNpc(ch) && IsBitSet(ch->Flags, PLR_AUTOGOLD)) ? "yes" : "no" );

  ch->Echo("Wimpy set to %d hit points.\r\n", ch->Wimpy );

  if ( !IsNpc(ch) && ch->PCData->Condition[COND_DRUNK]   > 10 )
    ch->Echo("You are drunk.\r\n");

  if ( !IsNpc(ch) && ch->PCData->Condition[COND_THIRST] ==  0 )
    ch->Echo("You are thirsty.\r\n");

  if ( !IsNpc(ch) && ch->PCData->Condition[COND_FULL]   ==  0 )
    ch->Echo("You are hungry.\r\n");

  switch( ch->MentalState / 10 )
    {
    default:
      ch->Echo("You're completely messed up!\r\n");
      break;

    case -10:
      ch->Echo("You're barely conscious.\r\n");
      break;

    case  -9:
      ch->Echo("You can barely keep your eyes open.\r\n");
      break;

    case  -8:
      ch->Echo("You're extremely drowsy.\r\n");
      break;

    case  -7:
      ch->Echo("You feel very unmotivated.\r\n");
      break;

    case  -6:
      ch->Echo("You feel sedated.\r\n");
      break;

    case  -5:
      ch->Echo("You feel sleepy.\r\n");
      break;

    case  -4:
      ch->Echo("You feel tired.\r\n");
      break;

    case  -3:
      ch->Echo("You could use a rest.\r\n");
      break;

    case  -2:
      ch->Echo("You feel a little under the weather.\r\n");
      break;

    case  -1:
      ch->Echo("You feel fine.\r\n");
      break;

    case   0:
      ch->Echo("You feel great.\r\n");
      break;

    case   1:
      ch->Echo("You feel energetic.\r\n");
      break;

    case   2:
      ch->Echo("Your mind is racing.\r\n");
      break;

    case   3:
      ch->Echo("You can't think straight.\r\n");
      break;

    case   4:
      ch->Echo("Your mind is going 100 miles an hour.\r\n");
      break;

    case   5:
      ch->Echo("You're high as a kite.\r\n");
      break;

    case   6:
      ch->Echo("Your mind and body are slipping appart.\r\n");
      break;

    case   7:
      ch->Echo("Reality is slipping away.\r\n");
      break;

    case   8:
      ch->Echo("You have no idea what is real, and what is not.\r\n");
      break;

    case   9:
      ch->Echo("You feel immortal.\r\n");
      break;

    case  10:
      ch->Echo("You are a Supreme Entity.\r\n");
      break;
    }

  switch( ch->Position )
    {
    case POS_DEAD:
      ch->Echo("You are DEAD!!\r\n");
      break;

    case POS_MORTAL:
      ch->Echo("You are mortally wounded.\r\n");
      break;

    case POS_INCAP:
      ch->Echo("You are incapacitated.\r\n");
      break;

    case POS_STUNNED:
      ch->Echo("You are stunned.\r\n");
      break;

    case POS_SLEEPING:
      ch->Echo("You are sleeping.\r\n");
      break;

    case POS_RESTING:
      ch->Echo("You are resting.\r\n");
      break;

    case POS_STANDING:
      ch->Echo("You are standing.\r\n");
      break;

    case POS_FIGHTING:
      ch->Echo("You are fighting.\r\n");
      break;

    case POS_MOUNTED:
      ch->Echo("Mounted.\r\n");
      break;

    case POS_SHOVE:
      ch->Echo("Being shoved.\r\n");
      break;

    case POS_DRAG:
      ch->Echo("Being dragged.\r\n");
      break;

    default:
      break;
    }

  if ( ch->TopLevel >= 25 )
    ch->Echo("AC: %d.  ", GetArmorClass(ch) );

  ch->Echo("You are ");

  if ( GetArmorClass(ch) >=  101 )
    ch->Echo("WORSE than naked!\r\n");
  else if ( GetArmorClass(ch) >=   80 )
    ch->Echo("naked.\r\n");
  else if ( GetArmorClass(ch) >=   60 )
    ch->Echo("wearing clothes.\r\n");
  else if ( GetArmorClass(ch) >=   40 )
    ch->Echo("slightly armored.\r\n");
  else if ( GetArmorClass(ch) >=   20 )
    ch->Echo("somewhat armored.\r\n");
  else if ( GetArmorClass(ch) >=    0 )
    ch->Echo("armored.\r\n");
  else if ( GetArmorClass(ch) >= - 20 )
    ch->Echo("well armored.\r\n");
  else if ( GetArmorClass(ch) >= - 40 )
    ch->Echo("strongly armored.\r\n");
  else if ( GetArmorClass(ch) >= - 60 )
    ch->Echo("heavily armored.\r\n");
  else if ( GetArmorClass(ch) >= - 80 )
    ch->Echo("superbly armored.\r\n");
  else if ( GetArmorClass(ch) >= -100 )
    ch->Echo("divinely armored.\r\n");
  else
    ch->Echo("invincible!\r\n");

  if ( ch->TopLevel >= 15 )
    ch->Echo("Hitroll: %d  Damroll: %d.\r\n",
               GetHitRoll(ch), GetDamageRoll(ch) );

  if ( ch->TopLevel >= 10 )
    ch->Echo("Alignment: %d.  ", ch->Alignment );

  ch->Echo("You are ");

  if ( ch->Alignment >  900 )
    ch->Echo("angelic.\r\n");
  else if ( ch->Alignment >  700 )
    ch->Echo("saintly.\r\n");
  else if ( ch->Alignment >  350 )
    ch->Echo("good.\r\n");
  else if ( ch->Alignment >  100 )
    ch->Echo("kind.\r\n");
  else if ( ch->Alignment > -100 )
    ch->Echo("neutral.\r\n");
  else if ( ch->Alignment > -350 )
    ch->Echo("mean.\r\n");
  else if ( ch->Alignment > -700 )
    ch->Echo("evil.\r\n");
  else if ( ch->Alignment > -900 )
    ch->Echo("demonic.\r\n");
  else
    ch->Echo("satanic.\r\n");

  if ( !ch->Affects().empty() )
    {
      ch->Echo("You are affected by:\r\n");

      for(const Affect *paf : ch->Affects())
        {
          const Skill *skill = GetSkill(paf->Type);
          
          if ( skill != nullptr )
            {
              ch->Echo("Spell: '%s'", skill->Name.c_str() );

              if ( ch->TopLevel >= 20 )
                {
                  ch->Echo(" modifies %s by %d for %d rounds",
                           GetAffectLocationName( paf->Location ),
                           paf->Modifier,
                           paf->Duration );
                }
              
              ch->Echo(".\r\n");
            }
        }
    }

  if ( !IsNpc( ch ) && IsImmortal( ch ) )
    {
      ch->Echo("WizInvis level: %d   WizInvis is %s\r\n",
               ch->PCData->WizInvis,
               IsBitSet( ch->Flags, PLR_WIZINVIS ) ? "ON" : "OFF" );

      if ( ch->PCData->Build.VnumRanges.Room.First && ch->PCData->Build.VnumRanges.Room.Last )
        ch->Echo("Room Range: %d - %d\r\n", ch->PCData->Build.VnumRanges.Room.First,
                 ch->PCData->Build.VnumRanges.Room.Last       );

      if ( ch->PCData->Build.VnumRanges.Object.First && ch->PCData->Build.VnumRanges.Object.Last )
        ch->Echo("Obj Range : %d - %d\r\n", ch->PCData->Build.VnumRanges.Object.First,
                 ch->PCData->Build.VnumRanges.Object.Last       );

      if ( ch->PCData->Build.VnumRanges.Mob.First && ch->PCData->Build.VnumRanges.Mob.Last )
        ch->Echo("Mob Range : %d - %d\r\n", ch->PCData->Build.VnumRanges.Mob.First,
                 ch->PCData->Build.VnumRanges.Mob.Last       );
    }
}
