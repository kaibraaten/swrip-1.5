#include "help.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "repos/playerrepository.hpp"
#include "character.hpp"
#include "shop.hpp"
#include "systemdata.hpp"
#include "repos/helprepository.hpp"
#include "repos/shoprepository.hpp"

void do_memory( std::shared_ptr<Character> ch, std::string argument )
{
  ch->Echo("Affects %5d    Areas   %5d\r\n",  top_affect, top_area   );
  ch->Echo("ExtDes  %5d    Exits   %5d\r\n", top_ed,       top_exit   );
  ch->Echo("Helps   %5lu    Resets  %5d\r\n", HelpFiles->Count(), top_reset  );
  ch->Echo("IdxMobs %5d    Mobs    %5d\r\n", top_mob_index, nummobsloaded );
  ch->Echo("IdxObjs %5d    Objs    %5d (%d)\r\n", top_obj_index, numobjsloaded, physicalobjects );
  ch->Echo("Rooms   %5d    VRooms  %5d\r\n", top_room,   top_vroom   );
  ch->Echo("Shops   %5lu    RepShps %5d\r\n", Shops->Count(),   top_repair );
  ch->Echo("CurOq's %5d    CurCq's %5d\r\n", cur_qobjs,  cur_qchars );
  ch->Echo("Players %5lu    Maxplrs %5d\r\n", PlayerCharacters->Count(),
        SysData.MaxPlayersThisBoot );
  ch->Echo("MaxEver %5d    Topsn   %5d (%d)\r\n", SysData.MaxPlayersEver, TopSN, MAX_SKILL );
  ch->Echo("MaxEver time recorded at:   %s\r\n", SysData.TimeOfMaxPlayersEver.c_str() );
}
