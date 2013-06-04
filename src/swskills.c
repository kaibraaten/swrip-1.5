/***************************************************************************
 *                   Star Wars: Rise in Power MUD Codebase                  *
 *--------------------------------------------------------------------------*
 * SWRiP Code Additions and changes from the SWReality and Smaug Code       *
 * copyright (c) 2001 by Mark Miller (Darrik Vequir)                        *
 *--------------------------------------------------------------------------*
 * Star Wars Reality Code Additions and changes from the Smaug Code         *
 * copyright (c) 1997 by Sean Cooper                                        *
 * -------------------------------------------------------------------------*
 * Starwars and Starwars Names copyright(c) Lucasfilm Ltd.                  *
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
 *                 New Star Wars Skills Unit                               *
 ****************************************************************************/

#include "mud.h"
#include "character.h"
#include "clan.h"

void add_reinforcements( CHAR_DATA *ch )
{
  MOB_INDEX_DATA  * pMobIndex;
  OBJ_DATA        * blaster;
  OBJ_INDEX_DATA  * pObjIndex;
  char         buf[MAX_INPUT_LENGTH];
  int multiplier = 1;

  if ( ( pMobIndex = get_mob_index( ch->backup_mob ) ) == NULL )
    return;

  sprintf(buf, "%s just posted a guard on %d!", ch->name, ch->in_room ? ch->in_room->vnum : 0 );
  bug(buf, 0);


  if ( ch->backup_mob == MOB_VNUM_STORMTROOPER ||
       ch->backup_mob == MOB_VNUM_NR_TROOPER   ||
       ch->backup_mob == MOB_VNUM_MERCINARY ||
       ch->backup_mob == MOB_VNUM_IMP_FORCES ||
       ch->backup_mob == MOB_VNUM_NR_FORCES   ||
       ch->backup_mob == MOB_VNUM_MERC_FORCES       )
    {


      CHAR_DATA * mob[3];
      int         mob_cnt;

      if ( ch->backup_mob == MOB_VNUM_IMP_FORCES ||
           ch->backup_mob == MOB_VNUM_NR_FORCES   ||
           ch->backup_mob == MOB_VNUM_MERC_FORCES )
        { multiplier = 2; }


      send_to_char( "Your reinforcements have arrived.\r\n", ch );
      for ( mob_cnt = 0 ; mob_cnt < 3 ; mob_cnt++ )
        {
          int ability;
          mob[mob_cnt] = create_mobile( pMobIndex );
          char_to_room( mob[mob_cnt], ch->in_room );
          act( AT_IMMORT, "$N has arrived.", ch, NULL, mob[mob_cnt], TO_ROOM );
          mob[mob_cnt]->top_level = multiplier / 1.4 * get_level( ch, LEADERSHIP_ABILITY ) / 3;

          for ( ability = 0 ; ability < MAX_ABILITY ; ability++ )
            set_level( mob[mob_cnt], ability, mob[mob_cnt]->top_level );

          mob[mob_cnt]->hit = mob[mob_cnt]->top_level*15;
          mob[mob_cnt]->max_hit = mob[mob_cnt]->hit;
          mob[mob_cnt]->armor = 100- mob[mob_cnt]->top_level*2.5;
          mob[mob_cnt]->damroll = mob[mob_cnt]->top_level/5;
          mob[mob_cnt]->hitroll = mob[mob_cnt]->top_level/5;

          if ( ( pObjIndex = get_obj_index( OBJ_VNUM_BLASTECH_E11 ) ) != NULL )
            {
              blaster = create_object( pObjIndex, mob[mob_cnt]->top_level );
              obj_to_char( blaster, mob[mob_cnt] );
              equip_char( mob[mob_cnt], blaster, WEAR_WIELD );
            }

          if ( mob[mob_cnt]->master )
            stop_follower( mob[mob_cnt] );

          add_follower( mob[mob_cnt], ch );
          SET_BIT( mob[mob_cnt]->affected_by, AFF_CHARM );
          do_setblaster( mob[mob_cnt] , "full" );
        }
    }
  else
    {
      CHAR_DATA *mob;
      int ability;

      if ( ch->backup_mob == MOB_VNUM_IMP_ELITE ||
           ch->backup_mob == MOB_VNUM_NR_ELITE   ||
           ch->backup_mob == MOB_VNUM_MERC_ELITE )
        { multiplier = 2; }

      mob = create_mobile( pMobIndex );
      char_to_room( mob, ch->in_room );
      if ( ch->pcdata && ch->pcdata->clan )
        {
          char tmpbuf[MAX_STRING_LENGTH];

          STRFREE( mob->name );
          mob->name = STRALLOC( ch->pcdata->clan->name );
          sprintf( tmpbuf , "(%s) %s" , ch->pcdata->clan->name  , mob->long_descr );
          STRFREE( mob->long_descr );
          mob->long_descr = STRALLOC( tmpbuf );
        }
      act( AT_IMMORT, "$N has arrived.", ch, NULL, mob, TO_ROOM );
      send_to_char( "Your guard has arrived.\r\n", ch );
      mob->top_level = multiplier * get_level( ch, LEADERSHIP_ABILITY ) / 2;

      for ( ability = 0 ; ability < MAX_ABILITY ; ability++ )
        set_level( mob, ability, mob->top_level );

      mob->hit = mob->top_level*10;
      mob->max_hit = mob->hit;
      mob->armor = 100- mob->top_level*2.5;
      mob->damroll = mob->top_level/5;
      mob->hitroll = mob->top_level/5;

      if ( ( pObjIndex = get_obj_index( OBJ_VNUM_BLASTECH_E11 ) ) != NULL )
        {
          blaster = create_object( pObjIndex, mob->top_level );
          obj_to_char( blaster, mob );
          equip_char( mob, blaster, WEAR_WIELD );
        }

      /* for making this more accurate in the future */

      if ( mob->mob_clan )
        STRFREE ( mob->mob_clan );
      if ( ch->pcdata && ch->pcdata->clan )
        mob->mob_clan = STRALLOC( ch->pcdata->clan->name );
    }
}
