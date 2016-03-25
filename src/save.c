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

#if defined(__NetBSD__)
#define _NETBSD_SOURCE
#endif

/* To include the prototype for fileno() */
#define _POSIX_SOURCE
#endif

#include <string.h>
#include <ctype.h>
#include "mud.h"
#include "character.h"
#include "shops.h"
#include "clan.h"
#include "skill.h"

/*
 * Increment with every major format change.
 */
#define SAVEVERSION     3

/*
 * Array to keep track of equipment temporarily.                -Thoric
 */
Object *save_equipment[MAX_WEAR][8];
Character *quitting_char = NULL;
Character *loading_char = NULL;
Character *saving_char = NULL;

int file_ver = 0;

extern FILE *fpArea;
extern char strArea[MAX_INPUT_LENGTH];
extern int falling;

/*
 * Array of containers read for proper re-nesting of objects.
 */
static Object *rgObjNest[MAX_NEST];

/*
 * Local functions.
 */
static bool HasAnyOvalues( const Object *obj );
static void WriteCharacter( const Character *ch, FILE *fp );
static void ReadCharacter( Character *ch, FILE *fp, bool preload );
static Character *ReadMobile( FILE *fp );
static void WriteMobile( FILE *fp, const Character *mob );

void SaveHome( Character *ch )
{
  if ( ch->plr_home )
    {
      FILE *fp = NULL;
      char filename[256];
      short templvl = 0;
      Object *contents = NULL;


      sprintf( filename, "%s%c/%s.home", PLAYER_DIR, tolower(ch->name[0]),
               Capitalize( ch->name ) );

      if ( ( fp = fopen( filename, "w" ) ) )
        {
          templvl = ch->top_level;
          ch->top_level = LEVEL_AVATAR;           /* make sure EQ doesn't get lost */
          contents = ch->plr_home->last_content;

          if (contents)
	    {
	      WriteObject(ch, contents, fp, 0, OS_CARRY );
	    }

          fprintf( fp, "#END\n" );
          ch->top_level = templvl;
          fclose( fp );
        }
    }
}

/*
 * Un-equip character before saving to ensure proper    -Thoric
 * stats are saved in case of changes to or removal of EQ
 */
void DeEquipCharacter( Character *ch )
{
  Object *obj = NULL;
  int x = 0;
  int y = 0;

  for ( x = 0; x < MAX_WEAR; x++ )
    {
      for ( y = 0; y < MAX_LAYERS; y++ )
	{
	  save_equipment[x][y] = NULL;
	}
    }

  for ( obj = ch->first_carrying; obj; obj = obj->next_content )
    {
      if ( obj->wear_loc > -1 && obj->wear_loc < MAX_WEAR )
	{
	  for ( x = 0; x < MAX_LAYERS; x++ )
	    {
	      if ( !save_equipment[obj->wear_loc][x] )
		{
		  save_equipment[obj->wear_loc][x] = obj;
		  break;
		}
	    }

	  if ( x == MAX_LAYERS )
	    {
	      Bug( "%s had on more than %d layers of clothing in one location (%d): %s",
		   ch->name, MAX_LAYERS, obj->wear_loc, obj->name );
	    }

	  UnequipCharacter(ch, obj);
	}
    }
}

/*
 * Re-equip character                                   -Thoric
 */
void ReEquipCharacter( Character *ch )
{
  int x = 0;
  int y = 0;

  for ( x = 0; x < MAX_WEAR; x++ )
    {
      for ( y = 0; y < MAX_LAYERS; y++ )
	{
	  if ( save_equipment[x][y] != NULL )
	    {
	      if ( quitting_char != ch )
		{
		  EquipCharacter(ch, save_equipment[x][y], x);
		}

	      save_equipment[x][y] = NULL;
	    }
	  else
	    {
	      break;
	    }
	}
    }
}

/*
 * Save a character and inventory.
 * Would be cool to save NPC's too for quest purposes,
 *   some of the infrastructure is provided.
 */
void SaveCharacter( Character *ch )
{
  char strsave[MAX_INPUT_LENGTH];
  char strback[MAX_INPUT_LENGTH];
  FILE *fp = NULL;

  if ( !ch )
    {
      Bug( "%s: null ch!", __FUNCTION__ );
      return;
    }

  if ( IsNpc(ch) || !IsAuthed(ch) )
    {
      return;
    }

  saving_char = ch;

  /* save pc's clan's data while we're at it to keep the data in sync */
  if ( !IsNpc(ch) && ch->pcdata->ClanInfo.Clan )
    {
      SaveClan( ch->pcdata->ClanInfo.Clan );
    }

  if ( ch->desc && ch->desc->original )
    {
      ch = ch->desc->original;
    }

  DeEquipCharacter( ch );

  ch->pcdata->save_time = current_time;
  sprintf( strsave, "%s%c/%s", PLAYER_DIR, tolower(ch->name[0]),
           Capitalize( ch->name ) );

  /*
   * Auto-backup pfile (can cause lag with high disk access situtations
   */
  if ( IsBitSet( sysdata.save_flags, SV_BACKUP ) )
    {
      sprintf( strback, "%s%c/%s", BACKUP_DIR, tolower(ch->name[0]),
               Capitalize( ch->name ) );
      rename( strsave, strback );
    }

  /*
   * Save immortal stats, level & vnums for wizlist             -Thoric
   * and do_vnums command
   *
   * Also save the player flags so we the wizlist builder can see
   * who is a guest and who is retired.
   */
  if ( GetTrustLevel(ch) > LEVEL_AVATAR )
    {
      sprintf( strback, "%s%s", GOD_DIR, Capitalize( ch->name ) );

      if ( ( fp = fopen( strback, "w" ) ) == NULL )
        {
          Bug( "%s: fopen", __FUNCTION__ );
          perror( strsave );
        }
      else
        {
          fprintf( fp, "Level        %d\n", ch->top_level );
          fprintf( fp, "Pcflags      %d\n", ch->pcdata->flags );

          if ( ch->pcdata->r_range_lo && ch->pcdata->r_range_hi )
	    {
	      fprintf( fp, "RoomRange    %ld %ld\n", ch->pcdata->r_range_lo,
		       ch->pcdata->r_range_hi     );
	    }

          if ( ch->pcdata->o_range_lo && ch->pcdata->o_range_hi )
	    {
	      fprintf( fp, "ObjRange     %ld %ld\n", ch->pcdata->o_range_lo,
		       ch->pcdata->o_range_hi     );
	    }

          if ( ch->pcdata->m_range_lo && ch->pcdata->m_range_hi )
	    {
	      fprintf( fp, "MobRange     %ld %ld\n", ch->pcdata->m_range_lo,
		       ch->pcdata->m_range_hi     );
	    }

          fclose( fp );
        }
    }

  if ( ( fp = fopen( strsave, "w" ) ) == NULL )
    {
      Bug( "%s: fopen", __FUNCTION__ );
      perror( strsave );
    }
  else
    {
      WriteCharacter( ch, fp );

      if ( ch->first_carrying )
	{
	  WriteObject( ch, ch->last_carrying, fp, 0, OS_CARRY );
	}

      if ( ch->pcdata && ch->pcdata->comments )
	{
	  WriteComments( ch, fp );
	}

      if ( ch->pcdata->pet )
	{
	  WriteMobile( fp, ch->pcdata->pet );
	}

      fprintf( fp, "#END\n" );
      fclose( fp );
    }

  ReEquipCharacter( ch );

  WriteCorpses(ch, NULL);
  quitting_char = NULL;
  saving_char   = NULL;
}

void SaveClone( Character *ch )
{
  char strsave[MAX_INPUT_LENGTH];
  char strback[MAX_INPUT_LENGTH];
  FILE *fp = NULL;

  if ( !ch )
    {
      Bug( "Save_char_obj: null ch!" );
      return;
    }

  if ( IsNpc(ch) || !IsAuthed(ch) )
    {
      return;
    }

  if ( ch->desc && ch->desc->original )
    {
      ch = ch->desc->original;
    }

  DeEquipCharacter( ch );
  ch->pcdata->clones++;

  ch->pcdata->save_time = current_time;
  sprintf( strsave, "%s%c/%s.clone", PLAYER_DIR, tolower(ch->name[0]),
           Capitalize( ch->name ) );

  /*
   * Auto-backup pfile (can cause lag with high disk access situtations
   */
  if ( IsBitSet( sysdata.save_flags, SV_BACKUP ) )
    {
      sprintf( strback, "%s%c/%s", BACKUP_DIR, tolower(ch->name[0]),
               Capitalize( ch->name ) );
      rename( strsave, strback );
    }

  if ( ( fp = fopen( strsave, "w" ) ) == NULL )
    {
      Bug( "Save_char_obj: fopen", 0 );
      perror( strsave );
    }
  else
    {
      WriteCharacter( ch, fp );

      if ( ch->pcdata && ch->pcdata->comments )
	{
	  WriteComments( ch, fp );
	}

      fprintf( fp, "#END\n" );
      fclose( fp );
    }

  ch->pcdata->clones--;
  ReEquipCharacter( ch );

  WriteCorpses(ch, NULL);
  quitting_char = NULL;
  saving_char   = NULL;
}

/*
 * Write the char.
 */
