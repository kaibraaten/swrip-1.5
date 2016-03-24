#include "character.h"
#include "mud.h"
#include "skill.h"

void do_cutdoor( Character *ch, char *argument )
{
  Character *gch;
  Exit *pexit;
  char       arg [ MAX_INPUT_LENGTH ];
  Object *wield;
  int whichweap;
  int SABER = 1;
  int PIKE = 0;

  if ( ( wield = GetEquipmentOnCharacter( ch, WEAR_WIELD ) ) == NULL ||
       ( ( wield->value[3] != WEAPON_LIGHTSABER ) && ( wield->value[3] != WEAPON_FORCE_PIKE ) ) )
    {
      SendToCharacter( "You need a lightsaber for that!\r\n", ch );
      return;
    }

  if ( wield->value[3] == WEAPON_LIGHTSABER )
    whichweap = SABER;
  else
    whichweap = PIKE;
  if ( !IsNpc( ch )
       && ( (whichweap ? ch->pcdata->learned[gsn_lightsabers] <= 0 : ch->pcdata->learned[gsn_force_pikes] <= 0) || ch->pcdata->learned[gsn_cutdoor] <= 0 ))
    {
      SendToCharacter( "You can not use it well enough to cut a door open.\r\n", ch );
      return;
    }

  OneArgument( argument, arg );

  if ( arg[0] == '\0' )
    {
      SendToCharacter( "Cut what?\r\n", ch );
      return;
    }

  if ( ch->fighting )
    {
      SendToCharacter( "You can't break off your fight.\r\n", ch );
      return;
    }

  if ( ( pexit = FindDoor( ch, arg, false ) ) != NULL )
    {
      Room *to_room;
      Exit       *pexit_rev;
      int              the_chance;
      char          *keyword;

      if ( !IsBitSet( pexit->exit_info, EX_CLOSED ) )
        {
          SendToCharacter( "It is already open.\r\n", ch );
          return;
        }

      SetWaitState( ch, SkillTable[gsn_cutdoor]->beats );

      if ( IsBitSet( pexit->exit_info, EX_SECRET ) )
        keyword = "wall";
      else
        keyword = pexit->keyword;
      if ( !IsNpc(ch) )
        the_chance = ch->pcdata->learned[gsn_cutdoor] / 2;
      else
        the_chance = 90;

      if ( !IsBitSet( pexit->exit_info, EX_BASHPROOF )
           &&   ch->move >= 15
           &&   GetRandomPercent() < ( the_chance + 4 * ( GetCurrentStrength( ch ) - 19 ) ) )
        {
          RemoveBit( pexit->exit_info, EX_CLOSED );
          if ( IsBitSet( pexit->exit_info, EX_LOCKED ) )
            RemoveBit( pexit->exit_info, EX_LOCKED );
          SetBit( pexit->exit_info, EX_BASHED );

          Act(AT_SKILL, "You cut open the $d!", ch, NULL, keyword, TO_CHAR );
          Act(AT_SKILL, "$n cuts open the $d!",          ch, NULL, keyword, TO_ROOM );
	  LearnFromSuccess(ch, gsn_cutdoor);

          if ( (to_room = pexit->to_room) != NULL
               &&   (pexit_rev = pexit->rexit) != NULL
               &&    pexit_rev->to_room == ch->in_room )
            {
              Character *rch;

              RemoveBit( pexit_rev->exit_info, EX_CLOSED );
              if ( IsBitSet( pexit_rev->exit_info, EX_LOCKED ) )
                RemoveBit( pexit_rev->exit_info, EX_LOCKED );
              SetBit( pexit_rev->exit_info, EX_BASHED );

              for ( rch = to_room->first_person; rch; rch = rch->next_in_room )
                {
                  Act(AT_SKILL, "The $d falls open!",
                      rch, NULL, pexit_rev->keyword, TO_CHAR );
                }
            }
          InflictDamage( ch, ch, ( ch->max_hit / 20 ), gsn_cutdoor );

        }
      else
        {
          Act(AT_SKILL, "You cut at the $d, but you handle it badly and just score it.",
              ch, NULL, keyword, TO_CHAR );
          Act(AT_SKILL, "$n cuts at the $d, but just scores it.",
              ch, NULL, keyword, TO_ROOM );
          InflictDamage( ch, ch, ( ch->max_hit / 20 ) + 10, gsn_cutdoor );
          LearnFromFailure(ch, gsn_cutdoor);
        }
    }
  else
    {
      Act(AT_SKILL, "You slice at the wall, but just score it.",
          ch, NULL, NULL, TO_CHAR );
      Act(AT_SKILL, "$n cuts at the wall, but just scores it.",
          ch, NULL, NULL, TO_ROOM );
      InflictDamage( ch, ch, ( ch->max_hit / 20 ) + 10, gsn_cutdoor );
      LearnFromFailure(ch, gsn_cutdoor);
    }
  if ( !CharacterDiedRecently( ch ) )
    for ( gch = ch->in_room->first_person; gch; gch = gch->next_in_room )
      {
        if ( IsAwake( gch )
	     && !gch->fighting
             && ( IsNpc( gch ) && !IsAffectedBy( gch, AFF_CHARM ) )
             && ( ch->top_level - gch->top_level <= 4 )
             && NumberBits( 2 ) == 0 )
          HitMultipleTimes( gch, ch, TYPE_UNDEFINED );
      }
}
