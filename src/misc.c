/***************************************************************************
 *                   Star Wars: Rise in Power MUD Codebase                  *
 *--------------------------------------------------------------------------*
 * SWRiP Code Additions and changes from the SWReality and Smaug Code       *
 * copyright (c) 2001 by Mark Miller (Darrik Vequir)                        *
 *--------------------------------------------------------------------------*
 * Star Wars Reality Code Additions and changes from the Smaug Code         *
 * copyright (c) 1997 by Sean Cooper                                        *
 * -------------------------------------------------------------------------*
 * Starwars and Starwars Names copyright(c) Lucas Film Ltd.                 *
 *--------------------------------------------------------------------------*
 * SMAUG 1.0 (C) 1994, 1995, 1996 by Derek Snider                           *
 * SMAUG code team: Thoric, Altrag, Blodkai, Narn, Haus,                    *
 * Scryn, Rennard, Swordbearer, Gorog, Grishnakh and Tricops                *
 * ------------------------------------------------------------------------ *
 * Merc 2.1 Diku Mud improvments copyright (C) 1992, 1993 by Michael        *
 * Chastain, Michael Quan, and Mitchell Tse.                                *
 * Original Diku Mud copyright (C) 1990, 1991 by Sebastian Hammer,          *
 * Michael Seifert, Hans Henrik St{rfeldt, Tom Madsen, and Katja Nyboe.     *
 * ------------------------------------------------------------------------ *
 *          Misc module for general commands: not skills or spells         *
 ****************************************************************************
 * Note: Most of the stuff in here would go in act_obj.c, but act_obj was   *
 * getting big.                                                            *
 ****************************************************************************/

#include <sys/types.h>
#include <stdio.h>
#include <string.h>
#include <time.h>
#include <crypt.h>
#include "mud.h"

#define CLONEGOLD 1000

#define QUEST_ITEM1 70
#define QUEST_ITEM2 71
#define QUEST_ITEM3 72
#define QUEST_ITEM4 73
#define QUEST_ITEM5 74


#define QUEST_VALUE1 5000
#define QUEST_VALUE2 2000
#define QUEST_VALUE3 2000
#define QUEST_VALUE4 7000
#define QUEST_VALUE5 10000

/* Object vnums for object quest 'tokens'. In Moongate, the tokens are
   things like 'the Shield of Moongate', 'the Sceptre of Moongate'. These
   items are worthless and have the rot-death flag, as they are placed
   into the world when a player receives an object quest. */

#define QUEST_OBJQUEST1 75
#define QUEST_OBJQUEST2 76
#define QUEST_OBJQUEST3 77
#define QUEST_OBJQUEST4 78
#define QUEST_OBJQUEST5 79

/* Local functions */

void generate_quest( CHAR_DATA *ch, CHAR_DATA *questman );
bool qchance( int num );

bool qchance( int num )
{
  if (number_range(1,100) <= num) return TRUE;
  else return FALSE;
}

extern int      top_exit;

void do_buyhome( CHAR_DATA *ch, char *argument )
{
  ROOM_INDEX_DATA *room;
  AREA_DATA *pArea;

  if ( !ch->in_room )
    return;

  if ( IS_NPC(ch) || !ch->pcdata )
    return;

  if ( ch->plr_home != NULL )
    {
      send_to_char( "&RYou already have a home!\r\n&w", ch);
      return;
    }

  room = ch->in_room;

  for ( pArea = first_bsort; pArea; pArea = pArea->next_sort )
    {
      if ( room->area == pArea )
        {
          send_to_char( "&RThis area isn't installed yet!\r\n&w", ch);
          return;
        }
    }

  if ( !IS_SET( room->room_flags , ROOM_EMPTY_HOME ) )
    {
      send_to_char( "&RThis room isn't for sale!\r\n&w", ch);
      return;
    }

  if ( ch->gold < 100000 )
    {
      send_to_char( "&RThis room costs 100000 credits you don't have enough!\r\n&w", ch);
      return;
    }

  if ( argument[0] == '\0' )
    {
      send_to_char( "Set the room name.  A very brief single line room description.\r\n", ch );
      send_to_char( "Usage: Buyhome <Room Name>\r\n", ch );
      return;
    }

  STRFREE( room->name );
  room->name = STRALLOC( argument );

  ch->gold -= 100000;

  REMOVE_BIT( room->room_flags , ROOM_EMPTY_HOME );
  SET_BIT( room->room_flags , ROOM_PLR_HOME );

  fold_area( room->area, room->area->filename, FALSE );

  ch->plr_home = room;
  do_save( ch , "" );

}

