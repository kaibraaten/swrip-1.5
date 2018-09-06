#include "mud.hpp"
#include "character.hpp"
#include "systemdata.hpp"

void do_cset( Character *ch, std::string argument )
{
  std::string arg;
  short level = 0;

  SetCharacterColor( AT_IMMORT, ch );

  if ( argument.empty() )
    {
      ch->Echo( "Mail:\r\n  Read all mail: %d. Read mail for free: %d. Write mail for free: %d.\r\n",
	   SysData.ReadAllMail, SysData.ReadMailFree, SysData.WriteMailFree );
      ch->Echo( "  Take all mail: %d.\r\n",
                SysData.TakeOthersMail);
      ch->Echo( "Channels:\r\n Log: %d. Build: %d.\r\n",
	   SysData.LevelOfLogChannel, SysData.LevelOfBuildChannel );
      ch->Echo( "Building:\r\n  Prototype modification: %d.  Player msetting: %d.\r\n",
	   SysData.LevelToModifyProto, SysData.LevelToMsetPlayers );
      ch->Echo( "Other:\r\n  Force on players: %d.  ", SysData.LevelToForcePlayers);
      ch->Echo( "Private room override: %d.\r\n", SysData.LevelToOverridePrivateFlag);
      ch->Echo( "  Penalty to regular stun chance: %d.  ", SysData.StunRegular );
      ch->Echo( "Penalty to stun plr vs. plr: %d.\r\n", SysData.StunModPlrVsPlr );
      ch->Echo( "  Percent damage plr vs. plr: %3d.  ", SysData.DamagePlrVsPlr );
      ch->Echo( "Percent damage plr vs. mob: %d.\r\n", SysData.DamagePlrVsMob );
      ch->Echo( "  Percent damage mob vs. plr: %3d.  ", SysData.DamageMobVsPlr );
      ch->Echo( "Percent damage mob vs. mob: %d.\r\n", SysData.DamageMobVsMob );
      ch->Echo( "  Get object without take flag: %d.  ", SysData.LevelToGetObjectsWithoutTakeFlag);
      ch->Echo( "Autosave frequency (minutes): %d.\r\n", SysData.SaveFrequency );
      ch->Echo( "  Save flags: %s\r\n", FlagString( SysData.SaveFlags, SaveFlags ).c_str() );
      ch->Echo( "Hunger and thirst: %s\r\n", SysData.DisableHunger ? "Disabled" : "Enabled" );
      ch->Echo( "Can choose Jedi: %s\r\n", SysData.CanChooseJedi ? "Yes" : "No" );
      ch->Echo( "Death is permanent: %s\r\n", SysData.PermaDeath ? "Yes" : "No" );
      ch->Echo( "Extended race selection: %s\r\n", SysData.ExtendedRaceSelection ? "Yes" : "No" );
      ch->Echo( "Multiplaying allowed: %s\r\n", SysData.AllowMultiplaying ? "Yes" : "No" );
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
      SysData.Save();
      return;
    }

  if( !StrCmp( arg, "permadeath" ) )
    {
      SysData.PermaDeath = !SysData.PermaDeath;
      ch->Echo( "Permadeath is %s.\r\n",
                SysData.PermaDeath ? "ENABLED" : "DISABLED" );
      return;
    }
  
  if( !StrCmp( arg, "can_choose_jedi" ) )
    {
      SysData.CanChooseJedi = !SysData.CanChooseJedi;
      ch->Echo( "Player can%s choose Jedi at character generation.\r\n",
                SysData.CanChooseJedi ? "" : " not" );
      return;
    }
  
  if( !StrCmp( arg, "disable_hunger" ) )
    {
      SysData.DisableHunger = !SysData.DisableHunger;
      ch->Echo( "Hunger and thirst now %s.\r\n",
                SysData.DisableHunger ? "DISABLED" : "ENABLED" );
      return;
    }

  if( !StrCmp( arg, "extended_race_selection" ) )
    {
      SysData.ExtendedRaceSelection = !SysData.ExtendedRaceSelection;
      ch->Echo( "Extended race selection %s.\r\n",
                SysData.ExtendedRaceSelection ? "ENABLED" : "DISABLED" );
      return;
    }

  if( !StrCmp( arg, "allow_multiplaying" ) )
    {
      SysData.AllowMultiplaying = !SysData.AllowMultiplaying;
      ch->Echo( "Multiplaying %s.\r\n",
                SysData.AllowMultiplaying ? "ENABLED" : "DISABLED" );
      return;
    }
  
  if (!StrCmp(arg, "saveflag"))
    {
      int x = GetSaveFlag( argument );

      if ( x == -1 )
        {
          ch->Echo( "Not a save flag.\r\n" );
        }
      else
        {
          ToggleBit( SysData.SaveFlags, 1 << x );
          ch->Echo( "Ok.\r\n" );
        }
      
      return;
    }

  level = (short) std::stoi(argument);

  if (!StringPrefix( arg, "savefrequency" ) )
    {
      SysData.SaveFrequency = level;
      ch->Echo("Ok.\r\n");
      return;
    }

  if (!StrCmp(arg, "stun"))
    {
      SysData.StunRegular = level;
      ch->Echo("Ok.\r\n");
      return;
    }

  if (!StrCmp(arg, "stun_pvp"))
    {
      SysData.StunModPlrVsPlr = level;
      ch->Echo("Ok.\r\n");
      return;
    }

  if (!StrCmp(arg, "dam_pvp"))
    {
      SysData.DamagePlrVsPlr = level;
      ch->Echo("Ok.\r\n");
      return;
    }

  if (!StrCmp(arg, "get_notake"))
    {
      SysData.LevelToGetObjectsWithoutTakeFlag = level;
      ch->Echo("Ok.\r\n");
      return;
    }

  if (!StrCmp(arg, "dam_pvm"))
    {
      SysData.DamagePlrVsMob = level;
      ch->Echo("Ok.\r\n");
      return;
    }

  if (!StrCmp(arg, "dam_mvp"))
    {
      SysData.DamageMobVsPlr = level;
      ch->Echo("Ok.\r\n");
      return;
    }

  if (!StrCmp(arg, "dam_mvm"))
    {
      SysData.DamageMobVsMob = level;
      ch->Echo("Ok.\r\n");
      return;
    }

  if (level < 0 || level > MAX_LEVEL)
    {
      ch->Echo("Invalid value for new control.\r\n");
      return;
    }

  if (!StrCmp(arg, "read_all"))
    {
      SysData.ReadAllMail = level;
      ch->Echo("Ok.\r\n");
      return;
    }

  if (!StrCmp(arg, "read_free"))
    {
      SysData.ReadMailFree = level;
      ch->Echo("Ok.\r\n");
      return;
    }

  if (!StrCmp(arg, "write_free"))
    {
      SysData.WriteMailFree = level;
      ch->Echo("Ok.\r\n");
      return;
    }

  if (!StrCmp(arg, "take_all"))
    {
      SysData.TakeOthersMail = level;
      ch->Echo("Ok.\r\n");
      return;
    }

  if (!StrCmp(arg, "log"))
    {
      SysData.LevelOfLogChannel = level;
      ch->Echo("Ok.\r\n");
      return;
    }

  if (!StrCmp(arg, "build"))
    {
      SysData.LevelOfBuildChannel = level;
      ch->Echo("Ok.\r\n");
      return;
    }

  if (!StrCmp(arg, "proto_modify"))
    {
      SysData.LevelToModifyProto = level;
      ch->Echo("Ok.\r\n");
      return;
    }

  if (!StrCmp(arg, "override_private"))
    {
      SysData.LevelToOverridePrivateFlag = level;
      ch->Echo("Ok.\r\n");
      return;
    }

  if (!StrCmp(arg, "forcepc"))
    {
      SysData.LevelToForcePlayers = level;
      ch->Echo("Ok.\r\n");
      return;
    }

  if (!StrCmp(arg, "mset_player"))
    {
      SysData.LevelToMsetPlayers = level;
      ch->Echo("Ok.\r\n");
      return;
    }
  else
    {
      ch->Echo("Invalid argument.\r\n");
      return;
    }
}
