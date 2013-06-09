#include <string.h>
#include "mud.h"
#include "character.h"

extern char *spell_target_name;
extern int pAbort;

static bool IsSpellParticipant( void *element, void *userData );
static void ContributeToSpell( void *element, void *userData );

typedef struct SpellParticipantData
{
  Character *Caster;
  int SkillNumber;
  char *Buffer;
  int ManaCost;
} SpellParticipantData;

/*
 * Cast a spell.  Multi-caster and component support by Thoric
 */
void do_cast( Character *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  static char staticbuf[MAX_INPUT_LENGTH];
  Character *victim = NULL;
  OBJ_DATA *obj = NULL;
  void *vo = NULL;
  int mana = 0;
  int sn = 0;
  ch_ret retcode = rNONE;
  bool dont_wait = FALSE;
  SKILLTYPE *skill = NULL;
  struct timeval time_used;

  switch( ch->substate )
    {
    default:
      /* no ordering charmed mobs to cast spells */
      if ( is_npc(ch) && is_affected_by( ch, AFF_CHARM ) )
        {
          send_to_char( "You can't seem to do that right now...\r\n", ch );
	  return;
        }

      if ( IS_SET( ch->in_room->room_flags, ROOM_NO_MAGIC ) )
        {
          set_char_color( AT_MAGIC, ch );
          send_to_char( "You failed.\r\n", ch );
          return;
        }

      spell_target_name = one_argument( argument, arg1 );
      one_argument( spell_target_name, arg2 );

      if ( arg1[0] == '\0' )
        {
          send_to_char( "Cast which what where?\r\n", ch );
          return;
        }

      if ( get_trust(ch) < LEVEL_GOD )
        {
          if ( ( sn = find_spell( ch, arg1, TRUE ) ) < 0
               || ( !is_npc(ch) &&  ch->pcdata->learned[sn] <= 0  ) )
            {
              send_to_char( "You can't do that.\r\n", ch );
              return;
            }
          if ( (skill=get_skilltype(sn)) == NULL )
            {
              send_to_char( "You can't do that right now...\r\n", ch );
              return;
            }
        }
      else
        {
	  sn = skill_lookup( arg1 );

          if ( sn < 0 )
            {
              send_to_char( "We didn't create that yet...\r\n", ch );
              return;
            }

          if ( sn >= MAX_SKILL )
            {
              send_to_char( "Hmm... that might hurt.\r\n", ch );
              return;
            }

	  skill = get_skilltype( sn );

	  if ( skill == NULL )
            {
              send_to_char( "Something is severely wrong with that one...\r\n", ch );
              return;
            }

          if ( skill->type != SKILL_SPELL )
            {
              send_to_char( "That isn't a force power.\r\n", ch );
              return;
            }

          if ( !skill->spell_fun )
            {
              send_to_char( "We didn't finish that one yet...\r\n", ch );
              return;
            }
        }

      /*
       * Something else removed by Merc                 -Thoric
       */
      if ( ch->position < skill->minimum_position )
        {
          switch( ch->position )
            {
            default:
              send_to_char( "You can't concentrate enough.\r\n", ch );
              break;

            case POS_SITTING:
              send_to_char( "You can't summon enough energy sitting down.\r\n", ch );
              break;

            case POS_RESTING:
              send_to_char( "You're too relaxed to cast that spell.\r\n", ch );
              break;

            case POS_FIGHTING:
              send_to_char( "You can't concentrate enough while fighting!\r\n", ch );
              break;

            case POS_SLEEPING:
              send_to_char( "You dream about great feats of magic.\r\n", ch );
              break;
            }

          return;
        }

      if ( skill->spell_fun == spell_null )
        {
	  send_to_char( "That's not a spell!\r\n", ch );
          return;
        }

      if ( !skill->spell_fun )
        {
          send_to_char( "You cannot cast that... yet.\r\n", ch );
          return;
        }

      mana = is_npc(ch) ? 0 : skill->min_mana;

      /*
       * Locate targets.
       */
      vo = locate_targets( ch, arg2, sn, &victim, &obj );

      if( vo == &pAbort )
        return;

      if( is_safe(ch, victim) )
        {
          set_char_color( AT_MAGIC, ch );
          send_to_char( "You cannot do that to them.\r\n", ch );
          return;
        }


      if ( !is_npc(ch) && ch->mana < mana )
        {
          send_to_char( "The force is not strong enough within you.\r\n", ch );
          return;
        }

      if ( skill->participants <= 1 )
	{
	  break;
	}

      /* multi-participant spells                       -Thoric */
      add_timer( ch, TIMER_DO_FUN, UMIN(skill->beats / 10, 3), do_cast, 1 );
      act( AT_MAGIC, "You begin to feel the force in yourself and those around you...",
	   ch, NULL, NULL, TO_CHAR );
      act( AT_MAGIC, "$n reaches out with the force to those around...", ch, NULL, NULL, TO_ROOM );
      sprintf( staticbuf, "%s %s", arg2, spell_target_name );
      ch->dest_buf = str_dup( staticbuf );
      ch->tempnum = sn;

      return;

    case SUB_TIMER_DO_ABORT:
      DISPOSE( ch->dest_buf );
      sn = ch->tempnum;

      if ( IS_VALID_SN( sn ) )
        {
	  skill = get_skilltype( sn );

          if ( skill == NULL )
            {
              send_to_char( "Something went wrong...\r\n", ch );
              bug( "%s: SUB_TIMER_DO_ABORT: bad sn %d", __FUNCTION__, sn );
              return;
            }

          mana = is_npc(ch) ? 0 : skill->min_mana;

          if ( !is_immortal( ch ) ) /* so imms dont lose mana */
	    {
	      ch->mana -= mana / 3;
	    }
        }

      set_char_color( AT_MAGIC, ch );
      send_to_char( "You stop your concentration\r\n", ch );
      /* should add chance of backfire here */
      return;

    case SUB_PAUSE:
      sn = ch->tempnum;
      skill = get_skilltype( sn );

      if ( skill == NULL )
        {
          send_to_char( "Something went wrong...\r\n", ch );
          bug( "%s: substate 1: bad sn %d", __FUNCTION__, sn );
          return;
        }

      if ( !ch->dest_buf || !IS_VALID_SN(sn) || skill->type != SKILL_SPELL )
        {
          send_to_char( "Something negates the powers of the force.\r\n", ch );
          bug( "%s: ch->dest_buf NULL or bad sn (%d)", __FUNCTION__, sn );
          return;
        }

      mana = is_npc(ch) ? 0 : skill->min_mana;
      strcpy( staticbuf, (const char*)ch->dest_buf );
      spell_target_name = one_argument(staticbuf, arg2);
      DISPOSE( ch->dest_buf );
      ch->substate = SUB_NONE;

      if ( skill->participants > 1 )
        {
          int cnt = 1;
	  SpellParticipantData participantData;

	  participantData.Caster = ch;
	  participantData.SkillNumber = sn;
	  participantData.Buffer = staticbuf;
	  participantData.ManaCost = mana;

	  cnt += List_CountIf( ch->in_room->People, IsSpellParticipant, &participantData );

          if ( cnt >= skill->participants )
            {
	      List_ForEach( ch->in_room->People, ContributeToSpell, &participantData );

              dont_wait = TRUE;
              send_to_char( "You concentrate all the energy into a burst of force!\r\n", ch );
              vo = locate_targets( ch, arg2, sn, &victim, &obj );

              if ( vo == &pAbort )
		{
		  return;
		}
            }
          else
            {
              set_char_color( AT_MAGIC, ch );
              send_to_char( "There was not enough power for that to succeed...\r\n", ch );

              if( !is_immortal( ch ) ) /* so imms dont lose mana */
		{
		  ch->mana -= mana / 2;
		}

              learn_from_failure( ch, sn );
              return;
            }
        }
    }

  if ( !dont_wait )
    {
      set_wait_state( ch, skill->beats );
    }

  /*
   * Getting ready to cast... check for spell components        -Thoric
   */
  if ( !process_spell_components( ch, sn ) )
    {

      if (!is_immortal( ch ) ) /* so imms dont lose mana */
	{
	  ch->mana -= mana / 2;
	}

      learn_from_failure( ch, sn );
      return;
    }

  if ( !is_npc(ch) && abs(ch->alignment - skill->alignment) > 1010 )
    {
      if ( ch->alignment > skill->alignment  )
        {
          send_to_char( "You do not have enough anger in you.\r\n", ch );

          if (!is_immortal( ch ) ) /* so imms dont lose mana */
	    {
	      ch->mana -= mana / 2;
	    }

          return;
        }

      if ( ch->alignment < skill->alignment )
        {
          send_to_char( "Your anger and hatred prevent you from focusing.\r\n", ch );

          if (!is_immortal( ch ) )    /* so imms dont lose mana */
	    {
	      ch->mana -= mana / 2;
	    }

          return;
        }
    }

  if ( !is_npc(ch)
       && (number_percent( ) + skill->difficulty * 5) > ch->pcdata->learned[sn] )
    {
      /* Some more interesting loss of concentration messages  -Thoric */
      switch( number_bits(2) )
        {
        case 0: /* too busy */
          if ( ch->fighting )
	    {
	      ch_printf( ch, "This round of battle is too hectic to concentrate properly.\r\n" );
	    }
          else
	    {
	      ch_printf( ch, "You lost your concentration.\r\n" );
	    }

          break;

        case 1: /* irritation */
          if ( number_bits(2) == 0 )
            {
              switch( number_bits(2) )
                {
                case 0:
		  send_to_char( "A tickle in your nose prevents you from keeping your concentration.\r\n", ch );
		  break;

                case 1:
		  send_to_char( "An itch on your leg keeps you from properly using the force.\r\n", ch );
		  break;

                case 2:
		  send_to_char( "A nagging thought prevents you from focusing on the force.\r\n", ch );
		  break;

                case 3:
		  send_to_char( "A twitch in your eye disrupts your concentration for a moment.\r\n", ch );
		  break;
                }
            }
          else
	    {
	      send_to_char( "Something distracts you, and you lose your concentration.\r\n", ch );
	    }

          break;

        case 2: /* not enough time */
          if ( ch->fighting )
	    {
	      send_to_char( "There wasn't enough time this round to complete your concentration.\r\n", ch );
	    }
          else
	    {
	      send_to_char( "You lost your concentration.\r\n", ch );
	    }

          break;

        case 3:
          send_to_char( "A disturbance in the force muddles your concentration.\r\n", ch );
          break;
        }

      if ( !is_immortal( ch ) ) /* so imms dont lose mana */
	{
	  ch->mana -= mana / 2;
	}

      learn_from_failure( ch, sn );
      return;
    }
  else
    {
      ch->mana -= mana;

      /*
       * check for immunity to magic if victim is known...
       * and it is a TAR_CHAR_DEFENSIVE/SELF spell
       * otherwise spells will have to check themselves
       */
      if ( (skill->target == TAR_CHAR_DEFENSIVE
            || skill->target == TAR_CHAR_SELF)
           && victim && IS_SET(victim->immune, RIS_MAGIC) )
        {
          immune_casting( skill, ch, victim, NULL );
          retcode = rSPELL_FAILED;
        }
      else
        {
	  short forceLevel = get_level( ch, FORCE_ABILITY );

          start_timer(&time_used);
          retcode = skill->spell_fun( sn, forceLevel, ch, vo );
          end_timer(&time_used);
          update_userec(&time_used, &skill->userec);
        }
    }

  if ( retcode == rCHAR_DIED || retcode == rERROR || char_died(ch) )
    {
      return;
    }

  if ( retcode != rSPELL_FAILED )
    {
      int force_exp = 0;

      force_exp = skill->min_level*skill->min_level*10;
      force_exp = URANGE( 0 , force_exp, ( exp_level(get_level( ch, FORCE_ABILITY ) + 1 ) - exp_level(get_level(ch, FORCE_ABILITY ) ) )/35 );

      if( !ch->fighting  )
	{
	  ch_printf( ch, "You gain %d force experience.\r\n" , force_exp );
	}

      gain_exp(ch, FORCE_ABILITY, force_exp );
      learn_from_success( ch, sn );
    }
  else
    {
      learn_from_failure( ch, sn );
    }

  /*
   * Fixed up a weird mess here, and added double safeguards    -Thoric
   */
  if ( skill->target == TAR_CHAR_OFFENSIVE
       && victim
       && !char_died(victim)
       && victim != ch
       && victim->in_room == ch->in_room
       && victim->master != ch
       && !victim->fighting )
    {
      retcode = multi_hit( victim, ch, TYPE_UNDEFINED );
    }
}