static void WriteCharacter( const Character *ch, FILE *fp )
{
  const Affect *paf = NULL;
  const Alias *pal = NULL;
  int sn = 0;
  int track = 0;
  int drug = 0;
  const Skill *skill = NULL;

  fprintf( fp, "#%s\n", IsNpc(ch) ? "MOB" : "PLAYER"           );

  fprintf( fp, "Version      %d\n",   SAVEVERSION               );
  fprintf( fp, "Name         %s~\n",    ch->name                );

  if ( ch->short_descr && ch->short_descr[0] != '\0' )
    {
      fprintf( fp, "ShortDescr   %s~\n",  ch->short_descr );
    }

  if ( ch->long_descr && ch->long_descr[0] != '\0' )
    {
      fprintf( fp, "LongDescr    %s~\n",  ch->long_descr  );
    }

  if ( ch->description && ch->description[0] != '\0' )
    {
      fprintf( fp, "Description  %s~\n",  ch->description );
    }

  fprintf( fp, "Sex          %d\n",     ch->sex                 );
  fprintf( fp, "Race         %d\n",     ch->race                );
  fprintf( fp, "MainAbility  %d\n",     ch->ability.main        );
  fprintf( fp, "Languages    %d %d\n", ch->speaks, ch->speaking );
  fprintf( fp, "Toplevel     %d\n",     ch->top_level           );

  if ( ch->trust )
    {
      fprintf( fp, "Trust        %d\n",   ch->trust               );
    }

  fprintf( fp, "Played       %d\n",
           ch->pcdata->played + (int) (current_time - ch->pcdata->logon)                );
  fprintf( fp, "Room         %ld\n",
           (  ch->in_room == GetRoom( ROOM_VNUM_LIMBO )
              && ch->was_in_room )
           ? ch->was_in_room->vnum
           : ch->in_room->vnum );

  if ( ch->plr_home != NULL )
    {
      fprintf( fp, "PlrHome      %ld\n",          ch->plr_home->vnum );
    }

  fprintf( fp, "HpManaMove   %d %d 0 0 %d %d\n",
           ch->hit, ch->max_hit, ch->move, ch->max_move );
  fprintf( fp, "Force        %d %d %d %d\n", ch->stats.perm_frc, ch->stats.mod_frc, ch->mana, ch->max_mana );
  fprintf( fp, "Gold         %d\n",     ch->gold                );
  fprintf( fp, "Bank         %ld\n",    ch->pcdata->bank                );

  {
    int ability;
    for ( ability = 0 ; ability < MAX_ABILITY ; ability++ )
      fprintf( fp, "Ability        %d %d %ld\n",
               ability, GetAbilityLevel( ch, ability ), GetAbilityXP( ch, ability ) );
  }

  fprintf( fp, "Clones         %d\n",   ch->pcdata->clones              );
  fprintf( fp, "Salary_time         %ld\n",     ch->pcdata->ClanInfo.SalaryDate );
  fprintf( fp, "Salary         %d\n",   ch->pcdata->ClanInfo.Salary );
  fprintf( fp, "Clones         %d\n",   ch->pcdata->clones              );
  fprintf( fp, "Jailvnum         %ld\n", ch->pcdata->jail_vnum   );

  if ( ch->act )
    {
      fprintf( fp, "Act          %d\n", ch->act                   );
    }

  if ( ch->affected_by )
    {
      fprintf( fp, "AffectedBy   %d\n",   ch->affected_by         );
    }

  fprintf( fp, "Position     %d\n",
           ch->position == POS_FIGHTING ? POS_STANDING : ch->position );

  fprintf( fp, "SavingThrows %d %d %d %d %d\n",
           ch->saving.poison_death,
           ch->saving.wand,
           ch->saving.para_petri,
           ch->saving.breath,
           ch->saving.spell_staff                       );
  fprintf( fp, "Alignment    %d\n",     ch->alignment           );
  fprintf( fp, "Hitroll      %d\n",     ch->hitroll             );
  fprintf( fp, "Damroll      %d\n",     ch->damroll             );
  fprintf( fp, "Armor        %d\n",     ch->armor               );

  if ( ch->wimpy )
    {
      fprintf( fp, "Wimpy        %d\n",   ch->wimpy               );
    }

  if ( ch->deaf )
    {
      fprintf( fp, "Deaf         %d\n",   ch->deaf                );
    }

  if ( ch->resistant )
    {
      fprintf( fp, "Resistant    %d\n",   ch->resistant           );
    }

  if ( ch->immune )
    {
      fprintf( fp, "Immune       %d\n",   ch->immune              );
    }

  if ( ch->susceptible )
    {
      fprintf( fp, "Susceptible  %d\n",   ch->susceptible         );
    }

  if ( ch->pcdata && ch->pcdata->outcast_time )
    {
      fprintf( fp, "Outcast_time %ld\n",ch->pcdata->outcast_time );
    }

  if ( ch->pcdata && ch->pcdata->restore_time )
    {
      fprintf( fp, "Restore_time %ld\n",ch->pcdata->restore_time );
    }

  if ( ch->mental_state != -10 )
    {
      fprintf( fp, "Mentalstate  %d\n",   ch->mental_state        );
    }

  if ( IsNpc(ch) )
    {
      fprintf( fp, "Vnum         %ld\n", ch->Prototype->vnum    );
      fprintf( fp, "Mobinvis     %d\n", ch->mobinvis            );
    }
  else
    {
      fprintf( fp, "Password     %s~\n", ch->pcdata->pwd         );
      fprintf( fp, "Lastplayed   %d\n", (int)current_time );

      if ( ch->pcdata->bamfin && ch->pcdata->bamfin[0] != '\0' )
	{
	  fprintf( fp, "Bamfin       %s~\n",      ch->pcdata->bamfin      );
	}

      if ( ch->pcdata->email && ch->pcdata->email[0] != '\0' )
	{
	  fprintf( fp, "Email       %s~\n",       ch->pcdata->email       );
	}

      if ( ch->pcdata->bamfout && ch->pcdata->bamfout[0] != '\0' )
	{
	  fprintf( fp, "Bamfout      %s~\n",      ch->pcdata->bamfout     );
	}

      if ( ch->pcdata->rank && ch->pcdata->rank[0] != '\0' )
	{
	  fprintf( fp, "Rank         %s~\n",      ch->pcdata->rank        );
	}

      if ( ch->pcdata->bestowments && ch->pcdata->bestowments[0] != '\0' )
	{
	  fprintf( fp, "Bestowments  %s~\n",      ch->pcdata->bestowments );
	}

      fprintf( fp, "Title        %s~\n",        ch->pcdata->title       );

      if ( ch->pcdata->homepage && ch->pcdata->homepage[0] != '\0' )
	{
	  fprintf( fp, "Homepage     %s~\n",      ch->pcdata->homepage    );
	}

      if ( ch->pcdata->bio && ch->pcdata->bio[0] != '\0' )
	{
	  fprintf( fp, "Bio          %s~\n",      ch->pcdata->bio         );
	}

      if ( ch->pcdata->authed_by && ch->pcdata->authed_by[0] != '\0' )
	{
	  fprintf( fp, "AuthedBy     %s~\n",      ch->pcdata->authed_by   );
	}

      if ( ch->pcdata->min_snoop )
	{
	  fprintf( fp, "Minsnoop     %d\n",       ch->pcdata->min_snoop   );
	}

      if ( ch->pcdata->prompt && *ch->pcdata->prompt )
	{
	  fprintf( fp, "Prompt       %s~\n",      ch->pcdata->prompt      );
	}

      if ( ch->pcdata->pagerlen != 24 )
	{
	  fprintf( fp, "Pagerlen     %d\n",       ch->pcdata->pagerlen    );
	}

      for ( pal = ch->pcdata->first_alias; pal; pal = pal->next )
        {
          if ( !pal->name || !pal->cmd || !*pal->name || !*pal->cmd )
	    {
	      continue;
	    }

          fprintf( fp, "Alias        %s~ %s~\n", pal->name, pal->cmd );
        }

      fprintf( fp, "Addiction   ");

      for ( drug = 0 ; drug <=9 ; drug++ )
	{
	  fprintf( fp, " %d",     ch->pcdata->addiction[drug] );
	}

      fprintf( fp, "\n");
      fprintf( fp, "Druglevel   ");

      for ( drug = 0 ; drug <=9 ; drug++ )
	{
	  fprintf( fp, " %d",     ch->pcdata->drug_level[drug] );
	}

      fprintf( fp, "\n");

      if ( ch->pcdata->wanted_flags )
	{
	  fprintf( fp, "Wanted       %d\n",       ch->pcdata->wanted_flags );
	}

      if ( IsImmortal( ch ) || ch->pcdata->area )
        {
          fprintf( fp, "WizInvis     %d\n", ch->pcdata->wizinvis );

          if ( ch->pcdata->r_range_lo && ch->pcdata->r_range_hi )
	    {
	      fprintf( fp, "RoomRange    %ld %ld\n", ch->pcdata->r_range_lo,
		       ch->pcdata->r_range_hi     );
	    }

          if ( ch->pcdata->o_range_lo && ch->pcdata->o_range_hi )
	    {
	      fprintf( fp, "ObjRange     %ld %ld\n", ch->pcdata->o_range_lo,
		       ch->pcdata->o_range_hi     );
	    }

          if ( ch->pcdata->m_range_lo && ch->pcdata->m_range_hi )
	    {
	      fprintf( fp, "MobRange     %ld %ld\n", ch->pcdata->m_range_lo,
		       ch->pcdata->m_range_hi     );
	    }
        }

      if ( ch->pcdata->ClanInfo.ClanName && ch->pcdata->ClanInfo.ClanName[0] != '\0' )
	{
	  fprintf( fp, "Clan         %s~\n",      ch->pcdata->ClanInfo.ClanName   );
	}

      fprintf( fp, "Flags        %d\n", ch->pcdata->flags       );

      if ( ch->pcdata->release_date > current_time )
	{
	  fprintf( fp, "Helled       %d %s~\n",
		   (int)ch->pcdata->release_date, ch->pcdata->helled_by );
	}

      if ( ch->pcdata->pkills )
	{
	  fprintf( fp, "PKills       %d\n",       ch->pcdata->pkills      );
	}

      if ( ch->pcdata->pdeaths )
	{
	  fprintf( fp, "PDeaths      %d\n",       ch->pcdata->pdeaths     );
	}

      if ( ch->pcdata->target && ch->pcdata->target[0] != '\0' )
	{
	  fprintf( fp, "Targ %s~\n",      ch->pcdata->target      );
	}

      if ( GetTimer( ch , TIMER_PKILLED)
           && ( GetTimer( ch , TIMER_PKILLED) > 0 ) )
	{
	  fprintf( fp, "PTimer       %d\n",     GetTimer(ch, TIMER_PKILLED));
	}

      fprintf( fp, "MKills       %d\n", ch->pcdata->mkills      );
      fprintf( fp, "MDeaths      %d\n", ch->pcdata->mdeaths     );

      if ( ch->pcdata->illegal_pk )
	{
	  fprintf( fp, "IllegalPK    %d\n",       ch->pcdata->illegal_pk  );
	}

      fprintf( fp, "AttrPerm     %d %d %d %d %d %d %d\n",
               ch->stats.perm_str,
               ch->stats.perm_int,
               ch->stats.perm_wis,
               ch->stats.perm_dex,
               ch->stats.perm_con,
               ch->stats.perm_cha,
               ch->stats.perm_lck );

      fprintf( fp, "AttrMod      %d %d %d %d %d %d %d\n",
               ch->stats.mod_str,
               ch->stats.mod_int,
               ch->stats.mod_wis,
               ch->stats.mod_dex,
               ch->stats.mod_con,
               ch->stats.mod_cha,
               ch->stats.mod_lck );

      fprintf( fp, "Condition    %d %d %d %d\n",
               ch->pcdata->condition[0],
               ch->pcdata->condition[1],
               ch->pcdata->condition[2],
               ch->pcdata->condition[3] );

      if ( ch->desc && ch->desc->remote.hostname )
	{
	  fprintf( fp, "Site         %s\n", ch->desc->remote.hostname );
	}
      else
	{
	  fprintf( fp, "Site         (Link-Dead)\n" );
	}

      for ( sn = 1; sn < TopSN; sn++ )
        {
          if ( SkillTable[sn]->Name && ch->pcdata->learned[sn] > 0 )
	    {
	      switch( SkillTable[sn]->Type )
		{
		default:
		  fprintf( fp, "Skill        %d '%s'\n",
			   ch->pcdata->learned[sn], SkillTable[sn]->Name );
		  break;

		case SKILL_SPELL:
		  fprintf( fp, "Spell        %d '%s'\n",
			   ch->pcdata->learned[sn], SkillTable[sn]->Name );
		  break;

		case SKILL_WEAPON:
		  fprintf( fp, "Weapon       %d '%s'\n",
			   ch->pcdata->learned[sn], SkillTable[sn]->Name );
		  break;

		case SKILL_TONGUE:
		  fprintf( fp, "Tongue       %d '%s'\n",
			   ch->pcdata->learned[sn], SkillTable[sn]->Name );
		  break;
		}
	    }
        }
    }

  for ( paf = ch->first_affect; paf; paf = paf->next )
    {
      if ( paf->Type >= 0 && (skill=GetSkill(paf->Type)) == NULL )
	{
	  continue;
	}

      if ( paf->Type >= 0 && paf->Type < TYPE_PERSONAL )
	{
	  fprintf( fp, "AffectData   '%s' %3d %3d %3d %10d\n",
		   skill->Name,
		   paf->Duration,
		   paf->Modifier,
		   paf->Location,
		   paf->AffectedBy
		   );
	}
      else
	{
	  fprintf( fp, "Affect       %3d %3d %3d %3d %10d\n",
		   paf->Type,
		   paf->Duration,
		   paf->Modifier,
		   paf->Location,
		   paf->AffectedBy
		   );
	}
    }

  track = urange( 2, ((ch->top_level+3) * MAX_KILLTRACK)/LEVEL_AVATAR, MAX_KILLTRACK );

  for ( sn = 0; sn < track; sn++ )
    {
      if ( ch->pcdata->killed[sn].vnum == INVALID_VNUM )
	{
	  break;
	}

      fprintf( fp, "Killed       %ld %d\n",
               ch->pcdata->killed[sn].vnum,
               ch->pcdata->killed[sn].count );
    }

#ifdef SWRIP_USE_IMC
  ImcSaveCharacter( ch, fp );
#endif

  fprintf( fp, "End\n\n" );
}

