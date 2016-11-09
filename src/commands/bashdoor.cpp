#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"

void do_bashdoor( Character *ch, std::string argument )
{
  Character *gch = NULL;
  Exit *pexit = NULL;
  char arg[MAX_INPUT_LENGTH];

  if ( !IsNpc( ch )
       &&  ch->PCData->Learned[gsn_bashdoor] <= 0  )
    {
      SendToCharacter( "You're not enough of a warrior to bash doors!\r\n", ch );
      return;
    }

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      SendToCharacter( "Bash what?\r\n", ch );
      return;
    }

  if ( ch->Fighting )
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

      if ( !IsBitSet( pexit->Flags, EX_CLOSED ) )
        {
          SendToCharacter( "Calm down.  It is already open.\r\n", ch );
          return;
        }

      SetWaitState( ch, SkillTable[gsn_bashdoor]->Beats );

      if ( IsBitSet( pexit->Flags, EX_SECRET ) )
        keyword = "wall";
      else
        keyword = pexit->Keyword;

      if ( !IsNpc(ch) )
        bash_chance = ch->PCData->Learned[gsn_bashdoor] / 2;
      else
        bash_chance = 90;

      if ( !IsBitSet( pexit->Flags, EX_BASHPROOF )
           && ch->Move >= 15
           && GetRandomPercent() < ( bash_chance + 4 * ( GetCurrentStrength( ch ) - 19 ) ) )
        {
          RemoveBit( pexit->Flags, EX_CLOSED );

          if ( IsBitSet( pexit->Flags, EX_LOCKED ) )
            RemoveBit( pexit->Flags, EX_LOCKED );

          SetBit( pexit->Flags, EX_BASHED );
          Act(AT_SKILL, "Crash!  You bashed open the $d!",
	      ch, NULL, keyword, TO_CHAR );
          Act(AT_SKILL, "$n bashes open the $d!",
	      ch, NULL, keyword, TO_ROOM );
          LearnFromSuccess(ch, gsn_bashdoor);

          if ( (to_room = pexit->ToRoom) != NULL
               &&   (pexit_rev = pexit->ReverseExit) != NULL
               &&    pexit_rev->ToRoom == ch->InRoom )
            {
              Character *rch = NULL;

              RemoveBit( pexit_rev->Flags, EX_CLOSED );

              if ( IsBitSet( pexit_rev->Flags, EX_LOCKED ) )
                RemoveBit( pexit_rev->Flags, EX_LOCKED );

              SetBit( pexit_rev->Flags, EX_BASHED );

              for ( rch = to_room->FirstPerson; rch; rch = rch->NextInRoom )
                {
                  Act(AT_SKILL, "The $d crashes open!",
                      rch, NULL, pexit_rev->Keyword, TO_CHAR );
		}
            }

          InflictDamage( ch, ch, ( ch->MaxHit / 20 ), gsn_bashdoor );
        }
      else
        {
          Act(AT_SKILL, "WHAAAAM!!! You bash against the $d, but it doesn't budge.",
              ch, NULL, keyword, TO_CHAR );
          Act(AT_SKILL, "WHAAAAM!!! $n bashes against the $d, but it holds strong.",
              ch, NULL, keyword, TO_ROOM );
          InflictDamage( ch, ch, ( ch->MaxHit / 20 ) + 10, gsn_bashdoor );
          LearnFromFailure(ch, gsn_bashdoor);
        }
    }
  else
    {
      Act(AT_SKILL, "WHAAAAM!!! You bash against the wall, but it doesn't budge.",
          ch, NULL, NULL, TO_CHAR );
      Act(AT_SKILL, "WHAAAAM!!! $n bashes against the wall, but it holds strong.",
          ch, NULL, NULL, TO_ROOM );
      InflictDamage( ch, ch, ( ch->MaxHit / 20 ) + 10, gsn_bashdoor );
      LearnFromFailure(ch, gsn_bashdoor);
    }

  if ( !CharacterDiedRecently( ch ) )
    {
      for ( gch = ch->InRoom->FirstPerson; gch; gch = gch->NextInRoom )
	{
	  if ( IsAwake( gch )
	       && !gch->Fighting
	       && ( IsNpc( gch ) && !IsAffectedBy( gch, AFF_CHARM ) )
	       && ( ch->TopLevel - gch->TopLevel <= 4 )
	       && NumberBits( 2 ) == 0 )
	    {
	      HitMultipleTimes( gch, ch, TYPE_UNDEFINED );
	    }
	}
    }
}