void do_clone( CHAR_DATA *ch, char *argument )
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

  if ( IS_NPC(ch) )
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
  frc = ch->perm_frc;
  mana = ch->mana;

  /* if character has force, there is a chance of losing force
     depending on the magnitude, the lesser force  the greater chance, as
     well as a slight chance of gaining force, also depending on
     the magnitude of the character's force */

  if ( ch->main_ability == FORCE_ABILITY )
    low_frc = 1;


  if(ch->perm_frc > 0)
    {
      change = number_range(-2, ch->perm_frc);
      change = URANGE( -2 , change , 0 );
      change2 = number_range( -1000, ch->perm_frc );
      change2 = URANGE(0, change2, 1);
      ch->perm_frc = URANGE( low_frc, ch->perm_frc + change + change2, 20);
    }
  else
    {
      /* a character with no force has a 1/100 chance of gaining it */

      change = number_range(-500, 2);
      change = URANGE( 0, change, 2);
      ch->perm_frc = URANGE( low_frc, ch->perm_frc + change, 20);

    }

  frc_level = ch->skill_level[7];
  frc_experience = ch->experience[7];

  /* Droids and hunters dont get force. DV */

  if (ch->main_ability == HUNTING_ABILITY )
    ch->perm_frc = low_frc;

  if (ch->race == RACE_DROID )
    ch->perm_frc = 0;

  if(frc > 0)
    {
      if(ch->perm_frc > 0)
        {
          ch->experience[7] = 500;
          ch->skill_level[7] = 2;
        }
    }
  else
    {
      ch->experience[7] = 0;
      ch->skill_level[7] = 1;
    }
  ch->mana = 100 + 100*ch->perm_frc;

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
          experience[ability] = ch->experience[ability];
          skill_level[ability] = ch->skill_level[ability];
          ch->experience[ability] = 0;
          ch->skill_level[ability] = 1;
        }
      experience[7] = frc_experience;
      skill_level[7] = frc_level;
    }

  ch->mana = 100 + (ch->perm_frc*100);

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
  ch->perm_frc = frc;
  ch->skill_level[7] = frc_level;
  ch->experience[7] = frc_experience;
  ch->mana = mana;
  if( ch->pcdata->clones == 2 )
    for(ability = 0; ability < MAX_ABILITY; ability++)
      {
        ch->experience[ability] = experience[ability];
        ch->skill_level[ability] = skill_level[ability];
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

void do_arm( CHAR_DATA *ch, char *argument )
{
  OBJ_DATA *obj;


  if ( IS_NPC(ch) || !ch->pcdata )
    {
      ch_printf( ch, "Mob's cant do that!\r\n" );
      return;
    }

  if ( ch->pcdata->learned[gsn_grenades] <= 0 )
    {
      ch_printf( ch, "You have no idea how to do that.\r\n" );
      return;
    }

  obj = get_eq_char( ch, WEAR_HOLD );

  if ( !obj || obj->item_type != ITEM_GRENADE )
    {
      ch_printf( ch, "You don't seem to be holding a grenade!\r\n" );
      return;
    }

  obj->timer = 1;
  STRFREE ( obj->armed_by );
  obj->armed_by = STRALLOC ( ch->name );

  ch_printf( ch, "You arm %s.\r\n", obj->short_descr );
  act( AT_PLAIN, "$n arms $p.", ch, obj, NULL, TO_ROOM );

  learn_from_success( ch , gsn_grenades );
}

void do_ammo( CHAR_DATA *ch, char *argument )
{
  OBJ_DATA *wield;
  OBJ_DATA *obj;
  bool checkammo = FALSE;
  int charge =0;

  obj = NULL;
  wield = get_eq_char( ch, WEAR_WIELD );
  if (wield)
    {
      obj = get_eq_char( ch, WEAR_DUAL_WIELD );
      if (!obj)
        obj = get_eq_char( ch, WEAR_HOLD );
    }
  else
    {
      wield = get_eq_char( ch, WEAR_HOLD );
      obj = NULL;
    }

  if (!wield || wield->item_type != ITEM_WEAPON )
    {
      send_to_char( "&RYou don't seem to be holding a weapon.\r\n&w", ch);
      return;
    }

  if ( wield->value[3] == WEAPON_BLASTER )
    {

      if ( obj && obj->item_type != ITEM_AMMO )
        {
          send_to_char( "&RYour hands are too full to reload your blaster.\r\n&w", ch);
          return;
        }

      if (obj)
        {
          if ( obj->value[0] > wield->value[5] )
            {
              send_to_char( "That cartridge is too big for your blaster.", ch);
              return;
            }
          unequip_char( ch, obj );
          checkammo = TRUE;
          charge = obj->value[0];
          separate_obj( obj );
          extract_obj( obj );
        }
      else
        {
          for ( obj = ch->last_carrying; obj; obj = obj->prev_content )
            {
              if ( obj->item_type == ITEM_AMMO)
                {
                  if ( obj->value[0] > wield->value[5] )
                    {
                      send_to_char( "That cartridge is too big for your blaster.", ch);
                      continue;
                    }
                  checkammo = TRUE;
                  charge = obj->value[0];
                  separate_obj( obj );
                  extract_obj( obj );
                  break;
                }
            }
        }

      if (!checkammo)
        {
          send_to_char( "&RYou don't seem to have any ammo to reload your blaster with.\r\n&w", ch);
          return;
        }

      ch_printf( ch, "You replace your ammunition cartridge.\r\nYour blaster is charged with %d shots at high power to %d shots on low.\r\n", charge/5, charge );
      act( AT_PLAIN, "$n replaces the ammunition cell in $p.", ch, wield, NULL, TO_ROOM );

    }
  else  if ( wield->value[3] == WEAPON_BOWCASTER )
    {

      if ( obj && obj->item_type != ITEM_BOLT )
        {
          send_to_char( "&RYour hands are too full to reload your bowcaster.\r\n&w", ch);
          return;
        }

      if (obj)
        {
          if ( obj->value[0] > wield->value[5] )
            {
              send_to_char( "That cartridge is too big for your bowcaster.", ch);
              return;
            }
          unequip_char( ch, obj );
          checkammo = TRUE;
          charge = obj->value[0];
          separate_obj( obj );
          extract_obj( obj );
        }
      else
        {
          for ( obj = ch->last_carrying; obj; obj = obj->prev_content )
            {
              if ( obj->item_type == ITEM_BOLT)
                {
                  if ( obj->value[0] > wield->value[5] )
                    {
                      send_to_char( "That cartridge is too big for your bowcaster.", ch);
                      continue;
                    }
                  checkammo = TRUE;
                  charge = obj->value[0];
                  separate_obj( obj );
                  extract_obj( obj );
                  break;
                }
            }
        }

      if (!checkammo)
        {
          send_to_char( "&RYou don't seem to have any quarrels to reload your bowcaster with.\r\n&w", ch);
          return;
        }

      ch_printf( ch, "You replace your quarrel pack.\r\nYour bowcaster is charged with %d energy bolts.\r\n", charge );
      act( AT_PLAIN, "$n replaces the quarrels in $p.", ch, wield, NULL, TO_ROOM );

    }
  else
    {

      if ( obj && obj->item_type != ITEM_BATTERY )
        {
          send_to_char( "&RYour hands are too full to replace the power cell.\r\n&w", ch);
          return;
        }

      if (obj)
        {
          unequip_char( ch, obj );
          checkammo = TRUE;
          charge = obj->value[0];
          separate_obj( obj );
          extract_obj( obj );
        }
      else
        {
          for ( obj = ch->last_carrying; obj; obj = obj->prev_content )
            {
              if ( obj->item_type == ITEM_BATTERY)
                {
                  checkammo = TRUE;
                  charge = obj->value[0];
                  separate_obj( obj );
                  extract_obj( obj );
                  break;
                }
            }
        }

      if (!checkammo)
        {
          send_to_char( "&RYou don't seem to have a power cell.\r\n&w", ch);
          return;
        }

      if (wield->value[3] == WEAPON_LIGHTSABER )
        {
          ch_printf( ch, "You replace your power cell.\r\nYour lightsaber is charged to %d/%d units.\r\n", charge, charge );
          act( AT_PLAIN, "$n replaces the power cell in $p.", ch, wield, NULL, TO_ROOM );
          act( AT_PLAIN, "$p ignites with a bright glow.", ch, wield, NULL, TO_ROOM );
        }
      else if (wield->value[3] == WEAPON_VIBRO_BLADE )
        {
          ch_printf( ch, "You replace your power cell.\r\nYour vibro-blade is charged to %d/%d units.\r\n", charge, charge );
          act( AT_PLAIN, "$n replaces the power cell in $p.", ch, wield, NULL, TO_ROOM );
        }
      else if (wield->value[3] == WEAPON_FORCE_PIKE )
        {
          ch_printf( ch, "You replace your power cell.\r\nYour force-pike is charged to %d/%d units.\r\n", charge, charge );
          act( AT_PLAIN, "$n replaces the power cell in $p.", ch, wield, NULL, TO_ROOM );
        }
      else
        {
          ch_printf( ch, "You feel very foolish.\r\n" );
          act( AT_PLAIN, "$n tries to jam a power cell into $p.", ch, wield, NULL, TO_ROOM );
        }
    }

  wield->value[4] = charge;

}

void do_setblaster( CHAR_DATA *ch, char *argument )
{
  OBJ_DATA *wield;
  OBJ_DATA *wield2;

  wield = get_eq_char( ch, WEAR_WIELD );
  if( wield && !( wield->item_type == ITEM_WEAPON && wield->value[3] == WEAPON_BLASTER ) )
    wield = NULL;
  wield2 = get_eq_char( ch, WEAR_DUAL_WIELD );
  if( wield2 && !( wield2->item_type == ITEM_WEAPON && wield2->value[3] == WEAPON_BLASTER ) )
    wield2 = NULL;

  if ( !wield && !wield2 )
    {
      send_to_char( "&RYou don't seem to be wielding a blaster.\r\n&w", ch);
      return;
    }

  if ( argument[0] == '\0' )
    {
      send_to_char( "&RUsage: setblaster <full|high|normal|half|low|stun>\r\n&w", ch);
      return;
    }

  if ( wield )
    act( AT_PLAIN, "$n adjusts the settings on $p.", ch, wield, NULL, TO_ROOM );

  if ( wield2 )
    act( AT_PLAIN, "$n adjusts the settings on $p.", ch, wield2, NULL, TO_ROOM );

  if ( !str_cmp( argument, "full" ) )
    {
      if (wield)
        {
          wield->blaster_setting = BLASTER_FULL;
          send_to_char( "&YWielded blaster set to FULL Power\r\n&w", ch);
        }
      if (wield2)
        {
          wield2->blaster_setting = BLASTER_FULL;
          send_to_char( "&YDual wielded blaster set to FULL Power\r\n&w", ch);
        }
      return;
    }
  if ( !str_cmp( argument, "high" ) )
    {
      if (wield)
        {
          wield->blaster_setting = BLASTER_HIGH;
          send_to_char( "&YWielded blaster set to HIGH Power\r\n&w", ch);
        }
      if (wield2)
        {
          wield2->blaster_setting = BLASTER_HIGH;
          send_to_char( "&YDual wielded blaster set to HIGH Power\r\n&w", ch);
        }
      return;
    }
  if ( !str_cmp( argument, "normal" ) )
    {
      if (wield)
        {
          wield->blaster_setting = BLASTER_NORMAL;
          send_to_char( "&YWielded blaster set to NORMAL Power\r\n&w", ch);
        }
      if (wield2)
        {
          wield2->blaster_setting = BLASTER_NORMAL;
          send_to_char( "&YDual wielded blaster set to NORMAL Power\r\n&w", ch);
        }
      return;
    }
  if ( !str_cmp( argument, "half" ) )
    {
      if (wield)
        {
          wield->blaster_setting = BLASTER_HALF;
          send_to_char( "&YWielded blaster set to HALF Power\r\n&w", ch);
        }
      if (wield2)
        {
          wield2->blaster_setting = BLASTER_HALF;
          send_to_char( "&YDual wielded blaster set to HALF Power\r\n&w", ch);
        }
      return;
    }
  if ( !str_cmp( argument, "low" ) )
    {
      if (wield)
        {
          wield->blaster_setting = BLASTER_LOW;
          send_to_char( "&YWielded blaster set to LOW Power\r\n&w", ch);
        }
      if (wield2)
        {
          wield2->blaster_setting = BLASTER_LOW;
          send_to_char( "&YDual wielded blaster set to LOW Power\r\n&w", ch);
        }
      return;
    }
  if ( !str_cmp( argument, "stun" ) )
    {
      if (wield)
        {
          wield->blaster_setting = BLASTER_STUN;
          send_to_char( "&YWielded blaster set to STUN\r\n&w", ch);
        }
      if (wield2)
        {
          wield2->blaster_setting = BLASTER_STUN;
          send_to_char( "&YDual wielded blaster set to STUN\r\n&w", ch);
        }
      return;
    }
  else
    do_setblaster( ch , "" );

}

void do_use( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  char argd[MAX_INPUT_LENGTH];
  CHAR_DATA *victim;
  OBJ_DATA *device;
  OBJ_DATA *obj;
  ch_ret retcode;

  argument = one_argument( argument, argd );
  argument = one_argument( argument, arg );

  if ( !str_cmp( arg , "on" ) )
    argument = one_argument( argument, arg );

  if ( argd[0] == '\0' )
    {
      send_to_char( "Use what?\r\n", ch );
      return;
    }

  if ( ( device = get_eq_char( ch, WEAR_HOLD ) ) == NULL ||
       !nifty_is_name(argd, device->name) )
    {
      do_takedrug( ch , argd );
      return;
    }

  if ( device->item_type == ITEM_SPICE )
    {
      do_takedrug( ch , argd );
      return;
    }

  if ( device->item_type != ITEM_DEVICE )
    {
      send_to_char( "You can't figure out what it is your supposed to do with it.\r\n", ch );
      return;
    }

  if ( device->value[2] <= 0 )
    {
      send_to_char( "It has no more charge left.", ch);
      return;
    }

  obj = NULL;
  if ( arg[0] == '\0' )
    {
      if ( ch->fighting )
        {
          victim = who_fighting( ch );
        }
      else
        {
          send_to_char( "Use on whom or what?\r\n", ch );
          return;
        }
    }
  else
    {
      if ( ( victim = get_char_room ( ch, arg ) ) == NULL
           &&   ( obj    = get_obj_here  ( ch, arg ) ) == NULL )
        {
          send_to_char( "You can't find your target.\r\n", ch );
          return;
        }
    }

  WAIT_STATE( ch, 1 * PULSE_VIOLENCE );

  if ( device->value[2] > 0 )
    {
      device->value[2]--;
      if ( victim )
        {
          if ( !oprog_use_trigger( ch, device, victim, NULL, NULL ) )
            {
              act( AT_MAGIC, "$n uses $p on $N.", ch, device, victim, TO_ROOM );
              act( AT_MAGIC, "You use $p on $N.", ch, device, victim, TO_CHAR );
            }
        }
      else
        {
          if ( !oprog_use_trigger( ch, device, NULL, obj, NULL ) )
            {
              act( AT_MAGIC, "$n uses $p on $P.", ch, device, obj, TO_ROOM );
              act( AT_MAGIC, "You use $p on $P.", ch, device, obj, TO_CHAR );
            }
        }

      retcode = obj_cast_spell( device->value[3], device->value[0], ch, victim, obj );
      if ( retcode == rCHAR_DIED || retcode == rBOTH_DIED )
        {
          bug( "do_use: char died", 0 );
          return;
        }
    }


  return;
}

void do_takedrug( CHAR_DATA *ch, char *argument )
{
  OBJ_DATA *obj;
  AFFECT_DATA af;
  int drug;
  int sn;

  if ( argument[0] == '\0' || !str_cmp(argument, "") )
    {
      send_to_char( "Use what?\r\n", ch );
      return;
    }

  if( is_droid(ch) )
    {
      send_to_char( "That would have no affect on you.\r\n", ch );
      return;
    }

  if ( (obj = find_obj(ch, argument, TRUE)) == NULL )
    return;

  if ( obj->item_type == ITEM_DEVICE )
    {
      send_to_char( "Try holding it first.\r\n", ch );
      return;
    }

  if ( obj->item_type != ITEM_SPICE )
    {
      act( AT_ACTION, "$n looks at $p and scratches $s head.", ch, obj, NULL, TO_ROOM );
      act( AT_ACTION, "You can't quite figure out what to do with $p.", ch, obj, NULL, TO_CHAR );
      return;
    }

  separate_obj( obj );
  if ( obj->in_obj )
    {
      act( AT_PLAIN, "You take $p from $P.", ch, obj, obj->in_obj, TO_CHAR );
      act( AT_PLAIN, "$n takes $p from $P.", ch, obj, obj->in_obj, TO_ROOM );
    }

  if ( ch->fighting && number_percent( ) > (get_curr_dex(ch) * 2 + 48) )
    {
      act( AT_MAGIC, "$n accidentally drops $p rendering it useless.", ch, obj, NULL, TO_ROOM );
      act( AT_MAGIC, "Oops... $p gets knocked from your hands rendering it completely useless!", ch, obj, NULL ,TO_CHAR );
    }
  else
    {
      if ( !oprog_use_trigger( ch, obj, NULL, NULL, NULL ) )
        {
          act( AT_ACTION, "$n takes $p.",  ch, obj, NULL, TO_ROOM );
          act( AT_ACTION, "You take $p.", ch, obj, NULL, TO_CHAR );
        }

      if ( IS_NPC(ch) )
        {
          extract_obj( obj );
          return;
        }

      drug = obj->value[0];

      WAIT_STATE( ch, PULSE_PER_SECOND/4 );

      gain_condition( ch, COND_THIRST, 1 );

      ch->pcdata->drug_level[drug] = UMIN(ch->pcdata->drug_level[drug]+obj->value[1] , 255);
      if ( ch->pcdata->drug_level[drug] >=255
           || ch->pcdata->drug_level[drug] > ( ch->pcdata->addiction[drug]+100 ) )
        {
          act( AT_POISON, "$n sputters and gags.", ch, NULL, NULL, TO_ROOM );
          act( AT_POISON, "You feel sick. You may have taken too much.", ch, NULL, NULL, TO_CHAR );
          ch->mental_state = URANGE( 20, ch->mental_state + 5, 100 );
          af.type      = gsn_poison;
          af.location  = APPLY_INT;
          af.modifier  = -5;
          af.duration  = ch->pcdata->drug_level[drug];
          af.bitvector = AFF_POISON;
          affect_to_char( ch, &af );
          ch->hit = 1;
        }

      switch (drug)
        {
        default:
        case SPICE_GLITTERSTIM:

          sn=skill_lookup("true sight");
          if ( sn < MAX_SKILL && !IS_AFFECTED( ch, AFF_TRUESIGHT ) )
            {
              af.type      = sn;
              af.location  = APPLY_AC;
              af.modifier  = -10;
              af.duration  = URANGE( 1, ch->pcdata->drug_level[drug] - ch->pcdata->addiction[drug] ,obj->value[1] );
              af.bitvector = AFF_TRUESIGHT;
              affect_to_char( ch, &af );
            }
          break;

        case SPICE_CARSANUM:

          sn=skill_lookup("heightened awareness");
          if ( sn < MAX_SKILL && !IS_AFFECTED( ch, AFF_SANCTUARY ) )
            {
              af.type      = sn;
              af.location  = APPLY_NONE;
              af.modifier  = 0;
              af.duration  = URANGE( 1, ch->pcdata->drug_level[drug] - ch->pcdata->addiction[drug] ,obj->value[1] );
              af.bitvector = AFF_DETECT_HIDDEN;
              affect_to_char( ch, &af );
            }
          break;

        case SPICE_LUMNI:

          sn=skill_lookup("sanctuary");
          if ( sn < MAX_SKILL && !IS_AFFECTED( ch, AFF_SANCTUARY ) )
            {
              af.type      = sn;
              af.location  = APPLY_NONE;
              af.modifier  = 0;
              af.duration  = URANGE( 1, ch->pcdata->drug_level[drug] - ch->pcdata->addiction[drug] ,obj->value[1] );
              af.bitvector = AFF_SANCTUARY;
              affect_to_char( ch, &af );
            }
          break;

        case SPICE_RYLL:

          af.type      = -1;
          af.location  = APPLY_CON;
          af.modifier  = 4;
          af.duration  = URANGE( 1, 2*(ch->pcdata->drug_level[drug] - ch->pcdata->addiction[drug]) ,2*obj->value[1] );
          af.bitvector = AFF_NONE;
          affect_to_char( ch, &af );

          af.type      = -1;
          af.location  = APPLY_IMMUNE;
          af.modifier  = RIS_POISON;
          af.duration  = URANGE( 1, 2*(ch->pcdata->drug_level[drug] - ch->pcdata->addiction[drug]) ,2*obj->value[1] );
          af.bitvector = AFF_NONE;
          affect_to_char( ch, &af );

          af.type      = -1;
          af.location  = APPLY_HIT;
          af.modifier  = 10;
          af.duration  = URANGE( 1, 2*(ch->pcdata->drug_level[drug] - ch->pcdata->addiction[drug]) ,2*obj->value[1] );
          af.bitvector = AFF_NONE;
          affect_to_char( ch, &af );
          break;

        case SPICE_ANDRIS:

          af.type      = -1;
          af.location  = APPLY_PARRY;
          af.modifier  = 50;
          af.duration  = URANGE( 1, 2*(ch->pcdata->drug_level[drug] - ch->pcdata->addiction[drug]) ,2*obj->value[1] );
          af.bitvector = AFF_NONE;
          affect_to_char( ch, &af );

          af.type      = -1;
          af.location  = APPLY_DEX;
          af.modifier  = 2;
          af.duration  = URANGE( 1, 2*(ch->pcdata->drug_level[drug] - ch->pcdata->addiction[drug]) ,2*obj->value[1] );
          af.bitvector = AFF_NONE;
          affect_to_char( ch, &af );

          break;

        }

    }
  if ( cur_obj == obj->serial )
    global_objcode = rOBJ_EATEN;
  extract_obj( obj );
  return;
}

void jedi_bonus( CHAR_DATA *ch )
{
  if ( number_range( 1 , 100 ) == 1 )
    {
      ch->max_mana++;
      send_to_char("&YYou are wise in your use of the force.\r\n", ch);
      send_to_char("You feel a little stronger in your wisdom.&w\r\n", ch);
    }
}

void sith_penalty( CHAR_DATA *ch )
{
  if ( number_range( 1 , 100 ) == 1 )
    {
      ch->max_mana++ ;
      if (ch->max_hit > 100)
        ch->max_hit--   ;
      ch->hit--   ;
      send_to_char("&zYour body grows weaker as your strength in the dark side grows.&w\r\n",ch);
    }
}

/*
 * Fill a container
 * Many enhancements added by Thoric (ie: filling non-drink containers)
 */
void do_fill( CHAR_DATA *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  OBJ_DATA *obj;
  OBJ_DATA *source;
  short    dest_item, src_item1, src_item2, src_item3, src_item4;
  int       diff;
  bool      all = FALSE;

  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );

  /* munch optional words */
  if ( (!str_cmp( arg2, "from" ) || !str_cmp( arg2, "with" ))
       &&    argument[0] != '\0' )
    argument = one_argument( argument, arg2 );

  if ( arg1[0] == '\0' )
    {
      send_to_char( "Fill what?\r\n", ch );
      return;
    }

  if ( ms_find_obj(ch) )
    return;

  if ( ( obj = get_obj_carry( ch, arg1 ) ) == NULL )
    {
      send_to_char( "You do not have that item.\r\n", ch );
      return;
    }
  else
    dest_item = obj->item_type;

  src_item1 = src_item2 = src_item3 = src_item4 = -1;
  switch( dest_item )
    {
    default:
      act( AT_ACTION, "$n tries to fill $p... (Don't ask me how)", ch, obj, NULL, TO_ROOM );
      send_to_char( "You cannot fill that.\r\n", ch );
      return;
      /* place all fillable item types here */
    case ITEM_DRINK_CON:
      src_item1 = ITEM_FOUNTAIN;        src_item2 = ITEM_BLOOD;         break;
    case ITEM_HERB_CON:
      src_item1 = ITEM_HERB;    src_item2 = ITEM_HERB_CON;      break;
    case ITEM_PIPE:
      src_item1 = ITEM_HERB;    src_item2 = ITEM_HERB_CON;      break;
    case ITEM_CONTAINER:
      src_item1 = ITEM_CONTAINER;       src_item2 = ITEM_CORPSE_NPC;
      src_item3 = ITEM_CORPSE_PC;       src_item4 = ITEM_CORPSE_NPC;    break;
    }

  if ( dest_item == ITEM_CONTAINER )
    {
      if ( IS_SET(obj->value[1], CONT_CLOSED) )
        {
          act( AT_PLAIN, "The $d is closed.", ch, NULL, obj->name, TO_CHAR );
          return;
        }
      if ( get_obj_weight( obj ) / obj->count
           >=   obj->value[0] )
        {
          send_to_char( "It's already full as it can be.\r\n", ch );
          return;
        }
    }
  else
    {
      diff = obj->value[0] - obj->value[1];
      if ( diff < 1 || obj->value[1] >= obj->value[0] )
        {
          send_to_char( "It's already full as it can be.\r\n", ch );
          return;
        }
    }

  if ( dest_item == ITEM_PIPE
       &&   IS_SET( obj->value[3], PIPE_FULLOFASH ) )
    {
      send_to_char( "It's full of ashes, and needs to be emptied first.\r\n", ch );
      return;
    }

  if ( arg2[0] != '\0' )
    {
      if ( dest_item == ITEM_CONTAINER
           && (!str_cmp( arg2, "all" ) || !str_prefix( "all.", arg2 )) )
        {
          all = TRUE;
          source = NULL;
        }
      else
        /* This used to let you fill a pipe from an object on the ground.  Seems
           to me you should be holding whatever you want to fill a pipe with.
           It's nitpicking, but I needed to change it to get a mobprog to work
           right.  Check out Lord Fitzgibbon if you're curious.  -Narn */
        if ( dest_item == ITEM_PIPE )
          {
            if ( ( source = get_obj_carry( ch, arg2 ) ) == NULL )
              {
                send_to_char( "You don't have that item.\r\n", ch );
                return;
              }
            if ( source->item_type != src_item1 && source->item_type != src_item2
                 &&   source->item_type != src_item3 &&   source->item_type != src_item4  )
              {
                act( AT_PLAIN, "You cannot fill $p with $P!", ch, obj, source, TO_CHAR );
                return;
              }
          }
        else
          {
            if ( ( source =  get_obj_here( ch, arg2 ) ) == NULL )
              {
                send_to_char( "You cannot find that item.\r\n", ch );
                return;
              }
          }
    }
  else
    source = NULL;

  if ( !source && dest_item == ITEM_PIPE )
    {
      send_to_char( "Fill it with what?\r\n", ch );
      return;
    }

  if ( !source )
    {
      bool      found = FALSE;
      OBJ_DATA *src_next;

      found = FALSE;
      separate_obj( obj );
      for ( source = ch->in_room->first_content;
            source;
            source = src_next )
        {
          src_next = source->next_content;
          if (dest_item == ITEM_CONTAINER)
            {
              if ( !CAN_WEAR(source, ITEM_TAKE)
                   ||   (IS_OBJ_STAT( source, ITEM_PROTOTYPE) && !can_take_proto(ch))
                   ||    ch->carry_weight + get_obj_weight(source) > can_carry_w(ch)
                   ||   (get_obj_weight(source) + get_obj_weight(obj)/obj->count)
                   > obj->value[0] )
                continue;
              if ( all && arg2[3] == '.'
                   &&  !nifty_is_name( &arg2[4], source->name ) )
                continue;
              obj_from_room(source);
              if ( source->item_type == ITEM_MONEY )
                {
                  ch->gold += source->value[0];
                  extract_obj( source );
                }
              else
                obj_to_obj(source, obj);
              found = TRUE;
            }
          else
            if (source->item_type == src_item1
                ||  source->item_type == src_item2
                ||  source->item_type == src_item3
                ||  source->item_type == src_item4 )
              {
                found = TRUE;
                break;
              }
        }
      if ( !found )
        {
          switch( src_item1 )
            {
            default:
              send_to_char( "There is nothing appropriate here!\r\n", ch );
              return;
            case ITEM_FOUNTAIN:
              send_to_char( "There is no fountain or pool here!\r\n", ch );
              return;
            case ITEM_BLOOD:
              send_to_char( "There is no blood pool here!\r\n", ch );
              return;
            case ITEM_HERB_CON:
              send_to_char( "There are no herbs here!\r\n", ch );
              return;
            case ITEM_HERB:
              send_to_char( "You cannot find any smoking herbs.\r\n", ch );
              return;
            }
        }
      if (dest_item == ITEM_CONTAINER)
        {
          act( AT_ACTION, "You fill $p.", ch, obj, NULL, TO_CHAR );
          act( AT_ACTION, "$n fills $p.", ch, obj, NULL, TO_ROOM );
          return;
        }
    }

  if (dest_item == ITEM_CONTAINER)
    {
      OBJ_DATA *otmp, *otmp_next;
      char name[MAX_INPUT_LENGTH];
      CHAR_DATA *gch;
      char *pd;
      bool found = FALSE;

      if ( source == obj )
        {
          send_to_char( "You can't fill something with itself!\r\n", ch );
          return;
        }

      switch( source->item_type )
        {
        default:        /* put something in container */
          if ( !source->in_room /* disallow inventory items */
               ||   !CAN_WEAR(source, ITEM_TAKE)
               ||   (IS_OBJ_STAT( source, ITEM_PROTOTYPE) && !can_take_proto(ch))
               ||    ch->carry_weight + get_obj_weight(source) > can_carry_w(ch)
               ||   (get_obj_weight(source) + get_obj_weight(obj)/obj->count)
               > obj->value[0] )
            {
              send_to_char( "You can't do that.\r\n", ch );
              return;
            }
          separate_obj( obj );
          act( AT_ACTION, "You take $P and put it inside $p.", ch, obj, source, TO_CHAR );
          act( AT_ACTION, "$n takes $P and puts it inside $p.", ch, obj, source, TO_ROOM );
          obj_from_room(source);
          obj_to_obj(source, obj);
          break;
        case ITEM_MONEY:
          send_to_char( "You can't do that... yet.\r\n", ch );
          break;
        case ITEM_CORPSE_PC:
          if ( IS_NPC(ch) )
            {
              send_to_char( "You can't do that.\r\n", ch );
              return;
            }

          pd = source->short_descr;
          pd = one_argument( pd, name );
          pd = one_argument( pd, name );
          pd = one_argument( pd, name );
          pd = one_argument( pd, name );

          if ( str_cmp( name, ch->name ) && !IS_IMMORTAL(ch) )
            {
              bool fGroup;

              fGroup = FALSE;
              for ( gch = first_char; gch; gch = gch->next )
                {
                  if ( !IS_NPC(gch)
                       &&   is_same_group( ch, gch )
                       &&   !str_cmp( name, gch->name ) )
                    {
                      fGroup = TRUE;
                      break;
                    }
                }
              if ( !fGroup )
                {
                  send_to_char( "That's someone else's corpse.\r\n", ch );
                  return;
                }
            }

        case ITEM_CONTAINER:
          if ( source->item_type == ITEM_CONTAINER  /* don't remove */
               &&   IS_SET(source->value[1], CONT_CLOSED) )
            {
              act( AT_PLAIN, "The $d is closed.", ch, NULL, source->name, TO_CHAR );
              return;
            }
        case ITEM_DROID_CORPSE:
        case ITEM_CORPSE_NPC:
          if ( (otmp=source->first_content) == NULL )
            {
              send_to_char( "It's empty.\r\n", ch );
              return;
            }
          separate_obj( obj );
          for ( ; otmp; otmp = otmp_next )
            {
              otmp_next = otmp->next_content;

              if ( !CAN_WEAR(otmp, ITEM_TAKE)
                   ||   (IS_OBJ_STAT( otmp, ITEM_PROTOTYPE) && !can_take_proto(ch))
                   ||    ch->carry_number + otmp->count > can_carry_n(ch)
                   ||    ch->carry_weight + get_obj_weight(otmp) > can_carry_w(ch)
                   ||   (get_obj_weight(source) + get_obj_weight(obj)/obj->count)
                   > obj->value[0] )
                continue;
              obj_from_obj(otmp);
              obj_to_obj(otmp, obj);
              found = TRUE;
            }
          if ( found )
            {
              act( AT_ACTION, "You fill $p from $P.", ch, obj, source, TO_CHAR );
              act( AT_ACTION, "$n fills $p from $P.", ch, obj, source, TO_ROOM );
            }
          else
            send_to_char( "There is nothing appropriate in there.\r\n", ch );
          break;
        }
      return;
    }

  if ( source->value[1] < 1 )
    {
      send_to_char( "There's none left!\r\n", ch );
      return;
    }
  if ( source->count > 1 && source->item_type != ITEM_FOUNTAIN )
    separate_obj( source );
  separate_obj( obj );

  switch( source->item_type )
    {
    default:
      bug( "do_fill: got bad item type: %d", source->item_type );
      send_to_char( "Something went wrong...\r\n", ch );
      return;
    case ITEM_FOUNTAIN:
      if ( obj->value[1] != 0 && obj->value[2] != 0 )
        {
          send_to_char( "There is already another liquid in it.\r\n", ch );
          return;
        }
      obj->value[2] = 0;
      obj->value[1] = obj->value[0];
      act( AT_ACTION, "You fill $p from $P.", ch, obj, source, TO_CHAR );
      act( AT_ACTION, "$n fills $p from $P.", ch, obj, source, TO_ROOM );
      return;
    case ITEM_BLOOD:
      if ( obj->value[1] != 0 && obj->value[2] != 13 )
        {
          send_to_char( "There is already another liquid in it.\r\n", ch );
          return;
        }
      obj->value[2] = 13;
      if ( source->value[1] < diff )
        diff = source->value[1];
      obj->value[1] += diff;
      act( AT_ACTION, "You fill $p from $P.", ch, obj, source, TO_CHAR );
      act( AT_ACTION, "$n fills $p from $P.", ch, obj, source, TO_ROOM );
      if ( (source->value[1] -= diff) < 1 )
        {
          extract_obj( source );
          make_bloodstain( ch );
        }
      return;
    case ITEM_HERB:
      if ( obj->value[1] != 0 && obj->value[2] != source->value[2] )
        {
          send_to_char( "There is already another type of herb in it.\r\n", ch );
          return;
        }
      obj->value[2] = source->value[2];
      if ( source->value[1] < diff )
        diff = source->value[1];
      obj->value[1] += diff;
      act( AT_ACTION, "You fill $p with $P.", ch, obj, source, TO_CHAR );
      act( AT_ACTION, "$n fills $p with $P.", ch, obj, source, TO_ROOM );
      if ( (source->value[1] -= diff) < 1 )
        extract_obj( source );
      return;
    case ITEM_HERB_CON:
      if ( obj->value[1] != 0 && obj->value[2] != source->value[2] )
        {
          send_to_char( "There is already another type of herb in it.\r\n", ch );
          return;
        }
      obj->value[2] = source->value[2];
      if ( source->value[1] < diff )
        diff = source->value[1];
      obj->value[1] += diff;
      source->value[1] -= diff;
      act( AT_ACTION, "You fill $p from $P.", ch, obj, source, TO_CHAR );
      act( AT_ACTION, "$n fills $p from $P.", ch, obj, source, TO_ROOM );
      return;
    case ITEM_DRINK_CON:
      if ( obj->value[1] != 0 && obj->value[2] != source->value[2] )
        {
          send_to_char( "There is already another liquid in it.\r\n", ch );
          return;
        }
      obj->value[2] = source->value[2];
      if ( source->value[1] < diff )
        diff = source->value[1];
      obj->value[1] += diff;
      source->value[1] -= diff;
      act( AT_ACTION, "You fill $p from $P.", ch, obj, source, TO_CHAR );
      act( AT_ACTION, "$n fills $p from $P.", ch, obj, source, TO_ROOM );
      return;
    }
}