static bool HasAnyOvalues( const Object *obj )
{
  int oval = 0;

  for( oval = 0; oval < MAX_OVAL; ++oval )
    {
      if( obj->value[oval] != 0 )
	{
	  return true;
	}
    }

  return false;
}

/*
 * Write an object and its contents.
 */
void WriteObject( const Character *ch, const Object *obj, FILE *fp, int iNest,
                 short os_type )
{
  ExtraDescription *ed = NULL;
  Affect *paf = NULL;
  short wear = 0, wear_loc = 0, x = 0;

  if ( iNest >= MAX_NEST )
    {
      Bug( "WriteObject: iNest hit MAX_NEST %d", iNest );
      return;
    }

  /*
   * Slick recursion to write lists backwards,
   *   so loading them will load in forwards order.
   */
  if ( obj->prev_content && os_type != OS_CORPSE )
    {
      WriteObject( ch, obj->prev_content, fp, iNest, OS_CARRY );
    }

  /*
   * Castrate storage characters.
   */
  if ( obj->item_type == ITEM_KEY && !IS_OBJ_STAT(obj, ITEM_CLANOBJECT ))
    {
      return;
    }

  /*
   * Catch deleted objects                                      -Thoric
   */
  if ( IsObjectExtracted(obj) )
    {
      return;
    }

  /*
   * Do NOT save prototype items!                               -Thoric
   */
  if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
    {
      return;
    }

  /* Corpse saving. -- Altrag */
  fprintf( fp, (os_type == OS_CORPSE ? "#CORPSE\n" : "#OBJECT\n") );

  if ( iNest )
    {
      fprintf( fp, "Nest         %d\n",   iNest                );
    }

  if ( obj->count > 1 )
    {
      fprintf( fp, "Count        %d\n",   obj->count           );
    }

  if ( StrCmp( obj->name, obj->Prototype->name ) )
    {
      fprintf( fp, "Name         %s~\n",  obj->name            );
    }

  if ( StrCmp( obj->short_descr, obj->Prototype->short_descr ) )
    {
      fprintf( fp, "ShortDescr   %s~\n",  obj->short_descr     );
    }

  if ( StrCmp( obj->description, obj->Prototype->description ) )
    {
      fprintf( fp, "Description  %s~\n",  obj->description     );
    }

  if ( StrCmp( obj->action_desc, obj->Prototype->action_desc ) )
    {
      fprintf( fp, "ActionDesc   %s~\n",  obj->action_desc     );
    }

  fprintf( fp, "Vnum         %ld\n",     obj->Prototype->vnum );

  if ( os_type == OS_CORPSE && obj->in_room )
    {
      fprintf( fp, "Room         %ld\n",   obj->in_room->vnum  );
    }

  if ( obj->extra_flags != obj->Prototype->extra_flags )
    {
      fprintf( fp, "ExtraFlags   %d\n",   obj->extra_flags     );
    }

  if ( obj->wear_flags != obj->Prototype->wear_flags )
    {
      fprintf( fp, "WearFlags    %d\n",   obj->wear_flags      );
    }

  wear_loc = -1;

  for ( wear = 0; wear < MAX_WEAR; wear++ )
    {
      for ( x = 0; x < MAX_LAYERS; x++ )
	{
	  if ( obj == save_equipment[wear][x] )
	    {
	      wear_loc = wear;
	      break;
	    }
	  else if ( !save_equipment[wear][x] )
	    {
	      break;
	    }
	}
    }

  if ( wear_loc != -1 )
    {
      fprintf( fp, "WearLoc      %d\n",   wear_loc             );
    }

  if ( obj->item_type != obj->Prototype->item_type )
    {
      fprintf( fp, "ItemType     %d\n",   obj->item_type       );
    }

  if ( obj->weight != obj->Prototype->weight )
    {
      fprintf( fp, "Weight       %d\n",   obj->weight                  );
    }

  if ( obj->level )
    {
      fprintf( fp, "Level        %d\n",   obj->level                   );
    }

  if ( obj->timer )
    {
      fprintf( fp, "Timer        %d\n",   obj->timer                   );
    }

  if ( obj->cost != obj->Prototype->cost )
    {
      fprintf( fp, "Cost         %d\n",   obj->cost                    );
    }

  if( HasAnyOvalues( obj ) )
    {
      fprintf( fp, "Values       %d %d %d %d %d %d\n",
	       obj->value[0], obj->value[1], obj->value[2],
	       obj->value[3], obj->value[4], obj->value[5]     );
    }

  switch ( obj->item_type )
    {
    case ITEM_PILL: /* was down there with staff and wand, wrongly - Scryn */
    case ITEM_POTION:
      if ( IS_VALID_SN(obj->value[OVAL_PILL_SPELL1]) )
	{
	  fprintf( fp, "Spell 1      '%s'\n",
		   SkillTable[obj->value[OVAL_PILL_SPELL1]]->Name );
	}

      if ( IS_VALID_SN(obj->value[OVAL_PILL_SPELL2]) )
	{
	  fprintf( fp, "Spell 2      '%s'\n",
		   SkillTable[obj->value[OVAL_PILL_SPELL2]]->Name );
	}

      if ( IS_VALID_SN(obj->value[OVAL_PILL_SPELL3]) )
	{
	  fprintf( fp, "Spell 3      '%s'\n",
		   SkillTable[obj->value[OVAL_PILL_SPELL3]]->Name );
	}
      break;

    case ITEM_DEVICE:
      if ( IS_VALID_SN(obj->value[OVAL_DEVICE_SPELL]) )
	{
	  fprintf( fp, "Spell 3      '%s'\n",
		   SkillTable[obj->value[OVAL_DEVICE_SPELL]]->Name );
	}
      break;

    case ITEM_SALVE:
      if ( IS_VALID_SN(obj->value[OVAL_SALVE_SPELL1]) )
	{
	  fprintf( fp, "Spell 4      '%s'\n",
		   SkillTable[obj->value[OVAL_SALVE_SPELL1]]->Name );
	}

      if ( IS_VALID_SN(obj->value[OVAL_SALVE_SPELL2]) )
	{
	  fprintf( fp, "Spell 5      '%s'\n",
		   SkillTable[obj->value[OVAL_SALVE_SPELL2]]->Name );
	}

      break;
    }

  for ( paf = obj->first_affect; paf; paf = paf->next )
    {
      /*
       * Save extra object affects                              -Thoric
       */
      if ( paf->Type < 0 || paf->Type >= TopSN )
        {
          fprintf( fp, "Affect       %d %d %d %d %d\n",
                   paf->Type,
                   paf->Duration,
                   ((paf->Location == APPLY_WEAPONSPELL
                     || paf->Location == APPLY_WEARSPELL
                     || paf->Location == APPLY_REMOVESPELL
                     || paf->Location == APPLY_STRIPSN)
                    && IS_VALID_SN(paf->Modifier))
                   ? SkillTable[paf->Modifier]->Slot : paf->Modifier,
                   paf->Location,
                   paf->AffectedBy
                   );
        }
      else
	{
	  fprintf( fp, "AffectData   '%s' %d %d %d %d\n",
		   SkillTable[paf->Type]->Name,
		   paf->Duration,
		   ((paf->Location == APPLY_WEAPONSPELL
		     || paf->Location == APPLY_WEARSPELL
		     || paf->Location == APPLY_REMOVESPELL
		     || paf->Location == APPLY_STRIPSN)
		    && IS_VALID_SN(paf->Modifier))
		   ? SkillTable[paf->Modifier]->Slot : paf->Modifier,
		   paf->Location,
		   paf->AffectedBy
		   );
	}
    }

  for ( ed = obj->first_extradesc; ed; ed = ed->next )
    {
      fprintf( fp, "ExtraDescr   %s~ %s~\n",
	       ed->keyword, ed->description );
    }

  fprintf( fp, "End\n\n" );

  if ( obj->first_content )
    {
      WriteObject( ch, obj->last_content, fp, iNest + 1, OS_CARRY );
    }
}

/*
 * Load a char and inventory into a new ch structure.
 */
