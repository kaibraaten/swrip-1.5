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
 *                       Shop and repair shop module                       *
 ****************************************************************************/

#ifdef __STRICT_ANSI__
/* To include the prototype for fchmod() */
#define _BSD_SOURCE

/* To include the prototype for fileno() */
#define _POSIX_SOURCE
#endif

#include <ctype.h>
#include <string.h>
#include "mud.h"
#include "shops.h"
#include "character.h"

#define COST_EQUATION  (int) (cost*cost_equation( obj ))

float cost_equation( OBJ_DATA *obj )
{
  float count = obj->pIndexData->count;

  count = URANGE( 50, count, 500 );

  return (100/(count));
}

/*
 * Shopping commands.
 */
Character *find_keeper( Character *ch )
{
  return find_keeper_q( ch, TRUE );
}

Character *find_keeper_q( Character *ch, bool message )
{
  Character *keeper;
  SHOP_DATA *pShop;

  pShop = NULL;
  for ( keeper = ch->in_room->first_person;
        keeper;
        keeper = keeper->next_in_room )
    if ( is_npc(keeper) && (pShop = keeper->pIndexData->pShop) != NULL )
      break;

  if ( !pShop )

    {
      if ( message )
        send_to_char( "You can't do that here.\r\n", ch );
      return NULL;
    }


  /*
   * Shop hours.
   */
  if ( pShop->business_hours.open > pShop->business_hours.close )
    {
      if( time_info.hour < pShop->business_hours.open && time_info.hour > pShop->business_hours.close )
        {
          do_say( keeper, "Sorry, come back later." );
          return NULL;
        }
    }
  else
    if( time_info.hour < pShop->business_hours.open || time_info.hour > pShop->business_hours.close )
      {
        if( time_info.hour > pShop->business_hours.open )
          {
            do_say( keeper, "Sorry, come back later." );
            return NULL;
          }
        if ( time_info.hour > pShop->business_hours.close )
          {
            do_say( keeper, "Sorry, come back tomorrow." );
            return NULL;
          }
      }
  if ( !knows_language( keeper, ch->speaking, ch ) )
    {
      do_say( keeper, "I can't understand you." );
      return NULL;
    }

  return keeper;
}

/*
 * repair commands.
 */
Character *find_fixer( Character *ch )
{
  Character *keeper;
  REPAIR_DATA *rShop;

  rShop = NULL;
  for ( keeper = ch->in_room->first_person;
        keeper;
        keeper = keeper->next_in_room )
    if ( is_npc(keeper) && (rShop = keeper->pIndexData->rShop) != NULL )
      break;

  if ( !rShop )
    {
      send_to_char( "You can't do that here.\r\n", ch );
      return NULL;
    }


  /*
   * Shop hours.
   */
  if ( time_info.hour < rShop->business_hours.open )
    {
      do_say( keeper, "Sorry, come back later." );
      return NULL;
    }

  if ( time_info.hour > rShop->business_hours.close )
    {
      do_say( keeper, "Sorry, come back tomorrow." );
      return NULL;
    }


  if ( !knows_language( keeper, ch->speaking, ch ) )
    {
      do_say( keeper, "I can't understand you." );
      return NULL;
    }

  return keeper;
}

int get_cost_quit( Character *ch )
{
  long cost = 1000;
  int golddem = 100000;
  long gold = 0;

  if( !ch )
    return 0;

  if( ch->top_level <= 6 )
    return 0;

  gold = ch->gold + (is_npc(ch) ? 0 : ch->pcdata->bank) + 1;

  if( gold < 5000 )
    return 0;
  cost *= gold/golddem;

  return (int) cost;
}

