#include <cstring>
#include "mud.hpp"
#include "character.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "log.hpp"

extern char *spell_target_name;
extern int pAbort;

/*
 * Cast a spell.  Multi-caster and component support by Thoric
 */
void do_cast( Character *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  static char staticbuf[MAX_INPUT_LENGTH];
  Character *victim = nullptr;
  Object *obj = nullptr;
  void *vo = nullptr;
  int mana = 0;
  int sn = 0;
  ch_ret retcode = rNONE;
  bool dont_wait = false;
  Skill *skill = NULL;
  struct timeval time_used;

  switch( ch->SubState )
    {
    default:
      /* no ordering charmed mobs to cast spells */
      if ( IsNpc(ch) && IsAffectedBy( ch, AFF_CHARM ) )
        {
          SendToCharacter( "You can't seem to do that right now...\r\n", ch );
	  return;
        }

      if ( IsBitSet( ch->InRoom->Flags, ROOM_NO_MAGIC ) )
        {
          SetCharacterColor( AT_MAGIC, ch );
          SendToCharacter( "You failed.\r\n", ch );
          return;
        }

      spell_target_name = OneArgument( argument, arg1 );
      OneArgument( spell_target_name, arg2 );

      if ( IsNullOrEmpty( arg1 ) )
        {
          SendToCharacter( "Cast which what where?\r\n", ch );
          return;
        }

      if ( GetTrustLevel(ch) < LEVEL_GREATER )
        {
          if ( ( sn = FindSpell( ch, arg1, true ) ) < 0
               || ( !IsNpc(ch) &&  ch->PCData->Learned[sn] <= 0  ) )
            {
              SendToCharacter( "You can't do that.\r\n", ch );
              return;
            }
          if ( (skill=GetSkill(sn)) == NULL )
            {
              SendToCharacter( "You can't do that right now...\r\n", ch );
              return;
            }
        }
      else
        {
          if ( (sn=LookupSkill(arg1)) < 0 )
            {
              SendToCharacter( "We didn't create that yet...\r\n", ch );
              return;
            }
          if ( sn >= MAX_SKILL )
            {
              SendToCharacter( "Hmm... that might hurt.\r\n", ch );
              return;
            }
	  if ( (skill=GetSkill(sn)) == NULL )
            {
              SendToCharacter( "Somethis is severely wrong with that one...\r\n", ch );
              return;
            }
          if ( skill->Type != SKILL_SPELL )
            {
              SendToCharacter( "That isn't a force power.\r\n", ch );
              return;
            }
          if ( !skill->SpellFunction )
            {
              SendToCharacter( "We didn't finish that one yet...\r\n", ch );
              return;
            }
        }

      /*
       * Something else removed by Merc                 -Thoric
       */
      if ( ch->Position < skill->Position )
        {
          switch( ch->Position )
            {
            default:
              SendToCharacter( "You can't concentrate enough.\r\n", ch );
              break;
            case POS_SITTING:
              SendToCharacter( "You can't summon enough energy sitting down.\r\n", ch );
              break;
            case POS_RESTING:
              SendToCharacter( "You're too relaxed to user that force power.\r\n", ch );
              break;
            case POS_FIGHTING:
              SendToCharacter( "You can't concentrate enough while fighting!\r\n", ch );
              break;
            case POS_SLEEPING:
              SendToCharacter( "You dream about being the greatest force user ever.\r\n", ch );
              break;
            }
          return;
        }

      if ( skill->SpellFunction == spell_null )
        {
	  SendToCharacter( "That's not a spell!\r\n", ch );
          return;
        }

      if ( !skill->SpellFunction )
        {
          SendToCharacter( "You cannot cast that... yet.\r\n", ch );
          return;
        }

      mana = IsNpc(ch) ? 0 : skill->Mana;

      /*
       * Locate targets.
       */
      vo = LocateSpellTargets( ch, arg2, sn, &victim, &obj );
      if ( vo == &pAbort )
        return;

      if  ( IsSafe(ch, victim) )
        {
          SetCharacterColor( AT_MAGIC, ch );
          SendToCharacter( "You cannot do that to them.\r\n", ch );
          return;
        }


      if ( !IsNpc(ch) && ch->Mana < mana )
        {
          SendToCharacter( "The force is not strong enough within you.\r\n", ch );
          return;
        }

      if ( skill->Participants <= 1 )
        break;

      /* multi-participant spells                       -Thoric */
      AddTimerToCharacter( ch, TIMER_CMD_FUN, umin(skill->Beats / 10, 3), do_cast, SUB_PAUSE );
      Act( AT_MAGIC, "You begin to feel the force in yourself and those around you...",
	   ch, NULL, NULL, TO_CHAR );
      Act( AT_MAGIC, "$n reaches out with the force to those around...", ch, NULL, NULL, TO_ROOM );
      sprintf( staticbuf, "%s %s", arg2, spell_target_name );
      ch->dest_buf = CopyString( staticbuf );
      ch->tempnum = sn;
      return;
    case SUB_TIMER_DO_ABORT:
      FreeMemory( ch->dest_buf );
      if ( IS_VALID_SN((sn = ch->tempnum)) )
        {
          if ( (skill=GetSkill(sn)) == NULL )
            {
              SendToCharacter( "Something went wrong...\r\n", ch );
              Log->Bug( "do_cast: SUB_TIMER_DO_ABORT: bad sn %d", sn );
              return;
            }
          mana = IsNpc(ch) ? 0 : skill->Mana;

          if ( GetTrustLevel(ch) < LEVEL_IMMORTAL)    /* so imms dont lose mana */
            ch->Mana -= mana / 3;
        }
      SetCharacterColor( AT_MAGIC, ch );
      SendToCharacter( "You stop your concentration\r\n", ch );
      /* should add chance of backfire here */
      return;
    case SUB_PAUSE:
      sn = ch->tempnum;
      if ( (skill=GetSkill(sn)) == NULL )
        {
          SendToCharacter( "Something went wrong...\r\n", ch );
          Log->Bug( "do_cast: substate 1: bad sn %d", sn );
          return;
        }
      if ( !ch->dest_buf || !IS_VALID_SN(sn) || skill->Type != SKILL_SPELL )
        {
          SendToCharacter( "Something negates the powers of the force.\r\n", ch );
          Log->Bug( "do_cast: ch->dest_buf NULL or bad sn (%d)", sn );
          return;
        }
      mana = IsNpc(ch) ? 0 : skill->Mana;
      strcpy( staticbuf, (const char*)ch->dest_buf );
      spell_target_name = OneArgument(staticbuf, arg2);
      FreeMemory( ch->dest_buf );
      ch->SubState = SUB_NONE;

      if ( skill->Participants > 1 )
        {
          int cnt = 1;
          Character *tmp;
          Timer *t;

          for ( tmp = ch->InRoom->FirstPerson; tmp; tmp = tmp->NextInRoom )
            if (  tmp != ch
		  &&   (t = GetTimerPointer( tmp, TIMER_CMD_FUN )) != NULL
                  &&    t->Count >= 1 && t->DoFun == do_cast
                  &&    tmp->tempnum == sn && tmp->dest_buf
                  &&   !StrCmp( (const char*)tmp->dest_buf, staticbuf ) )
              ++cnt;
          if ( cnt >= skill->Participants )
            {
              for ( tmp = ch->InRoom->FirstPerson; tmp; tmp = tmp->NextInRoom )
                if (  tmp != ch
                      &&   (t = GetTimerPointer( tmp, TIMER_CMD_FUN )) != NULL
                      &&    t->Count >= 1 && t->DoFun == do_cast
                      &&    tmp->tempnum == sn && tmp->dest_buf
                      &&   !StrCmp( (const char*)tmp->dest_buf, staticbuf ) )
                  {
                    ExtractTimer( tmp, t );
                    Act( AT_MAGIC, "Channeling your energy into $n, you help direct the force",
			 ch, NULL, tmp, TO_VICT );
                    Act( AT_MAGIC, "$N channels $S energy into you!", ch, NULL, tmp, TO_CHAR );
                    Act( AT_MAGIC, "$N channels $S energy into $n!", ch, NULL, tmp, TO_NOTVICT );
                    LearnFromSuccess( tmp, sn );

                    tmp->Mana -= mana;
                    tmp->SubState = SUB_NONE;
                    tmp->tempnum = -1;
                    FreeMemory( tmp->dest_buf );
                  }
              dont_wait = true;
              SendToCharacter( "You concentrate all the energy into a burst of force!\r\n", ch );
              vo = LocateSpellTargets( ch, arg2, sn, &victim, &obj );
              if ( vo == &pAbort )
                return;
            }
          else
            {
              SetCharacterColor( AT_MAGIC, ch );
              SendToCharacter( "There was not enough power for that to succeed...\r\n", ch );

              if (GetTrustLevel(ch)  < LEVEL_IMMORTAL)    /* so imms dont lose mana */
                ch->Mana -= mana / 2;
              LearnFromFailure( ch, sn );
              return;
            }
        }
    }

  if ( !dont_wait )
    SetWaitState( ch, skill->Beats );

  /*
   * Getting ready to cast... check for spell components        -Thoric
   */
  if ( !IsNpc(ch) && abs(ch->Alignment - skill->Alignment) > 1010 )
    {
      if ( ch->Alignment > skill->Alignment  )
        {
          SendToCharacter( "You do not have enough anger in you.\r\n", ch );
          if (GetTrustLevel(ch)  < LEVEL_IMMORTAL)    /* so imms dont lose mana */
            ch->Mana -= mana / 2;
          return;
        }
      if (  ch->Alignment < skill->Alignment )
        {
          SendToCharacter( "Your anger and hatred prevent you from focusing.\r\n", ch );
          if (GetTrustLevel(ch)  < LEVEL_IMMORTAL)    /* so imms dont lose mana */
            ch->Mana -= mana / 2;
          return;
        }
    }
  if ( !IsNpc(ch)
       &&   (GetRandomPercent() + skill->Difficulty * 5) > ch->PCData->Learned[sn] )
    {
      /* Some more interesting loss of concentration messages  -Thoric */
      switch( NumberBits(2) )
        {
        case 0: /* too busy */
          if ( ch->Fighting )
            SendToCharacter( "This round of battle is too hectic to concentrate properly.\r\n", ch );
          else
	    SendToCharacter( "You lost your concentration.\r\n", ch );
          break;
        case 1: /* irritation */
          if ( NumberBits(2) == 0 )
            {
              switch( NumberBits(2) )
                {
                case 0: SendToCharacter( "A tickle in your nose prevents you from keeping your concentration.\r\n", ch ); break;
                case 1: SendToCharacter( "An itch on your leg keeps you from properly using the force.\r\n", ch ); break;
                case 2: SendToCharacter( "A nagging thought prevents you from focusing on the force.\r\n", ch ); break;
                case 3: SendToCharacter( "A twitch in your eye disrupts your concentration for a moment.\r\n", ch ); break;
                }
            }
          else
            SendToCharacter( "Something distracts you, and you lose your concentration.\r\n", ch );
          break;
        case 2: /* not enough time */
          if ( ch->Fighting )
            SendToCharacter( "There wasn't enough time this round to complete your concentration.\r\n", ch );
          else
            SendToCharacter( "You lost your concentration.\r\n", ch );
          break;
        case 3:
          SendToCharacter( "A disturbance in the force muddles your concentration.\r\n", ch );
          break;
        }

      if (GetTrustLevel(ch)  < LEVEL_IMMORTAL)    /* so imms dont lose mana */
        ch->Mana -= mana / 2;
      LearnFromFailure( ch, sn );
      return;
    }
  else
    {

      ch->Mana -= mana;

      /*
       * check for immunity to magic if victim is known...
       * and it is a TAR_CHAR_DEFENSIVE/SELF spell
       * otherwise spells will have to check themselves
       */
      if ( (skill->Target == TAR_CHAR_DEFENSIVE
            ||    skill->Target == TAR_CHAR_SELF)
           &&    victim && IsBitSet(victim->Immune, RIS_MAGIC) )
        {
          ImmuneCasting( skill, ch, victim, NULL );
          retcode = rSPELL_FAILED;
        }
      else
        {
          StartTimer(&time_used);
          retcode = (*skill->SpellFunction) ( sn, GetAbilityLevel( ch, FORCE_ABILITY ), ch, vo );
          StopTimer(&time_used);
          UpdateNumberOfTimesUsed(&time_used, skill->UseRec);
        }
    }

  if ( retcode == rCHAR_DIED || retcode == rERROR || CharacterDiedRecently(ch) )
    return;
  if ( retcode != rSPELL_FAILED )
    {
      int force_exp;

      force_exp = skill->Level * skill->Level * 10;
      force_exp = urange( 0, force_exp, ( GetRequiredXpForLevel(GetAbilityLevel( ch, FORCE_ABILITY ) + 1 ) - GetRequiredXpForLevel(GetAbilityLevel(ch, FORCE_ABILITY ) ) )/35 );
      if( !ch->Fighting  )
        Echo( ch, "You gain %d force experience.\r\n" , force_exp );
      GainXP(ch, FORCE_ABILITY, force_exp );
      LearnFromSuccess( ch, sn );
    }
  else
    LearnFromFailure( ch, sn );

  /*
   * Fixed up a weird mess here, and added double safeguards    -Thoric
   */
  if ( skill->Target == TAR_CHAR_OFFENSIVE
       &&   victim
       &&  !CharacterDiedRecently(victim)
       &&        victim != ch )
    {
      Character *vch, *vch_next;

      for ( vch = ch->InRoom->FirstPerson; vch; vch = vch_next )
        {
          vch_next = vch->NextInRoom;

          if ( vch == victim )
            {
              if ( victim->Master != ch
                   &&  !victim->Fighting )
                retcode = HitMultipleTimes( victim, ch, TYPE_UNDEFINED );
              break;
            }
        }
    }
}