bool LoadCharacter( Descriptor *d, const char *name, bool preload )
{
  char strsave[MAX_INPUT_LENGTH];
  Character *ch = NULL;
  FILE *fp = NULL;
  bool found = false;
  struct stat fst;
  int i = 0, x = 0;
  char buf[MAX_INPUT_LENGTH];

  AllocateMemory( ch, Character, 1 );

  for ( x = 0; x < MAX_WEAR; x++ )
    {
      for ( i = 0; i < MAX_LAYERS; i++ )
	{
	  save_equipment[x][i] = NULL;
	}
    }

  ClearCharacter( ch );
  loading_char = ch;

  AllocateMemory( ch->pcdata, PCData, 1 );
  d->character                = ch;
  ch->on                              = NULL;
  ch->desc                            = d;
  ch->name                            = CopyString( name );
  ch->act                             = PLR_BLANK | PLR_COMBINE | PLR_PROMPT;
  ch->stats.perm_str                  = 10;
  ch->stats.perm_int                  = 10;
  ch->stats.perm_wis                  = 10;
  ch->stats.perm_dex                  = 10;
  ch->stats.perm_con                  = 10;
  ch->stats.perm_cha                  = 10;
  ch->stats.perm_lck                  = 10;
  ch->pcdata->condition[COND_THIRST]  = 48;
  ch->pcdata->condition[COND_FULL]    = 48;
  ch->pcdata->condition[COND_BLOODTHIRST] = 10;
  ch->pcdata->wizinvis                = 0;
  ch->mental_state                    = -10;
  ch->mobinvis                        = 0;

  for(i = 0; i < MAX_SKILL; i++)
    {
      ch->pcdata->learned[i]          = 0;
    }

  ch->pcdata->release_date  = 0;
  ch->pcdata->helled_by     = NULL;
  ch->pcdata->pet           = NULL;
  ch->saving.poison_death   = 0;
  ch->saving.wand           = 0;
  ch->saving.para_petri     = 0;
  ch->saving.breath         = 0;
  ch->saving.spell_staff    = 0;
  ch->pcdata->comments      = NULL;
  ch->pcdata->pagerlen      = 24;
  ch->mob_clan              = CopyString( "" );
  ch->was_sentinel          = NULL;
  ch->plr_home              = NULL;

#ifdef SWRIP_USE_IMC
  ImcInitializeCharacter( ch );
#endif

  sprintf( strsave, "%s%c/%s", PLAYER_DIR, tolower(name[0]),
           Capitalize( name ) );

  if ( stat( strsave, &fst ) != -1 )
    {
      if ( fst.st_size == 0 )
        {
          sprintf( strsave, "%s%c/%s", BACKUP_DIR, tolower(name[0]),
                   Capitalize( name ) );
          SendToCharacter( "Restoring your backup player file...", ch );
        }
      else
        {
          sprintf( buf, "%s player data for: %s (%dK)",
                   preload ? "Preloading" : "Loading", ch->name,
                   (int) fst.st_size/1024 );
          LogStringPlus( buf, LOG_COMM, LEVEL_GREATER );
        }
    }
  /* else no player file */

  if ( ( fp = fopen( strsave, "r" ) ) != NULL )
    {
      int iNest = 0;

      for ( iNest = 0; iNest < MAX_NEST; iNest++ )
	{
	  rgObjNest[iNest] = NULL;
	}

      found = true;
      /* Cheat so that bug will show line #'s -- Altrag */
      fpArea = fp;
      strcpy(strArea, strsave);

      for ( ; ; )
        {
	  const char *word;
          char letter = ReadChar( fp );

          if ( letter == '*' )
            {
              ReadToEndOfLine( fp );
              continue;
            }

          if ( letter != '#' )
            {
              Bug( "Load_char_obj: # not found.", 0 );
              Bug( name );
              break;
            }

          word = ReadWord( fp );

          if ( !StrCmp( word, "PLAYER" ) )
            {
              ReadCharacter ( ch, fp, preload );

              if ( preload )
		{
		  break;
		}
            }
          else if ( !StrCmp( word, "OBJECT" ) )
	    {
	      ReadObject( ch, fp, OS_CARRY );
	    }
	  else if ( !StrCmp( word, "COMMENT") )
	    {
	      ReadComment(ch, fp );
	    }
	  else if ( !StrCmp( word, "MOBILE") )
	    {
	      Character *mob = ReadMobile( fp );
	      ch->pcdata->pet = mob;
	      mob->master = ch;
	      SetBit(mob->affected_by, AFF_CHARM);
	    }
	  else if ( !StrCmp( word, "END"    ) )
	    {
	      break;
	    }
	  else
	    {
	      Bug( "Load_char_obj: bad section." );
	      Bug( name );
	      break;
	    }
        }

      fclose( fp );
      fpArea = NULL;
      strcpy(strArea, "$");
    }

  if ( !found )
    {
      ch->short_descr           = CopyString( "" );
      ch->long_descr            = CopyString( "" );
      ch->description           = CopyString( "" );
      ch->pcdata->target        = CopyString( "" );
      ch->editor                = NULL;
      ch->pcdata->clones        = 0;
      ch->pcdata->jail_vnum     = 0;
      ch->pcdata->ClanInfo.ClanName = CopyString( "" );
      ch->pcdata->ClanInfo.Clan = NULL;
      ch->pcdata->pwd           = CopyString( "" );
      ch->pcdata->email         = CopyString( "" );
      ch->pcdata->bamfin        = CopyString( "" );
      ch->pcdata->bamfout       = CopyString( "" );
      ch->pcdata->rank          = CopyString( "" );
      ch->pcdata->bestowments   = CopyString( "" );
      ch->pcdata->title         = CopyString( "" );
      ch->pcdata->homepage      = CopyString( "" );
      ch->pcdata->bio           = CopyString( "" );
      ch->pcdata->authed_by     = CopyString( "" );
      ch->pcdata->prompt        = CopyString( "" );
      ch->pcdata->r_range_lo    = 0;
      ch->pcdata->r_range_hi    = 0;
      ch->pcdata->m_range_lo    = 0;
      ch->pcdata->m_range_hi    = 0;
      ch->pcdata->o_range_lo    = 0;
      ch->pcdata->o_range_hi    = 0;
      ch->pcdata->wizinvis      = 0;
      ch->pcdata->wanted_flags  = 0;
      ch->pcdata->first_alias   = NULL;
      ch->pcdata->last_alias    = NULL;
      ch->on                    = NULL;
    }
  else
    {
      ch->on = NULL;

      if ( !ch->pcdata->ClanInfo.ClanName )
        {
          ch->pcdata->ClanInfo.ClanName = CopyString( "" );
          ch->pcdata->ClanInfo.Clan      = NULL;
        }

      if ( !ch->pcdata->bio )
	{
	  ch->pcdata->bio  = CopyString( "" );
	}

      if ( !ch->pcdata->authed_by )
	{
	  ch->pcdata->authed_by    = CopyString( "" );
	}

      if ( !IsNpc( ch ) && GetTrustLevel( ch ) > LEVEL_AVATAR )
        {
          if ( ch->pcdata->wizinvis < 2 )
	    {
	      ch->pcdata->wizinvis = ch->top_level;
	    }

          AssignAreaTo( ch );
        }

      if ( file_ver > 1 )
        {
          for ( i = 0; i < MAX_WEAR; i++ )
	    {
	      for ( x = 0; x < MAX_LAYERS; x++ )
		{
		  if ( save_equipment[i][x] )
		    {
		      EquipCharacter( ch, save_equipment[i][x], i );
		      save_equipment[i][x] = NULL;
		    }
		  else
		    {
		      break;
		    }
		}
	    }
        }
    }

  loading_char = NULL;
  return found;
}

/*
 * Read in a char.
 */
