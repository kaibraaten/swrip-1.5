#include "mud.h"

void do_cset( Character *ch, char *argument )
{
  char arg[MAX_STRING_LENGTH];
  short level;

  set_char_color( AT_IMMORT, ch );

  if (argument[0] == '\0')
    {
      ch_printf(ch, "Mail:\r\n  Read all mail: %d. Read mail for free: %d. Write mail for free: %d.\r\n",
                sysdata.read_all_mail, sysdata.read_mail_free, sysdata.write_mail_free );
      ch_printf(ch, "  Take all mail: %d.\r\n",
                sysdata.take_others_mail);
      ch_printf(ch, "Channels:\r\n  Muse: %d. Think: %d. Log: %d. Build: %d.\r\n",
                sysdata.muse_level, sysdata.think_level, sysdata.log_level,
                sysdata.build_level);
      ch_printf(ch, "Building:\r\n  Prototype modification: %d.  Player msetting: %d.\r\n",
                sysdata.level_modify_proto, sysdata.level_mset_player );
      ch_printf(ch, "Guilds:\r\n  Overseer: %s.  Advisor: %s.\r\n",
                sysdata.guild_overseer, sysdata.guild_advisor );
      ch_printf(ch, "Other:\r\n  Force on players: %d.  ", sysdata.level_forcepc);
      ch_printf(ch, "Private room override: %d.\r\n", sysdata.level_override_private);
      ch_printf(ch, "  Penalty to regular stun chance: %d.  ", sysdata.stun_regular );
      ch_printf(ch, "Penalty to stun plr vs. plr: %d.\r\n", sysdata.stun_plr_vs_plr );
      ch_printf(ch, "  Percent damage plr vs. plr: %3d.  ", sysdata.dam_plr_vs_plr );
      ch_printf(ch, "Percent damage plr vs. mob: %d.\r\n", sysdata.dam_plr_vs_mob );
      ch_printf(ch, "  Percent damage mob vs. plr: %3d.  ", sysdata.dam_mob_vs_plr );
      ch_printf(ch, "Percent damage mob vs. mob: %d.\r\n", sysdata.dam_mob_vs_mob );
      ch_printf(ch, "  Get object without take flag: %d.  ", sysdata.level_getobjnotake);
      ch_printf(ch, "Autosave frequency (minutes): %d.\r\n", sysdata.save_frequency );
      ch_printf(ch, "  Save flags: %s\r\n", FlagString( sysdata.save_flags, save_flag ) );
      ch_printf(ch, "Hunger and thirst: %s\r\n", sysdata.disable_hunger ? "Disabled" : "Enabled" );
      return;
    }

  argument = OneArgument( argument, arg );

  if (!StrCmp(arg, "help"))
    {
      do_help(ch, "controls");
      return;
    }

  if (!StrCmp(arg, "save"))
    {
      save_sysdata(sysdata);
      return;
    }

  if( !StrCmp( arg, "disable_hunger" ) )
    {
      sysdata.disable_hunger = sysdata.disable_hunger ? false : true;
      ch_printf( ch, "Hunger and thirst now %s\r\n",
		 sysdata.disable_hunger ? "DISABLED" : "ENABLED" );
      return;
    }

  if (!StrCmp(arg, "saveflag"))
    {
      int x = get_saveflag( argument );

      if ( x == -1 )
        send_to_char( "Not a save flag.\r\n", ch );
      else
        {
          ToggleBit( sysdata.save_flags, 1 << x );
          send_to_char( "Ok.\r\n", ch );
        }
      return;
    }

  if (!StringPrefix( arg, "guild_overseer" ) )
    {
      DISPOSE( sysdata.guild_overseer );
      sysdata.guild_overseer = CopyString( argument );
      send_to_char("Ok.\r\n", ch);
      return;
    }

  if (!StringPrefix( arg, "guild_advisor" ) )
    {
      DISPOSE( sysdata.guild_advisor );
      sysdata.guild_advisor = CopyString( argument );
      send_to_char("Ok.\r\n", ch);
      return;
    }

  level = (short) atoi(argument);

  if (!StringPrefix( arg, "savefrequency" ) )
    {
      sysdata.save_frequency = level;
      send_to_char("Ok.\r\n", ch);
      return;
    }

  if (!StrCmp(arg, "stun"))
    {
      sysdata.stun_regular = level;
      send_to_char("Ok.\r\n", ch);
      return;
    }

  if (!StrCmp(arg, "stun_pvp"))
    {
      sysdata.stun_plr_vs_plr = level;
      send_to_char("Ok.\r\n", ch);
      return;
    }

  if (!StrCmp(arg, "dam_pvp"))
    {
      sysdata.dam_plr_vs_plr = level;
      send_to_char("Ok.\r\n", ch);
      return;
    }

  if (!StrCmp(arg, "get_notake"))
    {
      sysdata.level_getobjnotake = level;
      send_to_char("Ok.\r\n", ch);
      return;
    }

  if (!StrCmp(arg, "dam_pvm"))
    {
      sysdata.dam_plr_vs_mob = level;
      send_to_char("Ok.\r\n", ch);
      return;
    }

  if (!StrCmp(arg, "dam_mvp"))
    {
      sysdata.dam_mob_vs_plr = level;
      send_to_char("Ok.\r\n", ch);
      return;
    }

  if (!StrCmp(arg, "dam_mvm"))
    {
      sysdata.dam_mob_vs_mob = level;
      send_to_char("Ok.\r\n", ch);
      return;
    }

  if (level < 0 || level > MAX_LEVEL)
    {
      send_to_char("Invalid value for new control.\r\n", ch);
      return;
    }

  if (!StrCmp(arg, "read_all"))
    {
      sysdata.read_all_mail = level;
      send_to_char("Ok.\r\n", ch);
      return;
    }

  if (!StrCmp(arg, "read_free"))
    {
      sysdata.read_mail_free = level;
      send_to_char("Ok.\r\n", ch);
      return;
    }

  if (!StrCmp(arg, "write_free"))
    {
      sysdata.write_mail_free = level;
      send_to_char("Ok.\r\n", ch);
      return;
    }

  if (!StrCmp(arg, "take_all"))
    {
      sysdata.take_others_mail = level;
      send_to_char("Ok.\r\n", ch);
      return;
    }

  if (!StrCmp(arg, "muse"))
    {
      sysdata.muse_level = level;
      send_to_char("Ok.\r\n", ch);
      return;
    }

  if (!StrCmp(arg, "think"))
    {
      sysdata.think_level = level;
      send_to_char("Ok.\r\n", ch);
      return;
    }

  if (!StrCmp(arg, "log"))
    {
      sysdata.log_level = level;
      send_to_char("Ok.\r\n", ch);
      return;
    }

  if (!StrCmp(arg, "build"))
    {
      sysdata.build_level = level;
      send_to_char("Ok.\r\n", ch);
      return;
    }

  if (!StrCmp(arg, "proto_modify"))
    {
      sysdata.level_modify_proto = level;
      send_to_char("Ok.\r\n", ch);
      return;
    }

  if (!StrCmp(arg, "override_private"))
    {
      sysdata.level_override_private = level;
      send_to_char("Ok.\r\n", ch);
      return;
    }

  if (!StrCmp(arg, "forcepc"))
    {
      sysdata.level_forcepc = level;
      send_to_char("Ok.\r\n", ch);
      return;
    }

  if (!StrCmp(arg, "mset_player"))
    {
      sysdata.level_mset_player = level;
      send_to_char("Ok.\r\n", ch);
      return;
    }
  else
    {
      send_to_char("Invalid argument.\r\n", ch);
      return;
    }
}
