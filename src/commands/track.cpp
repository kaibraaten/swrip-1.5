#include "character.hpp"
#include "track.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "ship.hpp"
#include "pcdata.hpp"

void do_track( Character *ch, char *argument )
{
  Character *vict = NULL;
  char arg[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];
  int maxdist = 0;

  if ( !IsNpc(ch) && !ch->PCData->Learned[gsn_track] )
    {
      ch->Echo("You do not know of this skill yet.\r\n");
      return;
    }

  OneArgument(argument, arg);

  if ( IsNullOrEmpty( arg ) )
    {
      ch->Echo("Whom are you trying to track?\r\n");
      return;
    }

  SetWaitState( ch, SkillTable[gsn_track]->Beats );

  if( !( vict = GetCharacterAnywhere( ch, arg ) ) )
    {
      ch->Echo("You can't sense a trail from here.\r\n");
      return;
    }

  maxdist = 100 + ch->TopLevel * 30;

  if ( !IsNpc(ch) )
    maxdist = (maxdist * ch->PCData->Learned[gsn_track]) / 100;

  DirectionType dir = FindFirstStep(ch->InRoom, vict->InRoom, maxdist);
  
  switch(dir)
    {
    case BFS_ERROR:
      ch->Echo("Hmm... something seems to be wrong.\r\n");
      break;

    case BFS_ALREADY_THERE:
      ch->Echo("You're already in the same room!\r\n");
      break;

    case BFS_NO_PATH:
      sprintf(buf, "You can't sense a trail from here.\r\n" );
      ch->Echo(buf);
      LearnFromFailure( ch, gsn_track );
      break;

    default:
      ch->Echo("You sense a trail %s from here...\r\n",
               GetDirectionName((DirectionType)dir));
      LearnFromSuccess( ch, gsn_track );
      break;
    }
}

