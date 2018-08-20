#include "character.hpp"
#include "mud.hpp"
#include "clan.hpp"
#include "ship.hpp"

struct UpdateOwnerNameData
{
  const char *OldName;
  const char *NewName;
};

static bool UpdateOwnerName(Ship *ship, void *userData);

void do_setclan( Character *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH] = { '\0' };
  char arg2[MAX_INPUT_LENGTH] = { '\0' };
  Clan *clan = NULL;

  if ( IsNpc( ch ) )
    {
      ch->Echo("Huh?\r\n");
      return;
    }

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  if ( IsNullOrEmpty( arg1 ) || IsNullOrEmpty( arg2 ) || IsNullOrEmpty( argument ) )
    {
      ch->Echo("Usage: setclan <clan> <field> <leader|number1|number2> <player>\r\n");
      ch->Echo("\r\nField being one of:\r\n");
      ch->Echo(" leader number1 number2 addguild enlist1 jail\r\n");
      ch->Echo(" enlist2 board storage funds\r\n");

      if ( GetTrustLevel( ch ) >= LEVEL_SUB_IMPLEM )
        {
          ch->Echo(" name desc\r\n");
        }

      return;
    }

  clan = GetClan( arg1 );

  if ( !clan )
    {
      ch->Echo("No such clan.\r\n");
      return;
    }

  if ( !StrCmp( arg2, "enlistroom1" ) )
    {
      clan->EnlistRoom1 = atoi( argument );
      ch->Echo("Done.\r\n");
      Clans->Save(clan);
      return;
    }

  if ( !StrCmp( arg2, "enlistroom2" ) )
    {
      clan->EnlistRoom2 = atoi( argument );
      ch->Echo("Done.\r\n");
      Clans->Save(clan);
      return;
    }

  if ( !StrCmp( arg2, "leader" ) )
    {
      FreeMemory( clan->Leadership.Leader );
      clan->Leadership.Leader = CopyString( argument );
      ch->Echo("Done.\r\n");
      Clans->Save(clan);
      return;
    }

  if ( !StrCmp( arg2, "addguild" ) )
    {
      Clan *guild = GetClan( argument );

      if ( !guild )
        {
          ch->Echo("Guild does't exist.\r\n");
          return;
        }

      if ( guild->Type == CLAN_GUILD || guild->MainClan )
        {
          ch->Echo("Guild is already part of another faction.\r\n");
          return;
        }

      if (!guild->Subclans().empty())
        {
          ch->Echo("Guild has guilds of its own that need removing first.\r\n");
          return;
        }

      AssignGuildToMainclan(clan, guild);

      Clans->Save(clan);
      Clans->Save(guild);
      return;
    }

  if ( !StrCmp( arg2, "number1" ) )
    {
      FreeMemory( clan->Leadership.Number1 );
      clan->Leadership.Number1 = CopyString( argument );
      ch->Echo("Done.\r\n");
      Clans->Save(clan);
      return;
    }

  if ( !StrCmp( arg2, "number2" ) )
    {
      FreeMemory( clan->Leadership.Number2 );
      clan->Leadership.Number2 = CopyString( argument );
      ch->Echo("Done.\r\n");
      Clans->Save(clan);
      return;
    }

  if ( !StrCmp( arg2, "board" ) )
    {
      clan->Board = atoi( argument );
      ch->Echo("Done.\r\n");
      Clans->Save(clan);
      return;
    }

  if ( !StrCmp( arg2, "funds" ) )
    {
      clan->Funds = atoi( argument );
      ch->Echo("Done.\r\n");
      Clans->Save(clan);
      return;
    }

  if ( !StrCmp( arg2, "storage" ) )
    {
      clan->Storeroom = atoi( argument );
      ch->Echo("Done.\r\n");
      Clans->Save(clan);
      return;
    }

  if ( !StrCmp( arg2, "jail" ) )
    {
      clan->Jail = atoi( argument );
      ch->Echo("Done.\r\n");
      Clans->Save(clan);
      return;
    }

  if ( GetTrustLevel( ch ) < LEVEL_SUB_IMPLEM )
    {
      do_setclan( ch, "" );
      return;
    }

  if ( !StrCmp( arg2, "name" ) )
    {
      ClanMemberList *memberList = GetMemberList( clan );
      char oldFilename[MAX_STRING_LENGTH] = { '\0' };
      struct UpdateOwnerNameData data;

      data.OldName = clan->Name;
      data.NewName = argument;

      if( GetClan( argument ) )
	{
   ch->Echo("There's already another guild with that name." );
	  return;
	}

      ForEachShip(UpdateOwnerName, &data);

      sprintf( oldFilename, "%s%s", CLAN_DIR, ConvertToLuaFilename( clan->Name ) );
      unlink( GetClanFilename( clan ) );

      FreeMemory( clan->Name );
      clan->Name = CopyString( argument );

      FreeMemory( memberList->Name );
      memberList->Name = CopyString( clan->Name );

      ch->Echo("Done.\r\n");
      Clans->Save(clan);
      return;
    }

  if ( !StrCmp( arg2, "desc" ) )
    {
      FreeMemory( clan->Description );
      clan->Description = CopyString( argument );
      ch->Echo("Done.\r\n");
      Clans->Save(clan);
      return;
    }

  do_setclan( ch, "" );
}

static bool UpdateOwnerName(Ship *ship, void *userData)
{
  struct UpdateOwnerNameData *data = (struct UpdateOwnerNameData*)userData;

  if( !StrCmp( ship->Owner, data->OldName ) )
    {
      FreeMemory( ship->Owner );
      ship->Owner = CopyString( data->NewName );
    }

  return true;
}

