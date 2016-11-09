#include "character.hpp"
#include "track.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "ship.hpp"

void do_track( Character *ch, std::string argument )
{
  Character *vict;
  char arg[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];
  int dir;
  int maxdist;

  if ( !IsNpc(ch) && !ch->PCData->Learned[gsn_track] )
    {
      SendToCharacter("You do not know of this skill yet.\r\n", ch );
      return;
    }

  OneArgument(argument, arg);

  if ( IsNullOrEmpty( arg ) )
    {
      SendToCharacter("Whom are you trying to track?\r\n", ch);
      return;
    }

  SetWaitState( ch, SkillTable[gsn_track]->Beats );

  if( !( vict = GetCharacterAnywhere( ch, arg ) ) )
    {
      SendToCharacter("You can't sense a trail from here.\r\n", ch);
      return;
    }

  maxdist = 100 + ch->TopLevel * 30;

  if ( !IsNpc(ch) )
    maxdist = (maxdist * ch->PCData->Learned[gsn_track]) / 100;

  dir = FindFirstStep(ch->InRoom, vict->InRoom, maxdist);
  
  switch(dir)
    {
    case BFS_ERROR:
      SendToCharacter("Hmm... something seems to be wrong.\r\n", ch);
      break;

    case BFS_ALREADY_THERE:
      SendToCharacter("You're already in the same room!\r\n", ch);
      break;

    case BFS_NO_PATH:
      sprintf(buf, "You can't sense a trail from here.\r\n" );
      SendToCharacter(buf, ch);
      LearnFromFailure( ch, gsn_track );
      break;

    default:
      Echo(ch, "You sense a trail %s from here...\r\n",
	   GetDirectionName((DirectionType)dir));
      LearnFromSuccess( ch, gsn_track );
      break;
    }
}
