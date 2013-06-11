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
  ROOM_INDEX_DATA *home;

  if ( IsNpc(ch) )
    {
      ch_printf( ch, "Yeah right!\r\n" );
      return;
    }

  if ( ch->in_room->vnum != 10001 )
    {
      ch_printf( ch, "You can't do that here!\r\n" );
      return;
    }

  if ( ch->pcdata->clones >= 3 )
    {
      ch_printf( ch, "The medical droids tell you your genetical material is too far degraded.\r\n");
      return;
    }

  if ( ch->gold < ch->top_level*200 )
    {
      ch_printf( ch, "You don't have enough credits... You need %d.\r\n" , ch->top_level*200 );
      return;
    }
  else
    {
      ch->gold -= ch->top_level*200;

      ch_printf( ch, "You pay %d credits for cloning.\r\n" , ch->top_level*200 );
      ch_printf( ch, "You are escorted into a small room.\r\n\r\n" );
    }

  char_from_room( ch );
  char_to_room( ch, get_room_index( 10000 ) );

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
      change = number_range(-2, ch->stats.perm_frc);
      change = URANGE( -2 , change , 0 );
      change2 = number_range( -1000, ch->stats.perm_frc );
      change2 = URANGE(0, change2, 1);
      ch->stats.perm_frc = URANGE( low_frc, ch->stats.perm_frc + change + change2, 20);
    }
  else
    {
      /* a character with no force has a 1/100 chance of gaining it */

      change = number_range(-500, 2);
      change = URANGE( 0, change, 2);
      ch->stats.perm_frc = URANGE( low_frc, ch->stats.perm_frc + change, 20);

    }

  frc_level = get_level( ch, FORCE_ABILITY );
  frc_experience = get_exp( ch, FORCE_ABILITY );

  /* Droids and hunters dont get force. DV */

  if (ch->ability.main == HUNTING_ABILITY )
    ch->stats.perm_frc = low_frc;

  if (ch->race == RACE_DROID )
    ch->stats.perm_frc = 0;

  if(frc > 0)
    {
      if(ch->stats.perm_frc > 0)
        {
          set_exp( ch, FORCE_ABILITY, 500 );
          set_level( ch, FORCE_ABILITY, 2 );
        }
    }
  else
    {
      set_exp( ch, FORCE_ABILITY, 0 );
      set_level( ch, FORCE_ABILITY, 1 );
    }

  ch->mana = 100 + 100*ch->stats.perm_frc;

  flags   = ch->act;
  REMOVE_BIT( ch->act, PLR_KILLER );
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

      ch_printf( ch, "The medical droids tell you your genetical material has degraded significantly.\r\n");

      for(ability = 0; ability < MAX_ABILITY; ability++)
        {
          experience[ability] = get_exp( ch, ability );
          skill_level[ability] = get_level( ch, ability );
          set_exp( ch, ability, 0 );
          set_level( ch, ability, 1 );
        }

      experience[FORCE_ABILITY] = frc_experience;
      skill_level[FORCE_ABILITY] = frc_level;
    }

  ch->mana = 100 + (ch->stats.perm_frc*100);

  if ( ch->pcdata->clan_name && ch->pcdata->clan_name[0] != '\0' )
    {
      strcpy( clanname, ch->pcdata->clan_name);
      STRFREE( ch->pcdata->clan_name );
      ch->pcdata->clan_name = STRALLOC( "" );
      strcpy( bestowments, ch->pcdata->bestowments);
      DISPOSE( ch->pcdata->bestowments );
      ch->pcdata->bestowments = str_dup( "" );
      save_clone(ch);
      STRFREE( ch->pcdata->clan_name );
      ch->pcdata->clan_name = STRALLOC( clanname );
      DISPOSE( ch->pcdata->bestowments );
      ch->pcdata->bestowments = str_dup( clanname );
    }
  else
    save_clone( ch );
  ch->stats.perm_frc = frc;

  set_level( ch, FORCE_ABILITY, frc_level );
  set_exp( ch, FORCE_ABILITY, frc_experience );
  ch->mana = mana;

  if( ch->pcdata->clones == 2 )
    {
      for(ability = 0; ability < MAX_ABILITY; ability++)
        {
          set_exp( ch, ability, experience[ability] );
          set_level( ch, ability, skill_level[ability] );
        }
    }

  ch->plr_home = home;
  ch->pcdata->played = played;
  ch->gold = credits;
  ch->pcdata->bank = bank;
  ch->act = flags;
  ch->pcdata->bestowments=str_dup( oldbestowments);
  char_from_room( ch );
  char_to_room( ch, get_room_index( 10002 ) );
  do_look( ch , "" );

  ch_printf( ch, "\r\n&WA small tissue sample is taken from your arm.\r\n" );
  ch_printf( ch, "&ROuch!\r\n\r\n" );
  ch_printf( ch, "&WYou have been succesfully cloned.\r\n" );

  ch->hit--;
}
