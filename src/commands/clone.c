#include <string.h>
#include "mud.h"
#include "character.h"

#define CLONEGOLD 1000

void do_clone( Character *ch, char *argument )
{
  long credits, bank;
  long played, frc_experience;
  char clanname[MAX_STRING_LENGTH];
  char bestowments[MAX_STRING_LENGTH];
  char oldbestowments[MAX_STRING_LENGTH];
  int experience[MAX_ABILITY];
  int skill_level[MAX_ABILITY];
  int flags, ability;
  short frc, change, change2, frc_level, low_frc = 0, mana;
  Room *home;

  if ( IsNpc(ch) )
    {
      ChPrintf( ch, "Yeah right!\r\n" );
      return;
    }

  if ( ch->in_room->vnum != 10001 )
    {
      ChPrintf( ch, "You can't do that here!\r\n" );
      return;
    }

  if ( ch->pcdata->clones >= 3 )
    {
      ChPrintf( ch, "The medical droids tell you your genetical material is too far degraded.\r\n");
      return;
    }

  if ( ch->gold < ch->top_level*200 )
    {
      ChPrintf( ch, "You don't have enough credits... You need %d.\r\n" , ch->top_level*200 );
      return;
    }
  else
    {
      ch->gold -= ch->top_level*200;

      ChPrintf( ch, "You pay %d credits for cloning.\r\n" , ch->top_level*200 );
      ChPrintf( ch, "You are escorted into a small room.\r\n\r\n" );
    }

  char_from_room( ch );
  char_to_room( ch, GetRoom( 10000 ) );

  /* random force change on cloning */
  frc = ch->stats.perm_frc;
  mana = ch->mana;

  /* if character has force, there is a chance of losing force
     depending on the magnitude, the lesser force  the greater chance, as
     well as a slight chance of gaining force, also depending on
     the magnitude of the character's force */

  if ( ch->ability.main == FORCE_ABILITY )
    low_frc = 1;


  if(ch->stats.perm_frc > 0)
    {
      change = GetRandomNumberFromRange(-2, ch->stats.perm_frc);
      change = urange( -2 , change , 0 );
      change2 = GetRandomNumberFromRange( -1000, ch->stats.perm_frc );
      change2 = urange(0, change2, 1);
      ch->stats.perm_frc = urange( low_frc, ch->stats.perm_frc + change + change2, 20);
    }
  else
    {
      /* a character with no force has a 1/100 chance of gaining it */

      change = GetRandomNumberFromRange(-500, 2);
      change = urange( 0, change, 2);
      ch->stats.perm_frc = urange( low_frc, ch->stats.perm_frc + change, 20);

    }

  frc_level = GetAbilityLevel( ch, FORCE_ABILITY );
  frc_experience = GetAbilityXP( ch, FORCE_ABILITY );

  /* Droids and hunters dont get force. DV */

  if (ch->ability.main == HUNTING_ABILITY )
    ch->stats.perm_frc = low_frc;

  if (ch->race == RACE_DROID )
    ch->stats.perm_frc = 0;

  if(frc > 0)
    {
      if(ch->stats.perm_frc > 0)
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

  ch->mana = 100 + 100*ch->stats.perm_frc;

  flags   = ch->act;
  RemoveBit( ch->act, PLR_KILLER );
  credits = ch->gold;
  if(credits <= CLONEGOLD)
    {
      ch->gold = credits;
      credits = 0;
    }
  else
    {
      ch->gold = CLONEGOLD;
      credits -= CLONEGOLD;
    }

  played = ch->pcdata->played;
  ch->pcdata->played = ch->pcdata->played/2;
  bank = ch->pcdata->bank;
  ch->pcdata->bank = 0;
  home = ch->plr_home;
  ch->plr_home = NULL;
  strcpy( oldbestowments, ch->pcdata->bestowments);


  if( ch->pcdata->clones == 2 )
    {

      ChPrintf( ch, "The medical droids tell you your genetical material has degraded significantly.\r\n");

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

  ch->mana = 100 + (ch->stats.perm_frc*100);

  if ( ch->pcdata->clan_name && ch->pcdata->clan_name[0] != '\0' )
    {
      strcpy( clanname, ch->pcdata->clan_name);
      FreeMemory( ch->pcdata->clan_name );
      ch->pcdata->clan_name = CopyString( "" );
      strcpy( bestowments, ch->pcdata->bestowments);
      FreeMemory( ch->pcdata->bestowments );
      ch->pcdata->bestowments = CopyString( "" );
      save_clone(ch);
      FreeMemory( ch->pcdata->clan_name );
      ch->pcdata->clan_name = CopyString( clanname );
      FreeMemory( ch->pcdata->bestowments );
      ch->pcdata->bestowments = CopyString( clanname );
    }
  else
    save_clone( ch );
  ch->stats.perm_frc = frc;

  SetAbilityLevel( ch, FORCE_ABILITY, frc_level );
  SetAbilityXP( ch, FORCE_ABILITY, frc_experience );
  ch->mana = mana;

  if( ch->pcdata->clones == 2 )
    {
      for(ability = 0; ability < MAX_ABILITY; ability++)
        {
          SetAbilityXP( ch, ability, experience[ability] );
          SetAbilityLevel( ch, ability, skill_level[ability] );
        }
    }

  ch->plr_home = home;
  ch->pcdata->played = played;
  ch->gold = credits;
  ch->pcdata->bank = bank;
  ch->act = flags;
  ch->pcdata->bestowments=CopyString( oldbestowments);
  char_from_room( ch );
  char_to_room( ch, GetRoom( 10002 ) );
  do_look( ch , "" );

  ChPrintf( ch, "\r\n&WA small tissue sample is taken from your arm.\r\n" );
  ChPrintf( ch, "&ROuch!\r\n\r\n" );
  ChPrintf( ch, "&WYou have been succesfully cloned.\r\n" );

  ch->hit--;
}
