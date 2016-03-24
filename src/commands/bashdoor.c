#include "character.h"
#include "mud.h"
#include "skill.h"

void do_bashdoor( Character *ch, char *argument )
{
  Character *gch = NULL;
  Exit *pexit = NULL;
  char arg[MAX_INPUT_LENGTH];

  if ( !IsNpc( ch )
       &&  ch->pcdata->learned[gsn_bashdoor] <= 0  )
    {
      SendToCharacter( "You're not enough of a warrior to bash doors!\r\n", ch );
      return;
    }

  OneArgument( argument, arg );

  if ( arg[0] == '\0' )
    {
      SendToCharacter( "Bash what?\r\n", ch );
      return;
    }

  if ( ch->fighting )
    {
      SendToCharacter( "You can't break off your fight.\r\n", ch );
      return;
    }

  if ( ( pexit = FindDoor( ch, arg, false ) ) != NULL )
    {
      Room *to_room = NULL;
      Exit *pexit_rev = NULL;
      int bash_chance = 0;
      char *keyword = NULL;

      if ( !IsBitSet( pexit->exit_info, EX_CLOSED ) )
        {
          SendToCharacter( "Calm down.  It is already open.\r\n", ch );
          return;
        }

      SetWaitState( ch, SkillTable[gsn_bashdoor]->beats );

      if ( IsBitSet( pexit->exit_info, EX_SECRET ) )
        keyword = "wall";
      else
        keyword = pexit->keyword;

      if ( !IsNpc(ch) )
        bash_chance = ch->pcdata->learned[gsn_bashdoor] / 2;
      else
        bash_chance = 90;

      if ( !IsBitSet( pexit->exit_info, EX_BASHPROOF )
           && ch->move >= 15
           && GetRandomPercent() < ( bash_chance + 4 * ( GetCurrentStrength( ch ) - 19 ) ) )
        {
          RemoveBit( pexit->exit_info, EX_CLOSED );

          if ( IsBitSet( pexit->exit_info, EX_LOCKED ) )
            RemoveBit( pexit->exit_info, EX_LOCKED );

          SetBit( pexit->exit_info, EX_BASHED );
          Act(AT_SKILL, "Crash!  You bashed open the $d!",
	      ch, NULL, keyword, TO_CHAR );
          Act(AT_SKILL, "$n bashes open the $d!",
	      ch, NULL, keyword, TO_ROOM );
          LearnFromSuccess(ch, gsn_bashdoor);

          if ( (to_room = pexit->to_room) != NULL
               &&   (pexit_rev = pexit->rexit) != NULL
               &&    pexit_rev->to_room == ch->in_room )
            {
              Character *rch = NULL;

              RemoveBit( pexit_rev->exit_info, EX_CLOSED );

              if ( IsBitSet( pexit_rev->exit_info, EX_LOCKED ) )
                RemoveBit( pexit_rev->exit_info, EX_LOCKED );

              SetBit( pexit_rev->exit_info, EX_BASHED );

              for ( rch = to_room->first_person; rch; rch = rch->next_in_room )
                {
                  Act(AT_SKILL, "The $d crashes open!",
                      rch, NULL, pexit_rev->keyword, TO_CHAR );
		}
            }

          InflictDamage( ch, ch, ( ch->max_hit / 20 ), gsn_bashdoor );
        }
      else
        {
          Act(AT_SKILL, "WHAAAAM!!! You bash against the $d, but it doesn't budge.",
              ch, NULL, keyword, TO_CHAR );
          Act(AT_SKILL, "WHAAAAM!!! $n bashes against the $d, but it holds strong.",
              ch, NULL, keyword, TO_ROOM );
          InflictDamage( ch, ch, ( ch->max_hit / 20 ) + 10, gsn_bashdoor );
          LearnFromFailure(ch, gsn_bashdoor);
        }
    }
  else
    {
      Act(AT_SKILL, "WHAAAAM!!! You bash against the wall, but it doesn't budge.",
          ch, NULL, NULL, TO_CHAR );
      Act(AT_SKILL, "WHAAAAM!!! $n bashes against the wall, but it holds strong.",
          ch, NULL, NULL, TO_ROOM );
      InflictDamage( ch, ch, ( ch->max_hit / 20 ) + 10, gsn_bashdoor );
      LearnFromFailure(ch, gsn_bashdoor);
    }

  if ( !CharacterDiedRecently( ch ) )
    {
      for ( gch = ch->in_room->first_person; gch; gch = gch->next_in_room )
	{
	  if ( IsAwake( gch )
	       && !gch->fighting
	       && ( IsNpc( gch ) && !IsAffectedBy( gch, AFF_CHARM ) )
	       && ( ch->top_level - gch->top_level <= 4 )
	       && NumberBits( 2 ) == 0 )
	    {
	      HitMultipleTimes( gch, ch, TYPE_UNDEFINED );
	    }
	}
    }
}
