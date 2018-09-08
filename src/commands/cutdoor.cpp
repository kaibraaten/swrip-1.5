#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "room.hpp"
#include "object.hpp"
#include "exit.hpp"

void do_cutdoor( Character *ch, std::string arg )
{
  Exit *pexit = nullptr;
  const Object *wield = nullptr;

  if ( ( wield = GetEquipmentOnCharacter( ch, WEAR_WIELD ) ) == NULL
       || wield->Value[OVAL_WEAPON_TYPE] != WEAPON_LIGHTSABER )
    {
      ch->Echo( "You need a lightsaber for that!\r\n" );
      return;
    }

  if ( !IsNpc( ch )
       && ( ch->PCData->Learned[gsn_lightsabers] <= 0 || ch->PCData->Learned[gsn_cutdoor] <= 0 ))
    {
      ch->Echo( "You can not use it well enough to cut a door open.\r\n" );
      return;
    }

  if ( arg.empty() )
    {
      ch->Echo( "Cut what?\r\n" );
      return;
    }

  if ( ch->Fighting )
    {
      ch->Echo( "You can't break off your fight.\r\n" );
      return;
    }

  if ( ( pexit = FindDoor( ch, arg, false ) ) != NULL )
    {
      const Room *to_room = nullptr;
      Exit *pexit_rev = nullptr;
      int the_chance = 0;
      std::string keyword;

      if ( !IsBitSet( pexit->Flags, EX_CLOSED ) )
        {
          ch->Echo( "It is already open.\r\n" );
          return;
        }

      SetWaitState( ch, SkillTable[gsn_cutdoor]->Beats );

      if ( IsBitSet( pexit->Flags, EX_SECRET ) )
        keyword = "wall";
      else
        keyword = pexit->Keyword;

      if ( !IsNpc(ch) )
        the_chance = ch->PCData->Learned[gsn_cutdoor] / 2;
      else
        the_chance = 90;

      if ( !IsBitSet( pexit->Flags, EX_BASHPROOF )
           &&   ch->Fatigue.Current >= 15
           &&   GetRandomPercent() < ( the_chance + 4 * ( GetCurrentStrength( ch ) - 19 ) ) )
        {
          RemoveBit( pexit->Flags, EX_CLOSED );

          if ( IsBitSet( pexit->Flags, EX_LOCKED ) )
            RemoveBit( pexit->Flags, EX_LOCKED );

	  SetBit( pexit->Flags, EX_BASHED );

          Act(AT_SKILL, "You cut open the $d!", ch, NULL, keyword.c_str(), TO_CHAR );
          Act(AT_SKILL, "$n cuts open the $d!", ch, NULL, keyword.c_str(), TO_ROOM );
	  LearnFromSuccess(ch, gsn_cutdoor);

          if ( (to_room = pexit->ToRoom) != NULL
               &&   (pexit_rev = pexit->ReverseExit) != NULL
               &&    pexit_rev->ToRoom == ch->InRoom )
            {
              RemoveBit( pexit_rev->Flags, EX_CLOSED );

              if ( IsBitSet( pexit_rev->Flags, EX_LOCKED ) )
                RemoveBit( pexit_rev->Flags, EX_LOCKED );

	      SetBit( pexit_rev->Flags, EX_BASHED );

              for(Character *rch : to_room->Characters())
                {
                  Act(AT_SKILL, "The $d falls open!",
                      rch, NULL, pexit_rev->Keyword.c_str(), TO_CHAR );
                }
            }

          InflictDamage( ch, ch, ( ch->HitPoints.Max / 20 ), gsn_cutdoor );
        }
      else
        {
          Act(AT_SKILL, "You cut at the $d, but you handle it badly and just score it.",
              ch, NULL, keyword.c_str(), TO_CHAR );
          Act(AT_SKILL, "$n cuts at the $d, but just scores it.",
              ch, NULL, keyword.c_str(), TO_ROOM );
          InflictDamage( ch, ch, ( ch->HitPoints.Max / 20 ) + 10, gsn_cutdoor );
          LearnFromFailure(ch, gsn_cutdoor);
        }
    }
  else
    {
      Act(AT_SKILL, "You slice at the wall, but just score it.",
          ch, NULL, NULL, TO_CHAR );
      Act(AT_SKILL, "$n cuts at the wall, but just scores it.",
          ch, NULL, NULL, TO_ROOM );
      InflictDamage( ch, ch, ( ch->HitPoints.Max / 20 ) + 10, gsn_cutdoor );
      LearnFromFailure(ch, gsn_cutdoor);
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
	    HitMultipleTimes( gch, ch, TYPE_UNDEFINED );
	}
    }
}

