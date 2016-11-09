#include "mud.hpp"
#include "character.hpp"
#include "clan.hpp"

void do_empower( Character *ch , std::string argument )
{
  char arg[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  Character *victim;
  Clan *clan;
  char buf[MAX_STRING_LENGTH];

  if ( IsNpc( ch ) )
    {
      SendToCharacter( "Huh?\r\n", ch );
      return;
    }

  clan = ch->PCData->ClanInfo.Clan;

  if ( ( ch->PCData->Bestowments
        && IsName("empower", ch->PCData->Bestowments))
       || !StrCmp( ch->Name, clan->Leadership.Leader  ) )
    ;
  else
    {
      SendToCharacter( "You clan hasn't seen fit to bestow that ability to you!\r\n", ch );
      return;
    }

  argument = OneArgument( argument, arg );
  argument = OneArgument( argument, arg2 );

  if ( IsNullOrEmpty( arg ) )
    {
      SendToCharacter( "Empower whom to do what?\r\n", ch );
      return;
    }

  if ( ( victim = GetCharacterAnywhere( ch, arg ) ) == NULL )
    {
      SendToCharacter( "That player is not here.\r\n", ch);
      return;
    }

  if ( IsNpc(victim) )
    {
      SendToCharacter( "Not on NPC's.\r\n", ch );
      return;
    }

  if ( victim == ch )
    {
      SendToCharacter( "Nice try.\r\n", ch );
      return;
    }

  if ( victim->PCData->ClanInfo.Clan != ch->PCData->ClanInfo.Clan )
    {
      SendToCharacter( "This player does not belong to your clan!\r\n", ch );
      return;
    }

  if (!victim->PCData->Bestowments)
    victim->PCData->Bestowments = CopyString("");

  if ( IsNullOrEmpty( arg2 ) || !StrCmp( arg2, "list" ) )
    {
      Echo( ch, "Current bestowed commands on %s: %s.\r\n",
                 victim->Name, victim->PCData->Bestowments );
      Echo( ch, "Current salary on %s: %d.\r\n",
                 victim->Name, victim->PCData->ClanInfo.Salary );

      return;
    }

  if ( (victim->PCData && victim->PCData->Bestowments
        &&    IsName(arg2, victim->PCData->Bestowments)) )
    {
      SendToCharacter( "That player already has that power.\r\n", ch );
      return;
    }


  if ( !StrCmp( arg2, "none" ) )
    {
      FreeMemory( victim->PCData->Bestowments );
      victim->PCData->Bestowments = CopyString("");
      Echo( ch, "Bestowments removed from %s.\r\n", victim->Name );
      Echo( victim, "%s has removed your bestowed clan abilities.\r\n", ch->Name );
      return;
    }
  else if ( !StrCmp( arg2, "pilot" ) )
    {
      sprintf( buf, "%s %s", victim->PCData->Bestowments, arg2 );
      FreeMemory( victim->PCData->Bestowments );
      victim->PCData->Bestowments = CopyString( buf );
      Echo( victim, "%s has given you permission to fly clan ships.\r\n",
                 ch->Name );
      SendToCharacter( "Ok, they now have the ability to fly clan ships.\r\n", ch );
    }
  else if ( !StrCmp( arg2, "withdraw" ) )
    {
      sprintf( buf, "%s %s", victim->PCData->Bestowments, arg2 );
      FreeMemory( victim->PCData->Bestowments );
      victim->PCData->Bestowments = CopyString( buf );
      Echo( victim, "%s has given you permission to withdraw clan funds.\r\n",
                 ch->Name );
      SendToCharacter( "Ok, they now have the ablitity to withdraw clan funds.\r\n", ch );
    }
  else if ( !StrCmp( arg2, "clanbuyship" ) )
    {
      sprintf( buf, "%s %s", victim->PCData->Bestowments, arg2 );
      FreeMemory( victim->PCData->Bestowments );
      victim->PCData->Bestowments = CopyString( buf );
      Echo( victim, "%s has given you permission to buy clan ships.\r\n",
                 ch->Name );
      SendToCharacter( "Ok, they now have the ablitity to use clanbuyship.\r\n", ch );
    }
  else if ( !StrCmp( arg2, "induct" ) )
    {
      sprintf( buf, "%s %s", victim->PCData->Bestowments, arg2 );
      FreeMemory( victim->PCData->Bestowments );
      victim->PCData->Bestowments = CopyString( buf );
      Echo( victim, "%s has given you permission to induct new members.\r\n",
                 ch->Name );
      SendToCharacter( "Ok, they now have the ablitity to induct new members.\r\n", ch );
    }
  else if ( !StrCmp( arg2, "empower" ) )
    {
      sprintf( buf, "%s %s", victim->PCData->Bestowments, arg2 );
      FreeMemory( victim->PCData->Bestowments );
      victim->PCData->Bestowments = CopyString( buf );
      Echo( victim, "%s has given you permission to empower members.\r\n",
                 ch->Name );
      SendToCharacter( "Ok, they now have the ablitity to empower members.\r\n", ch );
    }
  else if ( !StrCmp( arg2, "salary" ) )
    {
      sprintf( buf, "%s %s", victim->PCData->Bestowments, arg2 );
      FreeMemory( victim->PCData->Bestowments );
      victim->PCData->Bestowments = CopyString( buf );
      Echo( victim, "%s has given you permission to assign salaries.\r\n",
                 ch->Name );
      SendToCharacter( "Ok, they now have the ablitity to assign salaries.\r\n", ch );
    }
  else if ( !StrCmp( arg2, "roster" ) )
    {
      sprintf( buf, "%s %s", victim->PCData->Bestowments, arg2 );
      FreeMemory( victim->PCData->Bestowments );
      victim->PCData->Bestowments = CopyString( buf );
      Echo( victim, "%s has given you permission to access the roster.\r\n",
                 ch->Name );
      SendToCharacter( "Ok, they now have the ablitity to access the roster.\r\n", ch );
    }
  else
    {
      SendToCharacter( "Currently you may empower members with only the following:\r\n", ch );
      SendToCharacter( "\r\npilot:       ability to fly clan ships\r\n", ch );
      SendToCharacter(     "withdraw:    ability to withdraw clan funds\r\n", ch );
      SendToCharacter(     "clanbuyship: ability to buy clan ships\r\n", ch );
      SendToCharacter(     "induct:      ability to induct new members\r\n", ch );
      SendToCharacter(     "salary:      ability to assign salaries\r\n", ch );
      SendToCharacter(     "roster:      ability to see the full clan roster\r\n", ch );
      SendToCharacter(     "none:        removes bestowed abilities\r\n", ch );
    }

  SaveCharacter( victim );      /* clan gets saved when pfile is saved */
}