static void ReadCharacter( Character *ch, FILE *fp, bool preload )
{
  file_ver = 0;

  for ( ; ; )
    {
      char buf[MAX_STRING_LENGTH];
      const char *line = NULL;
      int x1 = 0, x2 = 0, x3 = 0, x4 = 0, x5 = 0, x6 = 0, x7 = 0, x8 = 0, x9 = 0, x0 = 0;
      short killcnt = 0;
      time_t lastplayed = 0;
      int sn = 0;
      const char *word = feof( fp ) ? "End" : ReadWord( fp );
      bool fMatch = false;

      switch ( CharToUppercase(word[0]) )
        {
        case '*':
          fMatch = true;
          ReadToEndOfLine( fp );
          break;

        case 'A':
          KEY( "Act",           ch->act,                ReadInt( fp ) );
          KEY( "AffectedBy",    ch->affected_by,        ReadInt( fp ) );
          KEY( "Alignment",     ch->alignment,          ReadInt( fp ) );
          KEY( "Armor", ch->armor,              ReadInt( fp ) );

          if ( !StrCmp( word, "Addiction"  ) )
            {
              line = ReadLine( fp );
              x0 = x1 = x2 = x3 = x4 = x5 = x6 = x7 = x8 = x9 = 0;
              sscanf( line, "%d %d %d %d %d %d %d %d %d %d",
                      &x0, &x1, &x2, &x3, &x4, &x5, &x6, &x7, &x8, &x9 );
              ch->pcdata->addiction[0] = x0;
              ch->pcdata->addiction[1] = x1;
              ch->pcdata->addiction[2] = x2;
              ch->pcdata->addiction[3] = x3;
              ch->pcdata->addiction[4] = x4;
              ch->pcdata->addiction[5] = x5;
              ch->pcdata->addiction[6] = x6;
              ch->pcdata->addiction[7] = x7;
              ch->pcdata->addiction[8] = x8;
              ch->pcdata->addiction[9] = x9;
              fMatch = true;
              break;
            }

          if ( !StrCmp( word, "Ability"  ) )
            {
              line = ReadLine( fp );
              x0=x1=x2=0;
              sscanf( line, "%d %d %d",
                      &x0, &x1, &x2 );

              if ( x0 >= 0 && x0 < MAX_ABILITY )
                {
                  SetAbilityLevel( ch, x0, x1 );
                  SetAbilityXP( ch, x0, x2 );
                }

              fMatch = true;
              break;
            }

          if ( !StrCmp( word, "Affect" ) || !StrCmp( word, "AffectData" ) )
            {
              Affect *paf = NULL;

              if ( preload )
                {
                  fMatch = true;
                  ReadToEndOfLine( fp );
                  break;
                }

              AllocateMemory( paf, Affect, 1 );

              if ( !StrCmp( word, "Affect" ) )
                {
                  paf->Type = ReadInt( fp );
                }
              else
                {
                  const char *sname = ReadWord(fp);

                  if ( (sn=LookupSkill(sname)) < 0 )
                    {
                      if ( (sn=LookupHerb(sname)) < 0 )
			{
			  Bug( "ReadCharacter: unknown skill.", 0 );
			}
                      else
			{
			  sn += TYPE_HERB;
			}
                    }

                  paf->Type = sn;
                }

              paf->Duration   = ReadInt( fp );
              paf->Modifier   = ReadInt( fp );
              paf->Location   = ReadInt( fp );
              paf->AffectedBy = ReadInt( fp );
              LINK(paf, ch->first_affect, ch->last_affect, next, prev );
              fMatch = true;
              break;
            }

          if ( !StrCmp( word, "AttrMod"  ) )
            {
              line = ReadLine( fp );
              x1=x2=x3=x4=x5=x6=x7=13;
              sscanf( line, "%d %d %d %d %d %d %d",
                      &x1, &x2, &x3, &x4, &x5, &x6, &x7 );
              ch->stats.mod_str = x1;
              ch->stats.mod_int = x2;
              ch->stats.mod_wis = x3;
              ch->stats.mod_dex = x4;
              ch->stats.mod_con = x5;
              ch->stats.mod_cha = x6;
              ch->stats.mod_lck = x7;
              if (!x7)
                ch->stats.mod_lck = 0;
              fMatch = true;
              break;
            }

          if ( !StrCmp( word, "Alias" ) )
            {
              Alias *pal = NULL;

              if ( preload )
                {
                  fMatch = true;
                  ReadToEndOfLine( fp );
                  break;
                }

              AllocateMemory( pal, Alias, 1 );

              pal->name = ReadStringToTilde( fp );
              pal->cmd  = ReadStringToTilde( fp );
	      AddAlias( ch, pal );
              fMatch = true;
              break;
            }

          if ( !StrCmp( word, "AttrPerm" ) )
            {
              line = ReadLine( fp );
              x1=x2=x3=x4=x5=x6=x7=0;
              sscanf( line, "%d %d %d %d %d %d %d",
                      &x1, &x2, &x3, &x4, &x5, &x6, &x7 );
              ch->stats.perm_str = x1;
              ch->stats.perm_int = x2;
              ch->stats.perm_wis = x3;
              ch->stats.perm_dex = x4;
              ch->stats.perm_con = x5;
              ch->stats.perm_cha = x6;
              ch->stats.perm_lck = x7;

              if ( x7 == 0 )
		{
		  ch->stats.perm_lck = 13;
		}

              fMatch = true;
              break;
            }

          KEY( "AuthedBy",      ch->pcdata->authed_by,  ReadStringToTilde( fp ) );
          break;

        case 'B':
          KEY( "Bamfin",        ch->pcdata->bamfin,     ReadStringToTilde( fp ) );
          KEY( "Bamfout",       ch->pcdata->bamfout,    ReadStringToTilde( fp ) );
          KEY( "Bestowments", ch->pcdata->bestowments, ReadStringToTilde( fp ) );
          KEY( "Bio",           ch->pcdata->bio,        ReadStringToTilde( fp ) );
          KEY( "Bank",  ch->pcdata->bank,       ReadInt( fp ) );
          break;

        case 'C':
          if ( !StrCmp( word, "Clan" ) )
            {
              ch->pcdata->ClanInfo.ClanName = ReadStringToTilde( fp );

              if ( !preload
                   &&   ch->pcdata->ClanInfo.ClanName[0] != '\0'
                   && ( ch->pcdata->ClanInfo.Clan = GetClan( ch->pcdata->ClanInfo.ClanName )) == NULL )
                {
                  Echo( ch, "Warning: the organization %s no longer exists, and therefore you no longer\r\nbelong to that organization.\r\n", ch->pcdata->ClanInfo.ClanName );
                  FreeMemory( ch->pcdata->ClanInfo.ClanName );
                  RemoveClanMember(ch);
                  ch->pcdata->ClanInfo.ClanName = CopyString( "" );
                }
              else
		{
		  UpdateClanMember(ch);
		}

              fMatch = true;
              break;
            }

          KEY( "Clones",        ch->pcdata->clones,             ReadInt( fp ) );

          if ( !StrCmp( word, "Condition" ) )
            {
              line = ReadLine( fp );
              sscanf( line, "%d %d %d %d",
                      &x1, &x2, &x3, &x4 );
              ch->pcdata->condition[0] = x1;
              ch->pcdata->condition[1] = x2;
              ch->pcdata->condition[2] = x3;
              ch->pcdata->condition[3] = x4;
              fMatch = true;
              break;
            }

          break;

        case 'D':
          KEY( "Damroll",       ch->damroll,            ReadInt( fp ) );
          KEY( "Deaf",  ch->deaf,               ReadInt( fp ) );
          KEY( "Description",   ch->description,        ReadStringToTilde( fp ) );

          if ( !StrCmp( word, "Druglevel"  ) )
            {
              line = ReadLine( fp );
              x0=x1=x2=x3=x4=x5=x6=x7=x8=x9=0;
              sscanf( line, "%d %d %d %d %d %d %d %d %d %d",
                      &x0, &x1, &x2, &x3, &x4, &x5, &x6, &x7, &x8, &x9 );
              ch->pcdata->drug_level[0] = x0;
              ch->pcdata->drug_level[1] = x1;
              ch->pcdata->drug_level[2] = x2;
              ch->pcdata->drug_level[3] = x3;
              ch->pcdata->drug_level[4] = x4;
              ch->pcdata->drug_level[5] = x5;
              ch->pcdata->drug_level[6] = x6;
              ch->pcdata->drug_level[7] = x7;
              ch->pcdata->drug_level[8] = x8;
              ch->pcdata->drug_level[9] = x9;
              fMatch = true;
              break;
            }

          break;

          /* 'E' was moved to after 'S' */
        case 'F':
          KEY( "Flags", ch->pcdata->flags,      ReadInt( fp ) );

          if ( !StrCmp( word, "Force" ) )
            {
              line = ReadLine( fp );
              x1=x2=x3=x4=x5=x6=0;
              sscanf( line, "%d %d %d %d",
                      &x1, &x2, &x3, &x4);
              ch->stats.perm_frc = x1;
              ch->stats.mod_frc = x2;
              ch->mana = x3;
              ch->max_mana = x4;
              fMatch = true;
              break;
            }
          break;

        case 'G':
          KEY( "Gold",  ch->gold,               ReadInt( fp ) );
          /* temporary measure */
          if ( !StrCmp( word, "Guild" ) )
            {
              ch->pcdata->ClanInfo.ClanName = ReadStringToTilde( fp );

              if ( !preload
                   &&   ch->pcdata->ClanInfo.ClanName[0] != '\0'
                   && ( ch->pcdata->ClanInfo.Clan = GetClan( ch->pcdata->ClanInfo.ClanName )) == NULL )
                {
                  Echo( ch, "Warning: the organization %s no longer exists, and therefore you no longer\r\nbelong to that organization.\r\n",
                           ch->pcdata->ClanInfo.ClanName );
                  FreeMemory( ch->pcdata->ClanInfo.ClanName );
                  ch->pcdata->ClanInfo.ClanName = CopyString( "" );
                }

              fMatch = true;
              break;
            }
          break;

        case 'H':
          if ( !StrCmp(word, "Helled") )
            {
              ch->pcdata->release_date = ReadInt(fp);
              ch->pcdata->helled_by = ReadStringToTilde(fp);

              if ( ch->pcdata->release_date < current_time )
                {
                  FreeMemory(ch->pcdata->helled_by);
                  ch->pcdata->helled_by = NULL;
                  ch->pcdata->release_date = 0;
                  ch->pcdata->jail_vnum = 0;
                }

              fMatch = true;
              break;
            }

          KEY( "Hitroll",       ch->hitroll,            ReadInt( fp ) );
          KEY( "Homepage",      ch->pcdata->homepage,   ReadStringToTilde( fp ) );

          if ( !StrCmp( word, "HpManaMove" ) )
            {
              line = ReadLine( fp );
              x1=x2=x3=x4=x5=x6=0;
              sscanf( line, "%d %d %d %d %d %d",
                      &x1, &x2, &x3, &x4, &x5, &x6 );
              ch->hit = x1;
              ch->max_hit = x2;
              ch->move = x5;
              ch->max_move = x6;

              if ( x4 >= 100 )
                {
                  ch->stats.perm_frc = GetRandomNumberFromRange( 1 , 20 );
                  ch->max_mana = x4;
                  ch->mana     = x4;
                }
              else if ( x4 >= 10 )
                {
                  ch->stats.perm_frc = 1;
                  ch->max_mana = x4;
                }

              fMatch = true;
              break;
            }

          break;

        case 'I':
          KEY( "IllegalPK",     ch->pcdata->illegal_pk, ReadInt( fp ) );
          KEY( "Immune",        ch->immune,             ReadInt( fp ) );

#ifdef SWRIP_USE_IMC
	  if( ( fMatch = ImcLoadCharacter( ch, fp, word ) ) )
	    {
	      break;
	    }
#endif
          break;
        case 'J':
          KEY( "Jailvnum",    ch->pcdata->jail_vnum,          ReadInt( fp ) );
          break;

        case 'K':
          if ( !StrCmp( word, "Killed" ) )
            {
              fMatch = true;

              if ( killcnt >= MAX_KILLTRACK )
		{
		  Bug( "ReadCharacter: killcnt (%d) >= MAX_KILLTRACK", killcnt );
		}
              else
                {
                  ch->pcdata->killed[killcnt].vnum    = ReadInt( fp );
                  ch->pcdata->killed[killcnt++].count = ReadInt( fp );
                }
            }
          break;

        case 'L':
          if ( !StrCmp(word, "Lastplayed") )
            {
              lastplayed = ReadInt(fp);
              fMatch = true;
              break;
            }

          KEY( "LongDescr",     ch->long_descr,         ReadStringToTilde( fp ) );

          if ( !StrCmp( word, "Languages" ) )
            {
              ch->speaks = ReadInt( fp );
              ch->speaking = ReadInt( fp );
              fMatch = true;
            }

          break;

        case 'M':
          KEY( "MainAbility",   ch->ability.main,               ReadInt( fp ) );
          KEY( "MDeaths",       ch->pcdata->mdeaths,    ReadInt( fp ) );
          KEY( "Mentalstate", ch->mental_state, ReadInt( fp ) );
          KEY( "Minsnoop",      ch->pcdata->min_snoop,  ReadInt( fp ) );
          KEY( "MKills",        ch->pcdata->mkills,     ReadInt( fp ) );
          KEY( "Mobinvis",      ch->mobinvis,           ReadInt( fp ) );

          if ( !StrCmp( word, "MobRange" ) )
            {
              ch->pcdata->m_range_lo = ReadInt( fp );
              ch->pcdata->m_range_hi = ReadInt( fp );
              fMatch = true;
            }

          break;

        case 'N':
          if ( !StrCmp( word, "Name" ) )
            {
              /*
               * Name already set externally.
               */
              ReadToEndOfLine( fp );
              fMatch = true;
              break;
            }
          break;

        case 'O':
          KEY( "Outcast_time", ch->pcdata->outcast_time, ReadInt( fp ) );

          if ( !StrCmp( word, "ObjRange" ) )
            {
              ch->pcdata->o_range_lo = ReadInt( fp );
              ch->pcdata->o_range_hi = ReadInt( fp );
              fMatch = true;
            }
          break;

        case 'P':
          KEY( "Pagerlen",      ch->pcdata->pagerlen,   ReadInt( fp ) );
          KEY( "Password",      ch->pcdata->pwd,        ReadStringToTilde( fp ) );
          KEY( "PDeaths",       ch->pcdata->pdeaths,    ReadInt( fp ) );
          KEY( "PKills",        ch->pcdata->pkills,     ReadInt( fp ) );
          KEY( "Played",        ch->pcdata->played,     ReadInt( fp ) );
          KEY( "Position",      ch->position,           ReadInt( fp ) );
          KEY( "Prompt",        ch->pcdata->prompt,     ReadStringToTilde( fp ) );

          if (!StrCmp ( word, "PTimer" ) )
            {
              AddTimerToCharacter( ch , TIMER_PKILLED, ReadInt(fp), NULL, SUB_NONE );
              fMatch = true;
              break;
            }

          if ( !StrCmp( word, "PlrHome" ) )
            {
              ch->plr_home = GetRoom( ReadInt( fp ) );

              if ( !ch->plr_home )
		{
		  ch->plr_home = NULL;
		}

              fMatch = true;
              break;
            }

          break;

        case 'R':
          KEY( "Race",        ch->race,         ReadInt( fp ) );
          KEY( "Rank",        ch->pcdata->rank, ReadStringToTilde( fp ) );
          KEY( "Resistant",     ch->resistant,          ReadInt( fp ) );
          KEY( "Restore_time",ch->pcdata->restore_time, ReadInt( fp ) );

          if ( !StrCmp( word, "Room" ) )
            {
              ch->in_room = GetRoom( ReadInt( fp ) );

              if ( !ch->in_room )
		{
		  ch->in_room = GetRoom( ROOM_VNUM_LIMBO );
		}

              fMatch = true;
              break;
            }

          if ( !StrCmp( word, "RoomRange" ) )
            {
              ch->pcdata->r_range_lo = ReadInt( fp );
              ch->pcdata->r_range_hi = ReadInt( fp );
              fMatch = true;
            }

          break;

        case 'S':
          KEY( "Salary",      ch->pcdata->ClanInfo.Salary, ReadInt( fp ) );
          KEY( "Salary_time",ch->pcdata->ClanInfo.SalaryDate, ReadInt( fp ) );
          KEY( "Sex",           ch->sex,                ReadInt( fp ) );
          KEY( "ShortDescr",    ch->short_descr,        ReadStringToTilde( fp ) );
          KEY( "Susceptible",   ch->susceptible,        ReadInt( fp ) );

          if ( !StrCmp( word, "SavingThrow" ) )
            {
              ch->saving.wand   = ReadInt( fp );
              ch->saving.poison_death = ch->saving.wand;
              ch->saving.para_petri     = ch->saving.wand;
              ch->saving.breath         = ch->saving.wand;
              ch->saving.spell_staff    = ch->saving.wand;
              fMatch = true;
              break;
            }

          if ( !StrCmp( word, "SavingThrows" ) )
            {
              ch->saving.poison_death = ReadInt( fp );
              ch->saving.wand   = ReadInt( fp );
              ch->saving.para_petri     = ReadInt( fp );
              ch->saving.breath         = ReadInt( fp );
              ch->saving.spell_staff    = ReadInt( fp );
              fMatch = true;
              break;
            }

          if ( !StrCmp( word, "Site" ) )
            {
              if ( !preload )
                {
                  Echo( ch, "Last connected from: %s\r\n", ReadWord( fp ) );
                }
              else
		{
		  ReadToEndOfLine( fp );
		}

              fMatch = true;

              if ( preload )
		{
		  word = "End";
		}
              else
		{
		  break;
		}
            }

          if ( !StrCmp( word, "Skill" ) )
            {
              int value;

              if ( preload )
		{
		  word = "End";
		}
              else
                {
                  value = ReadInt( fp );

                  if ( file_ver < 3 )
		    {
		      sn = LookupSkill( ReadWord( fp ) );
		    }
                  else
		    {
                    sn = BSearchSkillExact( ReadWord( fp ), gsn_first_skill, gsn_first_weapon-1 );
		    }

                  if ( sn < 0 )
		    {
		      Bug( "ReadCharacter: unknown skill." );
		    }
                  else
                    {
                      ch->pcdata->learned[sn] = value;

                    }

                  fMatch = true;
                  break;
                }
            }

          if ( !StrCmp( word, "Spell" ) )
            {
              int value = 0;

              if ( preload )
		{
		  word = "End";
		}
              else
                {
                  value = ReadInt( fp );
                  sn = BSearchSkillExact( ReadWord( fp ), gsn_first_spell, gsn_first_skill-1 );

                  if ( sn < 0 )
		    {
		      Bug( "ReadCharacter: unknown spell.", 0 );
		    }
                  else
                    {
                      ch->pcdata->learned[sn] = value;
                    }

                  fMatch = true;
                  break;
                }
            }

          if ( StrCmp( word, "End" ) )
	    {
	      break;
	    }

        case 'E':
          if ( !StrCmp( word, "End" ) )
            {
              if (!ch->short_descr)
                ch->short_descr = CopyString( "" );

              if (!ch->long_descr)
                ch->long_descr  = CopyString( "" );

              if (!ch->description)
                ch->description = CopyString( "" );

              if (!ch->pcdata->pwd)
                ch->pcdata->pwd = CopyString( "" );

              if (!ch->pcdata->email)
                ch->pcdata->email       = CopyString( "" );

              if (!ch->pcdata->bamfin)
                ch->pcdata->bamfin      = CopyString( "" );

              if (!ch->pcdata->bamfout)
                ch->pcdata->bamfout     = CopyString( "" );

              if (!ch->pcdata->bio)
                ch->pcdata->bio = CopyString( "" );

              if (!ch->pcdata->rank)
                ch->pcdata->rank        = CopyString( "" );

              if (!ch->pcdata->bestowments)
                ch->pcdata->bestowments = CopyString( "" );

              if (!ch->pcdata->title)
                ch->pcdata->title       = CopyString( "" );

              if (!ch->pcdata->homepage)
                ch->pcdata->homepage    = CopyString( "" );

              if (!ch->pcdata->authed_by)
                ch->pcdata->authed_by = CopyString( "" );

              if (!ch->pcdata->prompt )
                ch->pcdata->prompt      = CopyString( "" );

              ch->editor                = NULL;
              killcnt = urange( 2, ((ch->top_level+3) * MAX_KILLTRACK)/LEVEL_AVATAR, MAX_KILLTRACK );
              if ( killcnt < MAX_KILLTRACK )
                ch->pcdata->killed[killcnt].vnum = 0;
              {
                int ability;

                for ( ability = 0 ; ability < MAX_ABILITY ; ability++ )
                  {
                    if ( GetAbilityLevel( ch, ability ) == 0 )
		      {
			SetAbilityLevel( ch, ability, 1 );
		      }
                  }
              }

              if ( !IsImmortal( ch ) && !ch->speaking )
                ch->speaking = RaceTable[ch->race].language;

              if ( IsImmortal( ch ) )
                {
                  ch->speaks = ~0;

                  if ( ch->speaking == 0 )
		    {
		      ch->speaking = ~0;
		    }
                }

              if ( !ch->pcdata->prompt )
		{
		  ch->pcdata->prompt = CopyString("");
		}

              if ( lastplayed != 0 )
                {
                  int hitgain = ( ( int ) ( current_time - lastplayed ) / 60 );
                  ch->hit = urange( 1 , ch->hit + hitgain , ch->max_hit );
                  ch->move = urange( 1 , ch->move + hitgain , ch->max_move );

                  if ( IsJedi( ch ) )
		    {
		      ch->mana = urange( 0 , ch->mana + hitgain , ch->max_mana );
		    }

                  ImproveMentalState( ch , hitgain );
                }

              for ( sn = 0; sn < TopSN; sn++ )
                {
                  if ( !SkillTable[sn]->Name )
		    {
		      break;
		    }

                  if ( SkillTable[sn]->Guild < 0 || SkillTable[sn]->Guild >= MAX_ABILITY )
		    {
		      continue;
		    }

                  if ( ch->pcdata->learned[sn] > 0
		       && GetAbilityLevel( ch, SkillTable[sn]->Guild ) < SkillTable[sn]->Level )
		    {
		      ch->pcdata->learned[sn] = 0;
		    }

                }

              return;
            }

          KEY( "Email", ch->pcdata->email,      ReadStringToTilde( fp ) );
          break;

        case 'T':
          KEY( "Targ",  ch->pcdata->target,     ReadStringToTilde( fp ) );
          KEY( "Toplevel",      ch->top_level,          ReadInt( fp ) );

          if ( !StrCmp( word, "Tongue" ) )
            {
              int value  = 0;

              if ( preload )
		{
		  word = "End";
		}
              else
                {
                  value = ReadInt( fp );
                  sn = BSearchSkillExact( ReadWord( fp ), gsn_first_tongue, gsn_TopSN-1 );

                  if ( sn < 0 )
		    {
		      Bug( "ReadCharacter: unknown tongue." );
		    }
                  else
                    {
                      ch->pcdata->learned[sn] = value;
                    }

                  fMatch = true;
                }

              break;
            }

          KEY( "Trust", ch->trust, ReadInt( fp ) );
          /* Let no character be trusted higher than one below maxlevel -- Narn */
          ch->trust = umin( ch->trust, MAX_LEVEL - 1 );

          if ( !StrCmp( word, "Title" ) )
            {
              ch->pcdata->title = ReadStringToTilde( fp );

              if ( isalpha(ch->pcdata->title[0])
                   || isdigit(ch->pcdata->title[0]) )
                {
                  sprintf( buf, "%s", ch->pcdata->title );

                  if ( ch->pcdata->title )
                    FreeMemory( ch->pcdata->title );

                  ch->pcdata->title = CopyString( buf );
                }

              fMatch = true;
              break;
            }

          break;

        case 'V':
          if ( !StrCmp( word, "Vnum" ) )
            {
              ch->Prototype = GetProtoMobile( ReadInt( fp ) );
              fMatch = true;
              break;
            }

          KEY( "Version",       file_ver,               ReadInt( fp ) );
          break;

        case 'W':
          if ( !StrCmp( word, "Weapon" ) )
            {
              int value = 0;

              if ( preload )
		{
		  word = "End";
		}
              else
                {
                  value = ReadInt( fp );
                  sn = BSearchSkillExact( ReadWord( fp ), gsn_first_weapon, gsn_first_tongue-1 );
                  if ( sn < 0 )
		    {
		      Bug( "ReadCharacter: unknown weapon.", 0 );
		    }
                  else
                    {
                      ch->pcdata->learned[sn] = value;
                    }

                  fMatch = true;
                }
              break;
            }

          KEY( "Wimpy", ch->wimpy,              ReadInt( fp ) );
          KEY( "WizInvis",      ch->pcdata->wizinvis,   ReadInt( fp ) );
          KEY( "Wanted",        ch->pcdata->wanted_flags,  ReadInt( fp ) );
          break;
        }

      if ( !fMatch )
        {
          Bug( "ReadCharacter: no match: %s", word );
        }
    }
}

