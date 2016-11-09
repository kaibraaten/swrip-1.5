#include "character.hpp"
#include "mud.h"
#include "skill.h"

void do_oldscore( Character *ch, char *argument )
{
  Affect *paf;
  Skill   *skill;

  if ( IsAffectedBy(ch, AFF_POSSESS) )
    {
      SendToCharacter("You can't do that in your current state of mind!\r\n", ch);
      return;
    }

  SetCharacterColor( AT_SCORE, ch );
  Echo( ch,
             "You are %s%s, level %d.\r\n",
             ch->Name,
             IsNpc(ch) ? "" : ch->PCData->Title,
             ch->TopLevel );

  if ( GetTrustLevel( ch ) != ch->TopLevel )
    Echo( ch, "You are trusted at level %d.\r\n",
               GetTrustLevel( ch ) );

  if ( IsBitSet(ch->Flags, ACT_MOBINVIS) )
    Echo( ch, "You are mobinvis at level %d.\r\n",
               ch->MobInvis);


  Echo( ch,
             "You have %d/%d hit, %d/%d movement.\r\n",
             ch->Hit,  ch->MaxHit,
             ch->Move, ch->MaxMove);

  Echo( ch,
             "You are carrying %d/%d items with weight %d/%d kg.\r\n",
             ch->CarryNumber, GetCarryCapacityNumber(ch),
             ch->CarryWeight, GetCarryCapacityWeight(ch) );

  Echo( ch,
             "Str: %d  Int: %d  Wis: %d  Dex: %d  Con: %d  Cha: %d  Lck: ??  Frc: ??\r\n",
             GetCurrentStrength(ch),
             GetCurrentIntelligence(ch),
             GetCurrentWisdom(ch),
             GetCurrentDexterity(ch),
             GetCurrentConstitution(ch),
             GetCurrentCharisma(ch) );

  Echo( ch,
             "You have have %d credits.\r\n" , ch->Gold );

  Echo( ch, "Autoexit: %s   Autoloot: %s   Autosac: %s   Autocred: %s\r\n",
             (!IsNpc(ch) && IsBitSet(ch->Flags, PLR_AUTOEXIT)) ? "yes" : "no",
             (!IsNpc(ch) && IsBitSet(ch->Flags, PLR_AUTOLOOT)) ? "yes" : "no",
             (!IsNpc(ch) && IsBitSet(ch->Flags, PLR_AUTOSAC) ) ? "yes" : "no",
             (!IsNpc(ch) && IsBitSet(ch->Flags, PLR_AUTOGOLD)) ? "yes" : "no" );

  Echo( ch, "Wimpy set to %d hit points.\r\n", ch->Wimpy );

  if ( !IsNpc(ch) && ch->PCData->Condition[COND_DRUNK]   > 10 )
    SendToCharacter( "You are drunk.\r\n",   ch );
  if ( !IsNpc(ch) && ch->PCData->Condition[COND_THIRST] ==  0 )
    SendToCharacter( "You are thirsty.\r\n", ch );
  if ( !IsNpc(ch) && ch->PCData->Condition[COND_FULL]   ==  0 )
    SendToCharacter( "You are hungry.\r\n",  ch );

  switch( ch->MentalState / 10 )
    {
    default:   SendToCharacter( "You're completely messed up!\r\n", ch ); break;
    case -10:  SendToCharacter( "You're barely conscious.\r\n", ch ); break;
    case  -9:  SendToCharacter( "You can barely keep your eyes open.\r\n", ch ); break;
    case  -8:  SendToCharacter( "You're extremely drowsy.\r\n", ch ); break;
    case  -7:  SendToCharacter( "You feel very unmotivated.\r\n", ch ); break;
    case  -6:  SendToCharacter( "You feel sedated.\r\n", ch ); break;
    case  -5:  SendToCharacter( "You feel sleepy.\r\n", ch ); break;
    case  -4:  SendToCharacter( "You feel tired.\r\n", ch ); break;
    case  -3:  SendToCharacter( "You could use a rest.\r\n", ch ); break;
    case  -2:  SendToCharacter( "You feel a little under the weather.\r\n", ch ); break;
    case  -1:  SendToCharacter( "You feel fine.\r\n", ch ); break;
    case   0:  SendToCharacter( "You feel great.\r\n", ch ); break;
    case   1:  SendToCharacter( "You feel energetic.\r\n", ch ); break;
    case   2:  SendToCharacter( "Your mind is racing.\r\n", ch ); break;
    case   3:  SendToCharacter( "You can't think straight.\r\n", ch ); break;
    case   4:  SendToCharacter( "Your mind is going 100 miles an hour.\r\n", ch ); break;
    case   5:  SendToCharacter( "You're high as a kite.\r\n", ch ); break;
    case   6:  SendToCharacter( "Your mind and body are slipping appart.\r\n", ch ); break;
    case   7:  SendToCharacter( "Reality is slipping away.\r\n", ch ); break;
    case   8:  SendToCharacter( "You have no idea what is real, and what is not.\r\n", ch ); break;
    case   9:  SendToCharacter( "You feel immortal.\r\n", ch ); break;
    case  10:  SendToCharacter( "You are a Supreme Entity.\r\n", ch ); break;
    }

  switch( ch->Position )
    {
    case POS_DEAD:
      SendToCharacter( "You are DEAD!!\r\n",               ch );
      break;

    case POS_MORTAL:
      SendToCharacter( "You are mortally wounded.\r\n",    ch );
      break;

    case POS_INCAP:
      SendToCharacter( "You are incapacitated.\r\n",       ch );
      break;

    case POS_STUNNED:
      SendToCharacter( "You are stunned.\r\n",             ch );
      break;

    case POS_SLEEPING:
      SendToCharacter( "You are sleeping.\r\n",            ch );
      break;

    case POS_RESTING:
      SendToCharacter( "You are resting.\r\n",             ch );
      break;

    case POS_STANDING:
      SendToCharacter( "You are standing.\r\n",            ch );
      break;

    case POS_FIGHTING:
      SendToCharacter( "You are fighting.\r\n",            ch );
      break;

    case POS_MOUNTED:
      SendToCharacter( "Mounted.\r\n",                     ch );
      break;

    case POS_SHOVE:
      SendToCharacter( "Being shoved.\r\n",                ch );
      break;

    case POS_DRAG:
      SendToCharacter( "Being dragged.\r\n",               ch );
      break;

    default:
      break;
    }

  if ( ch->TopLevel >= 25 )
    Echo( ch, "AC: %d.  ", GetArmorClass(ch) );

  SendToCharacter( "You are ", ch );
  if ( GetArmorClass(ch) >=  101 ) SendToCharacter( "WORSE than naked!\r\n", ch );
  else if ( GetArmorClass(ch) >=   80 ) SendToCharacter( "naked.\r\n",            ch );
  else if ( GetArmorClass(ch) >=   60 ) SendToCharacter( "wearing clothes.\r\n",  ch );
  else if ( GetArmorClass(ch) >=   40 ) SendToCharacter( "slightly armored.\r\n", ch );
  else if ( GetArmorClass(ch) >=   20 ) SendToCharacter( "somewhat armored.\r\n", ch );
  else if ( GetArmorClass(ch) >=    0 ) SendToCharacter( "armored.\r\n",          ch );
  else if ( GetArmorClass(ch) >= - 20 ) SendToCharacter( "well armored.\r\n",     ch );
  else if ( GetArmorClass(ch) >= - 40 ) SendToCharacter( "strongly armored.\r\n", ch );
  else if ( GetArmorClass(ch) >= - 60 ) SendToCharacter( "heavily armored.\r\n",  ch );
  else if ( GetArmorClass(ch) >= - 80 ) SendToCharacter( "superbly armored.\r\n", ch );
  else if ( GetArmorClass(ch) >= -100 ) SendToCharacter( "divinely armored.\r\n", ch );
  else                           SendToCharacter( "invincible!\r\n",       ch );

  if ( ch->TopLevel >= 15 )
    Echo( ch, "Hitroll: %d  Damroll: %d.\r\n",
               GetHitRoll(ch), GetDamageRoll(ch) );

  if ( ch->TopLevel >= 10 )
    Echo( ch, "Alignment: %d.  ", ch->Alignment );

  SendToCharacter( "You are ", ch );
  if ( ch->Alignment >  900 ) SendToCharacter( "angelic.\r\n", ch );
  else if ( ch->Alignment >  700 ) SendToCharacter( "saintly.\r\n", ch );
  else if ( ch->Alignment >  350 ) SendToCharacter( "good.\r\n",    ch );
  else if ( ch->Alignment >  100 ) SendToCharacter( "kind.\r\n",    ch );
  else if ( ch->Alignment > -100 ) SendToCharacter( "neutral.\r\n", ch );
  else if ( ch->Alignment > -350 ) SendToCharacter( "mean.\r\n",    ch );
  else if ( ch->Alignment > -700 ) SendToCharacter( "evil.\r\n",    ch );
  else if ( ch->Alignment > -900 ) SendToCharacter( "demonic.\r\n", ch );
  else                             SendToCharacter( "satanic.\r\n", ch );

  if ( ch->FirstAffect )
    {
      SendToCharacter( "You are affected by:\r\n", ch );
      for ( paf = ch->FirstAffect; paf; paf = paf->Next )
        if ( (skill=GetSkill(paf->Type)) != NULL )
          {
            Echo( ch, "Spell: '%s'", skill->Name );

            if ( ch->TopLevel >= 20 )
              Echo( ch,
                         " modifies %s by %d for %d rounds",
                         GetAffectLocationName( paf->Location ),
                         paf->Modifier,
                         paf->Duration );

            SendToCharacter( ".\r\n", ch );
          }
    }

  if ( !IsNpc( ch ) && IsImmortal( ch ) )
    {
      Echo( ch, "WizInvis level: %d   WizInvis is %s\r\n",
		 ch->PCData->WizInvis,
                 IsBitSet( ch->Flags, PLR_WIZINVIS ) ? "ON" : "OFF" );
      if ( ch->PCData->Build.VnumRanges.Room.First && ch->PCData->Build.VnumRanges.Room.Last )
        Echo( ch, "Room Range: %d - %d\r\n", ch->PCData->Build.VnumRanges.Room.First,
                   ch->PCData->Build.VnumRanges.Room.Last       );
      if ( ch->PCData->Build.VnumRanges.Object.First && ch->PCData->Build.VnumRanges.Object.Last )
        Echo( ch, "Obj Range : %d - %d\r\n", ch->PCData->Build.VnumRanges.Object.First,
                   ch->PCData->Build.VnumRanges.Object.Last       );
      if ( ch->PCData->Build.VnumRanges.Mob.First && ch->PCData->Build.VnumRanges.Mob.Last )
        Echo( ch, "Mob Range : %d - %d\r\n", ch->PCData->Build.VnumRanges.Mob.First,
                   ch->PCData->Build.VnumRanges.Mob.Last       );
    }
}