void do_drink( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  OBJ_DATA *obj;
  int amount;
  int liquid;

  argument = one_argument( argument, arg );
  /* munch optional words */
  if ( !str_cmp( arg, "from" ) && argument[0] != '\0' )
    argument = one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      for ( obj = ch->in_room->first_content; obj; obj = obj->next_content )
        if ( (obj->item_type == ITEM_FOUNTAIN)
             ||   (obj->item_type == ITEM_BLOOD) )
          break;

      if ( !obj )
        {
          send_to_char( "Drink what?\r\n", ch );
          return;
        }
    }
  else
    {
      if ( ( obj = get_obj_here( ch, arg ) ) == NULL )
        {
          send_to_char( "You can't find it.\r\n", ch );
          return;
        }
    }

  if ( obj->count > 1 && obj->item_type != ITEM_FOUNTAIN )
    separate_obj(obj);

  if ( !IS_NPC(ch) && ch->pcdata->condition[COND_DRUNK] > 40 )
    {
      send_to_char( "You fail to reach your mouth.  *Hic*\r\n", ch );
      return;
    }

  switch ( obj->item_type )
    {
    default:
      if ( obj->carried_by == ch )
        {
          act( AT_ACTION, "$n lifts $p up to $s mouth and tries to drink from it...", ch, obj, NULL, TO_ROOM );
          act( AT_ACTION, "You bring $p up to your mouth and try to drink from it...", ch, obj, NULL, TO_CHAR );
        }
      else
        {
          act( AT_ACTION, "$n gets down and tries to drink from $p... (Is $e feeling ok?)", ch, obj, NULL, TO_ROOM );
          act( AT_ACTION, "You get down on the ground and try to drink from $p...", ch, obj, NULL, TO_CHAR );
        }
      break;

    case ITEM_POTION:
      if ( obj->carried_by == ch )
        do_quaff( ch, obj->name );
      else
        send_to_char( "You're not carrying that.\r\n", ch );
      break;

    case ITEM_FOUNTAIN:
      if ( !oprog_use_trigger( ch, obj, NULL, NULL, NULL ) )
        {
          act( AT_ACTION, "$n drinks from the fountain.", ch, NULL, NULL, TO_ROOM );
          send_to_char( "You take a long thirst quenching drink.\r\n", ch );
        }

      if ( !IS_NPC(ch) )
        ch->pcdata->condition[COND_THIRST] = 40;
      break;

    case ITEM_DRINK_CON:
      if ( obj->value[1] <= 0 )
        {
          send_to_char( "It is already empty.\r\n", ch );
          return;
        }

      if ( ( liquid = obj->value[2] ) >= LIQ_MAX )
        {
          bug( "Do_drink: bad liquid number %d.", liquid );
          liquid = obj->value[2] = 0;
        }

      if ( !oprog_use_trigger( ch, obj, NULL, NULL, NULL ) )
        {
          act( AT_ACTION, "$n drinks $T from $p.",
               ch, obj, liq_table[liquid].liq_name, TO_ROOM );
          act( AT_ACTION, "You drink $T from $p.",
               ch, obj, liq_table[liquid].liq_name, TO_CHAR );
        }

      amount = 1; /* UMIN(amount, obj->value[1]); */
      /* what was this? concentrated drinks?  concentrated water
         too I suppose... sheesh! */

      gain_condition( ch, COND_DRUNK,
                      amount * liq_table[liquid].liq_affect[COND_DRUNK  ] );
      gain_condition( ch, COND_FULL,
                      amount * liq_table[liquid].liq_affect[COND_FULL   ] );
      gain_condition( ch, COND_THIRST,
                      amount * liq_table[liquid].liq_affect[COND_THIRST ] );

      if ( !IS_NPC(ch) )
        {
          if ( ch->pcdata->condition[COND_DRUNK]  > 24 )
            send_to_char( "You feel quite sloshed.\r\n", ch );
          else
            if ( ch->pcdata->condition[COND_DRUNK]  > 18 )
              send_to_char( "You feel very drunk.\r\n", ch );
            else
              if ( ch->pcdata->condition[COND_DRUNK]  > 12 )
                send_to_char( "You feel drunk.\r\n", ch );
              else
                if ( ch->pcdata->condition[COND_DRUNK]  > 8 )
                  send_to_char( "You feel a little drunk.\r\n", ch );
                else
                  if ( ch->pcdata->condition[COND_DRUNK]  > 5 )
                    send_to_char( "You feel light headed.\r\n", ch );

          if ( ch->pcdata->condition[COND_FULL]   > 40 )
            send_to_char( "You are full.\r\n", ch );

          if ( ch->pcdata->condition[COND_THIRST] > 40 )
            send_to_char( "You feel bloated.\r\n", ch );
          else
            if ( ch->pcdata->condition[COND_THIRST] > 36 )
              send_to_char( "Your stomach is sloshing around.\r\n", ch );
            else
              if ( ch->pcdata->condition[COND_THIRST] > 30 )
                send_to_char( "You do not feel thirsty.\r\n", ch );
        }

      if ( obj->value[3] )
        {
          /* The drink was poisoned! */
          AFFECT_DATA af;

          act( AT_POISON, "$n sputters and gags.", ch, NULL, NULL, TO_ROOM );
          act( AT_POISON, "You sputter and gag.", ch, NULL, NULL, TO_CHAR );
          ch->mental_state = URANGE( 20, ch->mental_state + 5, 100 );
          af.type      = gsn_poison;
          af.duration  = 3 * obj->value[3];
          af.location  = APPLY_NONE;
          af.modifier  = 0;
          af.bitvector = AFF_POISON;
          affect_join( ch, &af );
        }

      obj->value[1] -= amount;
      break;
    }
  WAIT_STATE(ch, PULSE_PER_SECOND );
  return;
}

