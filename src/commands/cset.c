#include "mud.h"

void do_cset( Character *ch, char *argument )
{
  char arg[MAX_STRING_LENGTH];
  short level;

  SetCharacterColor( AT_IMMORT, ch );

  if ( IsNullOrEmpty( argument ) )
    {
      Echo(ch, "Mail:\r\n  Read all mail: %d. Read mail for free: %d. Write mail for free: %d.\r\n",
                sysdata.read_all_mail, sysdata.read_mail_free, sysdata.write_mail_free );
      Echo(ch, "  Take all mail: %d.\r\n",
                sysdata.take_others_mail);
      Echo(ch, "Channels:\r\n Log: %d. Build: %d.\r\n",
                sysdata.log_level, sysdata.build_level);
      Echo(ch, "Building:\r\n  Prototype modification: %d.  Player msetting: %d.\r\n",
                sysdata.level_modify_proto, sysdata.level_mset_player );
      Echo(ch, "Other:\r\n  Force on players: %d.  ", sysdata.level_forcepc);
      Echo(ch, "Private room override: %d.\r\n", sysdata.level_override_private);
      Echo(ch, "  Penalty to regular stun chance: %d.  ", sysdata.stun_regular );
      Echo(ch, "Penalty to stun plr vs. plr: %d.\r\n", sysdata.stun_plr_vs_plr );
      Echo(ch, "  Percent damage plr vs. plr: %3d.  ", sysdata.dam_plr_vs_plr );
      Echo(ch, "Percent damage plr vs. mob: %d.\r\n", sysdata.dam_plr_vs_mob );
      Echo(ch, "  Percent damage mob vs. plr: %3d.  ", sysdata.dam_mob_vs_plr );
      Echo(ch, "Percent damage mob vs. mob: %d.\r\n", sysdata.dam_mob_vs_mob );
      Echo(ch, "  Get object without take flag: %d.  ", sysdata.level_getobjnotake);
      Echo(ch, "Autosave frequency (minutes): %d.\r\n", sysdata.save_frequency );
      Echo(ch, "  Save flags: %s\r\n", FlagString( sysdata.save_flags, SaveFlags ) );
      Echo(ch, "Hunger and thirst: %s\r\n", sysdata.disable_hunger ? "Disabled" : "Enabled" );
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
      SaveSystemData(sysdata);
      return;
    }

  if( !StrCmp( arg, "disable_hunger" ) )
    {
      sysdata.disable_hunger = sysdata.disable_hunger ? false : true;
      Echo( ch, "Hunger and thirst now %s\r\n",
		 sysdata.disable_hunger ? "DISABLED" : "ENABLED" );
      return;
    }

  if (!StrCmp(arg, "saveflag"))
    {
      int x = GetSaveFlag( argument );

      if ( x == -1 )
        SendToCharacter( "Not a save flag.\r\n", ch );
      else
        {
          ToggleBit( sysdata.save_flags, 1 << x );
          SendToCharacter( "Ok.\r\n", ch );
        }
      return;
    }

  level = (short) atoi(argument);

  if (!StringPrefix( arg, "savefrequency" ) )
    {
      sysdata.save_frequency = level;
      SendToCharacter("Ok.\r\n", ch);
      return;
    }

  if (!StrCmp(arg, "stun"))
    {
      sysdata.stun_regular = level;
      SendToCharacter("Ok.\r\n", ch);
      return;
    }

  if (!StrCmp(arg, "stun_pvp"))
    {
      sysdata.stun_plr_vs_plr = level;
      SendToCharacter("Ok.\r\n", ch);
      return;
    }

  if (!StrCmp(arg, "dam_pvp"))
    {
      sysdata.dam_plr_vs_plr = level;
      SendToCharacter("Ok.\r\n", ch);
      return;
    }

  if (!StrCmp(arg, "get_notake"))
    {
      sysdata.level_getobjnotake = level;
      SendToCharacter("Ok.\r\n", ch);
      return;
    }

  if (!StrCmp(arg, "dam_pvm"))
    {
      sysdata.dam_plr_vs_mob = level;
      SendToCharacter("Ok.\r\n", ch);
      return;
    }

  if (!StrCmp(arg, "dam_mvp"))
    {
      sysdata.dam_mob_vs_plr = level;
      SendToCharacter("Ok.\r\n", ch);
      return;
    }

  if (!StrCmp(arg, "dam_mvm"))
    {
      sysdata.dam_mob_vs_mob = level;
      SendToCharacter("Ok.\r\n", ch);
      return;
    }

  if (level < 0 || level > MAX_LEVEL)
    {
      SendToCharacter("Invalid value for new control.\r\n", ch);
      return;
    }

  if (!StrCmp(arg, "read_all"))
    {
      sysdata.read_all_mail = level;
      SendToCharacter("Ok.\r\n", ch);
      return;
    }

  if (!StrCmp(arg, "read_free"))
    {
      sysdata.read_mail_free = level;
      SendToCharacter("Ok.\r\n", ch);
      return;
    }

  if (!StrCmp(arg, "write_free"))
    {
      sysdata.write_mail_free = level;
      SendToCharacter("Ok.\r\n", ch);
      return;
    }

  if (!StrCmp(arg, "take_all"))
    {
      sysdata.take_others_mail = level;
      SendToCharacter("Ok.\r\n", ch);
      return;
    }

  if (!StrCmp(arg, "log"))
    {
      sysdata.log_level = level;
      SendToCharacter("Ok.\r\n", ch);
      return;
    }

  if (!StrCmp(arg, "build"))
    {
      sysdata.build_level = level;
      SendToCharacter("Ok.\r\n", ch);
      return;
    }

  if (!StrCmp(arg, "proto_modify"))
    {
      sysdata.level_modify_proto = level;
      SendToCharacter("Ok.\r\n", ch);
      return;
    }

  if (!StrCmp(arg, "override_private"))
    {
      sysdata.level_override_private = level;
      SendToCharacter("Ok.\r\n", ch);
      return;
    }

  if (!StrCmp(arg, "forcepc"))
    {
      sysdata.level_forcepc = level;
      SendToCharacter("Ok.\r\n", ch);
      return;
    }

  if (!StrCmp(arg, "mset_player"))
    {
      sysdata.level_mset_player = level;
      SendToCharacter("Ok.\r\n", ch);
      return;
    }
  else
    {
      SendToCharacter("Invalid argument.\r\n", ch);
      return;
    }
}
