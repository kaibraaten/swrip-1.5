#include "mud.h"

void do_cset( Character *ch, char *argument )
{
  char arg[MAX_STRING_LENGTH];
  short level;

  SetCharacterColor( AT_IMMORT, ch );

  if ( IsNullOrEmpty( argument ) )
    {
      Echo(ch, "Mail:\r\n  Read all mail: %d. Read mail for free: %d. Write mail for free: %d.\r\n",
	   sysdata.ReadAllMail, sysdata.ReadMailFree, sysdata.WriteMailFree );
      Echo(ch, "  Take all mail: %d.\r\n",
	   sysdata.TakeOthersMail);
      Echo(ch, "Channels:\r\n Log: %d. Build: %d.\r\n",
	   sysdata.LevelOfLogChannel, sysdata.LevelOfBuildChannel );
      Echo(ch, "Building:\r\n  Prototype modification: %d.  Player msetting: %d.\r\n",
	   sysdata.LevelToModifyProto, sysdata.LevelToMsetPlayers );
      Echo(ch, "Other:\r\n  Force on players: %d.  ", sysdata.LevelToForcePlayers);
      Echo(ch, "Private room override: %d.\r\n", sysdata.LevelToOverridePrivateFlag);
      Echo(ch, "  Penalty to regular stun chance: %d.  ", sysdata.StunRegular );
      Echo(ch, "Penalty to stun plr vs. plr: %d.\r\n", sysdata.StunModPlrVsPlr );
      Echo(ch, "  Percent damage plr vs. plr: %3d.  ", sysdata.DamagePlrVsPlr );
      Echo(ch, "Percent damage plr vs. mob: %d.\r\n", sysdata.DamagePlrVsMob );
      Echo(ch, "  Percent damage mob vs. plr: %3d.  ", sysdata.DamageMobVsPlr );
      Echo(ch, "Percent damage mob vs. mob: %d.\r\n", sysdata.DamageMobVsMob );
      Echo(ch, "  Get object without take flag: %d.  ", sysdata.LevelToGetObjectsWithoutTakeFlag);
      Echo(ch, "Autosave frequency (minutes): %d.\r\n", sysdata.SaveFrequency );
      Echo(ch, "  Save flags: %s\r\n", FlagString( sysdata.SaveFlags, SaveFlags ) );
      Echo(ch, "Hunger and thirst: %s\r\n", sysdata.DisableHunger ? "Disabled" : "Enabled" );
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
      sysdata.DisableHunger = !sysdata.DisableHunger;
      Echo( ch, "Hunger and thirst now %s\r\n",
	    sysdata.DisableHunger ? "DISABLED" : "ENABLED" );
      return;
    }

  if (!StrCmp(arg, "saveflag"))
    {
      int x = GetSaveFlag( argument );

      if ( x == -1 )
        SendToCharacter( "Not a save flag.\r\n", ch );
      else
        {
          ToggleBit( sysdata.SaveFlags, 1 << x );
          SendToCharacter( "Ok.\r\n", ch );
        }
      return;
    }

  level = (short) atoi(argument);

  if (!StringPrefix( arg, "savefrequency" ) )
    {
      sysdata.SaveFrequency = level;
      SendToCharacter("Ok.\r\n", ch);
      return;
    }

  if (!StrCmp(arg, "stun"))
    {
      sysdata.StunRegular = level;
      SendToCharacter("Ok.\r\n", ch);
      return;
    }

  if (!StrCmp(arg, "stun_pvp"))
    {
      sysdata.StunModPlrVsPlr = level;
      SendToCharacter("Ok.\r\n", ch);
      return;
    }

  if (!StrCmp(arg, "dam_pvp"))
    {
      sysdata.DamagePlrVsPlr = level;
      SendToCharacter("Ok.\r\n", ch);
      return;
    }

  if (!StrCmp(arg, "get_notake"))
    {
      sysdata.LevelToGetObjectsWithoutTakeFlag = level;
      SendToCharacter("Ok.\r\n", ch);
      return;
    }

  if (!StrCmp(arg, "dam_pvm"))
    {
      sysdata.DamagePlrVsMob = level;
      SendToCharacter("Ok.\r\n", ch);
      return;
    }

  if (!StrCmp(arg, "dam_mvp"))
    {
      sysdata.DamageMobVsPlr = level;
      SendToCharacter("Ok.\r\n", ch);
      return;
    }

  if (!StrCmp(arg, "dam_mvm"))
    {
      sysdata.DamageMobVsMob = level;
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
      sysdata.ReadAllMail = level;
      SendToCharacter("Ok.\r\n", ch);
      return;
    }

  if (!StrCmp(arg, "read_free"))
    {
      sysdata.ReadMailFree = level;
      SendToCharacter("Ok.\r\n", ch);
      return;
    }

  if (!StrCmp(arg, "write_free"))
    {
      sysdata.WriteMailFree = level;
      SendToCharacter("Ok.\r\n", ch);
      return;
    }

  if (!StrCmp(arg, "take_all"))
    {
      sysdata.TakeOthersMail = level;
      SendToCharacter("Ok.\r\n", ch);
      return;
    }

  if (!StrCmp(arg, "log"))
    {
      sysdata.LevelOfLogChannel = level;
      SendToCharacter("Ok.\r\n", ch);
      return;
    }

  if (!StrCmp(arg, "build"))
    {
      sysdata.LevelOfBuildChannel = level;
      SendToCharacter("Ok.\r\n", ch);
      return;
    }

  if (!StrCmp(arg, "proto_modify"))
    {
      sysdata.LevelToModifyProto = level;
      SendToCharacter("Ok.\r\n", ch);
      return;
    }

  if (!StrCmp(arg, "override_private"))
    {
      sysdata.LevelToOverridePrivateFlag = level;
      SendToCharacter("Ok.\r\n", ch);
      return;
    }

  if (!StrCmp(arg, "forcepc"))
    {
      sysdata.LevelToForcePlayers = level;
      SendToCharacter("Ok.\r\n", ch);
      return;
    }

  if (!StrCmp(arg, "mset_player"))
    {
      sysdata.LevelToMsetPlayers = level;
      SendToCharacter("Ok.\r\n", ch);
      return;
    }
  else
    {
      SendToCharacter("Invalid argument.\r\n", ch);
      return;
    }
}
