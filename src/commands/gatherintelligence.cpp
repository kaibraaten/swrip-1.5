#include <string.h>
#include "mud.hpp"
#include "character.hpp"
#include "clan.hpp"
#include "skill.hpp"
#include "planet.hpp"
#include "area.hpp"
#include "pcdata.hpp"
#include "room.hpp"

void do_gather_intelligence( Character *ch , char *argument )
{
  Character *victim = NULL;
  char buf[MAX_STRING_LENGTH] = {'\0'};
  int percent = 0, the_chance = 0;
  Planet *planet = NULL;

  if( IsNullOrEmpty( argument ) )
    {
      ch->Echo("You must input a name.\r\n");
      return;
    }

  strcat(buf, "0.");
  strcat(buf, argument);

  SetWaitState( ch, SkillTable[gsn_gather_intelligence]->Beats );

  if( ( ( victim = GetCharacterAnywhere(ch, buf) ) == NULL ))
    {
      ch->Echo("You fail to gather information on that individual.\r\n");
      return;
    }

  if(IsNpc(victim))
    {
      ch->Echo("This person has not made much of a name for himself!\r\n");
      return;
    }

  percent = GetRandomPercent()*2;

  if ( IsNpc(ch) || percent < ch->PCData->Learned[gsn_gather_intelligence] )
    {

      if ( ch == victim )
        {
          ch->Echo( "I am sure you know enough about yourself right now" );
          return;
        }

      LearnFromSuccess( ch, gsn_gather_intelligence );

      the_chance = GetRandomPercent();

      if ( the_chance < 25 )
        {
          if ( ( planet = victim->InRoom->Area->Planet ) == NULL )
            {
              ch->Echo( "Information has been received that %s is travelling.", victim->Name );
            }
          else
            {
              ch->Echo( "Information has been received that %s is on %s.",
                        victim->Name, planet->Name );
            }

          return;
        }

      if ( the_chance < 30 )
        {
          if ( IsClanned( victim ) )
            {
              ch->Echo( "%s seems to be involved with %s.",
                        victim->Name, victim->PCData->ClanInfo.Clan->Name );
            }
          else
            {
              ch->Echo( "%s does not seem to be involved with any organization.", victim->Name );
            }

          return;
        }

      if ( the_chance < 40 )
        {
          if ( victim->Hit < ((victim->MaxHit)/4) )
            {
              ch->Echo( "Hospital records show that %s has had a very serious injury and has not fully recovered.", victim->Name );
            }
          else if ( victim->Hit < ((victim->MaxHit)/2) )
            {
              ch->Echo( "Hospital records show that %s has had a serious injury and has begun to recover.", victim->Name );
            }
          else if ( victim->Hit < ((victim->MaxHit)) )
            {
              ch->Echo( "Hospital records show that %s has had a minor injury recently.",
                        victim->Name );
            }
          else if ( victim->Hit == victim->MaxHit )
            {
              ch->Echo( "There has been no recently medical history for %s", victim->Name );
            }

          return;
        }

      if ( the_chance < 50 )
        {
          switch(victim->Ability.Main)
            {
            case COMBAT_ABILITY:
              sprintf( buf, "%s appears to have centered training on combat.", victim->Name );
              break;

            case PILOTING_ABILITY:
              sprintf( buf, "%s appears to have centered training on piloting ships.", victim->Name );
              break;

            case ENGINEERING_ABILITY:
              sprintf( buf, "%s appears to have centered training on engineering.", victim->Name );
              break;

	    case HUNTING_ABILITY:
              sprintf( buf, "%s appears to have centered training on bounty.hppunting.", victim->Name );
              break;

            case SMUGGLING_ABILITY:
              sprintf( buf, "%s appears to have centered training on smuggling.",  victim->Name );
              break;

            case DIPLOMACY_ABILITY:
              sprintf( buf, "%s appears to have centered training on diplomacy.", victim->Name );
              break;

            case LEADERSHIP_ABILITY:
              sprintf( buf, "%s appears to have centered training on leadership.", victim->Name );
              break;

            case FORCE_ABILITY:
              sprintf( buf, "%s appears to have centered attention on studying the force.", victim->Name );
              break;

            case COMMANDO_ABILITY:
              sprintf( buf, "%s has not centered training on anything, but seems to mix smuggling with piloting abilities.", victim->Name );
              break;

            default:
              break;
            }

          ch->Echo("%s", buf);
          return;
        }

      if ( the_chance < 55 )
        {
          if ( IsJedi( victim ) )
            {
              if ( victim->Mana > 1000 )
                sprintf( buf, "%s appears to have centered his attention on studying the force, and is rumored to excel at its use.", victim->Name );
              else if ( victim->Mana > 200 )
                sprintf( buf, "%s appears to have centered his attention on studying the force, and is rumored to have some skill.", victim->Name );
              else
                sprintf( buf, "%s appears to have centered his attention on studying the force, and is rumored to have found some minor ability in it.", victim->Name );
            }
          else
            sprintf( buf, "%s appears to have centered his attention on the mundane", victim->Name );

          ch->Echo("%s", buf);
          return;
        }

      ch->Echo("You fail to gather information on that individual.");
      return;
    }
  else
    {
      ch->Echo( "You fail to gather information on that individual." );
      return;
    }
}

