#include "help.hpp"
#include "mud.hpp"
#include "skill.hpp"

void do_memory( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];

  argument = OneArgument( argument, arg );
  Echo( ch, "Affects %5d    Areas   %5d\r\n",  top_affect, top_area   );
  Echo( ch, "ExtDes  %5d    Exits   %5d\r\n", top_ed,       top_exit   );
  Echo( ch, "Helps   %5d    Resets  %5d\r\n", ListSize(GetEntities(HelpFileRepository)),
        top_reset  );
  Echo( ch, "IdxMobs %5d    Mobs    %5d\r\n", top_mob_index, nummobsloaded );
  Echo( ch, "IdxObjs %5d    Objs    %5d (%d)\r\n", top_obj_index, numobjsloaded, physicalobjects );
  Echo( ch, "Rooms   %5d    VRooms  %5d\r\n", top_room,   top_vroom   );
  Echo( ch, "Shops   %5d    RepShps %5d\r\n", top_shop,   top_repair );
  Echo( ch, "CurOq's %5d    CurCq's %5d\r\n", cur_qobjs,  cur_qchars );
  Echo( ch, "Players %5d    Maxplrs %5d\r\n", num_descriptors, SysData.MaxPlayersThisBoot );
  Echo( ch, "MaxEver %5d    Topsn   %5d (%d)\r\n", SysData.MaxPlayersEver, TopSN, MAX_SKILL );
  Echo( ch, "MaxEver time recorded at:   %s\r\n", SysData.TimeOfMaxPlayersEver );

  if ( !StrCmp( arg, "check" ) )
    {
#ifdef HASHSTR
      SendToCharacter( check_hash(argument), ch );
#else
      SendToCharacter( "Hash strings not enabled.\r\n", ch );
#endif
      return;
    }

  if ( !StrCmp( arg, "showhigh" ) )
    {
#ifdef HASHSTR
      show_high_hash( atoi(argument) );
#else
      SendToCharacter( "Hash strings not enabled.\r\n", ch );
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

      Echo( ch, "Hash statistics:\r\n%s", hash_stats() );

      if ( hash != -1 )
        hash_dump( hash );
#else
      SendToCharacter( "Hash strings not enabled.\r\n", ch );
#endif
    }
}
