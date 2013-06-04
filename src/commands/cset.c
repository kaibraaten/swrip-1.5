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
      ch_printf(ch, "  Save flags: %s\r\n", flag_string( sysdata.save_flags, save_flag ) );
      return;
    }

  argument = one_argument( argument, arg );

  if (!str_cmp(arg, "help"))
    {
      do_help(ch, "controls");
      return;
    }

  if (!str_cmp(arg, "save"))
    {
      save_sysdata(sysdata);
      return;
    }

  if (!str_cmp(arg, "saveflag"))
    {
      int x = get_saveflag( argument );

      if ( x == -1 )
        send_to_char( "Not a save flag.\r\n", ch );
      else
        {
          TOGGLE_BIT( sysdata.save_flags, 1 << x );
          send_to_char( "Ok.\r\n", ch );
        }
      return;
    }

  if (!str_prefix( arg, "guild_overseer" ) )
    {
      STRFREE( sysdata.guild_overseer );
      sysdata.guild_overseer = str_dup( argument );
      send_to_char("Ok.\r\n", ch);
      return;
    }
  if (!str_prefix( arg, "guild_advisor" ) )
    {
      STRFREE( sysdata.guild_advisor );
      sysdata.guild_advisor = str_dup( argument );
      send_to_char("Ok.\r\n", ch);
      return;
    }

  level = (short) atoi(argument);

  if (!str_prefix( arg, "savefrequency" ) )
    {
      sysdata.save_frequency = level;
      send_to_char("Ok.\r\n", ch);
      return;
    }

  if (!str_cmp(arg, "stun"))
    {
      sysdata.stun_regular = level;
      send_to_char("Ok.\r\n", ch);
      return;
    }

  if (!str_cmp(arg, "stun_pvp"))
    {
      sysdata.stun_plr_vs_plr = level;
      send_to_char("Ok.\r\n", ch);
      return;
    }

  if (!str_cmp(arg, "dam_pvp"))
    {
      sysdata.dam_plr_vs_plr = level;
      send_to_char("Ok.\r\n", ch);
      return;
    }

  if (!str_cmp(arg, "get_notake"))
    {
      sysdata.level_getobjnotake = level;
      send_to_char("Ok.\r\n", ch);
      return;
    }

  if (!str_cmp(arg, "dam_pvm"))
    {
      sysdata.dam_plr_vs_mob = level;
      send_to_char("Ok.\r\n", ch);
      return;
    }

  if (!str_cmp(arg, "dam_mvp"))
    {
      sysdata.dam_mob_vs_plr = level;
      send_to_char("Ok.\r\n", ch);
      return;
    }

  if (!str_cmp(arg, "dam_mvm"))
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

  if (!str_cmp(arg, "read_all"))
    {
      sysdata.read_all_mail = level;
      send_to_char("Ok.\r\n", ch);
      return;
    }

  if (!str_cmp(arg, "read_free"))
    {
      sysdata.read_mail_free = level;
      send_to_char("Ok.\r\n", ch);
      return;
    }
  if (!str_cmp(arg, "write_free"))
    {
      sysdata.write_mail_free = level;
      send_to_char("Ok.\r\n", ch);
      return;
    }
  if (!str_cmp(arg, "take_all"))
    {
      sysdata.take_others_mail = level;
      send_to_char("Ok.\r\n", ch);
      return;
    }
  if (!str_cmp(arg, "muse"))
    {
      sysdata.muse_level = level;
      send_to_char("Ok.\r\n", ch);
      return;
    }

  if (!str_cmp(arg, "think"))
    {
      sysdata.think_level = level;
      send_to_char("Ok.\r\n", ch);
      return;
    }
  if (!str_cmp(arg, "log"))
    {
      sysdata.log_level = level;
      send_to_char("Ok.\r\n", ch);
      return;
    }
  if (!str_cmp(arg, "build"))
    {
      sysdata.build_level = level;
      send_to_char("Ok.\r\n", ch);
      return;
    }
  if (!str_cmp(arg, "proto_modify"))
    {
      sysdata.level_modify_proto = level;
      send_to_char("Ok.\r\n", ch);
      return;
    }
  if (!str_cmp(arg, "override_private"))
    {
      sysdata.level_override_private = level;
      send_to_char("Ok.\r\n", ch);
      return;
    }
  if (!str_cmp(arg, "forcepc"))
    {
      sysdata.level_forcepc = level;
      send_to_char("Ok.\r\n", ch);
      return;
    }
  if (!str_cmp(arg, "mset_player"))
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
