/****************************************************************************
 *                   Star Wars: Rise in Power MUD Codebase                  *
 * ------------------------------------------------------------------------ *
 * SWRiP Code Additions and changes from the SWReality and Smaug Code       *
 * copyright (c) 2001 by Mark Miller (Darrik Vequir)                        *
 * ------------------------------------------------------------------------ *
 * Star Wars Reality Code Additions and changes from the Smaug Code         *
 * copyright (c) 1997 by Sean Cooper                                        *
 * ------------------------------------------------------------------------ *
 * Starwars and Starwars Names copyright(c) Lucas Film Ltd.                 *
 * ------------------------------------------------------------------------ *
 * SMAUG 1.0 (C) 1994, 1995, 1996 by Derek Snider                           *
 * SMAUG code team: Thoric, Altrag, Blodkai, Narn, Haus,                    *
 * Scryn, Rennard, Swordbearer, Gorog, Grishnakh and Tricops                *
 * ------------------------------------------------------------------------ *
 * Merc 2.1 Diku Mud improvments copyright (C) 1992, 1993 by Michael        *
 * Chastain, Michael Quan, and Mitchell Tse.                                *
 * ------------------------------------------------------------------------ *
 * Original Diku Mud copyright (C) 1990, 1991 by Sebastian Hammer,          *
 * Michael Seifert, Hans Henrik Staerfeldt, Tom Madsen, and Katja Nyboe.    *
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

#define COST_EQUATION  (int) (cost*CostEquation( obj ))

static float CostEquation( const Object *obj )
{
  float count = obj->Prototype->count;

  count = urange( 50, count, 500 );

  return (100/(count));
}

/*
 * Shopping commands.
 */
Character *FindKeeper( const Character *ch )
{
  return FindKeeperQ( ch, true );
}

