#include "help.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "playerrepository.hpp"
#include "character.hpp"
#include "shop.hpp"
#include "systemdata.hpp"

void do_memory( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];

  argument = OneArgument( argument, arg );
  ch->Echo("Affects %5d    Areas   %5d\r\n",  top_affect, top_area   );
  ch->Echo("ExtDes  %5d    Exits   %5d\r\n", top_ed,       top_exit   );
  ch->Echo("Helps   %5d    Resets  %5d\r\n", HelpFiles->Count(), top_reset  );
  ch->Echo("IdxMobs %5d    Mobs    %5d\r\n", top_mob_index, nummobsloaded );
  ch->Echo("IdxObjs %5d    Objs    %5d (%d)\r\n", top_obj_index, numobjsloaded, physicalobjects );
  ch->Echo("Rooms   %5d    VRooms  %5d\r\n", top_room,   top_vroom   );
  ch->Echo("Shops   %5d    RepShps %5d\r\n", Shops->Count(),   top_repair );
  ch->Echo("CurOq's %5d    CurCq's %5d\r\n", cur_qobjs,  cur_qchars );
  ch->Echo("Players %5d    Maxplrs %5d\r\n", PlayerCharacters->Count(),
        SysData.MaxPlayersThisBoot );
  ch->Echo("MaxEver %5d    Topsn   %5d (%d)\r\n", SysData.MaxPlayersEver, TopSN, MAX_SKILL );
  ch->Echo("MaxEver time recorded at:   %s\r\n", SysData.TimeOfMaxPlayersEver );

  if ( !StrCmp( arg, "check" ) )
    {
#ifdef HASHSTR
      ch->Echo(check_hash(argument));
#else
      ch->Echo("Hash strings not enabled.\r\n");
#endif
      return;
    }

  if ( !StrCmp( arg, "showhigh" ) )
    {
#ifdef HASHSTR
      show_high_hash( atoi(argument) );
#else
      ch->Echo("Hash strings not enabled.\r\n");
#endif
      return;
    }

  if ( !StrCmp( arg, "hash" ) )
    {
#ifdef HASHSTR
      int hash = 0;

      if ( !IsNullOrEmpty( argument ) )
	hash = atoi(argument);
      else
	hash = -1;

      ch->Echo("Hash statistics:\r\n%s", hash_stats() );

      if ( hash != -1 )
        hash_dump( hash );
#else
      ch->Echo("Hash strings not enabled.\r\n");
#endif
    }
}