int get_cost( Character *ch, Character *keeper, OBJ_DATA *obj, bool fBuy )
{
  SHOP_DATA *pShop = NULL;
  int cost = 0;
  bool richcustomer = FALSE;
  int profitmod = 0;

  if ( !obj || ( pShop = keeper->pIndexData->pShop ) == NULL )
    return 0;

  if ( ( ch->gold + (is_npc(ch) ? 0 : ch->pcdata->bank) ) > (ch->top_level * 1000) )
    richcustomer = TRUE;
  else
    richcustomer = FALSE;

  if ( fBuy )
    {
      cost = (int) (obj->cost * (80 + UMIN(ch->top_level, LEVEL_AVATAR))) / 100;

      profitmod = 13 - get_curr_cha(ch) + (richcustomer ? 15 : 0)
        + ((URANGE(5,ch->top_level,LEVEL_AVATAR)-20)/2);
      cost = (int) (obj->cost
                    * UMAX( (pShop->profit_sell+1), pShop->profit_buy+profitmod ) )
        / 100;
    }
  else
    {
      OBJ_DATA *obj2;
      int itype;

      profitmod = get_curr_cha(ch) - 13 - (richcustomer ? 15 : 0);
      cost = 0;
      for ( itype = 0; itype < MAX_TRADE; itype++ )
        {
          if ( obj->item_type == pShop->buy_type[itype] )
            {
              cost = (int) (obj->cost
                            * UMIN( (pShop->profit_buy-1),
                                    pShop->profit_sell+profitmod) ) / 100;
              break;
            }
        }
      for ( obj2 = keeper->first_carrying; obj2; obj2 = obj2->next_content )
        {
          if ( obj->pIndexData == obj2->pIndexData )
            {
              cost /= (obj2->count+1);
              break;
            }
        }

      cost = UMIN( cost , 2500 );

    }

  if( cost > 0 )
    {
      cost = COST_EQUATION;
      if( cost <= 0 )
        cost = 1;
    }


  if ( obj->item_type == ITEM_ARMOR )
    cost = (int) (cost * (obj->value[0]+1) / (obj->value[1]+1) );
  if ( obj->item_type == ITEM_WEAPON )
    {
      cost = (int) (cost * (obj->value[0]+1) / INIT_WEAPON_CONDITION+1);
      cost = (int) (cost * (obj->value[4]+1) / (obj->value[5]+1));
    }

  if ( obj->item_type == ITEM_DEVICE )
    cost = (int) (cost * (obj->value[2]+1) / (obj->value[1]+1));

  return cost;
}

int get_repaircost( Character *keeper, OBJ_DATA *obj )
{
  REPAIR_DATA *rShop;
  int cost;
  int itype;
  bool found;

  if ( !obj || ( rShop = keeper->pIndexData->rShop ) == NULL )
    return 0;

  cost = 0;
  found = FALSE;
  for ( itype = 0; itype < MAX_FIX; itype++ )
    {
      if ( obj->item_type == rShop->fix_type[itype] )
        {
          cost = (int) (obj->cost * rShop->profit_fix / 100);
          found = TRUE;
          break;
        }
    }

  if ( !found )
    cost = -1;

  if ( cost == 0 )
    cost = 1;

  if ( found && cost > 0 )
    {
      switch (obj->item_type)
        {
        case ITEM_ARMOR:
          if (obj->value[0] >= obj->value[1])
            cost = -2;
          else
            cost *= (obj->value[1] - obj->value[0]);
          break;
        case ITEM_WEAPON:
          if (INIT_WEAPON_CONDITION == obj->value[0])
            cost = -2;
          else
            cost *= (INIT_WEAPON_CONDITION - obj->value[0]);
          break;
        case ITEM_DEVICE:
          if (obj->value[2] >= obj->value[1])
            cost = -2;
          else
            cost *= (obj->value[1] - obj->value[2]);
        }
    }

  return cost;
}

/* Write vendor to file */
void fwrite_vendor( FILE *fp, Character *mob )
{
  if ( !is_npc( mob ) || !fp )
    return;

  fprintf( fp, "Vnum     %ld\n", mob->pIndexData->vnum );

  if (mob->gold > 0)
    fprintf (fp, "Gold     %d\n",mob->gold);

  if ( mob->home )
    fprintf( fp, "Home     %ld\n", mob->home->vnum );

  if (mob->owner != NULL )
    fprintf (fp, "Owner     %s~\n", mob->owner );

  if ( QUICKMATCH( mob->short_descr, mob->pIndexData->short_descr) == 0 )
    fprintf( fp, "Short     %s~\n", mob->short_descr );

  fprintf( fp, "Position   %d\n", mob->position );
  fprintf( fp, "Flags   %d\n",   mob->act );
  fprintf( fp, "END\n" );
}


