#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "pcdata.hpp"

void do_viewskills( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];
  Character *victim = NULL;
  int sn = 0;
  int col = 0;

  argument = OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      ch->Echo("&zSyntax: skills <player>.\r\n");
      return;
    }

  if ( ( victim = GetCharacterAnywhere( ch, arg ) ) == NULL )
    {
      ch->Echo("No such person in the game.\r\n");
      return;
    }

  col = 0;

  if ( !IsNpc( victim ) )
    {
      SetCharacterColor( AT_MAGIC, ch );
      for ( sn = 0; sn < TopSN && SkillTable[sn] && SkillTable[sn]->Name; sn++ )
        {
	  if ( IsNullOrEmpty( SkillTable[sn]->Name ))
            break;

          if ( victim->PCData->Learned[sn] == 0 )
            continue;

          sprintf( buf, "%20s %3d%% ", SkillTable[sn]->Name,
                   victim->PCData->Learned[sn]);
          ch->Echo(buf);

          if ( ++col % 3 == 0 )
            ch->Echo("\r\n");
        }
    }
}

