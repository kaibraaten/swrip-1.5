#include <string.h>
#include "mud.h"
#include "character.h"
#include "clan.h"
#include "skill.h"
#include "planet.h"
#include "area.h"

void do_gather_intelligence( Character *ch , char *argument )
{
  Character *victim;
  char buf[MAX_STRING_LENGTH] = {'\0'};
  int percent, the_chance;
  Planet *planet;

  if( IsNullOrEmpty( argument ) )
    {
      SendToCharacter("You must input a name.\r\n", ch);
      return;
    }

  strcat(buf, "0.");
  strcat(buf, argument);

  SetWaitState( ch, SkillTable[gsn_gather_intelligence]->Beats );

  if( ( ( victim = GetCharacterAnywhere(ch, buf) ) == NULL ))
    {
      SendToCharacter("You fail to gather information on that individual.\r\n", ch);
      return;
    }

  if(IsNpc(victim))
    {
      SendToCharacter("This person has not made much of a name for himself!\r\n", ch);
      return;
    }

  percent = GetRandomPercent()*2;

  if ( IsNpc(ch) || percent < ch->PCData->Learned[gsn_gather_intelligence] )
    {

      if ( ch == victim )
        {
          SendToCharacter( "I am sure you know enough about yourself right now", ch );
          return;
        }

      LearnFromSuccess( ch, gsn_gather_intelligence );

      the_chance = GetRandomPercent();

      if ( the_chance < 25 )
        {
          if ( ( planet = victim->InRoom->Area->Planet ) == NULL )
            {
              sprintf( buf, "Information has been recieved that %s is travelling.", victim->Name );
              SendToCharacter(buf, ch);
              return;
            }
          else
            {
              sprintf( buf, "Information has been recieved that %s is on %s.", victim->Name, planet->Name );
              SendToCharacter(buf, ch);
              return;
            }
          return;
        }
      if ( the_chance < 30 )
        {
          if ( IsClanned( victim ) )
            {
              sprintf( buf, "%s seems to be involved with %s.", victim->Name, victim->PCData->ClanInfo.Clan->Name );
              SendToCharacter( buf, ch );
              return;
            }
          else
            {
              sprintf( buf, "%s does not seem to be involved with any organization.", victim->Name );
              SendToCharacter( buf, ch );
              return;
            }
          return;
        }

      if ( the_chance < 40 )
        {
          if ( victim->Hit < ((victim->MaxHit)/4) )
            {
              sprintf( buf, "Hospital records show that %s has had a very serious injury and has not fully recovered.", victim->Name );
              SendToCharacter( buf, ch);
              return;
            }
          if ( victim->Hit < ((victim->MaxHit)/2) )
            {
              sprintf( buf, "Hospital records show that %s has had a serious injury and has begun to recover.", victim->Name );
              SendToCharacter( buf, ch);
              return;
            }
          if ( victim->Hit < ((victim->MaxHit)) )
            {
              sprintf( buf, "Hospital records show that %s has had a minor injury recently.", victim->Name );
              SendToCharacter( buf, ch);
              return;
            }
          if ( victim->Hit == victim->MaxHit )
            {
              sprintf( buf, "There has been no recently medical history for %s", victim->Name );
              SendToCharacter( buf, ch);
              return;
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
              sprintf( buf, "%s appears to have centered training on bounty hunting.", victim->Name );
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
          SendToCharacter( buf, ch );
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

	  SendToCharacter( buf, ch );
          return;
        }

      SendToCharacter ( "You fail to gather information on that individual.", ch );
      return;
    }
  else
    {
      SendToCharacter ( "You fail to gather information on that individual.", ch );
      return;
    }
}