/* read vendor from file */
Character *  fread_vendor( FILE *fp )
{
  Character *mob = NULL;
  const char *word;
  bool fMatch;
  vnum_t inroom = 0;
  ROOM_INDEX_DATA *pRoomIndex = NULL;
  Character *victim;
  Character *vnext;
  char buf [MAX_INPUT_LENGTH];
  char vnum1 [MAX_INPUT_LENGTH];
  word   = feof( fp ) ? "END" : fread_word( fp );

  if ( !str_cmp(word, "Vnum") )
    {
      vnum_t vnum = fread_number( fp );

      mob = create_mobile( get_mob_index(vnum));

      if ( !mob )
        {
          for ( ; ; )
            {
              word   = feof( fp ) ? "END" : fread_word( fp );
              if ( !str_cmp( word, "END" ) )
                break;
            }

          bug("Fread_mobile: No index data for vnum %d", vnum );
          return NULL;
        }
    }
  else
    {
      for ( ; ; )
        {
          word   = feof( fp ) ? "END" : fread_word( fp );
          if ( !str_cmp( word, "END" ) )
            break;
        }

      extract_char(mob, TRUE);
      bug("Fread_vendor: Vnum not found", 0 );
      return NULL;
    }

  for ( ; ;) {
    word   = feof( fp ) ? "END" : fread_word( fp );
    fMatch = FALSE;
    switch ( UPPER(word[0]) ) {
    case '*':
      fMatch = TRUE;
      fread_to_eol( fp );
      break;
    case '#':
      if ( !str_cmp( word, "#OBJECT" ) )
        {
          fread_obj ( mob, fp, OS_CARRY );
        }
      break;
    case 'D':
      KEY( "Description", mob->description, fread_string(fp));
      break;
    case 'E':

      if ( !str_cmp( word, "END" ) )
        {
          if ( inroom == 0 )
            inroom = ROOM_VNUM_VENSTOR;

          mob->home = get_room_index(inroom);
          pRoomIndex = get_room_index( inroom );

          if ( !pRoomIndex )
            {
              pRoomIndex = get_room_index( ROOM_VNUM_VENSTOR );
              mob->home = get_room_index( ROOM_VNUM_VENSTOR );
            }

          mob->in_room = pRoomIndex;
          /* the following code is to make sure no more then one player owned vendor
             is in the room - meckteck */
          for ( victim = mob->in_room->first_person; victim; victim = vnext )
            {
              vnext = victim->next_in_room;
              if (victim->home != NULL)
                {
                  extract_char( victim, TRUE);
                  break;
                }

            }

          char_to_room(mob, pRoomIndex);
          sprintf(vnum1,"%ld", mob->pIndexData->vnum);
          do_makeshop (mob, vnum1 );
          sprintf (buf, mob->long_descr, mob->owner);
          mob->long_descr =  STRALLOC( buf );
          mob->hit = 10000;
          mob->max_hit = 10000;
          return mob;
        }
      break;
    case 'F':
      KEY( "Flags", mob->act, fread_number(fp));
      break;
    case 'G':
      KEY("Gold", mob->gold, fread_number(fp));
      break;
    case 'H':
      KEY("Home", inroom, fread_number(fp) );
      break;
    case 'L':
      break;
    case 'N':
      break;
    case 'O':
      KEY ("Owner", mob->owner, fread_string (fp) );
      break;
    case 'P':
      KEY( "Position", mob->position, fread_number( fp ) );
      break;
    case 'S':
      KEY( "Short", mob->short_descr, fread_string(fp));
      break;
    }
    if ( !fMatch )
      {
        bug ( "Fread_mobile: no match.", 0 );
        bug ( word, 0 );
      }
  }
  return NULL;
}

void save_vendor( Character *ch )
{
  char strsave[MAX_INPUT_LENGTH];
  FILE *fp;

  if ( !ch )
    {
      bug( "Save_char_obj: null ch!", 0 );
      return;
    }

  de_equip_char( ch );


  sprintf( strsave, "%s%s",VENDOR_DIR, capitalize( ch->owner ) );

  if ( ( fp = fopen( strsave, "w" ) ) == NULL )
    {
      perror( strsave );
      bug( "Save_vendor: fopen", 0 );
    }
  else
    {
      bool ferr;

      fchmod(fileno(fp), S_IRUSR|S_IWUSR | S_IRGRP|S_IWGRP | S_IROTH|S_IWOTH);
      fprintf( fp, "#VENDOR\n"          );
      fwrite_vendor( fp, ch );

      if ( ch->first_carrying )
        fwrite_obj( ch, ch->last_carrying, fp, 0, OS_CARRY );

      fprintf(fp, "#END\n" );
      ferr = ferror(fp);
      fclose( fp );
      if (ferr)
        {
          perror(strsave);
          bug("Error writing temp file for %s -- not copying", strsave);
        }
    }

  re_equip_char( ch );
  return;
}
