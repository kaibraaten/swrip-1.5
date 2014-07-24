#include "help.h"
#include "mud.h"

void do_memory( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];

  argument = one_argument( argument, arg );
  ch_printf( ch, "Affects %5d    Areas   %5d\r\n",  top_affect, top_area   );
  ch_printf( ch, "ExtDes  %5d    Exits   %5d\r\n", top_ed,       top_exit   );
  ch_printf( ch, "Helps   %5d    Resets  %5d\r\n", top_help,   top_reset  );
  ch_printf( ch, "IdxMobs %5d    Mobs    %5d\r\n", top_mob_index, nummobsloaded );
  ch_printf( ch, "IdxObjs %5d    Objs    %5d (%d)\r\n", top_obj_index, numobjsloaded, physicalobjects );
  ch_printf( ch, "Rooms   %5d    VRooms  %5d\r\n", top_room,   top_vroom   );
  ch_printf( ch, "Shops   %5d    RepShps %5d\r\n", top_shop,   top_repair );
  ch_printf( ch, "CurOq's %5d    CurCq's %5d\r\n", cur_qobjs,  cur_qchars );
  ch_printf( ch, "Players %5d    Maxplrs %5d\r\n", num_descriptors, sysdata.maxplayers );
  ch_printf( ch, "MaxEver %5d    Topsn   %5d (%d)\r\n", sysdata.alltimemax, top_sn, MAX_SKILL );
  ch_printf( ch, "MaxEver time recorded at:   %s\r\n", sysdata.time_of_max );

  if ( !str_cmp( arg, "check" ) )
    {
#ifdef HASHSTR
      send_to_char( check_hash(argument), ch );
#else
      send_to_char( "Hash strings not enabled.\r\n", ch );
#endif
      return;
    }

  if ( !str_cmp( arg, "showhigh" ) )
    {
#ifdef HASHSTR
      show_high_hash( atoi(argument) );
#else
      send_to_char( "Hash strings not enabled.\r\n", ch );
#endif
      return;
    }

  if ( !str_cmp( arg, "hash" ) )
    {
      int hash = 0;

      if ( argument[0] != '\0' )
	hash = atoi(argument);
      else
	hash = -1;

#ifdef HASHSTR
      ch_printf( ch, "Hash statistics:\r\n%s", hash_stats() );

      if ( hash != -1 )
        hash_dump( hash );
#else
      send_to_char( "Hash strings not enabled.\r\n", ch );
#endif
    }
}
