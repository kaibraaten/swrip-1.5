#include "mud.h"

void do_cset( Character *ch, char *argument )
{
  char arg[MAX_STRING_LENGTH];
  short level;

  SetCharacterColor( AT_IMMORT, ch );

  if ( IsNullOrEmpty( argument ) )
    {
      Echo(ch, "Mail:\r\n  Read all mail: %d. Read mail for free: %d. Write mail for free: %d.\r\n",
	   SysData.ReadAllMail, SysData.ReadMailFree, SysData.WriteMailFree );
      Echo(ch, "  Take all mail: %d.\r\n",
	   SysData.TakeOthersMail);
      Echo(ch, "Channels:\r\n Log: %d. Build: %d.\r\n",
	   SysData.LevelOfLogChannel, SysData.LevelOfBuildChannel );
      Echo(ch, "Building:\r\n  Prototype modification: %d.  Player msetting: %d.\r\n",
	   SysData.LevelToModifyProto, SysData.LevelToMsetPlayers );
      Echo(ch, "Other:\r\n  Force on players: %d.  ", SysData.LevelToForcePlayers);
      Echo(ch, "Private room override: %d.\r\n", SysData.LevelToOverridePrivateFlag);
      Echo(ch, "  Penalty to regular stun chance: %d.  ", SysData.StunRegular );
      Echo(ch, "Penalty to stun plr vs. plr: %d.\r\n", SysData.StunModPlrVsPlr );
      Echo(ch, "  Percent damage plr vs. plr: %3d.  ", SysData.DamagePlrVsPlr );
      Echo(ch, "Percent damage plr vs. mob: %d.\r\n", SysData.DamagePlrVsMob );
      Echo(ch, "  Percent damage mob vs. plr: %3d.  ", SysData.DamageMobVsPlr );
      Echo(ch, "Percent damage mob vs. mob: %d.\r\n", SysData.DamageMobVsMob );
      Echo(ch, "  Get object without take flag: %d.  ", SysData.LevelToGetObjectsWithoutTakeFlag);
      Echo(ch, "Autosave frequency (minutes): %d.\r\n", SysData.SaveFrequency );
      Echo(ch, "  Save flags: %s\r\n", FlagString( SysData.SaveFlags, SaveFlags ) );
      Echo(ch, "Hunger and thirst: %s\r\n", SysData.DisableHunger ? "Disabled" : "Enabled" );
      Echo(ch, "Can choose Jedi: %s\r\n", SysData.CanChooseJedi ? "Yes" : "No" );
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
      SaveSystemData(SysData);
      return;
    }

  if( !StrCmp( arg, "can_choose_jedi" ) )
    {
      SysData.CanChooseJedi = !SysData.CanChooseJedi;
      Echo( ch, "Player can%s choose Jedi at character generation.\r\n",
	    SysData.CanChooseJedi ? "" : " not" );
      return;
    }
  
  if( !StrCmp( arg, "disable_hunger" ) )
    {
      SysData.DisableHunger = !SysData.DisableHunger;
      Echo( ch, "Hunger and thirst now %s.\r\n",
	    SysData.DisableHunger ? "DISABLED" : "ENABLED" );
      return;
    }

  if (!StrCmp(arg, "saveflag"))
    {
      int x = GetSaveFlag( argument );

      if ( x == -1 )
        SendToCharacter( "Not a save flag.\r\n", ch );
      else
        {
          ToggleBit( SysData.SaveFlags, 1 << x );
          SendToCharacter( "Ok.\r\n", ch );
        }
      return;
    }

  level = (short) atoi(argument);

  if (!StringPrefix( arg, "savefrequency" ) )
    {
      SysData.SaveFrequency = level;
      SendToCharacter("Ok.\r\n", ch);
      return;
    }

  if (!StrCmp(arg, "stun"))
    {
      SysData.StunRegular = level;
      SendToCharacter("Ok.\r\n", ch);
      return;
    }

  if (!StrCmp(arg, "stun_pvp"))
    {
      SysData.StunModPlrVsPlr = level;
      SendToCharacter("Ok.\r\n", ch);
      return;
    }

  if (!StrCmp(arg, "dam_pvp"))
    {
      SysData.DamagePlrVsPlr = level;
      SendToCharacter("Ok.\r\n", ch);
      return;
    }

  if (!StrCmp(arg, "get_notake"))
    {
      SysData.LevelToGetObjectsWithoutTakeFlag = level;
      SendToCharacter("Ok.\r\n", ch);
      return;
    }

  if (!StrCmp(arg, "dam_pvm"))
    {
      SysData.DamagePlrVsMob = level;
      SendToCharacter("Ok.\r\n", ch);
      return;
    }

  if (!StrCmp(arg, "dam_mvp"))
    {
      SysData.DamageMobVsPlr = level;
      SendToCharacter("Ok.\r\n", ch);
      return;
    }

  if (!StrCmp(arg, "dam_mvm"))
    {
      SysData.DamageMobVsMob = level;
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
      SysData.ReadAllMail = level;
      SendToCharacter("Ok.\r\n", ch);
      return;
    }

  if (!StrCmp(arg, "read_free"))
    {
      SysData.ReadMailFree = level;
      SendToCharacter("Ok.\r\n", ch);
      return;
    }

  if (!StrCmp(arg, "write_free"))
    {
      SysData.WriteMailFree = level;
      SendToCharacter("Ok.\r\n", ch);
      return;
    }

  if (!StrCmp(arg, "take_all"))
    {
      SysData.TakeOthersMail = level;
      SendToCharacter("Ok.\r\n", ch);
      return;
    }

  if (!StrCmp(arg, "log"))
    {
      SysData.LevelOfLogChannel = level;
      SendToCharacter("Ok.\r\n", ch);
      return;
    }

  if (!StrCmp(arg, "build"))
    {
      SysData.LevelOfBuildChannel = level;
      SendToCharacter("Ok.\r\n", ch);
      return;
    }

  if (!StrCmp(arg, "proto_modify"))
    {
      SysData.LevelToModifyProto = level;
      SendToCharacter("Ok.\r\n", ch);
      return;
    }

  if (!StrCmp(arg, "override_private"))
    {
      SysData.LevelToOverridePrivateFlag = level;
      SendToCharacter("Ok.\r\n", ch);
      return;
    }

  if (!StrCmp(arg, "forcepc"))
    {
      SysData.LevelToForcePlayers = level;
      SendToCharacter("Ok.\r\n", ch);
      return;
    }

  if (!StrCmp(arg, "mset_player"))
    {
      SysData.LevelToMsetPlayers = level;
      SendToCharacter("Ok.\r\n", ch);
      return;
    }
  else
    {
      SendToCharacter("Invalid argument.\r\n", ch);
      return;
    }
}