void do_eat( CHAR_DATA *ch, char *argument )
{
  OBJ_DATA *obj;
  ch_ret retcode;
  int foodcond;

  if ( argument[0] == '\0' )
    {
      send_to_char( "Eat what?\r\n", ch );
      return;
    }

  if ( IS_NPC(ch) || ch->pcdata->condition[COND_FULL] > 5 )
    if ( ms_find_obj(ch) )
      return;

  if ( (obj = find_obj(ch, argument, TRUE)) == NULL )
    return;

  if ( !IS_IMMORTAL(ch) )
    {
      if ( obj->item_type != ITEM_FOOD && obj->item_type != ITEM_PILL )
        {
          act( AT_ACTION, "$n starts to nibble on $p... ($e must really be hungry)",  ch, obj, NULL, TO_ROOM );
          act( AT_ACTION, "You try to nibble on $p...", ch, obj, NULL, TO_CHAR );
          return;
        }

      if ( !IS_NPC(ch) && ch->pcdata->condition[COND_FULL] > 40 )
        {
          send_to_char( "You are too full to eat more.\r\n", ch );
          return;
        }
    }

  /* required due to object grouping */
  separate_obj( obj );

  WAIT_STATE( ch, PULSE_PER_SECOND/2 );

  if ( obj->in_obj )
    {
      act( AT_PLAIN, "You take $p from $P.", ch, obj, obj->in_obj, TO_CHAR );
      act( AT_PLAIN, "$n takes $p from $P.", ch, obj, obj->in_obj, TO_ROOM );
    }
  if ( !oprog_use_trigger( ch, obj, NULL, NULL, NULL ) )
    {
      if ( !obj->action_desc || obj->action_desc[0]=='\0' )
        {
          act( AT_ACTION, "$n eats $p.",  ch, obj, NULL, TO_ROOM );
          act( AT_ACTION, "You eat $p.", ch, obj, NULL, TO_CHAR );
        }
      else
        actiondesc( ch, obj, NULL );
    }

  switch ( obj->item_type )
    {

    case ITEM_FOOD:
      if ( obj->timer > 0 && obj->value[1] > 0 )
        foodcond = (obj->timer * 10) / obj->value[1];
      else
        foodcond = 10;

      if ( !IS_NPC(ch) )
        {
          int condition;

          condition = ch->pcdata->condition[COND_FULL];
          gain_condition( ch, COND_FULL, (obj->value[0] * foodcond) / 10 );
          if ( condition <= 1 && ch->pcdata->condition[COND_FULL] > 1 )
            send_to_char( "You are no longer hungry.\r\n", ch );
          else if ( ch->pcdata->condition[COND_FULL] > 40 )
            send_to_char( "You are full.\r\n", ch );
        }

      if (  obj->value[3] != 0
            ||   (foodcond < 4 && number_range( 0, foodcond + 1 ) == 0) )
        {
          /* The food was poisoned! */
          AFFECT_DATA af;

          if ( obj->value[3] != 0 )
            {
              act( AT_POISON, "$n chokes and gags.", ch, NULL, NULL, TO_ROOM );
              act( AT_POISON, "You choke and gag.", ch, NULL, NULL, TO_CHAR );
              ch->mental_state = URANGE( 20, ch->mental_state + 5, 100 );
            }
          else
            {
              act( AT_POISON, "$n gags on $p.", ch, obj, NULL, TO_ROOM );
              act( AT_POISON, "You gag on $p.", ch, obj, NULL, TO_CHAR );
              ch->mental_state = URANGE( 15, ch->mental_state + 5, 100 );
            }

          af.type      = gsn_poison;
          af.duration  = 2 * obj->value[0]
            * (obj->value[3] > 0 ? obj->value[3] : 1);
          af.location  = APPLY_NONE;
          af.modifier  = 0;
          af.bitvector = AFF_POISON;
          affect_join( ch, &af );
        }
      break;

    case ITEM_PILL:
      /* allow pills to fill you, if so desired */
      if ( !IS_NPC(ch) && obj->value[4] )
        {
          int condition;

          condition = ch->pcdata->condition[COND_FULL];
          gain_condition( ch, COND_FULL, obj->value[4] );
          if ( condition <= 1 && ch->pcdata->condition[COND_FULL] > 1 )
            send_to_char( "You are no longer hungry.\r\n", ch );
          else if ( ch->pcdata->condition[COND_FULL] > 40 )
            send_to_char( "You are full.\r\n", ch );
        }
      retcode = obj_cast_spell( obj->value[1], obj->value[0], ch, ch, NULL );
      if ( retcode == rNONE )
        retcode = obj_cast_spell( obj->value[2], obj->value[0], ch, ch, NULL );
      if ( retcode == rNONE )
        retcode = obj_cast_spell( obj->value[3], obj->value[0], ch, ch, NULL );
      break;
    }

  if ( obj->serial == cur_obj )
    global_objcode = rOBJ_EATEN;
  extract_obj( obj );
  return;
}

void do_quaff( CHAR_DATA *ch, char *argument )
{
  OBJ_DATA *obj;
  ch_ret retcode;

  if ( argument[0] == '\0' || !str_cmp(argument, "") )
    {
      send_to_char( "Quaff what?\r\n", ch );
      return;
    }

  if ( (obj = find_obj(ch, argument, TRUE)) == NULL )
    return;

  if ( obj->item_type != ITEM_POTION )
    {
      if ( obj->item_type == ITEM_DRINK_CON )
        do_drink( ch, obj->name );
      else
        {
          act( AT_ACTION, "$n lifts $p up to $s mouth and tries to drink from it...", ch, obj, NULL, TO_ROOM );
          act( AT_ACTION, "You bring $p up to your mouth and try to drink from it...", ch, obj, NULL, TO_CHAR );
        }
      return;
    }

  /*
   * Fullness checking                                  -Thoric
   */
  if ( !IS_NPC(ch)
       && ( ch->pcdata->condition[COND_FULL] >= 48
            ||   ch->pcdata->condition[COND_THIRST] >= 48 ) )
    {
      send_to_char( "Your stomach cannot contain any more.\r\n", ch );
      return;
    }

  separate_obj( obj );
  if ( obj->in_obj )
    {
      act( AT_PLAIN, "You take $p from $P.", ch, obj, obj->in_obj, TO_CHAR );
      act( AT_PLAIN, "$n takes $p from $P.", ch, obj, obj->in_obj, TO_ROOM );
    }

  /*
   * If fighting, chance of dropping potion                     -Thoric
   */
  if ( ch->fighting && number_percent( ) > (get_curr_dex(ch) * 2 + 48) )
    {
      act( AT_MAGIC, "$n accidentally drops $p and it smashes into a thousand fragments.", ch, obj, NULL, TO_ROOM );
      act( AT_MAGIC, "Oops... $p gets knocked from your hands and smashes into pieces!", ch, obj, NULL ,TO_CHAR );
    }
  else
    {
      if ( !oprog_use_trigger( ch, obj, NULL, NULL, NULL ) )
        {
          act( AT_ACTION, "$n quaffs $p.",  ch, obj, NULL, TO_ROOM );
          act( AT_ACTION, "You quaff $p.", ch, obj, NULL, TO_CHAR );
        }

      WAIT_STATE( ch, PULSE_PER_SECOND/4 );

      gain_condition( ch, COND_THIRST, 1 );
      retcode = obj_cast_spell( obj->value[1], obj->value[0], ch, ch, NULL );
      if ( retcode == rNONE )
        retcode = obj_cast_spell( obj->value[2], obj->value[0], ch, ch, NULL );
      if ( retcode == rNONE )
        retcode = obj_cast_spell( obj->value[3], obj->value[0], ch, ch, NULL );
    }
  if ( cur_obj == obj->serial )
    global_objcode = rOBJ_QUAFFED;
  extract_obj( obj );
  return;
}


void do_recite( CHAR_DATA *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  CHAR_DATA *victim;
  OBJ_DATA *scroll;
  OBJ_DATA *obj;
  ch_ret    retcode;

  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );

  if ( arg1[0] == '\0' )
    {
      send_to_char( "Activate what?\r\n", ch );
      return;
    }

  if ( ms_find_obj(ch) )
    return;

  if ( ( scroll = get_obj_carry( ch, arg1 ) ) == NULL )
    {
      send_to_char( "You do not have that item.\r\n", ch );
      return;
    }

  if ( scroll->item_type != ITEM_SCROLL )
    {
      act( AT_ACTION, "$n attempts to activate $p ... the silly fool.",  ch, scroll, NULL, TO_ROOM );
      act( AT_ACTION, "You try to activate $p. (Now what?)", ch, scroll, NULL, TO_CHAR );
      return;
    }

  if ( IS_NPC(ch)
       && (scroll->pIndexData->vnum == OBJ_VNUM_SCROLL_SCRIBING) )
    {
      send_to_char( "As a mob, this dialect is foreign to you.\r\n", ch );
      return;
    }

  if( ( scroll->pIndexData->vnum == OBJ_VNUM_SCROLL_SCRIBING)
      &&(ch->top_level + 10 < scroll->value[0]))
    {
      send_to_char( "This item is too complex for you to understand.\r\n", ch);
      return;
    }

  obj = NULL;
  if ( arg2[0] == '\0' )
    victim = ch;
  else
    {
      if ( ( victim = get_char_room ( ch, arg2 ) ) == NULL
           &&   ( obj    = get_obj_here  ( ch, arg2 ) ) == NULL )
        {
          send_to_char( "You can't find it.\r\n", ch );
          return;
        }
    }

  separate_obj( scroll );
  act( AT_MAGIC, "$n activate $p.", ch, scroll, NULL, TO_ROOM );
  act( AT_MAGIC, "You activate $p.", ch, scroll, NULL, TO_CHAR );


  WAIT_STATE( ch, PULSE_PER_SECOND/2 );

  retcode = obj_cast_spell( scroll->value[1], scroll->value[0], ch, victim, obj );
  if ( retcode == rNONE )
    retcode = obj_cast_spell( scroll->value[2], scroll->value[0], ch, victim, obj );
  if ( retcode == rNONE )
    retcode = obj_cast_spell( scroll->value[3], scroll->value[0], ch, victim, obj );

  if ( scroll->serial == cur_obj )
    global_objcode = rOBJ_USED;
  extract_obj( scroll );
  return;
}


/*
 * Function to handle the state changing of a triggerobject (lever)  -Thoric
 */
void pullorpush( CHAR_DATA *ch, OBJ_DATA *obj, bool pull )
{
  char buf[MAX_STRING_LENGTH];
  CHAR_DATA             *rch;
  bool           isup;
  ROOM_INDEX_DATA       *room,  *to_room = NULL;
  EXIT_DATA             *pexit, *pexit_rev;
  int                    edir;
  char          *txt;

  if ( IS_SET( obj->value[0], TRIG_UP ) )
    isup = TRUE;
  else
    isup = FALSE;
  switch( obj->item_type )
    {
    default:
      sprintf( buf, "You can't %s that!\r\n", pull ? "pull" : "push" );
      send_to_char( buf, ch );
      return;
      break;
    case ITEM_SWITCH:
    case ITEM_LEVER:
    case ITEM_PULLCHAIN:
      if ( (!pull && isup) || (pull && !isup) )
        {
          sprintf( buf, "It is already %s.\r\n", isup ? "up" : "down" );
          send_to_char( buf, ch );
          return;
        }
    case ITEM_BUTTON:
      if ( (!pull && isup) || (pull & !isup) )
        {
          sprintf( buf, "It is already %s.\r\n", isup ? "in" : "out" );
          send_to_char( buf, ch );
          return;
        }
      break;
    }
  if( (pull) && IS_SET(obj->pIndexData->progtypes,PULL_PROG) )
    {
      if ( !IS_SET(obj->value[0], TRIG_AUTORETURN ) )
        REMOVE_BIT( obj->value[0], TRIG_UP );
      oprog_pull_trigger( ch, obj );
      return;
    }
  if( (!pull) && IS_SET(obj->pIndexData->progtypes,PUSH_PROG) )
    {
      if ( !IS_SET(obj->value[0], TRIG_AUTORETURN ) )
        SET_BIT( obj->value[0], TRIG_UP );
      oprog_push_trigger( ch, obj );
      return;
    }

  if ( !oprog_use_trigger( ch, obj, NULL, NULL, NULL ) )
    {
      sprintf( buf, "$n %s $p.", pull ? "pulls" : "pushes" );
      act( AT_ACTION, buf,  ch, obj, NULL, TO_ROOM );
      sprintf( buf, "You %s $p.", pull ? "pull" : "push" );
      act( AT_ACTION, buf, ch, obj, NULL, TO_CHAR );
    }

  if ( !IS_SET(obj->value[0], TRIG_AUTORETURN ) )
    {
      if ( pull )
        REMOVE_BIT( obj->value[0], TRIG_UP );
      else
        SET_BIT( obj->value[0], TRIG_UP );
    }
  if ( IS_SET( obj->value[0], TRIG_TELEPORT )
       ||   IS_SET( obj->value[0], TRIG_TELEPORTALL )
       ||   IS_SET( obj->value[0], TRIG_TELEPORTPLUS ) )
    {
      int flags;

      if ( ( room = get_room_index( obj->value[1] ) ) == NULL )
        {
          bug( "PullOrPush: obj points to invalid room %d", obj->value[1] );
          return;
        }
      flags = 0;
      if ( IS_SET( obj->value[0], TRIG_SHOWROOMDESC ) )
        SET_BIT( flags, TELE_SHOWDESC );
      if ( IS_SET( obj->value[0], TRIG_TELEPORTALL ) )
        SET_BIT( flags, TELE_TRANSALL );
      if ( IS_SET( obj->value[0], TRIG_TELEPORTPLUS ) )
        SET_BIT( flags, TELE_TRANSALLPLUS );

      teleport( ch, obj->value[1], flags );
      return;
    }

  if ( IS_SET( obj->value[0], TRIG_RAND4 )
       ||        IS_SET( obj->value[0], TRIG_RAND6 ) )
    {
      int maxd;

      if ( ( room = get_room_index( obj->value[1] ) ) == NULL )
        {
          bug( "PullOrPush: obj points to invalid room %d", obj->value[1] );
          return;
        }

      if ( IS_SET( obj->value[0], TRIG_RAND4 ) )
        maxd = 3;
      else
        maxd = 5;

      randomize_exits( room, maxd );
      for ( rch = room->first_person; rch; rch = rch->next_in_room )
        {
          send_to_char( "You hear a loud rumbling sound.\r\n", rch );
          send_to_char( "Something seems different...\r\n", rch );
        }
    }
  if ( IS_SET( obj->value[0], TRIG_DOOR ) )
    {
      room = get_room_index( obj->value[1] );
      if ( !room )
        room = obj->in_room;
      if ( !room )
        {
          bug( "PullOrPush: obj points to invalid room %d", obj->value[1] );
          return;
        }
      if ( IS_SET( obj->value[0], TRIG_D_NORTH ) )
        {
          edir = DIR_NORTH;
          txt = "to the north";
        }
      else
        if ( IS_SET( obj->value[0], TRIG_D_SOUTH ) )
          {
            edir = DIR_SOUTH;
            txt = "to the south";
          }
        else
          if ( IS_SET( obj->value[0], TRIG_D_EAST ) )
            {
              edir = DIR_EAST;
              txt = "to the east";
            }
          else
            if ( IS_SET( obj->value[0], TRIG_D_WEST ) )
              {
                edir = DIR_WEST;
                txt = "to the west";
              }
            else
              if ( IS_SET( obj->value[0], TRIG_D_UP ) )
                {
                  edir = DIR_UP;
                  txt = "from above";
                }
              else
                if ( IS_SET( obj->value[0], TRIG_D_DOWN ) )
                  {
                    edir = DIR_DOWN;
                    txt = "from below";
                  }
                else
                  {
                    bug( "PullOrPush: door: no direction flag set.", 0 );
                    return;
                  }
      pexit = get_exit( room, edir );
      if ( !pexit )
        {
          if ( !IS_SET( obj->value[0], TRIG_PASSAGE ) )
            {
              bug( "PullOrPush: obj points to non-exit %d", obj->value[1] );
              return;
            }
          to_room = get_room_index( obj->value[2] );
          if ( !to_room )
            {
              bug( "PullOrPush: dest points to invalid room %d", obj->value[2] );
              return;
            }
          pexit = make_exit( room, to_room, edir );
          pexit->keyword        = STRALLOC( "" );
          pexit->description    = STRALLOC( "" );
          pexit->key            = -1;
          pexit->exit_info      = 0;
          top_exit++;
          act( AT_PLAIN, "A passage opens!", ch, NULL, NULL, TO_CHAR );
          act( AT_PLAIN, "A passage opens!", ch, NULL, NULL, TO_ROOM );
          return;
        }
      if ( IS_SET( obj->value[0], TRIG_UNLOCK )
           &&   IS_SET( pexit->exit_info, EX_LOCKED) )
        {
          REMOVE_BIT(pexit->exit_info, EX_LOCKED);
          act( AT_PLAIN, "You hear a faint click $T.", ch, NULL, txt, TO_CHAR );
          act( AT_PLAIN, "You hear a faint click $T.", ch, NULL, txt, TO_ROOM );
          if ( ( pexit_rev = pexit->rexit ) != NULL
               &&   pexit_rev->to_room == ch->in_room )
            REMOVE_BIT( pexit_rev->exit_info, EX_LOCKED );
          return;
        }
      if ( IS_SET( obj->value[0], TRIG_LOCK   )
           &&  !IS_SET( pexit->exit_info, EX_LOCKED) )
        {
          SET_BIT(pexit->exit_info, EX_LOCKED);
          act( AT_PLAIN, "You hear a faint click $T.", ch, NULL, txt, TO_CHAR );
          act( AT_PLAIN, "You hear a faint click $T.", ch, NULL, txt, TO_ROOM );
          if ( ( pexit_rev = pexit->rexit ) != NULL
               &&   pexit_rev->to_room == ch->in_room )
            SET_BIT( pexit_rev->exit_info, EX_LOCKED );
          return;
        }
      if ( IS_SET( obj->value[0], TRIG_OPEN   )
           &&   IS_SET( pexit->exit_info, EX_CLOSED) )
        {
          REMOVE_BIT(pexit->exit_info, EX_CLOSED);
          for ( rch = room->first_person; rch; rch = rch->next_in_room )
            act( AT_ACTION, "The $d opens.", rch, NULL, pexit->keyword, TO_CHAR );
          if ( ( pexit_rev = pexit->rexit ) != NULL
               &&   pexit_rev->to_room == ch->in_room )
            {
              REMOVE_BIT( pexit_rev->exit_info, EX_CLOSED );
              for ( rch = to_room->first_person; rch; rch = rch->next_in_room )
                act( AT_ACTION, "The $d opens.", rch, NULL, pexit_rev->keyword, TO_CHAR );
            }
          check_room_for_traps( ch, trap_door[edir]);
          return;
        }
      if ( IS_SET( obj->value[0], TRIG_CLOSE   )
           &&  !IS_SET( pexit->exit_info, EX_CLOSED) )
        {
          SET_BIT(pexit->exit_info, EX_CLOSED);
          for ( rch = room->first_person; rch; rch = rch->next_in_room )
            act( AT_ACTION, "The $d closes.", rch, NULL, pexit->keyword, TO_CHAR );
          if ( ( pexit_rev = pexit->rexit ) != NULL
               &&   pexit_rev->to_room == ch->in_room )
            {
              SET_BIT( pexit_rev->exit_info, EX_CLOSED );
              for ( rch = to_room->first_person; rch; rch = rch->next_in_room )
                act( AT_ACTION, "The $d closes.", rch, NULL, pexit_rev->keyword, TO_CHAR );
            }
          check_room_for_traps( ch, trap_door[edir]);
          return;
        }
    }
}