static bool IsSpellParticipant( void *element, void *userData )
{
  const Character *participant = (Character*) element;
  const SpellParticipantData *args = (SpellParticipantData*) userData;
  const TIMER *timer = get_timerptr( participant, TIMER_DO_FUN );

  if( participant != args->Caster
      && timer != NULL
      && timer->count >= 1
      && timer->do_fun == do_cast
      && participant->tempnum == args->SkillNumber
      && participant->dest_buf
      && !str_cmp( (const char*)participant->dest_buf, args->Buffer ) )
    {
      return TRUE;
    }

  return FALSE;
}

static void ContributeToSpell( void *element, void *userData )
{
  Character *participant = (Character*) element;
  const SpellParticipantData *args = (SpellParticipantData*) userData;
  TIMER *timer = get_timerptr( participant, TIMER_DO_FUN );
  int mana = args->ManaCost;

  if( participant != args->Caster
      && timer != NULL
      && timer->count >= 1
      && timer->do_fun == do_cast
      && participant->tempnum == args->SkillNumber
      && participant->dest_buf
      && !str_cmp( (const char*)participant->dest_buf, args->Buffer ) )
    {
      extract_timer( participant, timer );
      act( AT_MAGIC, "Channeling your energy into $n, you help direct the force.",
	   args->Caster, NULL, participant, TO_VICT );
      act( AT_MAGIC, "$N channels $S energy into you!", args->Caster, NULL, participant, TO_CHAR );
      act( AT_MAGIC, "$N channels $S energy into $n!", args->Caster, NULL, participant, TO_NOTVICT );
      learn_from_success( participant, args->SkillNumber );

      participant->mana -= mana;
      participant->substate = SUB_NONE;
      participant->tempnum = -1;
      DISPOSE( participant->dest_buf );
    }
}