void ReadObject( Character *ch, FILE *fp, short os_type )
{
  Object *obj = NULL;
  int iNest = 0;
  bool fNest = true; /* Yes, these should             */
  bool fVnum = true; /* indeed be initialized as true */
  Room *room = NULL;

  AllocateMemory( obj, Object, 1 );
  obj->count     = 1;
  obj->wear_loc  = -1;
  obj->weight    = 1;

  for ( ; ; )
    {
      const char *word = feof( fp ) ? "End" : ReadWord( fp );
      bool fMatch = false;

      switch ( CharToUppercase(word[0]) )
        {
        case '*':
          fMatch = true;
          ReadToEndOfLine( fp );
          break;

        case 'A':
          if ( !StrCmp( word, "Affect" ) || !StrCmp( word, "AffectData" ) )
            {
              Affect *paf = NULL;
              int pafmod = 0;

              AllocateMemory( paf, Affect, 1 );

              if ( !StrCmp( word, "Affect" ) )
                {
                  paf->Type = ReadInt( fp );
                }
              else
                {
                  int sn = LookupSkill( ReadWord( fp ) );

                  if ( sn < 0 )
		    {
		      Bug( "Fread_obj: unknown skill." );
		    }
                  else
		    {
		      paf->Type = sn;
		    }
                }

              paf->Duration     = ReadInt( fp );
              pafmod            = ReadInt( fp );
              paf->Location     = ReadInt( fp );
              paf->AffectedBy   = ReadInt( fp );

              if ( paf->Location == APPLY_WEAPONSPELL
                   || paf->Location == APPLY_WEARSPELL
                   || paf->Location == APPLY_REMOVESPELL )
		{
		  paf->Modifier = SkillNumberFromSlot( pafmod );
		}
              else
		{
		  paf->Modifier = pafmod;
		}

              LINK(paf, obj->first_affect, obj->last_affect, next, prev );
              fMatch                            = true;
              break;
            }

          KEY( "Actiondesc",    obj->action_desc,       ReadStringToTilde( fp ) );
          break;

        case 'C':
          KEY( "Cost",  obj->cost,              ReadInt( fp ) );
          KEY( "Count", obj->count,             ReadInt( fp ) );
          break;

        case 'D':
          KEY( "Description",   obj->description,       ReadStringToTilde( fp ) );
          break;

        case 'E':
          KEY( "ExtraFlags",    obj->extra_flags,       ReadInt( fp ) );

          if ( !StrCmp( word, "ExtraDescr" ) )
            {
              ExtraDescription *ed = NULL;

              AllocateMemory( ed, ExtraDescription, 1 );
              ed->keyword = ReadStringToTilde( fp );
              ed->description = ReadStringToTilde( fp );
              LINK(ed, obj->first_extradesc, obj->last_extradesc, next, prev );
              fMatch = true;
            }

          if ( !StrCmp( word, "End" ) )
            {
              if ( !fNest || !fVnum )
                {
                  Bug( "Fread_obj: incomplete object.", 0 );

                  if ( obj->name )
                    FreeMemory( obj->name );

                  if ( obj->description )
                    FreeMemory( obj->description );

                  if ( obj->short_descr )
                    FreeMemory( obj->short_descr );

                  FreeMemory( obj );
                  return;
                }
              else
                {
                  short wear_loc = obj->wear_loc;

                  if ( !obj->name )
                    obj->name = CopyString( obj->Prototype->name );

                  if ( !obj->description )
                    obj->description = CopyString( obj->Prototype->description );

                  if ( !obj->short_descr )
                    obj->short_descr = CopyString( obj->Prototype->short_descr );

                  if ( !obj->action_desc )
                    obj->action_desc = CopyString( obj->Prototype->action_desc );

                  LINK(obj, first_object, last_object, next, prev );
                  obj->Prototype->count += obj->count;

                  if ( !obj->serial )
                    {
                      cur_obj_serial = umax((cur_obj_serial + 1 ) & (BV30-1), 1);
                      obj->serial = obj->Prototype->serial = cur_obj_serial;
                    }

                  if ( fNest )
                    rgObjNest[iNest] = obj;

                  numobjsloaded += obj->count;
                  ++physicalobjects;

                  if ( file_ver > 1 || obj->wear_loc < -1
                       || obj->wear_loc >= MAX_WEAR )
		    {
		      obj->wear_loc = -1;
		    }

                  /* Corpse saving. -- Altrag */
                  if ( os_type == OS_CORPSE )
                    {
                      if ( !room )
                        {
                          Bug( "Fread_obj: Corpse without room", 0);
                          room = GetRoom(ROOM_VNUM_LIMBO);
                        }

                      obj = ObjectToRoom( obj, room );
                    }
                  else if ( iNest == 0 || rgObjNest[iNest] == NULL )
                    {
                      int slot = 0;
                      bool reslot = false;

                      if ( file_ver > 1
                           && wear_loc > -1
                           && wear_loc < MAX_WEAR )
                        {
                          int x = 0;

                          for ( x = 0; x < MAX_LAYERS; x++ )
			    {
			      if ( !save_equipment[wear_loc][x] )
				{
				  save_equipment[wear_loc][x] = obj;
				  slot = x;
				  reslot = true;
				  break;
				}
			    }

                          if ( x == MAX_LAYERS )
			    {
			      Bug( "Fread_obj: too many layers %d", wear_loc );
			    }
                        }

                      obj = ObjectToCharacter( obj, ch );

                      if ( reslot )
			{
			  save_equipment[wear_loc][slot] = obj;
			}
                    }
                  else
                    {
                      if ( rgObjNest[iNest-1] )
                        {
                          SeparateOneObjectFromGroup( rgObjNest[iNest-1] );
                          obj = ObjectToObject( obj, rgObjNest[iNest-1] );
                        }
                      else
			{
			  Bug( "Fread_obj: nest layer missing %d", iNest-1 );
			}
                    }

                  if ( fNest )
		    {
		      rgObjNest[iNest] = obj;
		    }

                  return;
                }
            }
          break;

        case 'I':
          KEY( "ItemType",      obj->item_type,         ReadInt( fp ) );
          break;

        case 'L':
          KEY( "Level", obj->level,             ReadInt( fp ) );
          break;

        case 'N':
          KEY( "Name",  obj->name,              ReadStringToTilde( fp ) );

          if ( !StrCmp( word, "Nest" ) )
            {
              iNest = ReadInt( fp );

              if ( iNest < 0 || iNest >= MAX_NEST )
                {
                  Bug( "Fread_obj: bad nest %d.", iNest );
                  iNest = 0;
                  fNest = false;
                }

              fMatch = true;
            }
          break;

        case 'R':
          KEY( "Room", room, GetRoom(ReadInt(fp)) );

        case 'S':
          KEY( "ShortDescr",    obj->short_descr,       ReadStringToTilde( fp ) );

          if ( !StrCmp( word, "Spell" ) )
            {
              int iValue = ReadInt( fp );
              int sn     = LookupSkill( ReadWord( fp ) );

              if ( iValue < 0 || iValue > 5 )
		{
		  Bug( "Fread_obj: bad iValue %d.", iValue );
		}
              else if ( sn < 0 )
		{
		  Bug( "Fread_obj: unknown skill.", 0 );
		}
              else
		{
		  obj->value[iValue] = sn;
		}

              fMatch = true;
              break;
            }

          break;

        case 'T':
          KEY( "Timer", obj->timer,             ReadInt( fp ) );
          break;

        case 'V':
          if ( !StrCmp( word, "Values" ) )
            {
              int x1 = 0, x2 = 0, x3 = 0, x4 = 0, x5 = 0, x6 = 0;
              const char *ln = ReadLine( fp );

              sscanf( ln, "%d %d %d %d %d %d", &x1, &x2, &x3, &x4, &x5, &x6 );

              obj->value[0]     = x1;
              obj->value[1]     = x2;
              obj->value[2]     = x3;
              obj->value[3]     = x4;
              obj->value[4]     = x5;
              obj->value[5]     = x6;
              fMatch            = true;
              break;
            }

          if ( !StrCmp( word, "Vnum" ) )
            {
              vnum_t vnum = ReadInt( fp );

              if ( ( obj->Prototype = GetProtoObject( vnum ) ) == NULL )
                {
                  fVnum = false;
                  Bug( "Fread_obj: bad vnum %d.", vnum );
                }
              else
                {
                  fVnum = true;
                  obj->cost = obj->Prototype->cost;
                  obj->weight = obj->Prototype->weight;
                  obj->item_type = obj->Prototype->item_type;
                  obj->wear_flags = obj->Prototype->wear_flags;
                  obj->extra_flags = obj->Prototype->extra_flags;
                }

              fMatch = true;
              break;
            }
          break;

        case 'W':
          KEY( "WearFlags",     obj->wear_flags,        ReadInt( fp ) );
          KEY( "WearLoc",       obj->wear_loc,          ReadInt( fp ) );
          KEY( "Weight",        obj->weight,            ReadInt( fp ) );
          break;

        }

      if ( !fMatch )
        {
          ExtraDescription *ed = NULL;
          Affect *paf = NULL;

          Bug( "Fread_obj: no match." );
          Bug( word );
          ReadToEndOfLine( fp );

          if ( obj->name )
            FreeMemory( obj->name        );

          if ( obj->description )
            FreeMemory( obj->description );

          if ( obj->short_descr )
            FreeMemory( obj->short_descr );

          while ( (ed=obj->first_extradesc) != NULL )
            {
              FreeMemory( ed->keyword );
              FreeMemory( ed->description );
              UNLINK( ed, obj->first_extradesc, obj->last_extradesc, next, prev );
              FreeMemory( ed );
            }

          while ( (paf=obj->first_affect) != NULL )
            {
              UNLINK( paf, obj->first_affect, obj->last_affect, next, prev );
              FreeMemory( paf );
            }

          FreeMemory( obj );
          return;
        }
    }
}