void do_pull( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  OBJ_DATA *obj;

  one_argument( argument, arg );
  if ( arg[0] == '\0' )
    {
      send_to_char( "Pull what?\r\n", ch );
      return;
    }

  if ( ms_find_obj(ch) )
    return;

  if ( ( obj = get_obj_here( ch, arg ) ) == NULL )
    {
      act( AT_PLAIN, "I see no $T here.", ch, NULL, arg, TO_CHAR );
      return;
    }

  pullorpush( ch, obj, TRUE );
}

void do_push( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  OBJ_DATA *obj;

  one_argument( argument, arg );
  if ( arg[0] == '\0' )
    {
      send_to_char( "Push what?\r\n", ch );
      return;
    }

  if ( ms_find_obj(ch) )
    return;

  if ( ( obj = get_obj_here( ch, arg ) ) == NULL )
    {
      act( AT_PLAIN, "I see no $T here.", ch, NULL, arg, TO_CHAR );
      return;
    }

  pullorpush( ch, obj, FALSE );
}

/* pipe commands (light, tamp, smoke) by Thoric */
void do_tamp( CHAR_DATA *ch, char *argument )
{
  OBJ_DATA *pipe_obj;
  char arg[MAX_INPUT_LENGTH];

  one_argument( argument, arg );
  if ( arg[0] == '\0' )
    {
      send_to_char( "Tamp what?\r\n", ch );
      return;
    }

  if ( ms_find_obj(ch) )
    return;

  if ( (pipe_obj = get_obj_carry( ch, arg )) == NULL )
    {
      send_to_char( "You aren't carrying that.\r\n", ch );
      return;
    }
  if ( pipe_obj->item_type != ITEM_PIPE )
    {
      send_to_char( "You can't tamp that.\r\n", ch );
      return;
    }
  if ( !IS_SET( pipe_obj->value[3], PIPE_TAMPED ) )
    {
      act( AT_ACTION, "You gently tamp $p.", ch, pipe_obj, NULL, TO_CHAR );
      act( AT_ACTION, "$n gently tamps $p.", ch, pipe_obj, NULL, TO_ROOM );
      SET_BIT( pipe_obj->value[3], PIPE_TAMPED );
      return;
    }
  send_to_char( "It doesn't need tamping.\r\n", ch );
}

void do_smoke( CHAR_DATA *ch, char *argument )
{
  OBJ_DATA *pipe_obj;
  char arg[MAX_INPUT_LENGTH];

  one_argument( argument, arg );
  if ( arg[0] == '\0' )
    {
      send_to_char( "Smoke what?\r\n", ch );
      return;
    }

  if ( ms_find_obj(ch) )
    return;

  if ( (pipe_obj = get_obj_carry( ch, arg )) == NULL )
    {
      send_to_char( "You aren't carrying that.\r\n", ch );
      return;
    }
  if ( pipe_obj->item_type != ITEM_PIPE )
    {
      act( AT_ACTION, "You try to smoke $p... but it doesn't seem to work.", ch, pipe_obj, NULL, TO_CHAR );
      act( AT_ACTION, "$n tries to smoke $p... (I wonder what $e's been putting his $s pipe_obj?)", ch, pipe_obj, NULL, TO_ROOM );
      return;
    }
  if ( !IS_SET( pipe_obj->value[3], PIPE_LIT ) )
    {
      act( AT_ACTION, "You try to smoke $p, but it's not lit.", ch, pipe_obj, NULL, TO_CHAR );
      act( AT_ACTION, "$n tries to smoke $p, but it's not lit.", ch, pipe_obj, NULL, TO_ROOM );
      return;
    }
  if ( pipe_obj->value[1] > 0 )
    {
      if ( !oprog_use_trigger( ch, pipe_obj, NULL, NULL, NULL ) )
        {
          act( AT_ACTION, "You draw thoughtfully from $p.", ch, pipe_obj, NULL, TO_CHAR );
          act( AT_ACTION, "$n draws thoughtfully from $p.", ch, pipe_obj, NULL, TO_ROOM );
        }

      if ( IS_VALID_HERB( pipe_obj->value[2] ) && pipe_obj->value[2] < top_herb )
        {
          int sn                = pipe_obj->value[2] + TYPE_HERB;
          SKILLTYPE *skill      = get_skilltype( sn );

          WAIT_STATE( ch, skill->beats );
          if ( skill->spell_fun )
            obj_cast_spell( sn, UMIN(skill->min_level, ch->top_level),
                            ch, ch, NULL );
          if ( obj_extracted( pipe_obj ) )
            return;
        }
      else
        bug( "do_smoke: bad herb type %d", pipe_obj->value[2] );

      SET_BIT( pipe_obj->value[3], PIPE_HOT );
      if ( --pipe_obj->value[1] < 1 )
        {
          REMOVE_BIT( pipe_obj->value[3], PIPE_LIT );
          SET_BIT( pipe_obj->value[3], PIPE_DIRTY );
          SET_BIT( pipe_obj->value[3], PIPE_FULLOFASH );
        }
    }
}

void do_light( CHAR_DATA *ch, char *argument )
{
  OBJ_DATA *pipe_obj;
  char arg[MAX_INPUT_LENGTH];

  one_argument( argument, arg );
  if ( arg[0] == '\0' )
    {
      send_to_char( "Light what?\r\n", ch );
      return;
    }

  if ( ms_find_obj(ch) )
    return;

  if ( (pipe_obj = get_obj_carry( ch, arg )) == NULL )
    {
      send_to_char( "You aren't carrying that.\r\n", ch );
      return;
    }
  if ( pipe_obj->item_type != ITEM_PIPE )
    {
      send_to_char( "You can't light that.\r\n", ch );
      return;
    }
  if ( !IS_SET( pipe_obj->value[3], PIPE_LIT ) )
    {
      if ( pipe_obj->value[1] < 1 )
        {
          act( AT_ACTION, "You try to light $p, but it's empty.", ch, pipe_obj, NULL, TO_CHAR );
          act( AT_ACTION, "$n tries to light $p, but it's empty.", ch, pipe_obj, NULL, TO_ROOM );
          return;
        }
      act( AT_ACTION, "You carefully light $p.", ch, pipe_obj, NULL, TO_CHAR );
      act( AT_ACTION, "$n carefully lights $p.", ch, pipe_obj, NULL, TO_ROOM );
      SET_BIT( pipe_obj->value[3], PIPE_LIT );
      return;
    }
  send_to_char( "It's already lit.\r\n", ch );
}

void do_empty( CHAR_DATA *ch, char *argument )
{
  OBJ_DATA *obj;
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];

  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );
  if ( !str_cmp( arg2, "into" ) && argument[0] != '\0' )
    argument = one_argument( argument, arg2 );

  if ( arg1[0] == '\0' )
    {
      send_to_char( "Empty what?\r\n", ch );
      return;
    }
  if ( ms_find_obj(ch) )
    return;

  if ( (obj = get_obj_carry( ch, arg1 )) == NULL )
    {
      send_to_char( "You aren't carrying that.\r\n", ch );
      return;
    }
  if ( obj->count > 1 )
    separate_obj(obj);

  switch( obj->item_type )
    {
    default:
      act( AT_ACTION, "You shake $p in an attempt to empty it...", ch, obj, NULL, TO_CHAR );
      act( AT_ACTION, "$n begins to shake $p in an attempt to empty it...", ch, obj, NULL, TO_ROOM );
      return;
    case ITEM_PIPE:
      act( AT_ACTION, "You gently tap $p and empty it out.", ch, obj, NULL, TO_CHAR );
      act( AT_ACTION, "$n gently taps $p and empties it out.", ch, obj, NULL, TO_ROOM );
      REMOVE_BIT( obj->value[3], PIPE_FULLOFASH );
      REMOVE_BIT( obj->value[3], PIPE_LIT );
      obj->value[1] = 0;
      return;
    case ITEM_DRINK_CON:
      if ( obj->value[1] < 1 )
        {
          send_to_char( "It's already empty.\r\n", ch );
          return;
        }
      act( AT_ACTION, "You empty $p.", ch, obj, NULL, TO_CHAR );
      act( AT_ACTION, "$n empties $p.", ch, obj, NULL, TO_ROOM );
      obj->value[1] = 0;
      return;
    case ITEM_CONTAINER:
      if ( IS_SET(obj->value[1], CONT_CLOSED) )
        {
          act( AT_PLAIN, "The $d is closed.", ch, NULL, obj->name, TO_CHAR );
          return;
        }
      if ( !obj->first_content )
        {
          send_to_char( "It's already empty.\r\n", ch );
          return;
        }
      if ( arg2[0] == '\0' )
        {
          if ( IS_SET( ch->in_room->room_flags, ROOM_NODROP )
               || ( !IS_NPC(ch) &&  IS_SET( ch->act, PLR_LITTERBUG ) ) )
            {
              set_char_color( AT_MAGIC, ch );
              send_to_char( "A magical force stops you!\r\n", ch );
              set_char_color( AT_TELL, ch );
              send_to_char( "Someone tells you, 'No littering here!'\r\n", ch );
              return;
            }
          if ( IS_SET( ch->in_room->room_flags, ROOM_NODROPALL ) )
            {
              send_to_char( "You can't seem to do that here...\r\n", ch );
              return;
            }
          if ( empty_obj( obj, NULL, ch->in_room ) )
            {
              act( AT_ACTION, "You empty $p.", ch, obj, NULL, TO_CHAR );
              act( AT_ACTION, "$n empties $p.", ch, obj, NULL, TO_ROOM );
              if ( IS_SET( sysdata.save_flags, SV_DROP ) )
                save_char_obj( ch );
            }
          else
            send_to_char( "Hmmm... didn't work.\r\n", ch );
        }
      else
        {
          OBJ_DATA *dest = get_obj_here( ch, arg2 );

          if ( !dest )
            {
              send_to_char( "You can't find it.\r\n", ch );
              return;
            }
          if ( dest == obj )
            {
              send_to_char( "You can't empty something into itself!\r\n", ch );
              return;
            }
          if ( dest->item_type != ITEM_CONTAINER )
            {
              send_to_char( "That's not a container!\r\n", ch );
              return;
            }
          if ( IS_SET(dest->value[1], CONT_CLOSED) )
            {
              act( AT_PLAIN, "The $d is closed.", ch, NULL, dest->name, TO_CHAR );
              return;
            }
          separate_obj( dest );
          if ( empty_obj( obj, dest, NULL ) )
            {
              act( AT_ACTION, "You empty $p into $P.", ch, obj, dest, TO_CHAR );
              act( AT_ACTION, "$n empties $p into $P.", ch, obj, dest, TO_ROOM );
              if ( !dest->carried_by
                   &&    IS_SET( sysdata.save_flags, SV_PUT ) )
                save_char_obj( ch );
            }
          else
            act( AT_ACTION, "$P is too full.", ch, obj, dest, TO_CHAR );
        }
      return;
    }
}

/*
 * Apply a salve/ointment                                       -Thoric
 */
void do_apply( CHAR_DATA *ch, char *argument )
{
  OBJ_DATA *obj;
  ch_ret retcode;

  if ( argument[0] == '\0' )
    {
      send_to_char( "Apply what?\r\n", ch );
      return;
    }

  if ( ms_find_obj(ch) )
    return;

  if ( ( obj = get_obj_carry( ch, argument ) ) == NULL )
    {
      send_to_char( "You do not have that.\r\n", ch );
      return;
    }

  if ( obj->item_type != ITEM_SALVE )
    {
      act( AT_ACTION, "$n starts to rub $p on $mself...",  ch, obj, NULL, TO_ROOM );
      act( AT_ACTION, "You try to rub $p on yourself...", ch, obj, NULL, TO_CHAR );
      return;
    }

  separate_obj( obj );

  --obj->value[1];
  if ( !oprog_use_trigger( ch, obj, NULL, NULL, NULL ) )
    {
      if ( !obj->action_desc || obj->action_desc[0]=='\0' )
        {
          act( AT_ACTION, "$n rubs $p onto $s body.",  ch, obj, NULL, TO_ROOM );
          if ( obj->value[1] <= 0 )
            act( AT_ACTION, "You apply the last of $p onto your body.", ch, obj, NULL, TO_CHAR );
          else
            act( AT_ACTION, "You apply $p onto your body.", ch, obj, NULL, TO_CHAR );
        }
      else
        actiondesc( ch, obj, NULL );
    }

  WAIT_STATE( ch, obj->value[2] );
  retcode = obj_cast_spell( obj->value[4], obj->value[0], ch, ch, NULL );
  if ( retcode == rNONE )
    retcode = obj_cast_spell( obj->value[5], obj->value[0], ch, ch, NULL );

  if ( !obj_extracted(obj) && obj->value[1] <= 0 )
    extract_obj( obj );

  return;
}

void actiondesc( CHAR_DATA *ch, OBJ_DATA *obj, void *vo )
{
  char charbuf[MAX_STRING_LENGTH];
  char roombuf[MAX_STRING_LENGTH];
  char *srcptr = obj->action_desc;
  char *charptr = charbuf;
  char *roomptr = roombuf;
  const char *ichar;
  const char *iroom;

  while ( *srcptr != '\0' )
    {
      if ( *srcptr == '$' )
        {
          srcptr++;
          switch ( *srcptr )
            {
            case 'e':
              ichar = "you";
              iroom = "$e";
              break;

            case 'm':
              ichar = "you";
              iroom = "$m";
              break;

            case 'n':
              ichar = "you";
              iroom = "$n";
              break;

            case 's':
              ichar = "your";
              iroom = "$s";
              break;

              /*case 'q':
                iroom = "s";
                break;*/

            default:
              srcptr--;
              *charptr++ = *srcptr;
              *roomptr++ = *srcptr;
              break;
            }
        }
      else if ( *srcptr == '%' && *++srcptr == 's' )
        {
          ichar = "You";
          iroom = IS_NPC( ch ) ? ch->short_descr : ch->name;
        }
      else
        {
          *charptr++ = *srcptr;
          *roomptr++ = *srcptr;
          srcptr++;
          continue;
        }

      while ( ( *charptr = *ichar ) != '\0' )
        {
          charptr++;
          ichar++;
        }

      while ( ( *roomptr = *iroom ) != '\0' )
        {
          roomptr++;
          iroom++;
        }
      srcptr++;
    }

  *charptr = '\0';
  *roomptr = '\0';

  /*
    sprintf( buf, "Charbuf: %s", charbuf );
    log_string_plus( buf, LOG_HIGH, LEVEL_LESSER );
    sprintf( buf, "Roombuf: %s", roombuf );
    log_string_plus( buf, LOG_HIGH, LEVEL_LESSER );
  */

  switch( obj->item_type )
    {
    case ITEM_BLOOD:
    case ITEM_FOUNTAIN:
      act( AT_ACTION, charbuf, ch, obj, ch, TO_CHAR );
      act( AT_ACTION, roombuf, ch, obj, ch, TO_ROOM );
      return;

    case ITEM_DRINK_CON:
      act( AT_ACTION, charbuf, ch, obj, liq_table[obj->value[2]].liq_name, TO_CHAR );
      act( AT_ACTION, roombuf, ch, obj, liq_table[obj->value[2]].liq_name, TO_ROOM );
      return;

    case ITEM_PIPE:
      return;

    case ITEM_ARMOR:
    case ITEM_WEAPON:
    case ITEM_LIGHT:
      act( AT_ACTION, charbuf, ch, obj, ch, TO_CHAR );
      act( AT_ACTION, roombuf, ch, obj, ch, TO_ROOM );
      return;

    case ITEM_FOOD:
    case ITEM_PILL:
      act( AT_ACTION, charbuf, ch, obj, ch, TO_CHAR );
      act( AT_ACTION, roombuf, ch, obj, ch, TO_ROOM );
      return;

    default:
      return;
    }
  return;
}

