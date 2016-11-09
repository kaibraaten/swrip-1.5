#include "mud.hpp"
#include "clan.hpp"
#include "character.hpp"

static bool IsGuildNameAcceptable( const char *name );

void do_makeguild( Character *ch, std::string argument )
{
  char faction[MAX_INPUT_LENGTH];
  Clan *guild = NULL;
  Clan *mainClan = NULL;
  ClanMemberList *memberList = NULL;
  argument = OneArgument( argument, faction );
  
  if ( IsNullOrEmpty( faction ) || IsNullOrEmpty( argument ) )
    {
      Echo( ch, "Usage: startguild <imperial|rebel|independent> <guild name>\r\n" );
      return;
    }

  if( IsClanned( ch ) )
    {
      Echo( ch, "&RYou're already in a guild.&d\r\n" );
      return;
    }

  if( !IsGuildNameAcceptable( argument ) )
    {
      Echo( ch, "&RThat name is not accepted.&d\r\n" );
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
      Echo( ch, "&RChoose faction for your guild: Imperial, Rebel or Independent.&d\r\n" );
      return;
    }

  if( !mainClan )
    {
      Echo( ch, "&RSomething when wrong. Contact the administration.&d\r\n" );
      Bug( "%d: Main clan %s does not exist.", __FUNCTION__,
	   !StrCmp( faction, "imperial" ) ? BADGUY_CLAN
	   : !StrCmp( faction, "rebel" ) ? GOODGUY_CLAN : INDEPENDENT_CLAN );
      return;
    }

  if( ch->Gold < GUILD_PRICE )
    {
      Echo( ch, "&RStarting a guild costs %d credits. You don't have the funds.&d\r\n",
	    GUILD_PRICE );
      return;
    }
  else
    {
      ch->Gold -= GUILD_PRICE;
    }
  
  guild = AllocateClan();
  AddClan( guild );

  guild->Name               = CopyString( argument );
  guild->Description        = CopyString( "" );
  guild->Leadership.Leader  = CopyString( ch->Name );
  guild->Leadership.Number1 = CopyString( "" );
  guild->Leadership.Number2 = CopyString( "" );
  guild->tmpstr             = CopyString( mainClan->Name );
  guild->FoundationDate = current_time;
  
  AllocateMemory( memberList, ClanMemberList, 1 );
  memberList->Name = CopyString( guild->Name );
  LINK( memberList, FirstClanMemberList, LastClanMemberList, Next, Previous );

  AssignGuildToMainclan( guild, mainClan );
  SaveClan( guild );
  ch->PCData->ClanInfo.Clan = guild;
  ch->PCData->ClanInfo.ClanName = CopyString( guild->Name );
  UpdateClanMember( ch );

  Echo( ch, "&GCongratulations, your new guild %s has been successfully created!\r\n",
	guild->Name );
  Echo( ch, "See HELP GUILD to get started.&d\r\n" );
}

static bool IsGuildNameAcceptable( const char *name )
{
  return !GetClan( name )
    && StringInfix( "Jedi Order", name );
}