void SetAlarm( long seconds )
{
  alarm( seconds );
}

void WriteCorpses( const Character *ch, const char *name )
{
  const Object *corpse = NULL;
  FILE *fp = NULL;

  /* Name and ch support so that we dont have to have a char to save their
     corpses.. (ie: decayed corpses while offline) */
  if ( ch && IsNpc(ch) )
    {
      Bug( "Write_corpses: writing NPC corpse." );
      return;
    }

  if ( ch )
    {
      name = ch->name;
    }

  /* Go by vnum, less chance of screwups. -- Altrag */
  for ( corpse = first_object; corpse; corpse = corpse->next )
    {
      if ( corpse->Prototype->vnum == OBJ_VNUM_CORPSE_PC
	   && corpse->in_room != NULL && corpse->value[OVAL_CORPSE_1] != 1
	   && !StrCmp(corpse->short_descr+14, name) )
	{
	  if ( !fp )
	    {
	      char buf[127];

	      sprintf(buf, "%s%s", CORPSE_DIR, Capitalize(name));

	      if ( !(fp = fopen(buf, "w")) )
		{
		  Bug( "Write_corpses: Cannot open file." );
		  perror(buf);
		  return;
		}
	    }

	  WriteObject(ch, corpse, fp, 0, OS_CORPSE);
	}
    }

  if ( fp )
    {
      fprintf(fp, "#END\n\n");
      fclose(fp);
    }
  else
    {
      char buf[127];

      sprintf(buf, "%s%s", CORPSE_DIR, Capitalize(name));
      remove(buf);
    }
}

