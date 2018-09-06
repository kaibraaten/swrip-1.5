#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "pcdata.hpp"

void do_viewskills( Character *ch, std::string arg )
{
  char buf[MAX_STRING_LENGTH] = {'\0'};
  Character *victim = NULL;
  int sn = 0;
  int col = 0;

  if ( arg.empty() )
    {
      ch->Echo("&zSyntax: skills <player>\r\n");
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

      for ( sn = 0; sn < TopSN && SkillTable[sn] && !SkillTable[sn]->Name.empty(); sn++ )
        {
	  if ( SkillTable[sn]->Name.empty() )
            break;

          if ( victim->PCData->Learned[sn] == 0 )
            continue;

          sprintf( buf, "%20s %3d%% ", SkillTable[sn]->Name.c_str(),
                   victim->PCData->Learned[sn]);
          ch->Echo(buf);

          if ( ++col % 3 == 0 )
            ch->Echo("\r\n");
        }
    }
}
