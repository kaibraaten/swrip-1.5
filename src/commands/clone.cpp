#include <string.h>
#include "mud.hpp"
#include "character.hpp"
#include "pcdata.hpp"

#define CLONEGOLD 1000

void do_clone( Character *ch, char *argument )
{
  long credits = 0, bank = 0;
  long played = 0, frc_experience = 0;
  char clanname[MAX_STRING_LENGTH] = { '\0' };
  char bestowments[MAX_STRING_LENGTH] = { '\0' };
  char oldbestowments[MAX_STRING_LENGTH] = { '\0' };
  int experience[MAX_ABILITY];
  int skill_level[MAX_ABILITY];
  int flags = 0, ability = 0;
  short frc = 0, change = 0, change2 = 0, frc_level = 0, low_frc = 0, mana = 0;
  Room *home = NULL;

  if ( IsNpc(ch) )
    {
      Echo( ch, "Yeah right!\r\n" );
      return;
    }

  if ( ch->InRoom->Vnum != ROOM_VNUM_CLONING_PAY_COUNTER )
    {
      Echo( ch, "You can't do that here!\r\n" );
      return;
    }

  if ( ch->PCData->Clones >= 3 && SysData.PermaDeath )
    {
      Echo( ch, "The medical droids tell you your genetical material is too far degraded.\r\n");
      return;
    }

  if ( ch->Gold < ch->TopLevel * 200 && SysData.PermaDeath )
    {
      Echo( ch, "You don't have enough credits... You need %d.\r\n" , ch->TopLevel*200 );
      return;
    }
  else
    {
      if( SysData.PermaDeath )
	{
	  ch->Gold -= ch->TopLevel*200;
	  Echo( ch, "You pay %d credits for cloning.\r\n" , ch->TopLevel*200 );
	}
      
      Echo( ch, "You are escorted into a small room.\r\n\r\n" );
    }

  if( SysData.PermaDeath )
    {
      CharacterFromRoom( ch );
      CharacterToRoom( ch, GetRoom( ROOM_VNUM_CLONING_CYLINDER ) );
      
      /* random force change on cloning */
      frc = ch->Stats.PermFrc;
      mana = ch->Mana;

      /* if character.hppas force, there is a chance of losing force
	 depending on the magnitude, the lesser force  the greater chance, as
	 well as a slight chance of gaining force, also depending on
	 the magnitude of the character's force */

      if ( ch->Ability.Main == FORCE_ABILITY )
	low_frc = 1;

      if(ch->Stats.PermFrc > 0)
	{
	  change = GetRandomNumberFromRange(-2, ch->Stats.PermFrc);
	  change = urange( -2 , change , 0 );
	  change2 = GetRandomNumberFromRange( -1000, ch->Stats.PermFrc );
	  change2 = urange(0, change2, 1);
	  ch->Stats.PermFrc = urange( low_frc, ch->Stats.PermFrc + change + change2, 20);
	}
      else
	{
	  /* a character with no force has a 1/100 chance of gaining it */

	  change = GetRandomNumberFromRange(-500, 2);
	  change = urange( 0, change, 2);
	  ch->Stats.PermFrc = urange( low_frc, ch->Stats.PermFrc + change, 20);
	}

      frc_level = GetAbilityLevel( ch, FORCE_ABILITY );
      frc_experience = GetAbilityXP( ch, FORCE_ABILITY );

      /* Droids and hunters dont get force. DV */

      if (ch->Ability.Main == HUNTING_ABILITY )
	ch->Stats.PermFrc = low_frc;

      if (ch->Race == RACE_DROID )
	ch->Stats.PermFrc = 0;

      if(frc > 0)
	{
	  if(ch->Stats.PermFrc > 0)
	    {
	      SetAbilityXP( ch, FORCE_ABILITY, 500 );
	      SetAbilityLevel( ch, FORCE_ABILITY, 2 );
	    }
	}
      else
	{
	  SetAbilityXP( ch, FORCE_ABILITY, 0 );
	  SetAbilityLevel( ch, FORCE_ABILITY, 1 );
	}

      ch->Mana = 100 + 100*ch->Stats.PermFrc;

      flags   = ch->Flags;
      RemoveBit( ch->Flags, PLR_KILLER );
      credits = ch->Gold;

      if(credits <= CLONEGOLD)
	{
	  ch->Gold = credits;
	  credits = 0;
	}
      else
	{
	  ch->Gold = CLONEGOLD;
	  credits -= CLONEGOLD;
	}

      played = ch->PCData->Played;
      ch->PCData->Played = ch->PCData->Played/2;
      bank = ch->PCData->Bank;
      ch->PCData->Bank = 0;
      home = ch->PlayerHome;
      ch->PlayerHome = NULL;
      strcpy( oldbestowments, ch->PCData->Bestowments);

      if( ch->PCData->Clones == 2 )
	{
	  Echo( ch, "The medical droids tell you your genetical material has degraded significantly.\r\n");

	  for(ability = 0; ability < MAX_ABILITY; ability++)
	    {
	      experience[ability] = GetAbilityXP( ch, ability );
	      skill_level[ability] = GetAbilityLevel( ch, ability );
	      SetAbilityXP( ch, ability, 0 );
	      SetAbilityLevel( ch, ability, 1 );
	    }

	  experience[FORCE_ABILITY] = frc_experience;
	  skill_level[FORCE_ABILITY] = frc_level;
	}

      ch->Mana = 100 + (ch->Stats.PermFrc*100);

      if ( !IsNullOrEmpty( ch->PCData->ClanInfo.ClanName ) )
	{
	  strcpy( clanname, ch->PCData->ClanInfo.ClanName);
	  FreeMemory( ch->PCData->ClanInfo.ClanName );
	  ch->PCData->ClanInfo.ClanName = CopyString( "" );
	  strcpy( bestowments, ch->PCData->Bestowments);
	  FreeMemory( ch->PCData->Bestowments );
	  ch->PCData->Bestowments = CopyString( "" );
	  SaveClone(ch);
	  FreeMemory( ch->PCData->ClanInfo.ClanName );
	  ch->PCData->ClanInfo.ClanName = CopyString( clanname );
	  FreeMemory( ch->PCData->Bestowments );
	  ch->PCData->Bestowments = CopyString( clanname );
	}
      else
	SaveClone( ch );

      ch->Stats.PermFrc = frc;

      SetAbilityLevel( ch, FORCE_ABILITY, frc_level );
      SetAbilityXP( ch, FORCE_ABILITY, frc_experience );
      ch->Mana = mana;

      if( ch->PCData->Clones == 2 )
	{
	  for(ability = 0; ability < MAX_ABILITY; ability++)
	    {
	      SetAbilityXP( ch, ability, experience[ability] );
	      SetAbilityLevel( ch, ability, skill_level[ability] );
	    }
	}

      ch->PlayerHome = home;
      ch->PCData->Played = played;
      ch->Gold = credits;
      ch->PCData->Bank = bank;
      ch->Flags = flags;
      ch->PCData->Bestowments=CopyString( oldbestowments);
      ch->Hit--;
    }
  
  CharacterFromRoom( ch );
  CharacterToRoom( ch, GetRoom( ROOM_VNUM_CLONING_CLINIC ) );
  do_look( ch , "" );

  Echo( ch, "\r\n&WA small tissue sample is taken from your arm.\r\n" );
  Echo( ch, "&ROuch!\r\n\r\n" );
  Echo( ch, "&WYou have been succesfully cloned.\r\n" );
}