void LoadCorpses( void )
{
  DIR *dp = NULL;
  struct dirent *de = NULL;

  if ( !(dp = opendir(CORPSE_DIR)) )
    {
      Bug( "%s: can't open CORPSE_DIR", __FUNCTION__ );
      perror(CORPSE_DIR);
      return;
    }

  falling = 1; /* Arbitrary, must be >0 though. */

  while ( (de = readdir(dp)) != NULL )
    {
      if ( de->d_name[0] != '.' )
        {
          sprintf(strArea, "%s%s", CORPSE_DIR, de->d_name );
          fprintf(stderr, "Corpse -> %s\n", strArea);

          if ( !(fpArea = fopen(strArea, "r")) )
            {
              perror(strArea);
              continue;
            }

          for ( ; ; )
            {
              const char *word;
              char letter = ReadChar( fpArea );

              if ( letter == '*' )
                {
                  ReadToEndOfLine(fpArea);
                  continue;
                }

              if ( letter != '#' )
                {
                  Bug( "%s: # not found.", __FUNCTION__ );
                  break;
                }

              word = ReadWord( fpArea );

              if ( !StrCmp(word, "CORPSE" ) )
		{
		  ReadObject( NULL, fpArea, OS_CORPSE );
		}
              else if ( !StrCmp(word, "OBJECT" ) )
		{
		  ReadObject( NULL, fpArea, OS_CARRY );
		}
              else if ( !StrCmp( word, "END" ) )
		{
		  break;
		}
              else
                {
                  Bug( "%s: bad section.", __FUNCTION__ );
                  break;
                }
            }

          fclose(fpArea);
        }
    }

  fpArea = NULL;
  strcpy(strArea, "$");
  closedir(dp);
  falling = 0;
}

void LoadStorerooms( void )
{
  DIR *dp = NULL;
  struct dirent *de = NULL;
  char buf[MAX_INPUT_LENGTH];

  if ( !(dp = opendir(STOREROOM_DIR)) )
    {
      Bug( "Load_storeroom: can't open STOREROOM_DIR" );
      perror(STOREROOM_DIR);
      return;
    }

  falling = 1;

  while ( (de = readdir(dp)) != NULL )
    {
      if ( de->d_name[0] != '.' )
        {
          int iNest = 0;
          Object *tobj = NULL;
	  Object *tobj_next = NULL;
          Room *storeroom = NULL;

          sprintf(strArea, "%s%s", STOREROOM_DIR, de->d_name );
          fprintf(stderr, "Storeroom -> %s\n", strArea);

          if ( !(fpArea = fopen(strArea, "r")) )
            {
              perror(strArea);
              continue;
            }

          storeroom = GetRoom(atoi(de->d_name));

          if( !storeroom )
            {
              fpArea = NULL;
              strcpy(strArea, "$");
              closedir(dp);
              falling = 0;
              return;
            }

          if ( !IsBitSet( storeroom->room_flags, ROOM_CLANSTOREROOM ) )
            {
              sprintf( buf, "%s%ld", STOREROOM_DIR, storeroom->vnum );
              remove( buf );
            }

          RoomProgSetSupermob(storeroom);

          for ( iNest = 0; iNest < MAX_NEST; iNest++ )
	    {
	      rgObjNest[iNest] = NULL;
	    }

          for ( ; ; )
            {
              const char *word = NULL;
              char letter = ReadChar( fpArea );

              if ( letter == '*' )
                {
                  ReadToEndOfLine( fpArea );
                  continue;
                }

              if ( letter != '#' )
                {
                  Bug( "LoadStorerooms: # not found.", 0 );
                  Bug( de->d_name, 0 );
                  break;
                }

              word = ReadWord( fpArea );

              if ( !StrCmp( word, "OBJECT" ) ) /* Objects      */
		{
		  ReadObject( supermob, fpArea, OS_CARRY );
		}
              else if ( !StrCmp( word, "END"    ) )       /* Done         */
		{
                  break;
		}
	      else
		{
		  Bug( "LoadStorerooms: bad section.", 0 );
		  Bug( de->d_name, 0 );
		  break;
		}
            }

          fclose( fpArea );

          for ( tobj = supermob->first_carrying; tobj; tobj = tobj_next )
            {
              tobj_next = tobj->next_content;
              ObjectFromCharacter( tobj );

              if( tobj->item_type != ITEM_MONEY )
		{
		  ObjectToRoom( tobj, storeroom );
		}
            }

          ReleaseSupermob();
        }
    }

  fpArea = NULL;
  strcpy(strArea, "$");
  closedir(dp);
  falling = 0;
}

void SaveStoreroom( const Room *room )
{
  char strsave[MAX_INPUT_LENGTH];
  FILE *fp = NULL;
  const Object *contents = NULL;

  if ( !room )
    {
      Bug( "SaveStoreroom: null room!" );
      return;
    }

  sprintf( strsave, "%s%ld",STOREROOM_DIR, room->vnum );

  if ( ( fp = fopen( strsave, "w" ) ) == NULL )
    {
      perror( strsave );
      Bug( "Save_storeroom: fopen", 0 );
      Bug( strsave, 0 );

    }
  else
    {
      fchmod(fileno(fp), S_IRUSR|S_IWUSR | S_IRGRP|S_IWGRP | S_IROTH|S_IWOTH);

      contents = room->last_content;

      if (contents)
	{
	  WriteObject(NULL, contents, fp, 0, OS_CARRY );
	}

      fprintf( fp, "#END\n" );
      fclose( fp );
    }
}

void LoadVendors( void )
{
  DIR *dp = NULL;
  Character *mob = NULL;
  struct dirent *de = NULL;

  if ( !(dp = opendir(VENDOR_DIR)) )
    {
      Bug( "Load_vendors: can't open VENDOR_DIR" );
      perror(VENDOR_DIR);
      return;
    }

  falling = 1;

  while ( (de = readdir(dp)) != NULL )
    {
      if ( de->d_name[0] != '.' )
        {
          sprintf(strArea, "%s%s", VENDOR_DIR, de->d_name );
          fprintf(stderr, "Vendor -> %s\n", strArea);

          if ( !(fpArea = fopen(strArea, "r")) )
            {
              perror(strArea);
              continue;
            }

          for ( ; ; )
            {
              const char *word = NULL;
	      char letter = ReadChar( fpArea );

              if ( letter == '*' )
                {
                  ReadToEndOfLine(fpArea);
                  continue;
                }

              if ( letter != '#' )
                {
                  Bug( "Load_vendor: # not found.", 0 );
                  break;
                }

              word = ReadWord( fpArea );

              if ( !StrCmp(word, "VENDOR" ) )
		{
		  mob = ReadVendor( fpArea );
		}
              else if ( !StrCmp(word, "OBJECT" ) )
		{
		  ReadObject( mob, fpArea, OS_CARRY );
		}
              else if ( !StrCmp( word, "END" ) )
		{
		  break;
		}
            }

          fclose(fpArea);
        }
    }

  fpArea = NULL;
  strcpy(strArea, "$");
  closedir(dp);
  falling = 0;
}

/*
 * This will write one mobile structure pointed to be fp --Shaddai
 */
static void WriteMobile( FILE *fp, const Character *mob )
{
  if ( !IsNpc( mob ) || !fp )
    {
      return;
    }

  fprintf( fp, "#MOBILE\n" );
  fprintf( fp, "Vnum    %ld\n", mob->Prototype->vnum );

  if ( mob->in_room )
    {
      fprintf( fp, "Room  %ld\n",
	       (  mob->in_room == GetRoom( ROOM_VNUM_LIMBO )
		  && mob->was_in_room )
	       ? mob->was_in_room->vnum
	       : mob->in_room->vnum );
    }

  if ( StrCmp( mob->name, mob->Prototype->name) )
    {
      fprintf( fp, "Name     %s~\n", mob->name );
    }

  if ( StrCmp( mob->short_descr, mob->Prototype->short_descr) )
    {
      fprintf( fp, "Short %s~\n", mob->short_descr );
    }

  if ( StrCmp( mob->long_descr, mob->Prototype->long_descr) )
    {
      fprintf( fp, "Long  %s~\n", mob->long_descr );
    }

  if ( StrCmp( mob->description, mob->Prototype->description) )
    {
      fprintf( fp, "Description %s~\n", mob->description );
    }

  fprintf( fp, "Position %d\n", mob->position );
  fprintf( fp, "Flags %d\n", mob->act );
  /* Might need these later --Shaddai
     DeEquipCharacter( mob );
     ReEquipCharacter( mob );
  */
  if ( mob->first_carrying )
    {
      WriteObject( mob, mob->last_carrying, fp, 0, OS_CARRY );
    }

  fprintf( fp, "EndMobile\n" );
}

/*
 * This will read one mobile structure pointer to by fp --Shaddai
 */
static Character *ReadMobile( FILE *fp )
{
  Character *mob = NULL;
  bool fMatch = false;
  int inroom = 0;
  Room *pRoomIndex = NULL;
  const char *word = feof( fp ) ? "EndMobile" : ReadWord( fp );

  if ( !StrCmp(word, "Vnum") )
    {
      int vnum = ReadInt( fp );

      mob = CreateMobile( GetProtoMobile(vnum) );

      if ( !mob )
        {
          for ( ; ; )
	    {
	      word = feof( fp ) ? "EndMobile" : ReadWord( fp );
	      /* So we don't get so many bug messages when something messes up
	       * --Shaddai
	       */
	      if ( !StrCmp( word, "EndMobile" ) )
		break;
	    }

          Bug("ReadMobile: No index data for vnum %d", vnum );
          return NULL;
        }
    }
  else
    {
      for ( ; ; )
	{
	  word = feof( fp ) ? "EndMobile" : ReadWord( fp );
	  /* So we don't get so many bug messages when something messes up
	   * --Shaddai
	   */
	  if ( !StrCmp( word, "EndMobile" ) )
	    {
	      break;
	    }
	}

      ExtractCharacter(mob, true);
      Bug("ReadMobile: Vnum not found", 0 );
      return NULL;
    }

  for ( ; ;)
    {
      word = feof( fp ) ? "EndMobile" : ReadWord( fp );
      fMatch = false;

      switch ( CharToUppercase(word[0]) )
	{
	case '*':
	  fMatch = true;
	  ReadToEndOfLine( fp );
	  break;

	case '#':
	  if ( !StrCmp( word, "#OBJECT" ) )
	    ReadObject ( mob, fp, OS_CARRY );
	case 'D':
	  KEY( "Description", mob->description, ReadStringToTilde(fp));
	  break;

	case 'E':
	  if ( !StrCmp( word, "EndMobile" ) )
	    {
	      if ( inroom == 0 )
		{
		  inroom = ROOM_VNUM_TEMPLE;
		}

	      pRoomIndex = GetRoom( inroom );

	      if ( !pRoomIndex )
		{
		  pRoomIndex = GetRoom( ROOM_VNUM_TEMPLE );
		}

	      CharacterToRoom(mob, pRoomIndex);
	      return mob;
	    }
	  break;

	case 'F':
	  KEY( "Flags", mob->act, ReadInt( fp ));
	  break;

	case 'L':
	  KEY( "Long", mob->long_descr, ReadStringToTilde(fp ) );
	  break;

	case 'N':
	  KEY( "Name", mob->name, ReadStringToTilde( fp ) );
	  break;

	case 'P':
	  KEY( "Position", mob->position, ReadInt( fp ) );
	  break;

	case 'R':
	  KEY( "Room",  inroom, ReadInt(fp));
	  break;

	case 'S':
	  KEY( "Short", mob->short_descr, ReadStringToTilde(fp));
	  break;
	}

      if ( !fMatch )
	{
	  Bug( "ReadMobile: no match.", 0 );
	  Bug( word, 0 );
	}
    }

  return NULL;
}