Character *FindKeeperQ( const Character *ch, bool message )
{
  Character *keeper = NULL;
  const SHOP_DATA *pShop = NULL;

  for ( keeper = ch->in_room->first_person;
        keeper;
        keeper = keeper->next_in_room )
    {
      if ( IsNpc(keeper) && (pShop = keeper->Prototype->pShop) != NULL )
	{
	  break;
	}
    }

  if ( !pShop )

    {
      if ( message )
	{
	  SendToCharacter( "You can't do that here.\r\n", ch );
	}

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
  if ( !CharacterKnowsLanguage( keeper, ch->speaking, ch ) )
    {
      do_say( keeper, "I can't understand you." );
      return NULL;
    }

  return keeper;
}

/*
 * repair commands.
 */
Character *FindFixer( const Character *ch )
{
  Character *keeper = NULL;
  const REPAIR_DATA *rShop = NULL;

  for ( keeper = ch->in_room->first_person;
        keeper;
        keeper = keeper->next_in_room )
    {
      if ( IsNpc(keeper) && (rShop = keeper->Prototype->rShop) != NULL )
	{
	  break;
	}
    }

  if ( !rShop )
    {
      SendToCharacter( "You can't do that here.\r\n", ch );
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


  if ( !CharacterKnowsLanguage( keeper, ch->speaking, ch ) )
    {
      do_say( keeper, "I can't understand you." );
      return NULL;
    }

  return keeper;
}

int GetCostToQuit( const Character *ch )
{
  long cost = 1000;
  int golddem = 100000;
  long gold = 0;

  if( !ch )
    {
      return 0;
    }

  if( ch->top_level <= 6 )
    {
      return 0;
    }

  gold = ch->gold + (IsNpc(ch) ? 0 : ch->pcdata->bank) + 1;

  if( gold < 5000 )
    {
      return 0;
    }

  cost *= gold / golddem;

  return (int) cost;
}

int GetObjectCost( const Character *ch, const Character *keeper, const Object *obj, bool fBuy )
{
  const SHOP_DATA *pShop = NULL;
  int cost = 0;
  bool richcustomer = false;
  int profitmod = 0;

  if ( !obj || ( pShop = keeper->Prototype->pShop ) == NULL )
    {
      return 0;
    }

  if ( ( ch->gold + (IsNpc(ch) ? 0 : ch->pcdata->bank) ) > (ch->top_level * 1000) )
    {
      richcustomer = true;
    }
  else
    {
      richcustomer = false;
    }

  if ( fBuy )
    {
      cost = (int) (obj->cost * (80 + umin(ch->top_level, LEVEL_AVATAR))) / 100;

      profitmod = 13 - GetCurrentCharisma(ch) + (richcustomer ? 15 : 0)
        + ((urange(5,ch->top_level,LEVEL_AVATAR)-20)/2);
      cost = (int) (obj->cost
                    * umax( (pShop->profit_sell+1), pShop->profit_buy+profitmod ) )
        / 100;
    }
  else
    {
      const Object *obj2 = NULL;
      int itype = 0;

      profitmod = GetCurrentCharisma(ch) - 13 - (richcustomer ? 15 : 0);
      cost = 0;

      for ( itype = 0; itype < MAX_TRADE; itype++ )
        {
          if ( obj->item_type == pShop->buy_type[itype] )
            {
              cost = (int) (obj->cost
                            * umin( (pShop->profit_buy-1),
                                    pShop->profit_sell+profitmod) ) / 100;
              break;
            }
        }
      for ( obj2 = keeper->first_carrying; obj2; obj2 = obj2->next_content )
        {
          if ( obj->Prototype == obj2->Prototype )
            {
              cost /= (obj2->count+1);
              break;
            }
        }

      cost = umin( cost , 2500 );

    }

  if( cost > 0 )
    {
      cost = COST_EQUATION;

      if( cost <= 0 )
	{
	  cost = 1;
	}
    }


  if ( obj->item_type == ITEM_ARMOR )
    {
      cost = (int) (cost * (obj->value[OVAL_ARMOR_CONDITION]+1) / (obj->value[OVAL_ARMOR_AC]+1) );
    }

  if ( obj->item_type == ITEM_WEAPON )
    {
      cost = (int) (cost * (obj->value[OVAL_WEAPON_CONDITION]+1) / INIT_WEAPON_CONDITION+1);
      cost = (int) (cost * (obj->value[OVAL_WEAPON_CHARGE]+1) / (obj->value[OVAL_WEAPON_MAX_CHARGE]+1));
    }

  if ( obj->item_type == ITEM_DEVICE )
    {
      cost = (int) (cost * (obj->value[OVAL_DEVICE_CHARGES]+1) / (obj->value[OVAL_DEVICE_MAX_CHARGES]+1));
    }

  return cost;
}

int GetRepairCost( const Character *keeper, const Object *obj )
{
  const REPAIR_DATA *rShop = NULL;
  int cost = 0;
  int itype = 0;
  bool found = false;

  if ( !obj || ( rShop = keeper->Prototype->rShop ) == NULL )
    {
      return 0;
    }

  for ( itype = 0; itype < MAX_FIX; itype++ )
    {
      if ( obj->item_type == rShop->fix_type[itype] )
        {
          cost = (int) (obj->cost * rShop->profit_fix / 100);
          found = true;
          break;
        }
    }

  if ( !found )
    {
      cost = -1;
    }

  if ( cost == 0 )
    {
      cost = 1;
    }

  if ( found && cost > 0 )
    {
      switch (obj->item_type)
        {
        case ITEM_ARMOR:
          if (obj->value[OVAL_ARMOR_CONDITION] >= obj->value[OVAL_ARMOR_AC])
	    {
	      cost = -2;
	    }
          else
	    {
	      cost *= (obj->value[OVAL_ARMOR_AC] - obj->value[OVAL_ARMOR_CONDITION]);
	    }
          break;

        case ITEM_WEAPON:
          if (INIT_WEAPON_CONDITION == obj->value[OVAL_WEAPON_CONDITION])
	    {
	      cost = -2;
	    }
          else
	    {
	      cost *= (INIT_WEAPON_CONDITION - obj->value[OVAL_WEAPON_CONDITION]);
	    }
          break;

        case ITEM_DEVICE:
          if (obj->value[OVAL_DEVICE_CHARGES] >= obj->value[OVAL_DEVICE_MAX_CHARGES])
	    {
	      cost = -2;
	    }
          else
	    {
	      cost *= (obj->value[OVAL_DEVICE_MAX_CHARGES] - obj->value[OVAL_DEVICE_CHARGES]);
	    }
        }
    }

  return cost;
}

/* Write vendor to file */
void WriteVendor( FILE *fp, Character *mob )
{
  if ( !IsNpc( mob ) || !fp )
    {
      return;
    }

  fprintf( fp, "Vnum     %ld\n", mob->Prototype->vnum );

  if (mob->gold > 0)
    {
      fprintf (fp, "Gold     %d\n",mob->gold);
    }

  if ( mob->home )
    {
      fprintf( fp, "Home     %ld\n", mob->home->vnum );
    }

  if (mob->owner != NULL )
    {
      fprintf (fp, "Owner     %s~\n", mob->owner );
    }

  if ( StrCmp( mob->short_descr, mob->Prototype->short_descr) )
    {
      fprintf( fp, "Short     %s~\n", mob->short_descr );
    }

  fprintf( fp, "Position   %d\n", mob->position );
  fprintf( fp, "Flags   %d\n",   mob->act );
  fprintf( fp, "END\n" );
}

/* read vendor from file */
Character *ReadVendor( FILE *fp )
{
  Character *mob = NULL;
  const char *word = NULL;

  word = feof( fp ) ? "END" : ReadWord( fp );

  if ( !StrCmp(word, "Vnum") )
    {
      vnum_t vnum = ReadInt( fp );

      mob = CreateMobile( get_mob_index(vnum));

      if ( !mob )
        {
          for ( ; ; )
            {
              word = feof( fp ) ? "END" : ReadWord( fp );

              if ( !StrCmp( word, "END" ) )
		{
		  break;
		}
            }

          bug("Fread_mobile: No index data for vnum %d", vnum );
          return NULL;
        }
    }
  else
    {
      for ( ; ; )
        {
          word = feof( fp ) ? "END" : ReadWord( fp );

          if ( !StrCmp( word, "END" ) )
	    {
	      break;
	    }
        }

      bug("Fread_vendor: Vnum not found", 0 );
      return NULL;
    }

  for ( ; ;)
    {
      bool fMatch = false;
      vnum_t inroom = 0;
      Room *pRoomIndex = NULL;

      word = feof( fp ) ? "END" : ReadWord( fp );

      switch ( CharToUppercase(word[0]) )
	{
	case '*':
	  fMatch = true;
	  ReadToEndOfLine( fp );
	  break;

	case '#':
	  if ( !StrCmp( word, "#OBJECT" ) )
	    {
	      fread_obj ( mob, fp, OS_CARRY );
	    }
	  break;

	case 'D':
	  KEY( "Description", mob->description, ReadStringToTilde(fp));
	  break;

	case 'E':
	  if ( !StrCmp( word, "END" ) )
	    {
	      Character *victim = NULL;
	      Character *vnext = NULL;
	      char buf[MAX_INPUT_LENGTH];
	      char vnum1[MAX_INPUT_LENGTH];

	      if ( inroom == INVALID_VNUM )
		{
		  inroom = ROOM_VNUM_VENSTOR;
		}

	      mob->home = get_room_index(inroom);
	      pRoomIndex = get_room_index( inroom );

	      if ( !pRoomIndex )
		{
		  pRoomIndex = get_room_index( ROOM_VNUM_VENSTOR );
		  mob->home = get_room_index( ROOM_VNUM_VENSTOR );
		}

	      mob->in_room = pRoomIndex;

	      /* the following code is to make sure no more than one player owned vendor
		 is in the room - meckteck */
	      for ( victim = mob->in_room->first_person; victim; victim = vnext )
		{
		  vnext = victim->next_in_room;

		  if (victim->home != NULL)
		    {
		      extract_char( victim, true);
		      break;
		    }
		}

	      char_to_room(mob, pRoomIndex);
	      sprintf(vnum1,"%ld", mob->Prototype->vnum);
	      do_makeshop (mob, vnum1 );
	      sprintf (buf, mob->long_descr, mob->owner);
	      mob->long_descr = CopyString( buf );
	      mob->hit = 10000;
	      mob->max_hit = 10000;
	      return mob;
	    }
	  break;

	case 'F':
	  KEY( "Flags", mob->act, ReadInt(fp));
	  break;

	case 'G':
	  KEY("Gold", mob->gold, ReadInt(fp));
	  break;

	case 'H':
	  KEY("Home", inroom, ReadInt(fp) );
	  break;

	case 'L':
	  break;

	case 'N':
	  break;

	case 'O':
	  KEY ("Owner", mob->owner, ReadStringToTilde (fp) );
	  break;

	case 'P':
	  KEY( "Position", mob->position, ReadInt( fp ) );
	  break;

	case 'S':
	  KEY( "Short", mob->short_descr, ReadStringToTilde(fp));
	  break;
	}

      if ( !fMatch )
	{
	  bug( "Fread_mobile: no match." );
	  bug( word );
	}
    }

  return NULL;
}

void SaveVendor( Character *ch )
{
  char strsave[MAX_INPUT_LENGTH];
  FILE *fp = NULL;

  if ( !ch )
    {
      bug( "Save_char_obj: null ch!", 0 );
      return;
    }

  de_EquipCharacter( ch );


  sprintf( strsave, "%s%s",VENDOR_DIR, Capitalize( ch->owner ) );

  if ( ( fp = fopen( strsave, "w" ) ) == NULL )
    {
      perror( strsave );
      bug( "Save_vendor: fopen" );
    }
  else
    {
      bool ferr = false;

      fchmod(fileno(fp), S_IRUSR|S_IWUSR | S_IRGRP|S_IWGRP | S_IROTH|S_IWOTH);
      fprintf( fp, "#VENDOR\n"          );
      WriteVendor( fp, ch );

      if ( ch->first_carrying )
	{
	  fwrite_obj( ch, ch->last_carrying, fp, 0, OS_CARRY );
	}

      fprintf(fp, "#END\n" );
      ferr = ferror(fp);
      fclose( fp );

      if (ferr)
        {
          perror(strsave);
          bug("Error writing temp file for %s -- not copying", strsave);
        }
    }

  re_EquipCharacter( ch );
}
