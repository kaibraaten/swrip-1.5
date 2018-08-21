#include "mud.hpp"
#include "clan.hpp"
#include "character.hpp"
#include "pcdata.hpp"
#include "log.hpp"

static bool IsGuildNameAcceptable( const std::string &name );

void do_makeguild( Character *ch, char *argument )
{
  char faction[MAX_INPUT_LENGTH];
  Clan *guild = NULL;
  Clan *mainClan = NULL;
  argument = OneArgument( argument, faction );
  
  if ( IsNullOrEmpty( faction ) || IsNullOrEmpty( argument ) )
    {
      ch->Echo("Usage: startguild <imperial|rebel|independent> <guild name>\r\n" );
      return;
    }

  if( IsClanned( ch ) )
    {
      ch->Echo("&RYou're already in a guild.&d\r\n" );
      return;
    }

  if( !IsGuildNameAcceptable( argument ) )
    {
      ch->Echo("&RThat name is not accepted.&d\r\n" );
      return;
    }
  
  if( !StrCmp( faction, "imperial" ) )
    {
      mainClan = GetClan( BADGUY_CLAN );
    }
  else if( !StrCmp( faction, "rebel" ))
    {
      mainClan = GetClan( GOODGUY_CLAN );
    }
  else if( !StrCmp( faction, "independent" ) )
    {
      mainClan = GetClan( INDEPENDENT_CLAN );
    }
  else
    {
      ch->Echo("&RChoose faction for your guild: Imperial, Rebel or Independent.&d\r\n" );
      return;
    }

  if( !mainClan )
    {
      ch->Echo("&RSomething when wrong. Contact the administration.&d\r\n" );
      Log->Bug( "%d: Main clan %s does not exist.", __FUNCTION__,
                !StrCmp( faction, "imperial" ) ? BADGUY_CLAN
                : !StrCmp( faction, "rebel" ) ? GOODGUY_CLAN : INDEPENDENT_CLAN );
      return;
    }

  if( ch->Gold < GUILD_PRICE )
    {
      ch->Echo("&RStarting a guild costs %d credits. You don't have the funds.&d\r\n",
	    GUILD_PRICE );
      return;
    }
  else
    {
      ch->Gold -= GUILD_PRICE;
    }
  
  guild = AllocateClan();
  Clans->Add(guild);

  guild->Name               = CopyString( argument );
  guild->Description        = CopyString( "" );
  guild->Leadership.Leader  = CopyString( ch->Name );
  guild->Leadership.Number1 = CopyString( "" );
  guild->Leadership.Number2 = CopyString( "" );
  guild->tmpstr             = CopyString( mainClan->Name );
  guild->FoundationDate = current_time;

  AssignGuildToMainclan( guild, mainClan );
  Clans->Save( guild );
  ch->PCData->ClanInfo.Clan = guild;
  ch->PCData->ClanInfo.ClanName = CopyString( guild->Name );
  UpdateClanMember( ch );

  ch->Echo("&GCongratulations, your new guild %s has been successfully created!\r\n",
           guild->Name );
  ch->Echo("See HELP GUILD to get started.&d\r\n" );
}

static bool IsGuildNameAcceptable( const std::string &name )
{
  bool nameIsAvailable = GetClan(name.c_str()) == nullptr;

  return nameIsAvailable
    && StringInfix( "Jedi Order", name ) != 0;
}