void do_hail( CHAR_DATA *ch , char *argument )
{
  int vnum;
  long gold = 1;
  bool steal = FALSE;
  ROOM_INDEX_DATA *room;
  char arg[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];
  SHIP_DATA *ship;
  SHIP_DATA *target = NULL;

  argument = one_argument( argument, arg );
  strcpy ( arg2, argument);

  if ( arg[0] != '\0' )
    {
      if ( (ship = ship_from_cockpit(ch->in_room->vnum)) == NULL )

        {
          send_to_char("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
          return;
        }

      if ( arg2[0] == '\0' )
        {
          send_to_char( "&RUsage: hail <ship> <message>\r\n&w", ch);
          return;
        }

      if ( !ship->spaceobject )
        {
          send_to_char( "&RYou need to launch first!\r\n&w", ch);
          return;
        }

      target = get_ship_here( arg,ship );


      if (  target == NULL )

        {
          send_to_char("&RThat ship isn't here!\r\n",ch);
          return;
        }
      if (  target == ship )
        {
          send_to_char("&RWhy don't you just say it?\r\n",ch);
          return;
        }
      if (abs(target->vx - ship->vx) > 100*(ship->sensor+10)*((target->class)+1 ))
        if ( abs(target->vx - ship->vx) > 100*((ship->comm)+(target->comm)+20) ||
             abs(target->vy - ship->vy) > 100*((ship->comm)+(target->comm)+20) ||
             abs(target->vz - ship->vz) > 100*((ship->comm)+(target->comm)+20) )

          {
            send_to_char("&RThat ship is out of the range of your comm system.\r\n&w", ch);
            return;
          }

      strcpy( buf , "You hail the " );
      strcat( buf , target->name );
      strcat( buf , ": &C" );
      strcat( buf , arg2 );
      strcat( buf , "&w\r\n" );

      echo_to_ship( AT_WHITE , ship , buf);


      strcpy( buf , ship->name );
      strcat( buf , " hails you: &C" );
      strcat( buf , arg2 );
      strcat( buf , "&w\r\n" );

      echo_to_ship( AT_WHITE , target , buf);

      return;
    }


  if ( !ch->in_room )
    return;

  if ( ch->position < POS_FIGHTING )
    {
      send_to_char( "You might want to stop fighting first!\r\n", ch );
      return;
    }

  if ( ch->position < POS_STANDING )
    {
      send_to_char( "You might want to stand up first!\r\n", ch );
      return;
    }

  if ( IS_SET( ch->in_room->room_flags , ROOM_INDOORS ) )
    {
      send_to_char( "You'll have to go outside to do that!\r\n", ch );
      return;
    }

  if ( ch->in_room->sector_type != SECT_CITY )
    {
      send_to_char( "There does not seem to be any speeders out here.\r\n", ch );
      return;
    }


  if ( IS_SET( ch->in_room->room_flags , ROOM_SPACECRAFT ) )
    {
      send_to_char( "You can't do that on spacecraft!\r\n", ch );
      return;
    }

  if( ch->top_level < 6 )
    gold = 0;

  if ( gold )
    gold = 500*ch->top_level/50;

  if ( ch->gold < gold )
    {
      send_to_char( "You don't have enough credits!\r\n", ch );
      return;
    }

  if ( gold && number_range( 1, 10 ) == 1 )
    steal = TRUE;

  vnum = ch->in_room->vnum;

  for ( vnum = ch->in_room->area->low_r_vnum  ;  vnum <= ch->in_room->area->hi_r_vnum  ;  vnum++ )
    {
      room = get_room_index ( vnum );

      if ( room != NULL )
        {
          if ( IS_SET(room->room_flags , ROOM_HOTEL ) )
            break;
          else
            room = NULL;
        }
    }

  if ( room == NULL )
    {
      send_to_char( "There doesn't seem to be any taxis nearby!\r\n", ch );
      return;
    }

  ch->gold -= UMAX( gold, 0);
  if( ch->in_room && ch->in_room->area )
    boost_economy( ch->in_room->area, gold );

  act( AT_ACTION, "$n hails a speederbike, and drives off to seek shelter.", ch, NULL, NULL,  TO_ROOM );

  char_from_room( ch );
  char_to_room( ch, room );

  ch_printf( ch, "A speederbike picks you up and drives you to a safe location.\r\nYou pay the driver %d credits.\r\n", gold );
  //  send_to_char( "A speederbike picks you up and drives you to a safe location.\r\nYou pay the driver 20 credits.\r\n\n\n" , ch );
  act( AT_ACTION, "$n $T", ch, NULL, "arrives on a speederbike, gets off and pays the driver before it leaves.",  TO_ROOM );

  if( steal )
    {
      send_to_char( "You realize after the taxi drives off that you are missing a good amount of your credits! Thief!\r\n", ch );
      gold = ch->gold/10;
      ch->gold -= gold;
      if( ch->in_room && ch->in_room->area )
        boost_economy( ch->in_room->area, gold );
      return;
    }


  do_look( ch, "auto" );

}

void do_train( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  CHAR_DATA *mob;
  bool tfound = FALSE;
  bool successful = FALSE;

  if ( IS_NPC(ch) )
    return;

  strcpy( arg, argument );

  switch( ch->substate )
    {
    default:

      if ( arg[0] == '\0' )
        {
          send_to_char( "Train what?\r\n", ch );
          send_to_char( "\r\nChoices: strength, intelligence, wisdom, dexterity, constitution or charisma\r\n", ch );
          return;
        }

      if ( !IS_AWAKE(ch) )
        {
          send_to_char( "In your dreams, or what?\r\n", ch );
          return;
        }

      for ( mob = ch->in_room->first_person; mob; mob = mob->next_in_room )
        if ( IS_NPC(mob) && IS_SET(mob->act, ACT_TRAIN) )
          {
            tfound = TRUE;
            break;
          }

      if ( (!mob) || (!tfound) )
        {
          send_to_char( "You can't do that here.\r\n", ch );
          return;
        }

      if ( str_cmp( arg, "str" ) && str_cmp( arg, "strength" )
           && str_cmp( arg, "dex" ) && str_cmp( arg, "dexterity" )
           && str_cmp( arg, "con" ) && str_cmp( arg, "constitution" )
           && str_cmp( arg, "cha" ) && str_cmp( arg, "charisma" )
           && str_cmp( arg, "wis" ) && str_cmp( arg, "wisdom" )
           && str_cmp( arg, "int" ) && str_cmp( arg, "intelligence" ) )
        {
          do_train ( ch , "" );
          return;
        }

      if ( !str_cmp( arg, "str" ) || !str_cmp( arg, "strength" ) )
        {
          if( mob->perm_str <= ch->perm_str || ch->perm_str >= 20 + race_table[ch->race].str_plus || ch->perm_str >= 25 )
            {
              act( AT_TELL, "$n tells you 'I cannot help you... you are already stronger than I.'",
                   mob, NULL, ch, TO_VICT );
              return;
            }
          send_to_char("&GYou begin your weight training.\r\n", ch);
        }
      if ( !str_cmp( arg, "dex" ) || !str_cmp( arg, "dexterity" ) )
        {
          if( mob->perm_dex <= ch->perm_dex || ch->perm_dex >= 20 + race_table[ch->race].dex_plus || ch->perm_dex >= 25 )
            {
              act( AT_TELL, "$n tells you 'I cannot help you... you are already more dextrous than I.'",
                   mob, NULL, ch, TO_VICT );
              return;
            }
          send_to_char("&GYou begin to work at some challenging tests of coordination.\r\n", ch);
        }
      if ( !str_cmp( arg, "int" ) || !str_cmp( arg, "intelligence" ) )
        {
          if( mob->perm_int <= ch->perm_int || ch->perm_int >= 20 + race_table[ch->race].int_plus || ch->perm_int >= 25 )
            {
              act( AT_TELL, "$n tells you 'I cannot help you... you are already more educated than I.'",
                   mob, NULL, ch, TO_VICT );
              return;
            }
          send_to_char("&GYou begin your studies.\r\n", ch);
        }
      if ( !str_cmp( arg, "wis" ) || !str_cmp( arg, "wisdom" ) )
        {
          if( mob->perm_wis <= ch->perm_wis || ch->perm_wis >= 20 + race_table[ch->race].wis_plus || ch->perm_wis >= 25 )
            {
              act( AT_TELL, "$n tells you 'I cannot help you... you are already far wiser than I.'",
                   mob, NULL, ch, TO_VICT );
              return;
            }
          send_to_char("&GYou begin contemplating several ancient texts in an effort to gain wisdom.\r\n", ch);
        }
      if ( !str_cmp( arg, "con" ) || !str_cmp( arg, "constitution" ) )
        {
          if( mob->perm_con <= ch->perm_con || ch->perm_con >= 20 + race_table[ch->race].con_plus || ch->perm_con >= 25 )
            {
              act( AT_TELL, "$n tells you 'I cannot help you... you are already healthier than I.'",
                   mob, NULL, ch, TO_VICT );
              return;
            }
          send_to_char("&GYou begin your endurance training.\r\n", ch);
        }
      if ( !str_cmp( arg, "cha" ) || !str_cmp( arg, "charisma" ) )
        {
          if( mob->perm_cha <= ch->perm_cha || ch->perm_cha >= 20 + race_table[ch->race].cha_plus || ch->perm_cha >= 25 )
            {
              act( AT_TELL, "$n tells you 'I cannot help you... you already are more charming than I.'",
                   mob, NULL, ch, TO_VICT );
              return;
            }
          send_to_char("&GYou begin lessons in maners and ettiquite.\r\n", ch);
        }
      add_timer ( ch , TIMER_DO_FUN , 10 , do_train , 1 );
      ch->dest_buf = str_dup(arg);
      return;

    case 1:
      if ( !ch->dest_buf )
        return;
      strcpy(arg, ch->dest_buf);
      DISPOSE( ch->dest_buf);
      break;

    case SUB_TIMER_DO_ABORT:
      DISPOSE( ch->dest_buf );
      ch->substate = SUB_NONE;
      send_to_char("&RYou fail to complete your training.\r\n", ch);
      return;
    }

  ch->substate = SUB_NONE;

  if ( number_bits ( 2 ) == 0 )
    {
      successful = TRUE;
    }

  if ( !str_cmp( arg, "str" ) || !str_cmp( arg, "strength" ) )
    {
      if ( !successful )
        {
          send_to_char("&RYou feel that you have wasted alot of energy for nothing...\r\n", ch);
          return;
        }
      send_to_char("&GAfter much of excercise you feel a little stronger.\r\n", ch);
      ch->perm_str++;
      return;
    }

  if ( !str_cmp( arg, "dex" ) || !str_cmp( arg, "dexterity" ) )
    {
      if ( !successful )
        {
          send_to_char("&RAfter all that training you still feel like a clutz...\r\n", ch);
          return;
        }
      send_to_char("&GAfter working hard at many challenging tasks you feel a bit more coordinated.\r\n", ch);
      ch->perm_dex++;
      return;
    }

  if ( !str_cmp( arg, "int" ) || !str_cmp( arg, "intelligence" ) )
    {
      if ( !successful )
        {
          send_to_char("&RHitting the books leaves you only with sore eyes...\r\n", ch);
          return;
        }
      send_to_char("&GAfter much study you feel alot more knowledgeable.\r\n", ch);
      ch->perm_int++;
      return;
    }

  if ( !str_cmp( arg, "wis" ) || !str_cmp( arg, "wisdom" ) )
    {
      if ( !successful )
        {
          send_to_char("&RStudying the ancient texts has left you more confused than wise...\r\n", ch);
          return;
        }
      send_to_char("&GAfter contemplating several seemingly meaningless events you suddenly \r\nreceive a flash of insight into the workings of the universe.\r\n", ch);
      ch->perm_wis++;
      return;
    }

  if ( !str_cmp( arg, "con" ) || !str_cmp( arg, "constitution" ) )
    {
      if ( !successful )
        {
          send_to_char("&RYou spend long a long arobics session ecersising very hard but finish \r\nfeeling only tired and out of breath....\r\n", ch);
          return;
        }
      send_to_char("&GAfter a long tiring excersise session you feel much healthier than before.\r\n", ch);
      ch->perm_con++;
      return;
    }


  if ( !str_cmp( arg, "cha" ) || !str_cmp( arg, "charisma" ) )
    {
      if ( !successful )
        {
          send_to_char("&RYou finish your self improvement session feeling a little depressed.\r\n", ch);
          return;
        }
      send_to_char("&GYou spend some time focusing on how to improve your personality and feel \r\nmuch better about yourself and the ways others see you.\r\n", ch);
      ch->perm_cha++;
      return;
    }

}

void do_suicide( CHAR_DATA *ch, char *argument )
{
  char  logbuf[MAX_STRING_LENGTH];

  OBJ_DATA *obj;

  if ( IS_NPC(ch) || !ch->pcdata )
    {
      send_to_char( "Yeah right!\r\n", ch );
      return;
    }

  if ( argument[0] == '\0' )
    {
      send_to_char( "&RIf you really want to delete this character type suicide and your password.\r\n", ch );
      return;
    }

  if ( strcmp( crypt( argument, ch->pcdata->pwd ), ch->pcdata->pwd ) )
    {
      send_to_char( "Sorry wrong password.\r\n", ch );
      sprintf( logbuf , "%s attempting to commit suicide... WRONG PASSWORD!" , ch->name );
      log_string( logbuf );
      return;
    }

  if ( ( obj = get_eq_char( ch, WEAR_WIELD ) ) == NULL

       ||   ( obj->value[3] != WEAPON_VIBRO_BLADE ) )
    {
      send_to_char( "You need to wield a blade to slit your throat!.\r\n", ch );
      return;
    }

  act( AT_BLOOD, "With a sad determination and trembling hands you slit your own throat!",  ch, NULL, NULL, TO_CHAR    );
  act( AT_BLOOD, "Cold shivers run down your spine as you watch $n slit $s own throat!",  ch, NULL, NULL, TO_ROOM );
  sprintf( logbuf , "%s just committed suicide." , ch->name );
  log_string( logbuf );

  set_cur_char(ch);
  raw_kill( ch, ch );

}

void do_bank( CHAR_DATA *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char arg3[MAX_INPUT_LENGTH];
  long amount = 0;
  CHAR_DATA *victim;
  OBJ_DATA *obj;
  bool ch_comlink = FALSE;

  argument = one_argument( argument , arg1 );
  argument = one_argument( argument , arg2 );
  argument = one_argument( argument , arg3 );

  if ( IS_NPC(ch) || !ch->pcdata )
    return;

  if ( NOT_AUTHED(ch) )
    {
      send_to_char("You can not access your bank account until after you've graduated from the acadamey.\r\n", ch);
      return;
    }

  if ( IS_IMMORTAL( ch ) )
    ch_comlink = TRUE;
  else
    for ( obj = ch->last_carrying; obj; obj = obj->prev_content )
      {
        if (obj->pIndexData->item_type == ITEM_COMLINK)
          ch_comlink = TRUE;
      }

  if ( !ch_comlink )
    {
      if (!ch->in_room || !IS_SET(ch->in_room->room_flags, ROOM_BANK) )
        {
          send_to_char( "You must be in a bank or have a comlink to do that!\r\n", ch );
          return;
        }
    }

  if ( arg1[0] == '\0' )
    {
      send_to_char( "Usage: BANK <deposit|withdraw|balance|transfer> [amount] [recievee]\r\n", ch );
      return;
    }

  if (arg2[0] != '\0' )
    amount = atoi(arg2);

  if ( !str_prefix( arg1 , "deposit" ) )
    {
      if ( amount  <= 0 )
        {
          send_to_char( "You may only deposit amounts greater than zero.\r\n", ch );
          do_bank( ch , "" );
          return;
        }

      if ( ch->gold < amount )
        {
          send_to_char( "You don't have that many credits on you.\r\n", ch );
          return;
        }

      ch->gold -= amount;
      ch->pcdata->bank += amount;

      ch_printf( ch , "You deposit %ld credits into your account.\r\n" ,amount );
      return;
    }
  else if ( !str_prefix( arg1 , "withdrawl" ) )
    {
      if ( amount  <= 0 )
        {
          send_to_char( "You may only withdraw amounts greater than zero.\r\n", ch );
          do_bank( ch , "" );
          return;
        }

      if ( ch->pcdata->bank < amount )
        {
          send_to_char( "You don't have that many credits in your account.\r\n", ch );
          return;
        }

      ch->gold += amount;
      ch->pcdata->bank -= amount;

      ch_printf( ch , "You withdraw %ld credits from your account.\r\n" ,amount );
      return;

    }
  else if ( !str_prefix( arg1 , "balance" ) )
    {
      ch_printf( ch , "You have %ld credits in your account.\r\n" , ch->pcdata->bank );
      return;
    }
  else if ( !str_prefix( arg1 , "transfer" ) )
    {
      if( ( ( victim = get_char_world(ch, arg3) ) == NULL ))
        {
          send_to_char("No such player online.\r\n", ch);
          return;
        }

      if( ( IS_NPC(victim)))
        {
          send_to_char("No such player online.\r\n", ch);
          return;
        }


      if ( amount  <= 0 )
        {
          send_to_char( "You may only transfer amounts greater than zero.\r\n", ch );
          do_bank( ch , "" );
          return;
        }

      if ( ch->pcdata->bank < amount )
        {
          send_to_char( "You don't have that many credits in your account.\r\n", ch );
          return;
        }

      ch->pcdata->bank -= amount;
      victim->pcdata->bank += amount;

      ch_printf( ch , "You transfer %ld credits to %s's account.\r\n" ,amount, victim->name );
      ch_printf( victim , "%s transfers %ld credits to your account.\r\n" , ch->name , amount);
      return;

    }
  else
    {
      do_bank( ch , "" );
      return;
    }


}

bool check_bad_name( char *name ){
  /* Problems with the badname snippet? Contact kre@iname.com */  FILE *fp;
  char *ln;
  if ( (fp = fopen(BAD_NAME_FILE,"r")) == NULL) {
    bug("Bad Name file missing. Creating.");
    fp = fopen(BAD_NAME_FILE,"w+");
    fprintf(fp,"ShitEater~\n");
    fprintf(fp,"$~");
    fclose(fp);
    return FALSE;
  }

  while (!feof(fp))
    {
      ln = fread_string_nohash(fp);
      if (is_name(name,ln))
        {
          fclose(fp);
          return TRUE;
        }
      if (is_name("$",ln))
        {
          fclose(fp);
          return FALSE;
        }
    }
  fclose(fp);
  return FALSE;
}

int add_bad_name(char *name)
{
  FILE *fp;
  char *ln;
  fpos_t pos;

  if (check_bad_name(name))
    return 0;

  if ((fp = fopen(BAD_NAME_FILE,"r+")) == NULL)
    {
      bug("Error opening Bad Name file.");
      return -1;
    }

  ln = fread_string_nohash(fp);
  while(!is_name("$",ln) && !feof(fp))
    ln = fread_string_nohash(fp);

  /* Delete the $~ from the end of the file */
  fgetpos(fp, &pos);

  fsetpos(fp, &pos -2);
  fsetpos(fp, &pos);
  fprintf(fp,"%s~\n",name);
  fprintf(fp,"$~");
  fclose(fp);
  return 1;
}

void do_buzz (CHAR_DATA *ch, char *arg)
{
  short exit_dir;
  ROOM_INDEX_DATA *home;
  EXIT_DATA *exitdat;

  if ( !str_cmp( arg, "n"  ) || !str_cmp( arg, "north"     ) )
    exit_dir = DIR_NORTH;
  else if ( !str_cmp( arg, "e"  ) || !str_cmp( arg, "east"      ) )
    exit_dir = DIR_EAST;
  else if ( !str_cmp( arg, "s"  ) || !str_cmp( arg, "south"     ) )
    exit_dir = DIR_SOUTH;
  else if ( !str_cmp( arg, "w"  ) || !str_cmp( arg, "west"      ) )
    exit_dir = DIR_WEST;
  else if ( !str_cmp( arg, "u"  ) || !str_cmp( arg, "up"        ) )
    exit_dir = DIR_UP;
  else if ( !str_cmp( arg, "d"  ) || !str_cmp( arg, "down"      ) )
    exit_dir = DIR_DOWN;
  else if ( !str_cmp( arg, "ne" ) || !str_cmp( arg, "northeast" ) )
    exit_dir = DIR_NORTHEAST;
  else if ( !str_cmp( arg, "nw" ) || !str_cmp( arg, "northwest" ) )
    exit_dir = DIR_NORTHWEST;
  else if ( !str_cmp( arg, "se" ) || !str_cmp( arg, "southeast" ) )
    exit_dir = DIR_SOUTHEAST;
  else if ( !str_cmp( arg, "sw" ) || !str_cmp( arg, "southwest" ) )
    exit_dir = DIR_SOUTHWEST;
  else
    {
      send_to_char("&RBuzz the home in what direction?\r\n",ch);
      return;
    }

  exitdat = get_exit(ch->in_room, exit_dir);

  if ( exitdat == NULL )
    {
      send_to_char("&RYou can't do that.\r\n",ch);
      return;
    }

  home = exitdat->to_room;

  if ( IS_SET(home->room_flags,ROOM_EMPTY_HOME) )
    {
      send_to_char("&RThat home isn't owned by anyone.\r\n",ch);
      return;
    }

  if ( !IS_SET(home->room_flags,ROOM_PLR_HOME) )
    {
      send_to_char("&RThat isn't a home.\r\n",ch);
      return;
    }

  ch->buzzed_from_room = ch->in_room;

  echo_to_room(AT_WHITE,home,"The door buzzer sounds.\r\n");
  send_to_char("You press the door buzzer.\r\n",ch);
  act(AT_ACTION,"$n presses a door buzzer.",ch,NULL,NULL,TO_ROOM);
}

void do_invite(CHAR_DATA *ch, char *argument)
{
  ROOM_INDEX_DATA *home;
  CHAR_DATA *victim;

  home = ch->in_room;

  if ( !IS_SET(home->room_flags,ROOM_PLR_HOME) || home != ch->plr_home )
    {
      send_to_char("&RThis isn't your home!\r\n",ch);
      return;
    }

  if ( argument[0] == '\0' )
    {
      send_to_char("&RInvite who?\r\n",ch);
      return;
    }

  if ( (victim = get_char_world(ch,argument)) == NULL )
    {
      send_to_char("&RThey aren't here.\r\n",ch);
      return;
    }

  if ( victim->buzzed_from_room == NULL && victim->buzzed_home != home )
    {
      send_to_char("&RThey didn't buzz your home.\r\n",ch);
      return;
    }

  if ( victim->buzzed_from_room != victim->in_room )
    {
      send_to_char("&RThey aren't outside your home anymore.\r\n",ch);
      return;
    }

  act(AT_ACTION,"You invite $N to enter, and $E steps inside.",ch,NULL,victim,TO_CHAR);
  act(AT_ACTION,"$n invites you to enter, and you step inside.",ch,NULL,victim,TO_VICT);
  char_from_room(victim);
  char_to_room(victim,home);
  victim->buzzed_home = NULL;
  victim->buzzed_from_room = NULL;
}

void do_sellhome (CHAR_DATA *ch, char *argument)
{
  /* Added by Ulysses, Dec '99/Jan '00 */

  /* changed it so you can change the variable faster and easier. Darrik Vequir */

  int sellHomeCreditReturn = 50000;

  ROOM_INDEX_DATA *room;

  if ( ch->plr_home == NULL )
    {
      send_to_char("&RYou don't own a home.\r\n",ch);
      return;
    }

  if ( (room = ch->in_room) != ch->plr_home )
    {
      send_to_char("&RYou need to be inside your home to sell it.\r\n",ch);
      return;
    }

  if ( IS_SET(ch->act,PLR_HOME_RESIDENT) )
    {
      send_to_char("&RYou are not the owner of this home.\r\n",ch);
      return;
    }

  STRFREE(room->name);
  room->name = STRALLOC("An Empty Apartment");
  ch->gold += sellHomeCreditReturn;
  REMOVE_BIT(room->room_flags,ROOM_PLR_HOME);
  SET_BIT(room->room_flags,ROOM_EMPTY_HOME);
  fold_area(room->area,room->area->filename,FALSE);
  ch->plr_home = NULL;
  do_save(ch,"");
  ch_printf(ch,"You sell your home. You receive %d credits.\r\n",sellHomeCreditReturn);
}


void do_addresident(CHAR_DATA *ch, char *argument)
{
  ROOM_INDEX_DATA *home;
  CHAR_DATA *victim;

  home = ch->in_room;

  if ( !IS_SET(home->room_flags,ROOM_PLR_HOME) || home != ch->plr_home )
    {
      send_to_char("&RThis isn't your home!\r\n",ch);
      return;
    }

  if ( IS_SET(ch->act,PLR_HOME_RESIDENT) )
    {
      send_to_char("&RYou are not the owner of this home.\r\n",ch);
      return;
    }

  if ( argument[0] == '\0' )
    {
      send_to_char("&RAdd who as a resident?\r\n",ch);
      return;
    }

  if ( (victim = get_char_room(ch,argument)) == NULL )
    {
      send_to_char("&RThey aren't here.\r\n",ch);
      return;
    }

  if ( victim == ch )
    {
      send_to_char("&RNot only are you a resident of this home, but you are its owner.\r\n",ch);
      return;
    }

  if ( victim->plr_home != NULL )
    {
      send_to_char("&RThat player already has a home.\r\n",ch);
      return;
    }

  victim->plr_home = home;
  SET_BIT(victim->act,PLR_HOME_RESIDENT);
  do_save(victim,"");

  act(AT_PLAIN,"You add $N as a resident.",ch,NULL,victim,TO_CHAR);
  send_to_char("You are now a resident of this home.\r\n",victim);
}

void do_remresident(CHAR_DATA *ch, char *argument)
{
  ROOM_INDEX_DATA *home;
  CHAR_DATA *victim;

  home = ch->in_room;

  if ( !IS_SET(home->room_flags,ROOM_PLR_HOME) || home != ch->plr_home )
    {
      send_to_char("&RThis isn't your home!\r\n",ch);
      return;
    }

  if ( IS_SET(ch->act,PLR_HOME_RESIDENT) )
    {
      send_to_char("&RYou are not the owner of this home.\r\n",ch);
      return;
    }

  if ( argument[0] == '\0' )
    {
      send_to_char("&RRemove which resident?\r\n",ch);
      return;
    }

  if ( (victim = get_char_room(ch,argument)) == NULL )
    {
      send_to_char("&RThey aren't here.\r\n",ch);
      return;
    }

  if ( victim == ch )
    {
      send_to_char("&RYou are the home owner. Use sellhome to sell it.\r\n",ch);
      return;
    }

  if ( !IS_SET(victim->act,PLR_HOME_RESIDENT) || victim->plr_home != home )
    {
      send_to_char("&RThat player is not a resident of your home.\r\n",ch);
      return;
    }

  victim->plr_home = NULL;
  REMOVE_BIT(victim->act,PLR_HOME_RESIDENT);
  do_save(victim,"");

  act(AT_PLAIN,"You remove $N as a resident.",ch,NULL,victim,TO_CHAR);
  send_to_char("You are no longer a resident of this home.\r\n",victim);
}


/* The main quest function */

void do_aquest(CHAR_DATA *ch, char *argument)
{
  CHAR_DATA *questman;
  OBJ_DATA *obj=NULL, *obj_next;
  OBJ_INDEX_DATA *obj1, *obj2, *obj3, *obj4, *obj5;
  OBJ_INDEX_DATA *questinfoobj;
  MOB_INDEX_DATA *questinfo;
  char buf [MAX_STRING_LENGTH];
  char arg1 [MAX_INPUT_LENGTH];
  char arg2 [MAX_INPUT_LENGTH];

  argument = one_argument(argument, arg1);
  argument = one_argument(argument, arg2);

  if (!strcmp(arg1, "info"))
    {
      if (IS_SET(ch->act, PLR_QUESTOR))
        {
          if (ch->questmob == -1 && ch->questgiver->short_descr != NULL)
            {
              sprintf(buf, "Your quest is ALMOST complete!\r\nGet back to %s before your time runs out!\r\n",ch->questgiver->short_descr);
              send_to_char(buf, ch);
            }
          else if (ch->questobj > 0)
            {
              questinfoobj = get_obj_index(ch->questobj);
              if (questinfoobj != NULL)
                {
                  sprintf(buf, "You are on a quest to recover the fabled %s!\r\n",questinfoobj->name);
                  send_to_char(buf, ch);
                }
              else send_to_char("You aren't currently on a quest.\r\n",ch);
              return;
            }
          else if (ch->questmob > 0)
            {
              questinfo = get_mob_index(ch->questmob);
              if (questinfo != NULL)
                {
                  sprintf(buf, "You are on a quest to slay the dreaded %s!\r\n",questinfo->short_descr);
                  send_to_char(buf, ch);
                }
              else send_to_char("You aren't currently on a quest.\r\n",ch);
              return;
            }
        }
      else
        send_to_char("You aren't currently on a quest.\r\n",ch);
      return;
    }
  if (!strcmp(arg1, "points"))
    {
      sprintf(buf, "You have %d quest points.\r\n",ch->questpoints);
      send_to_char(buf, ch);
      return;
    }
  else if (!strcmp(arg1, "time"))
    {
      if (!IS_SET(ch->act, PLR_QUESTOR))
        {
          send_to_char("You aren't currently on a quest.\r\n",ch);
          if (ch->nextquest > 1)
            {
              sprintf(buf, "There are %d minutes remaining until you can go on another quest.\r\n",ch->nextquest);
              send_to_char(buf, ch);
            }
          else if (ch->nextquest == 1)
            {
              sprintf(buf, "There is less than a minute remaining until you can go on another quest.\r\n");
              send_to_char(buf, ch);
            }
        }
      else if (ch->countdown > 0)
        {
          sprintf(buf, "Time left for current quest: %d\r\n",ch->countdown);
          send_to_char(buf, ch);
        }
      return;
    }

  /* Checks for a character in the room with spec_questmaster set. This special
     procedure must be defined in special.c. You could instead use an
     ACT_QUESTMASTER flag instead of a special procedure. */

  for ( questman = ch->in_room->first_person; questman != NULL; questman = questman->next_in_room )
    {
      if (!IS_NPC(questman)) continue;
      if (questman->spec_fun == spec_lookup( "spec_questmaster" )) break;
    }

  if (questman == NULL || questman->spec_fun != spec_lookup( "spec_questmaster" ))
    {
      send_to_char("You can't do that here.\r\n",ch);
      return;
    }

  if ( questman->position == POS_FIGHTING)
    {
      send_to_char("Wait until the fighting stops.\r\n",ch);
      return;
    }

  ch->questgiver = questman;

  /* And, of course, you will need to change the following lines for YOUR
     quest item information. Quest items on Moongate are unbalanced, very
     very nice items, and no one has one yet, because it takes awhile to
     build up quest points :> Make the item worth their while. */


  obj1 = get_obj_index(QUEST_ITEM1);
  obj2 = get_obj_index(QUEST_ITEM2);
  obj3 = get_obj_index(QUEST_ITEM3);
  obj4 = get_obj_index(QUEST_ITEM4);
  obj5 = get_obj_index(QUEST_ITEM5);

  if ( obj1 == NULL || obj2 == NULL || obj3 == NULL || obj4 == NULL || obj5 == NULL )
    {
      bug("Error loading quest objects. Char: ", ch->name);
      return;
    }

  if (!strcmp(arg1, "list"))
    {
      act(AT_PLAIN,"$n asks $N for a list of quest items.",ch,NULL,questman,TO_ROOM);
      act(AT_PLAIN,"You ask $N for a list of quest items.",ch,NULL,questman,TO_CHAR);
      sprintf(buf, "Current Quest Items available for Purchase:\r\n\r\n\
[1] %dqp.......%s\r\n\
[2] %dqp.......%s\r\n\
[3] %dqp........%s\r\n\
[4] %dqp........%s\r\n\
[5] %dqp......%s\r\n\
[6] 500qp........100,000 gold pieces\r\n\
[7] 500qp........10 health points\r\n",
              QUEST_VALUE1, obj1->short_descr, QUEST_VALUE2, obj2->short_descr,
              QUEST_VALUE3, obj3->short_descr, QUEST_VALUE4, obj4->short_descr,
              QUEST_VALUE5, obj5->short_descr);

      send_to_char(buf, ch);
      return;
    }

  else if (!strcmp(arg1, "buy"))
    {
      if (arg2[0] == '\0')
        {
          send_to_char("To buy an item, type 'QUEST BUY <item>'.\r\n",ch);
          return;
        }
      if (is_name(arg2, "1"))
        {
          if (ch->questpoints >= QUEST_VALUE1)
            {
              ch->questpoints -= QUEST_VALUE1;
              obj = create_object(get_obj_index(QUEST_ITEM1),ch->top_level);
            }
          else
            {
              sprintf(buf, "Sorry, %s, but you don't have enough quest points for that.",ch->name);
              do_say(questman,buf);
              return;
            }
        }
      else if (is_name(arg2, "2"))
        {
          if (ch->questpoints >= QUEST_VALUE2)
            {
              ch->questpoints -= QUEST_VALUE2;
              obj = create_object(get_obj_index(QUEST_ITEM2),ch->top_level);
            }
          else
            {
              sprintf(buf, "Sorry, %s, but you don't have enough quest points for that.",ch->name);
              do_say(questman,buf);
              return;
            }
        }
      else if (is_name(arg2, "3"))
        {
          if (ch->questpoints >= QUEST_VALUE3)
            {
              ch->questpoints -= QUEST_VALUE3;
              obj = create_object(get_obj_index(QUEST_ITEM3),ch->top_level);
            }
          else
            {
              sprintf(buf, "Sorry, %s, but you don't have enough quest points for that.",ch->name);
              do_say(questman,buf);
              return;
            }
        }
      else if (is_name(arg2, "4"))
        {
          if (ch->questpoints >= QUEST_VALUE4)
            {
              ch->questpoints -= QUEST_VALUE4;
              obj = create_object(get_obj_index(QUEST_ITEM4),ch->top_level);
            }
          else
            {
              sprintf(buf, "Sorry, %s, but you don't have enough quest points for that.",ch->name);
              do_say(questman,buf);
              return;
            }
        }
      else if (is_name(arg2, "5"))
        {
          if (ch->questpoints >= QUEST_VALUE5)
            {
              ch->questpoints -= QUEST_VALUE5;
              obj = create_object(get_obj_index(QUEST_ITEM5),ch->top_level);
            }
          else
            {
              sprintf(buf, "Sorry, %s, but you don't have enough quest points for that.",ch->name);
              do_say(questman,buf);
              return;
            }
        }
      else if (is_name(arg2, "6"))
        {
          if (ch->questpoints >= 500)
            {
              ch->questpoints -= 500;
              ch->gold += 100000;
              act(AT_MAGIC,"$N gives a pouch of gold to $n.", ch, NULL,
                  questman, TO_ROOM );
              act(AT_MAGIC,"$N hands you a pouch of gold pieces.",   ch, NULL,
                  questman, TO_CHAR );
              return;
            }
          else
            {
              sprintf(buf, "Sorry, %s, but you don't have enough quest points for that.",ch->name);
              do_say(questman,buf);
              return;
            }
        }
      else if (is_name(arg2, "7"))
        {
          if (ch->questpoints >= 750)
            {
              ch->questpoints -= 750;
              ch->max_hit += 10;
              act(AT_MAGIC,"$N waves his hand over $n. $n looks stronger.", ch, NULL,
                  questman, TO_ROOM );
              act(AT_MAGIC,"$N waves his hand over you. You feel stronger.",   ch, NULL,
                  questman, TO_CHAR );
              return;
            }
          else
            {
              sprintf(buf, "Sorry, %s, but you don't have enough quest points for that.",ch->name);
              do_say(questman,buf);
              return;
            }
        }
      else
        {
          sprintf(buf, "I don't have that item, %s.",ch->name);
          do_say(questman, buf);
        }
      if (obj != NULL)
        {
          act(AT_PLAIN,"$N gives something to $n.", ch, obj, questman, TO_ROOM );
          act(AT_PLAIN,"$N gives you your reward.",   ch, obj, questman, TO_CHAR );
          obj_to_char(obj, ch);
        }
      return;
    }
  else if (!strcmp(arg1, "request"))
    {

      sprintf(buf, "Do to extreme stupidity of its system, the quest system has been removed\r\nThere are other ways to gain quest points now!");
      do_say(questman, buf);
      return;

      act(AT_PLAIN,"$n asks $N for a quest.", ch, NULL, questman, TO_ROOM);
      act(AT_PLAIN,"You ask $N for a quest.",ch, NULL, questman, TO_CHAR);
      if (IS_SET(ch->act, PLR_QUESTOR))
        {
          sprintf(buf, "But you're already on a quest!\r\nBetter hurry up and finish it!");
          do_say(questman, buf);
          return;
        }
      if (ch->nextquest > 0)
        {
          sprintf(buf, "You're very brave, %s, but let someone else have a chance.",ch->name);
          do_say(questman, buf);
          sprintf(buf, "Come back later.");
          do_say(questman, buf);
          return;
        }

      sprintf(buf, "Thank you, brave %s!",ch->name);
      do_say(questman, buf);

      generate_quest(ch, questman);

      if (ch->questmob > 0 || ch->questobj > 0)
        {
          ch->countdown = number_range(10,30);
          SET_BIT(ch->act, PLR_QUESTOR);
          sprintf(buf, "You have %d minutes to complete this quest.",ch->countdown);
          do_say(questman, buf);
          sprintf(buf, "May the gods go with you!");
          do_say(questman, buf);
        }
      return;
    }
  else if (!strcmp(arg1, "complete"))
    {
      act(AT_PLAIN,"$n informs $N $e has completed $s quest.", ch, NULL, questman,
          TO_ROOM);
      act(AT_PLAIN,"You inform $N you have completed $s quest.",ch, NULL,
          questman, TO_CHAR);
      if (ch->questgiver != questman)
        {
          sprintf(buf, "I never sent you on a quest! Perhaps you're thinking of someone else.");
          do_say(questman,buf);
          return;
        }

      if (IS_SET(ch->act, PLR_QUESTOR))
        {
          if (ch->questmob == -1 && ch->countdown > 0)
            {
              int reward, pointreward;

              reward = number_range(5000,10000);
              pointreward = number_range(1,5);

              sprintf(buf, "Congratulations on completing your quest!");
              do_say(questman,buf);
              sprintf(buf,"As a reward, I am giving you %d quest points, and %d gold.",pointreward,reward);
              do_say(questman,buf);

              REMOVE_BIT(ch->act, PLR_QUESTOR);
              ch->questgiver = NULL;
              ch->countdown = 0;
              ch->questmob = 0;
              ch->questobj = 0;
              ch->nextquest = 30;
              ch->gold += reward;
              ch->questpoints += pointreward;

              return;
            }
          else if (ch->questobj > 0 && ch->countdown > 0)
            {
              bool obj_found = FALSE;

              for (obj = ch->first_carrying; obj != NULL; obj=obj_next)
                {
                  obj_next = obj->next;

                  if ( obj->carried_by == ch )
                    if (obj != NULL && obj->pIndexData->vnum == ch->questobj)
                      {
                        obj_found = TRUE;
                        break;
                      }
                }
              if (obj_found == TRUE)
                {
                  int reward, pointreward;

                  reward = number_range(5000,10000);
                  pointreward = number_range(1,5);

                  act(AT_PLAIN,"You hand $p to $N.",ch, obj, questman, TO_CHAR);
                  act(AT_PLAIN,"$n hands $p to $N.",ch, obj, questman, TO_ROOM);

                  sprintf(buf, "Congratulations on completing your quest!");
                  do_say(questman,buf);
                  sprintf(buf,"As a reward, I am giving you %d quest points, and %d gold.",pointreward,reward);
                  do_say(questman,buf);

                  REMOVE_BIT(ch->act, PLR_QUESTOR);
                  ch->questgiver = NULL;
                  ch->countdown = 0;
                  ch->questmob = 0;
                  ch->questobj = 0;
                  ch->nextquest = 30;
                  ch->gold += reward;
                  ch->questpoints += pointreward;
                  extract_obj(obj);
                  return;
                }
              else
                {
                  sprintf(buf, "You haven't completed the quest yet, but there is still time!");
                  do_say(questman, buf);
                  return;
                }
              return;
            }
          else if ((ch->questmob > 0 || ch->questobj > 0) && ch->countdown > 0)
            {
              sprintf(buf, "You haven't completed the quest yet, but there is still time!");
              do_say(questman, buf);
              return;
            }
        }
      if (ch->nextquest > 0)
        sprintf(buf,"But you didn't complete your quest in time!");
      else sprintf(buf, "You have to REQUEST a quest first, %s.",ch->name);
      do_say(questman, buf);
      return;
    }

  send_to_char("QUEST commands: POINTS INFO TIME REQUEST COMPLETE LIST BUY.\r\n",ch);
  send_to_char("For more information, type 'HELP QUEST'.\r\n",ch);
  return;
}

void generate_quest(CHAR_DATA *ch, CHAR_DATA *questman)
{
  CHAR_DATA *victim;
  MOB_INDEX_DATA *vsearch;
  ROOM_INDEX_DATA *room;
  OBJ_DATA *questitem;
  char buf[MAX_STRING_LENGTH];
  long mcounter;
  int level_diff, mob_vnum;
  bool noquest = FALSE;

  /*  Randomly selects a mob from the world mob list. If you don't
      want a mob to be selected, make sure it is immune to summon.
      Or, you could add a new mob flag called ACT_NOQUEST. The mob
      is selected for both mob and obj quests, even tho in the obj
      quest the mob is not used. This is done to assure the level
      of difficulty for the area isn't too great for the player. */

  for (mcounter = 0; mcounter < 99999; mcounter ++)
    {
      mob_vnum = number_range(50, 32600);

      if ( (vsearch = get_mob_index(mob_vnum) ) != NULL )
        {
          level_diff = vsearch->level - ch->top_level;

          /* Level differences to search for. Moongate has 350
             levels, so you will want to tweak these greater or
             less than statements for yourself. - Vassago */


          /*
            if( (room = find_location( ch, vsearch->player_name )) != NULL
            && room->area && IS_SET( room->area->flags, AFLAG_NOQUEST ) )
            noquest = TRUE;
          */

          if (((level_diff < -5 && level_diff > -5)
               || (ch->top_level > 30 && ch->top_level < 40 && vsearch->level > 30 && vsearch->level < 54)
               || (ch->top_level > 40 && vsearch->level > 40))
              && IS_EVIL(vsearch)
              && vsearch->pShop == NULL
              && vsearch->rShop == NULL
              && !IS_SET(vsearch->act,ACT_TRAIN)
              && !IS_SET(vsearch->act,ACT_PRACTICE)
              && !IS_SET(vsearch->act,ACT_IMMORTAL)
              && qchance(35) && !noquest )

            break;


          else vsearch = NULL;
        }
    }

  if ( vsearch == NULL || ( victim = get_char_world( ch, vsearch->player_name ) ) == NULL || !IS_NPC(victim))
    {
      sprintf(buf, "I'm sorry, but I don't have any quests for you at this time.");
      do_say(questman, buf);
      sprintf(buf, "Try again later.");
      do_say(questman, buf);
      ch->nextquest = 5;
      return;
    }

  if ( ( room = find_location( ch, victim->name) )== NULL )
    {
      sprintf(buf, "I'm sorry, but I don't have any quests for you at this time.");
      do_say(questman, buf);
      sprintf(buf, "Try again later.");
      do_say(questman, buf);
      ch->nextquest = 5;
      return;
    }

  /*  40% chance it will send the player on a 'recover item' quest. */

  if (qchance(40))
    {
      int objvnum = 0;

      switch(number_range(0,4))
        {
        case 0:
          objvnum = QUEST_OBJQUEST1;
          break;

        case 1:
          objvnum = QUEST_OBJQUEST2;
          break;

        case 2:
          objvnum = QUEST_OBJQUEST3;
          break;

        case 3:
          objvnum = QUEST_OBJQUEST4;
          break;

        case 4:
          objvnum = QUEST_OBJQUEST5;
          break;
        }

      questitem = create_object( get_obj_index(objvnum), ch->top_level );
      obj_to_room(questitem, room);
      questitem->timer = 30;
      ch->questobj = questitem->pIndexData->vnum;

      sprintf(buf, "Vile pilferers have stolen %s from the treasury!",questitem->short_descr);
      do_say(questman, buf);
      do_say(questman, "My court wizardess, with her magic mirror, has pinpointed its location.");

      /* I changed my area names so that they have just the name of the area
         and none of the level stuff. You may want to comment these next two
         lines. - Vassago */

      sprintf(buf, "Look in the general area of %s for %s!",room->area->name, room->name);
      do_say(questman, buf);
      return;
    }

  /* Quest to kill a mob */

  else
    {
      switch(number_range(0,1))
        {
        case 0:
          sprintf(buf, "An enemy of ours, %s, is making vile threats against my master.",victim->short_descr);
          do_say(questman, buf);
          sprintf(buf, "This threat must be eliminated!");
          do_say(questman, buf);
          break;

        case 1:
          sprintf(buf, "One of the galaxy's most heinous criminal, %s, is wandering lose!",victim->short_descr);
          do_say(questman, buf);
          sprintf(buf, "%s has murdered %d civillians, that we know of!",victim->short_descr, number_range(2,20));
          do_say(questman, buf);
          do_say(questman,"The penalty for this crime is death, and you are to deliver the sentence!");
          break;
        }

      if (room->name != NULL)
        {
          sprintf(buf, "Seek %s out somewhere in the vicinity of %s!",victim->short_descr,room->name);
          do_say(questman, buf);

          /* I changed my area names so that they have just the name of the area
             and none of the level stuff. You may want to comment these next two
             lines. - Vassago */

          sprintf(buf, "That location is in the general area of %s.",room->area->name);
          do_say(questman, buf);
        }
      ch->questmob = victim->pIndexData->vnum;
    }
  return;
}

/* Called from update_handler() by pulse_area */

void quest_update(void)
{
  CHAR_DATA *ch, *ch_next;

  for ( ch = first_char; ch != NULL; ch = ch_next )
    {
      ch_next = ch->next;

      if (IS_NPC(ch)) continue;

      if (ch->nextquest > 0)
        {
          ch->nextquest--;

          if (ch->nextquest == 0)
            {
              send_to_char("You may now quest again.\r\n",ch);
              return;
            }
        }
      else if (IS_SET(ch->act,PLR_QUESTOR))
        {
          if (--ch->countdown <= 0)
            {
              char buf [MAX_STRING_LENGTH];

              ch->nextquest = 30;
              sprintf(buf, "You have run out of time for your quest!\r\nYou may quest again in %d minutes.\r\n",ch->nextquest);
              send_to_char(buf, ch);
              REMOVE_BIT(ch->act, PLR_QUESTOR);
              ch->questgiver = NULL;
              ch->countdown = 0;
              ch->questmob = 0;
            }
          if (ch->countdown > 0 && ch->countdown < 6)
            {
              send_to_char("Better hurry, you're almost out of time for your quest!\r\n",ch);
              return;
            }
        }
    }
  return;
}
