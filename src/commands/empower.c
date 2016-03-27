#include "mud.h"
#include "character.h"
#include "clan.h"

void do_empower( Character *ch , char *argument )
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

  clan = ch->pcdata->ClanInfo.Clan;

  if ( ( ch->pcdata->bestowments
        && IsName("empower", ch->pcdata->bestowments))
       || !StrCmp( ch->name, clan->Leadership.Leader  ) )
    ;
  else
    {
      SendToCharacter( "You clan hasn't seen fit to bestow that ability to you!\r\n", ch );
      return;
    }

  argument = OneArgument( argument, arg );
  argument = OneArgument( argument, arg2 );

  if ( arg[0] == '\0' )
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

  if ( victim->pcdata->ClanInfo.Clan != ch->pcdata->ClanInfo.Clan )
    {
      SendToCharacter( "This player does not belong to your clan!\r\n", ch );
      return;
    }

  if (!victim->pcdata->bestowments)
    victim->pcdata->bestowments = CopyString("");

  if ( arg2[0] == '\0' || !StrCmp( arg2, "list" ) )
    {
      Echo( ch, "Current bestowed commands on %s: %s.\r\n",
                 victim->name, victim->pcdata->bestowments );
      Echo( ch, "Current salary on %s: %d.\r\n",
                 victim->name, victim->pcdata->ClanInfo.Salary );

      return;
    }

  if ( (victim->pcdata && victim->pcdata->bestowments
        &&    IsName(arg2, victim->pcdata->bestowments)) )
    {
      SendToCharacter( "That player already has that power.\r\n", ch );
      return;
    }


  if ( !StrCmp( arg2, "none" ) )
    {
      FreeMemory( victim->pcdata->bestowments );
      victim->pcdata->bestowments = CopyString("");
      Echo( ch, "Bestowments removed from %s.\r\n", victim->name );
      Echo( victim, "%s has removed your bestowed clan abilities.\r\n", ch->name );
      return;
    }
  else if ( !StrCmp( arg2, "pilot" ) )
    {
      sprintf( buf, "%s %s", victim->pcdata->bestowments, arg2 );
      FreeMemory( victim->pcdata->bestowments );
      victim->pcdata->bestowments = CopyString( buf );
      Echo( victim, "%s has given you permission to fly clan ships.\r\n",
                 ch->name );
      SendToCharacter( "Ok, they now have the ability to fly clan ships.\r\n", ch );
    }
  else if ( !StrCmp( arg2, "withdraw" ) )
    {
      sprintf( buf, "%s %s", victim->pcdata->bestowments, arg2 );
      FreeMemory( victim->pcdata->bestowments );
      victim->pcdata->bestowments = CopyString( buf );
      Echo( victim, "%s has given you permission to withdraw clan funds.\r\n",
                 ch->name );
      SendToCharacter( "Ok, they now have the ablitity to withdraw clan funds.\r\n", ch );
    }
  else if ( !StrCmp( arg2, "clanbuyship" ) )
    {
      sprintf( buf, "%s %s", victim->pcdata->bestowments, arg2 );
      FreeMemory( victim->pcdata->bestowments );
      victim->pcdata->bestowments = CopyString( buf );
      Echo( victim, "%s has given you permission to buy clan ships.\r\n",
                 ch->name );
      SendToCharacter( "Ok, they now have the ablitity to use clanbuyship.\r\n", ch );
    }
  else if ( !StrCmp( arg2, "induct" ) )
    {
      sprintf( buf, "%s %s", victim->pcdata->bestowments, arg2 );
      FreeMemory( victim->pcdata->bestowments );
      victim->pcdata->bestowments = CopyString( buf );
      Echo( victim, "%s has given you permission to induct new members.\r\n",
                 ch->name );
      SendToCharacter( "Ok, they now have the ablitity to induct new members.\r\n", ch );
    }
  else if ( !StrCmp( arg2, "empower" ) )
    {
      sprintf( buf, "%s %s", victim->pcdata->bestowments, arg2 );
      FreeMemory( victim->pcdata->bestowments );
      victim->pcdata->bestowments = CopyString( buf );
      Echo( victim, "%s has given you permission to empower members.\r\n",
                 ch->name );
      SendToCharacter( "Ok, they now have the ablitity to empower members.\r\n", ch );
    }
  else if ( !StrCmp( arg2, "salary" ) )
    {
      sprintf( buf, "%s %s", victim->pcdata->bestowments, arg2 );
      FreeMemory( victim->pcdata->bestowments );
      victim->pcdata->bestowments = CopyString( buf );
      Echo( victim, "%s has given you permission to assign salaries.\r\n",
                 ch->name );
      SendToCharacter( "Ok, they now have the ablitity to assign salaries.\r\n", ch );
    }
  else if ( !StrCmp( arg2, "roster" ) )
    {
      sprintf( buf, "%s %s", victim->pcdata->bestowments, arg2 );
      FreeMemory( victim->pcdata->bestowments );
      victim->pcdata->bestowments = CopyString( buf );
      Echo( victim, "%s has given you permission to access the roster.\r\n",
                 ch->name );
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
