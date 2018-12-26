#include "mud.hpp"
#include "character.hpp"
#include "clan.hpp"
#include "pcdata.hpp"
#include "repos/playerrepository.hpp"

void do_empower( Character *ch , std::string argument )
{
  std::string arg;
  std::string arg2;
  Character *victim = NULL;
  std::shared_ptr<Clan> clan;

  if ( IsNpc( ch ) )
    {
      ch->Echo( "Huh?\r\n" );
      return;
    }

  clan = ch->PCData->ClanInfo.Clan;

  if ( ( !ch->PCData->Bestowments.empty()
        && IsName("empower", ch->PCData->Bestowments))
       || !StrCmp( ch->Name, clan->Leadership.Leader  ) )
    ;
  else
    {
      ch->Echo( "You clan hasn't seen fit to bestow that ability to you!\r\n" );
      return;
    }

  argument = OneArgument( argument, arg );
  argument = OneArgument( argument, arg2 );

  if ( arg.empty() )
    {
      ch->Echo( "Empower whom to do what?\r\n" );
      return;
    }

  if ( ( victim = GetCharacterAnywhere( ch, arg ) ) == NULL )
    {
      ch->Echo( "That player is not here.\r\n" );
      return;
    }

  if ( IsNpc(victim) )
    {
      ch->Echo( "Not on NPC's.\r\n" );
      return;
    }

  if ( victim == ch )
    {
      ch->Echo( "Nice try.\r\n" );
      return;
    }

  if ( victim->PCData->ClanInfo.Clan != ch->PCData->ClanInfo.Clan )
    {
      ch->Echo( "This player does not belong to your clan!\r\n" );
      return;
    }

  if ( arg2.empty() || !StrCmp( arg2, "list" ) )
    {
      ch->Echo( "Current bestowed commands on %s: %s.\r\n",
                victim->Name.c_str(), victim->PCData->Bestowments.c_str() );
      ch->Echo( "Current salary on %s: %d.\r\n",
                victim->Name.c_str(), victim->PCData->ClanInfo.Salary );
      return;
    }

  if ( (victim->PCData && !victim->PCData->Bestowments.empty()
        && IsName(arg2, victim->PCData->Bestowments)) )
    {
      ch->Echo( "That player already has that power.\r\n" );
      return;
    }

  if ( !StrCmp( arg2, "none" ) )
    {
      victim->PCData->Bestowments.erase();
      ch->Echo( "Bestowments removed from %s.\r\n", victim->Name.c_str() );
      victim->Echo( "%s has removed your bestowed clan abilities.\r\n", ch->Name.c_str() );
      return;
    }
  else if ( !StrCmp( arg2, "pilot" ) )
    {
      victim->PCData->Bestowments += " " + arg2;
      victim->Echo( "%s has given you permission to fly clan ships.\r\n",
                    ch->Name.c_str() );
      ch->Echo( "Ok, they now have the ability to fly clan ships.\r\n" );
    }
  else if ( !StrCmp( arg2, "withdraw" ) )
    {
      victim->PCData->Bestowments += " " + arg2;
      victim->Echo( "%s has given you permission to withdraw clan funds.\r\n",
                    ch->Name.c_str() );
      ch->Echo( "Ok, they now have the ablitity to withdraw clan funds.\r\n" );
    }
  else if ( !StrCmp( arg2, "clanbuyship" ) )
    {
      victim->PCData->Bestowments += " " + arg2;
      victim->Echo( "%s has given you permission to buy clan ships.\r\n",
                    ch->Name.c_str() );
      ch->Echo( "Ok, they now have the ablitity to use clanbuyship.\r\n" );
    }
  else if ( !StrCmp( arg2, "induct" ) )
    {
      victim->PCData->Bestowments += " " + arg2;
      victim->Echo( "%s has given you permission to induct new members.\r\n",
                    ch->Name.c_str() );
      ch->Echo( "Ok, they now have the ablitity to induct new members.\r\n" );
    }
  else if ( !StrCmp( arg2, "empower" ) )
    {
      victim->PCData->Bestowments += " " + arg2;
      victim->Echo( "%s has given you permission to empower members.\r\n",
                    ch->Name.c_str() );
      ch->Echo( "Ok, they now have the ablitity to empower members.\r\n" );
    }
  else if ( !StrCmp( arg2, "salary" ) )
    {
      victim->PCData->Bestowments += " " + arg2;
      victim->Echo( "%s has given you permission to assign salaries.\r\n",
                    ch->Name.c_str() );
      ch->Echo( "Ok, they now have the ablitity to assign salaries.\r\n" );
    }
  else if ( !StrCmp( arg2, "roster" ) )
    {
      victim->PCData->Bestowments += " " + arg2;
      victim->Echo( "%s has given you permission to access the roster.\r\n",
                    ch->Name.c_str() );
      ch->Echo( "Ok, they now have the ablitity to access the roster.\r\n" );
    }
  else
    {
      ch->Echo( "Currently you may empower members with only the following:\r\n" );
      ch->Echo( "\r\npilot:       ability to fly clan ships\r\n" );
      ch->Echo(     "withdraw:    ability to withdraw clan funds\r\n" );
      ch->Echo(     "clanbuyship: ability to buy clan ships\r\n" );
      ch->Echo(     "induct:      ability to induct new members\r\n" );
      ch->Echo(     "salary:      ability to assign salaries\r\n" );
      ch->Echo(     "roster:      ability to see the full clan roster\r\n" );
      ch->Echo(     "none:        removes bestowed abilities\r\n" );
    }

  PlayerCharacters->Save( victim );      /* clan gets saved when pfile is saved */
}
