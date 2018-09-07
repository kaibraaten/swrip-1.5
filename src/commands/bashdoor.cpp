#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "room.hpp"
#include "exit.hpp"

void do_bashdoor( Character *ch, std::string arg )
{
  Exit *pexit = NULL;

  if ( !IsNpc( ch )
       && ch->PCData->Learned[gsn_bashdoor] <= 0  )
    {
      ch->Echo( "You're not enough of a warrior to bash doors!\r\n" );
      return;
    }

  if ( arg.empty() )
    {
      ch->Echo( "Bash what?\r\n" );
      return;
    }

  if ( ch->Fighting )
    {
      ch->Echo( "You can't break off your fight.\r\n" );
      return;
    }

  if ( ( pexit = FindDoor( ch, arg, false ) ) != NULL )
    {
      Room *to_room = NULL;
      Exit *pexit_rev = NULL;
      int bash_chance = 0;
      std::string keyword;

      if ( !IsBitSet( pexit->Flags, EX_CLOSED ) )
        {
          ch->Echo( "Calm down. It is already open.\r\n" );
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
          Act(AT_SKILL, "Crash! You bashed open the $d!",
	      ch, NULL, keyword.c_str(), TO_CHAR );
          Act(AT_SKILL, "$n bashes open the $d!",
	      ch, NULL, keyword.c_str(), TO_ROOM );
          LearnFromSuccess(ch, gsn_bashdoor);

          if ( (to_room = pexit->ToRoom) != NULL
               && (pexit_rev = pexit->ReverseExit) != NULL
               && pexit_rev->ToRoom == ch->InRoom )
            {
              RemoveBit( pexit_rev->Flags, EX_CLOSED );

              if ( IsBitSet( pexit_rev->Flags, EX_LOCKED ) )
                RemoveBit( pexit_rev->Flags, EX_LOCKED );

              SetBit( pexit_rev->Flags, EX_BASHED );

              for(Character *rch : to_room->Characters())
                {
                  Act(AT_SKILL, "The $d crashes open!",
                      rch, NULL, pexit_rev->Keyword.c_str(), TO_CHAR );
		}
            }

          InflictDamage( ch, ch, ( ch->MaxHit / 20 ), gsn_bashdoor );
        }
      else
        {
          Act(AT_SKILL, "WHAAAAM!!! You bash against the $d, but it doesn't budge.",
              ch, NULL, keyword.c_str(), TO_CHAR );
          Act(AT_SKILL, "WHAAAAM!!! $n bashes against the $d, but it holds strong.",
              ch, NULL, keyword.c_str(), TO_ROOM );
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
      for(Character *gch : ch->InRoom->Characters())
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
