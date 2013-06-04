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
 *                   Character saving and loading module                   *
 ****************************************************************************/

#ifdef __STRICT_ANSI__
/* To include the prototype for fchmod() */
#define _BSD_SOURCE

/* To include the prototype for fileno() */
#define _POSIX_SOURCE
#endif

#include <string.h>
#include <ctype.h>
#include "mud.h"
#include "character.h"
#include "clan.h"

/*
 * Increment with every major format change.
 */
#define SAVEVERSION     3

/*
 * Array to keep track of equipment temporarily.                -Thoric
 */
OBJ_DATA *save_equipment[MAX_WEAR][8];
Character *quitting_char, *loading_char, *saving_char;

int file_ver;

/*
 * Externals
 */
void fwrite_comments( Character *ch, FILE *fp );
void fread_comment( Character *ch, FILE *fp );

extern FILE *fpArea;
extern char strArea[MAX_INPUT_LENGTH];
extern int falling;

/*
 * Array of containers read for proper re-nesting of objects.
 */
static  OBJ_DATA *      rgObjNest       [MAX_NEST];

/*
 * Local functions.
 */
void    fwrite_char( Character *ch, FILE *fp );
void    fread_char( Character *ch, FILE *fp, bool preload );
void    write_corpses( Character *ch, char *name );
Character *  fread_mobile( FILE *fp );
void write_char_mobile( Character *ch , char *argument );
void read_char_mobile( char *argument );
void fwrite_mobile( FILE *fp, Character *mob );


void save_home( Character *ch )
{
  if ( ch->plr_home )
    {
      FILE *fp;
      char filename[256];
      short templvl;
      OBJ_DATA *contents;


      sprintf( filename, "%s%c/%s.home", PLAYER_DIR, tolower(ch->name[0]),
               capitalize( ch->name ) );
      if ( ( fp = fopen( filename, "w" ) ) == NULL )
        {
        }
      else
        {
          templvl = ch->top_level;
          ch->top_level = LEVEL_HERO;           /* make sure EQ doesn't get lost */
          contents = ch->plr_home->last_content;
          if (contents)
            fwrite_obj(ch, contents, fp, 0, OS_CARRY );
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
void de_equip_char( Character *ch )
{
  char buf[MAX_STRING_LENGTH];
  OBJ_DATA *obj;
  int x,y;

  for ( x = 0; x < MAX_WEAR; x++ )
    for ( y = 0; y < MAX_LAYERS; y++ )
      save_equipment[x][y] = NULL;
  for ( obj = ch->first_carrying; obj; obj = obj->next_content )
    if ( obj->wear_loc > -1 && obj->wear_loc < MAX_WEAR )
      {

        for ( x = 0; x < MAX_LAYERS; x++ )
          if ( !save_equipment[obj->wear_loc][x] )
            {
              save_equipment[obj->wear_loc][x] = obj;
              break;
            }
        if ( x == MAX_LAYERS )
          {
            sprintf( buf, "%s had on more than %d layers of clothing in one location (%d): %s",
                     ch->name, MAX_LAYERS, obj->wear_loc, obj->name );
            bug( buf, 0 );
          }

        unequip_char(ch, obj);
      }
}

/*
 * Re-equip character                                   -Thoric
 */
void re_equip_char( Character *ch )
{
  int x,y;

  for ( x = 0; x < MAX_WEAR; x++ )
    for ( y = 0; y < MAX_LAYERS; y++ )
      if ( save_equipment[x][y] != NULL )
        {
          if ( quitting_char != ch )
            equip_char(ch, save_equipment[x][y], x);
          save_equipment[x][y] = NULL;
        }
      else
        break;
}


/*
 * Save a character and inventory.
 * Would be cool to save NPC's too for quest purposes,
 *   some of the infrastructure is provided.
 */
void save_char_obj( Character *ch )
{
  char strsave[MAX_INPUT_LENGTH];
  char strback[MAX_INPUT_LENGTH];
  FILE *fp;

  if ( !ch )
    {
      bug( "Save_char_obj: null ch!", 0 );
      return;
    }

  if ( is_npc(ch) || is_not_authed(ch) )
    return;

  saving_char = ch;
  /* save pc's clan's data while we're at it to keep the data in sync */
  if ( is_clanned( ch ) )
    SaveClan( ch->pcdata->clan );

  if ( ch->desc && ch->desc->original )
    ch = ch->desc->original;

  de_equip_char( ch );

  ch->pcdata->save_time = current_time;
  sprintf( strsave, "%s%c/%s", PLAYER_DIR, tolower(ch->name[0]),
           capitalize( ch->name ) );

  /*
   * Auto-backup pfile (can cause lag with high disk access situtations
   */
  if ( IS_SET( sysdata.save_flags, SV_BACKUP ) )
    {
      sprintf( strback, "%s%c/%s", BACKUP_DIR, tolower(ch->name[0]),
               capitalize( ch->name ) );
      rename( strsave, strback );
    }

  /*
   * Save immortal stats, level & vnums for wizlist             -Thoric
   * and do_vnums command
   *
   * Also save the player flags so we the wizlist builder can see
   * who is a guest and who is retired.
   */
  if ( get_trust(ch) > LEVEL_HERO )
    {
      sprintf( strback, "%s%s", GOD_DIR, capitalize( ch->name ) );

      if ( ( fp = fopen( strback, "w" ) ) == NULL )
        {
          bug( "Save_god_level: fopen", 0 );
          perror( strsave );
        }
      else
        {
          fprintf( fp, "Level        %d\n", ch->top_level );
          fprintf( fp, "Pcflags      %d\n", ch->pcdata->flags );
          if ( ch->pcdata->r_range_lo && ch->pcdata->r_range_hi )
            fprintf( fp, "RoomRange    %d %d\n", ch->pcdata->r_range_lo,
                     ch->pcdata->r_range_hi     );
          if ( ch->pcdata->o_range_lo && ch->pcdata->o_range_hi )
            fprintf( fp, "ObjRange     %d %d\n", ch->pcdata->o_range_lo,
                     ch->pcdata->o_range_hi     );
          if ( ch->pcdata->m_range_lo && ch->pcdata->m_range_hi )
            fprintf( fp, "MobRange     %d %d\n", ch->pcdata->m_range_lo,
                     ch->pcdata->m_range_hi     );
          fclose( fp );
        }
    }

  if ( ( fp = fopen( strsave, "w" ) ) == NULL )
    {
      bug( "Save_char_obj: fopen", 0 );
      perror( strsave );
    }
  else
    {
      fwrite_char( ch, fp );
      if ( ch->first_carrying )
        fwrite_obj( ch, ch->last_carrying, fp, 0, OS_CARRY );
      /*        if ( ch->pcdata->pet )
                fwrite_mobile( fp, ch->pcdata->pet ); */
      if ( ch->pcdata && ch->pcdata->comments )         /* comments */
        fwrite_comments( ch, fp );        /* comments */
      if ( ch->pcdata->pet )
        fwrite_mobile( fp, ch->pcdata->pet );
      fprintf( fp, "#END\n" );
      fclose( fp );
    }

  re_equip_char( ch );

  write_corpses(ch, NULL);
  quitting_char = NULL;
  saving_char   = NULL;
  return;
}

void save_clone( Character *ch )
{
  char strsave[MAX_INPUT_LENGTH];
  char strback[MAX_INPUT_LENGTH];
  FILE *fp;

  if ( !ch )
    {
      bug( "Save_char_obj: null ch!", 0 );
      return;
    }

  if ( is_npc(ch) || is_not_authed(ch) )
    return;

  if ( ch->desc && ch->desc->original )
    ch = ch->desc->original;

  de_equip_char( ch );
  ch->pcdata->clones++;

  ch->pcdata->save_time = current_time;
  sprintf( strsave, "%s%c/%s.clone", PLAYER_DIR, tolower(ch->name[0]),
           capitalize( ch->name ) );

  /*
   * Auto-backup pfile (can cause lag with high disk access situtations
   */
  if ( IS_SET( sysdata.save_flags, SV_BACKUP ) )
    {
      sprintf( strback, "%s%c/%s", BACKUP_DIR, tolower(ch->name[0]),
               capitalize( ch->name ) );
      rename( strsave, strback );
    }

  if ( ( fp = fopen( strsave, "w" ) ) == NULL )
    {
      bug( "Save_char_obj: fopen", 0 );
      perror( strsave );
    }
  else
    {
      fwrite_char( ch, fp );
      if ( ch->pcdata && ch->pcdata->comments )         /* comments */
        fwrite_comments( ch, fp );        /* comments */
      fprintf( fp, "#END\n" );
      fclose( fp );
    }

  ch->pcdata->clones--;
  re_equip_char( ch );

  write_corpses(ch, NULL);
  quitting_char = NULL;
  saving_char   = NULL;
  return;
}

static void WriteAlias( void *element, void *userData )
{
  FILE *filehandle = (FILE*) userData;
  Alias *alias = (Alias*) element;
  const char *name = GetAliasName( alias );
  const char *value = GetAliasValue( alias );

  if ( !*name || !*value )
    {
      return;
    }

  fprintf( filehandle, "Alias        %s~ %s~\n", name, value );
}

/*
 * Write the char.
 */
void fwrite_char( Character *ch, FILE *fp )
{
  AFFECT_DATA *paf;
  int sn, track, drug;
  SKILLTYPE *skill;

  fprintf( fp, "#%s\n", is_npc(ch) ? "MOB" : "PLAYER"           );

  fprintf( fp, "Version      %d\n",   SAVEVERSION               );
  fprintf( fp, "Name         %s~\n",    ch->name                );
  if ( ch->short_descr && ch->short_descr[0] != '\0' )
    fprintf( fp, "ShortDescr   %s~\n",  ch->short_descr );
  if ( ch->long_descr && ch->long_descr[0] != '\0' )
    fprintf( fp, "LongDescr    %s~\n",  ch->long_descr  );
  if ( ch->description && ch->description[0] != '\0' )
    fprintf( fp, "Description  %s~\n",  ch->description );
  fprintf( fp, "Sex          %d\n",     ch->sex                 );
  fprintf( fp, "Race         %d\n",     ch->race                );
  fprintf( fp, "MainAbility  %d\n",     ch->ability.main        );
  fprintf( fp, "Languages    %d %d\n", ch->speaks, ch->speaking );
  fprintf( fp, "Toplevel     %d\n",     ch->top_level           );
  if ( ch->trust )
    fprintf( fp, "Trust        %d\n",   ch->trust               );
  fprintf( fp, "Played       %d\n",
           ch->pcdata->played + (int) (current_time - ch->pcdata->logon)                );
  fprintf( fp, "Room         %d\n",
           (  ch->in_room == get_room_index( ROOM_VNUM_LIMBO )
              && ch->was_in_room )
           ? ch->was_in_room->vnum
           : ch->in_room->vnum );
  if ( ch->plr_home != NULL )
    fprintf( fp, "PlrHome      %d\n",          ch->plr_home->vnum );

  fprintf( fp, "HpManaMove   %d %d 0 0 %d %d\n",
           ch->hit, ch->max_hit, ch->move, ch->max_move );
  fprintf( fp, "Force        %d %d %d %d\n", ch->stats.perm_frc, ch->stats.mod_frc, ch->mana, ch->max_mana );
  fprintf( fp, "Gold         %d\n",     ch->gold                );
  fprintf( fp, "Bank         %ld\n",    ch->pcdata->bank                );
  {
    int ability;
    for ( ability = 0 ; ability < MAX_ABILITY ; ability++ )
      fprintf( fp, "Ability        %d %d %ld\n",
               ability, get_level( ch, ability ), get_exp( ch, ability ) );
  }
  fprintf( fp, "Clones         %d\n",   ch->pcdata->clones              );
  fprintf( fp, "Salary_time         %ld\n",     ch->pcdata->salary_date );
  fprintf( fp, "Salary         %d\n",   ch->pcdata->salary              );
  fprintf( fp, "Clones         %d\n",   ch->pcdata->clones              );
  fprintf( fp, "Questpoints         %d\n",      ch->quest.questpoints         );
  fprintf( fp, "Nextquest         %d\n",        ch->quest.nextquest           );
  fprintf( fp, "Jailvnum         %d\n", ch->pcdata->jail_vnum   );
  if ( ch->act )
    fprintf( fp, "Act          %d\n", ch->act                   );
  if ( ch->affected_by )
    fprintf( fp, "AffectedBy   %d\n",   ch->affected_by         );
  fprintf( fp, "Position     %d\n",
           ch->position == POS_FIGHTING ? POS_STANDING : ch->position );

  fprintf( fp, "SavingThrows %d %d %d %d %d\n",
           ch->saving.poison_death,
           ch->saving.wand,
           ch->saving.para_petri,
           ch->saving.breath,
           ch->saving.spell_staff                       );
  fprintf( fp, "Alignment    %d\n",     ch->alignment           );
  fprintf( fp, "Glory        %d\n",   ch->pcdata->quest_curr  );
  fprintf( fp, "MGlory       %d\n",   ch->pcdata->quest_accum );
  fprintf( fp, "Hitroll      %d\n",     ch->hitroll             );
  fprintf( fp, "Damroll      %d\n",     ch->damroll             );
  fprintf( fp, "Armor        %d\n",     ch->armor               );
  if ( ch->wimpy )
    fprintf( fp, "Wimpy        %d\n",   ch->wimpy               );
  if ( ch->deaf )
    fprintf( fp, "Deaf         %d\n",   ch->deaf                );
  if ( ch->resistant )
    fprintf( fp, "Resistant    %d\n",   ch->resistant           );
  if ( ch->immune )
    fprintf( fp, "Immune       %d\n",   ch->immune              );
  if ( ch->susceptible )
    fprintf( fp, "Susceptible  %d\n",   ch->susceptible         );
  if ( ch->pcdata && ch->pcdata->outcast_time )
    fprintf( fp, "Outcast_time %ld\n",ch->pcdata->outcast_time );
  if ( ch->pcdata && ch->pcdata->restore_time )
    fprintf( fp, "Restore_time %ld\n",ch->pcdata->restore_time );
  if ( ch->mental_state != -10 )
    fprintf( fp, "Mentalstate  %d\n",   ch->mental_state        );

  if ( is_npc(ch) )
    {
      fprintf( fp, "Vnum         %d\n", ch->pIndexData->vnum    );
      fprintf( fp, "Mobinvis     %d\n", ch->mobinvis            );
    }
  else
    {
      fprintf( fp, "Password     %s~\n",        ch->pcdata->pwd         );
      fprintf( fp, "Lastplayed   %d\n",
               (int)current_time );
      if ( ch->pcdata->bamfin && ch->pcdata->bamfin[0] != '\0' )
        fprintf( fp, "Bamfin       %s~\n",      ch->pcdata->bamfin      );
      if ( ch->pcdata->email && ch->pcdata->email[0] != '\0' )
        fprintf( fp, "Email       %s~\n",       ch->pcdata->email       );
      if ( ch->pcdata->bamfout && ch->pcdata->bamfout[0] != '\0' )
        fprintf( fp, "Bamfout      %s~\n",      ch->pcdata->bamfout     );
      if ( ch->pcdata->rank && ch->pcdata->rank[0] != '\0' )
        fprintf( fp, "Rank         %s~\n",      ch->pcdata->rank        );
      if ( ch->pcdata->bestowments && ch->pcdata->bestowments[0] != '\0' )
        fprintf( fp, "Bestowments  %s~\n",      ch->pcdata->bestowments );
      fprintf( fp, "Title        %s~\n",        ch->pcdata->title       );
      if ( ch->pcdata->homepage && ch->pcdata->homepage[0] != '\0' )
        fprintf( fp, "Homepage     %s~\n",      ch->pcdata->homepage    );
      if ( ch->pcdata->bio && ch->pcdata->bio[0] != '\0' )
        fprintf( fp, "Bio          %s~\n",      ch->pcdata->bio         );
      if ( ch->pcdata->authed_by && ch->pcdata->authed_by[0] != '\0' )
        fprintf( fp, "AuthedBy     %s~\n",      ch->pcdata->authed_by   );
      if ( ch->pcdata->min_snoop )
        fprintf( fp, "Minsnoop     %d\n",       ch->pcdata->min_snoop   );
      if ( ch->pcdata->prompt && *ch->pcdata->prompt )
        fprintf( fp, "Prompt       %s~\n",      ch->pcdata->prompt      );
      if ( ch->pcdata->pagerlen != 24 )
        fprintf( fp, "Pagerlen     %d\n",       ch->pcdata->pagerlen    );

      List_ForEach( GetAliases( ch ), WriteAlias, fp );

      fprintf( fp, "Addiction   ");
      for ( drug = 0 ; drug <=9 ; drug++ )
        fprintf( fp, " %d",     ch->pcdata->addiction[drug] );
      fprintf( fp, "\n");
      fprintf( fp, "Druglevel   ");
      for ( drug = 0 ; drug <=9 ; drug++ )
        fprintf( fp, " %d",     ch->pcdata->drug_level[drug] );
      fprintf( fp, "\n");
      if ( ch->pcdata->wanted_flags )
        fprintf( fp, "Wanted       %d\n",       ch->pcdata->wanted_flags );

      if ( is_immortal( ch ) || ch->pcdata->area )
        {
          fprintf( fp, "WizInvis     %d\n", ch->pcdata->wizinvis );
          if ( ch->pcdata->r_range_lo && ch->pcdata->r_range_hi )
            fprintf( fp, "RoomRange    %d %d\n", ch->pcdata->r_range_lo,
                     ch->pcdata->r_range_hi     );
          if ( ch->pcdata->o_range_lo && ch->pcdata->o_range_hi )
            fprintf( fp, "ObjRange     %d %d\n", ch->pcdata->o_range_lo,
                     ch->pcdata->o_range_hi     );
          if ( ch->pcdata->m_range_lo && ch->pcdata->m_range_hi )
            fprintf( fp, "MobRange     %d %d\n", ch->pcdata->m_range_lo,
                     ch->pcdata->m_range_hi     );
        }
      if ( ch->pcdata->clan_name && ch->pcdata->clan_name[0] != '\0' )
        fprintf( fp, "Clan         %s~\n",      ch->pcdata->clan_name   );
      fprintf( fp, "Flags        %d\n", ch->pcdata->flags       );
      if ( ch->pcdata->release_date > current_time )
        fprintf( fp, "Helled       %d %s~\n",
                 (int)ch->pcdata->release_date, ch->pcdata->helled_by );
      if ( ch->pcdata->pkills )
        fprintf( fp, "PKills       %d\n",       ch->pcdata->pkills      );
      if ( ch->pcdata->pdeaths )
        fprintf( fp, "PDeaths      %d\n",       ch->pcdata->pdeaths     );
      if ( ch->pcdata->target && ch->pcdata->target[0] != '\0' )
        fprintf( fp, "Targ %s~\n",      ch->pcdata->target      );
      if ( get_timer( ch , TIMER_PKILLED)
           && ( get_timer( ch , TIMER_PKILLED) > 0 ) )
        fprintf( fp, "PTimer       %d\n",     get_timer(ch, TIMER_PKILLED));
      fprintf( fp, "MKills       %d\n", ch->pcdata->mkills      );
      fprintf( fp, "MDeaths      %d\n", ch->pcdata->mdeaths     );
      if ( ch->pcdata->illegal_pk )
        fprintf( fp, "IllegalPK    %d\n",       ch->pcdata->illegal_pk  );
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
        fprintf( fp, "Site         %s\n", ch->desc->remote.hostname );
      else
        fprintf( fp, "Site         (Link-Dead)\n" );

      for ( sn = 1; sn < top_sn; sn++ )
        {
          if ( skill_table[sn]->name && ch->pcdata->learned[sn] > 0 )
            switch( skill_table[sn]->type )
              {
              default:
                fprintf( fp, "Skill        %d '%s'\n",
                         ch->pcdata->learned[sn], skill_table[sn]->name );
                break;
              case SKILL_SPELL:
                fprintf( fp, "Spell        %d '%s'\n",
                         ch->pcdata->learned[sn], skill_table[sn]->name );
                break;
              case SKILL_WEAPON:
                fprintf( fp, "Weapon       %d '%s'\n",
                         ch->pcdata->learned[sn], skill_table[sn]->name );
                break;
              case SKILL_TONGUE:
                fprintf( fp, "Tongue       %d '%s'\n",
                         ch->pcdata->learned[sn], skill_table[sn]->name );
                break;
              }
        }
    }

  for ( paf = ch->first_affect; paf; paf = paf->next )
    {
      if ( paf->type >= 0 && (skill=get_skilltype(paf->type)) == NULL )
        continue;

      if ( paf->type >= 0 && paf->type < TYPE_PERSONAL )
        fprintf( fp, "AffectData   '%s' %3d %3d %3d %10d\n",
                 skill->name,
                 paf->duration,
                 paf->modifier,
                 paf->location,
                 paf->bitvector
                 );
      else
        fprintf( fp, "Affect       %3d %3d %3d %3d %10d\n",
                 paf->type,
                 paf->duration,
                 paf->modifier,
                 paf->location,
                 paf->bitvector
                 );
    }

  track = URANGE( 2, ((ch->top_level+3) * MAX_KILLTRACK)/LEVEL_AVATAR, MAX_KILLTRACK );
  for ( sn = 0; sn < track; sn++ )
    {
      if ( ch->pcdata->killed[sn].vnum == 0 )
        break;
      fprintf( fp, "Killed       %d %d\n",
               ch->pcdata->killed[sn].vnum,
               ch->pcdata->killed[sn].count );
    }

#ifdef SWRIP_USE_IMC
  imc_savechar( ch, fp );
#endif

  fprintf( fp, "End\n\n" );
}



/*
 * Write an object and its contents.
 */
void fwrite_obj( const Character *ch, const OBJ_DATA *obj, FILE *fp, int iNest,
                 short os_type )
{
  EXTRA_DESCR_DATA *ed;
  AFFECT_DATA *paf;
  short wear, wear_loc, x;

  if ( iNest >= MAX_NEST )
    {
      bug( "fwrite_obj: iNest hit MAX_NEST %d", iNest );
      return;
    }

  /*
   * Slick recursion to write lists backwards,
   *   so loading them will load in forwards order.
   */
  if ( obj->prev_content && os_type != OS_CORPSE )
    fwrite_obj( ch, obj->prev_content, fp, iNest, OS_CARRY );

  /*
   * Castrate storage characters.
   */
  if ( obj->item_type == ITEM_KEY && !IS_OBJ_STAT(obj, ITEM_CLANOBJECT ))
    return;

  /*
   * Catch deleted objects                                      -Thoric
   */
  if ( obj_extracted(obj) )
    return;

  /*
   * Do NOT save prototype items!                               -Thoric
   */
  if ( IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
    return;

  /* Corpse saving. -- Altrag */
  fprintf( fp, (os_type == OS_CORPSE ? "#CORPSE\n" : "#OBJECT\n") );

  if ( iNest )
    fprintf( fp, "Nest         %d\n",   iNest                );
  if ( obj->count > 1 )
    fprintf( fp, "Count        %d\n",   obj->count           );
  if ( QUICKMATCH( obj->name, obj->pIndexData->name ) == 0 )
    fprintf( fp, "Name         %s~\n",  obj->name            );
  if ( QUICKMATCH( obj->short_descr, obj->pIndexData->short_descr ) == 0 )
    fprintf( fp, "ShortDescr   %s~\n",  obj->short_descr     );
  if ( QUICKMATCH( obj->description, obj->pIndexData->description ) == 0 )
    fprintf( fp, "Description  %s~\n",  obj->description     );
  if ( QUICKMATCH( obj->action_desc, obj->pIndexData->action_desc ) == 0 )
    fprintf( fp, "ActionDesc   %s~\n",  obj->action_desc     );
  fprintf( fp, "Vnum         %d\n",     obj->pIndexData->vnum        );
  if ( os_type == OS_CORPSE && obj->in_room )
    fprintf( fp, "Room         %d\n",   obj->in_room->vnum         );
  if ( obj->extra_flags != obj->pIndexData->extra_flags )
    fprintf( fp, "ExtraFlags   %d\n",   obj->extra_flags     );
  if ( obj->wear_flags != obj->pIndexData->wear_flags )
    fprintf( fp, "WearFlags    %d\n",   obj->wear_flags      );
  wear_loc = -1;
  for ( wear = 0; wear < MAX_WEAR; wear++ )
    for ( x = 0; x < MAX_LAYERS; x++ )
      if ( obj == save_equipment[wear][x] )
        {
          wear_loc = wear;
          break;
        }
      else
        if ( !save_equipment[wear][x] )
          break;
  if ( wear_loc != -1 )
    fprintf( fp, "WearLoc      %d\n",   wear_loc             );
  if ( obj->item_type != obj->pIndexData->item_type )
    fprintf( fp, "ItemType     %d\n",   obj->item_type       );
  if ( obj->weight != obj->pIndexData->weight )
    fprintf( fp, "Weight       %d\n",   obj->weight                  );
  if ( obj->level )
    fprintf( fp, "Level        %d\n",   obj->level                   );
  if ( obj->timer )
    fprintf( fp, "Timer        %d\n",   obj->timer                   );
  if ( obj->cost != obj->pIndexData->cost )
    fprintf( fp, "Cost         %d\n",   obj->cost                    );
  if ( obj->value[0] || obj->value[1] || obj->value[2]
       ||   obj->value[3] || obj->value[4] || obj->value[5] )
    fprintf( fp, "Values       %d %d %d %d %d %d\n",
             obj->value[0], obj->value[1], obj->value[2],
             obj->value[3], obj->value[4], obj->value[5]     );

  switch ( obj->item_type )
    {
    case ITEM_PILL: /* was down there with staff and wand, wrongly - Scryn */
    case ITEM_POTION:
      if ( IS_VALID_SN(obj->value[1]) )
        fprintf( fp, "Spell 1      '%s'\n",
                 skill_table[obj->value[1]]->name );

      if ( IS_VALID_SN(obj->value[2]) )
        fprintf( fp, "Spell 2      '%s'\n",
                 skill_table[obj->value[2]]->name );

      if ( IS_VALID_SN(obj->value[3]) )
        fprintf( fp, "Spell 3      '%s'\n",
                 skill_table[obj->value[3]]->name );

      break;

    case ITEM_DEVICE:
      if ( IS_VALID_SN(obj->value[3]) )
        fprintf( fp, "Spell 3      '%s'\n",
                 skill_table[obj->value[3]]->name );

      break;
    case ITEM_SALVE:
      if ( IS_VALID_SN(obj->value[4]) )
        fprintf( fp, "Spell 4      '%s'\n",
                 skill_table[obj->value[4]]->name );

      if ( IS_VALID_SN(obj->value[5]) )
        fprintf( fp, "Spell 5      '%s'\n",
                 skill_table[obj->value[5]]->name );
      break;
    }

  for ( paf = obj->first_affect; paf; paf = paf->next )
    {
      /*
       * Save extra object affects                              -Thoric
       */
      if ( paf->type < 0 || paf->type >= top_sn )
        {
          fprintf( fp, "Affect       %d %d %d %d %d\n",
                   paf->type,
                   paf->duration,
                   ((paf->location == APPLY_WEAPONSPELL
                     || paf->location == APPLY_WEARSPELL
                     || paf->location == APPLY_REMOVESPELL
                     || paf->location == APPLY_STRIPSN)
                    && IS_VALID_SN(paf->modifier))
                   ? skill_table[paf->modifier]->slot : paf->modifier,
                   paf->location,
                   paf->bitvector
                   );
        }
      else
        fprintf( fp, "AffectData   '%s' %d %d %d %d\n",
                 skill_table[paf->type]->name,
                 paf->duration,
                 ((paf->location == APPLY_WEAPONSPELL
                   || paf->location == APPLY_WEARSPELL
                   || paf->location == APPLY_REMOVESPELL
                   || paf->location == APPLY_STRIPSN)
                  && IS_VALID_SN(paf->modifier))
                 ? skill_table[paf->modifier]->slot : paf->modifier,
                 paf->location,
                 paf->bitvector
                 );
    }

  for ( ed = obj->first_extradesc; ed; ed = ed->next )
    fprintf( fp, "ExtraDescr   %s~ %s~\n",
             ed->keyword, ed->description );

  fprintf( fp, "End\n\n" );

  if ( obj->first_content )
    fwrite_obj( ch, obj->last_content, fp, iNest + 1, OS_CARRY );

  return;
}



/*
 * Load a char and inventory into a new ch structure.
 */
bool load_char_obj( DESCRIPTOR_DATA *d, char *name, bool preload )
{
  char strsave[MAX_INPUT_LENGTH];
  Character *ch;
  FILE *fp;
  bool found;
  struct stat fst;
  int i, x;
  char buf[MAX_INPUT_LENGTH];

  CREATE( ch, Character, 1 );
  for ( x = 0; x < MAX_WEAR; x++ )
    for ( i = 0; i < MAX_LAYERS; i++ )
      save_equipment[x][i] = NULL;
  clear_char( ch );
  loading_char = ch;

  CREATE( ch->pcdata, PC_DATA, 1 );
  d->character                  = ch;
  ch->on                                = NULL;
  ch->desc                              = d;
  ch->name                              = STRALLOC( name );
  ch->act                               = PLR_BLANK
    | PLR_COMBINE
    | PLR_PROMPT;
  ch->stats.perm_str                  = 10;
  ch->stats.perm_int                  = 10;
  ch->stats.perm_wis                  = 10;
  ch->stats.perm_dex                  = 10;
  ch->stats.perm_con                  = 10;
  ch->stats.perm_cha                  = 10;
  ch->stats.perm_lck                  = 10;
  ch->pcdata->condition[COND_THIRST]    = 48;
  ch->pcdata->condition[COND_FULL]      = 48;
  ch->pcdata->condition[COND_BLOODTHIRST] = 10;
  ch->pcdata->wizinvis          = 0;
  ch->mental_state                      = -10;
  ch->mobinvis                  = 0;
  for(i = 0; i < MAX_SKILL; i++)
    ch->pcdata->learned[i]              = 0;
  ch->pcdata->release_date              = 0;
  ch->pcdata->helled_by         = NULL;
  ch->pcdata->pet                       = NULL;
  ch->saving.poison_death               = 0;
  ch->saving.wand                       = 0;
  ch->saving.para_petri         = 0;
  ch->saving.breath                     = 0;
  ch->saving.spell_staff                = 0;
  ch->pcdata->comments                = NULL;    /* comments */
  ch->pcdata->pagerlen          = 24;
  ch->mob_clan                        = STRALLOC( "" );
  ch->was_sentinel                    = NULL;
  ch->plr_home                        = NULL;
  AllocateAliasList( ch );

#ifdef SWRIP_USE_IMC
  imc_initchar( ch );
#endif

  found = FALSE;
  sprintf( strsave, "%s%c/%s", PLAYER_DIR, tolower(name[0]),
           capitalize( name ) );
  if ( stat( strsave, &fst ) != -1 )
    {
      if ( fst.st_size == 0 )
        {
          sprintf( strsave, "%s%c/%s", BACKUP_DIR, tolower(name[0]),
                   capitalize( name ) );
          send_to_char( "Restoring your backup player file...", ch );
        }
      else
        {
          sprintf( buf, "%s player data for: %s (%dK)",
                   preload ? "Preloading" : "Loading", ch->name,
                   (int) fst.st_size/1024 );
          log_string_plus( buf, LOG_COMM, LEVEL_GREATER );
        }
    }
  /* else no player file */

  if ( ( fp = fopen( strsave, "r" ) ) != NULL )
    {
      int iNest;

      for ( iNest = 0; iNest < MAX_NEST; iNest++ )
        rgObjNest[iNest] = NULL;

      found = TRUE;
      /* Cheat so that bug will show line #'s -- Altrag */
      fpArea = fp;
      strcpy(strArea, strsave);
      for ( ; ; )
        {
          char letter;
          char *word;

          letter = fread_letter( fp );
          if ( letter == '*' )
            {
              fread_to_eol( fp );
              continue;
            }

          if ( letter != '#' )
            {
              bug( "Load_char_obj: # not found.", 0 );
              bug( name, 0 );
              break;
            }

          word = fread_word( fp );

          if ( !str_cmp( word, "PLAYER" ) )
            {
              fread_char ( ch, fp, preload );
              if ( preload )
                break;
            }
          else
            if ( !str_cmp( word, "OBJECT" ) )   /* Objects      */
              fread_obj  ( ch, fp, OS_CARRY );
            else
              if ( !str_cmp( word, "COMMENT") )
                fread_comment(ch, fp );         /* Comments     */
              else
                if ( !str_cmp( word, "MOBILE") )
                  {
                    Character *mob;
                    mob = fread_mobile( fp );
                    ch->pcdata->pet = mob;
                    mob->master = ch;
                    SET_BIT(mob->affected_by, AFF_CHARM);
                  }
                else
                  if ( !str_cmp( word, "END"    ) )     /* Done         */
                    break;
                  else
                    {
                      bug( "Load_char_obj: bad section.", 0 );
                      bug( name, 0 );
                      break;
                    }
        }
      fclose( fp );
      fpArea = NULL;
      strcpy(strArea, "$");
    }


  if ( !found )
    {
      ch->short_descr                   = STRALLOC( "" );
      ch->long_descr                    = STRALLOC( "" );
      ch->description                   = STRALLOC( "" );
      ch->pcdata->target                = STRALLOC( "" );
      ch->editor                        = NULL;
      ch->quest.nextquest                             = 0;
      ch->quest.questpoints                           = 0;
      ch->pcdata->clones                        = 0;
      ch->pcdata->jail_vnum                     = 0;
      ch->pcdata->clan_name             = STRALLOC( "" );
      ch->pcdata->clan          = NULL;
      ch->pcdata->pwd                   = str_dup( "" );
      ch->pcdata->email         = str_dup( "" );
      ch->pcdata->bamfin                = str_dup( "" );
      ch->pcdata->bamfout               = str_dup( "" );
      ch->pcdata->rank          = str_dup( "" );
      ch->pcdata->bestowments           = str_dup( "" );
      ch->pcdata->title         = STRALLOC( "" );
      ch->pcdata->homepage              = str_dup( "" );
      ch->pcdata->bio           = STRALLOC( "" );
      ch->pcdata->authed_by             = STRALLOC( "" );
      ch->pcdata->prompt                = STRALLOC( "" );
      ch->pcdata->r_range_lo            = 0;
      ch->pcdata->r_range_hi            = 0;
      ch->pcdata->m_range_lo            = 0;
      ch->pcdata->m_range_hi            = 0;
      ch->pcdata->o_range_lo            = 0;
      ch->pcdata->o_range_hi            = 0;
      ch->pcdata->wizinvis              = 0;
      ch->pcdata->wanted_flags        = 0;
      ch->on                            = NULL;
    }
  else
    {
      ch->on                            = NULL;
      if ( !ch->pcdata->clan_name )
        {
          ch->pcdata->clan_name = STRALLOC( "" );
          ch->pcdata->clan      = NULL;
        }
      if ( !ch->pcdata->bio )
        ch->pcdata->bio  = STRALLOC( "" );

      if ( !ch->pcdata->authed_by )
        ch->pcdata->authed_by    = STRALLOC( "" );

      if ( !is_npc( ch ) && get_trust( ch ) > LEVEL_AVATAR )
        {
          if ( ch->pcdata->wizinvis < 2 )
            ch->pcdata->wizinvis = ch->top_level;
          assign_area( ch );
        }
      if ( file_ver > 1 )
        {
          for ( i = 0; i < MAX_WEAR; i++ )
            for ( x = 0; x < MAX_LAYERS; x++ )
              if ( save_equipment[i][x] )
                {
                  equip_char( ch, save_equipment[i][x], i );
                  save_equipment[i][x] = NULL;
                }
              else
                break;
        }

    }

  loading_char = NULL;
  return found;
}



/*
 * Read in a char.
 */
void fread_char( Character *ch, FILE *fp, bool preload )
{
  char buf[MAX_STRING_LENGTH];
  char *line;
  const char *word;
  int x1, x2, x3, x4, x5, x6, x7, x8, x9, x0;
  short killcnt;
  bool fMatch;
  time_t lastplayed;
  int sn;

  file_ver = 0;
  killcnt = 0;

  for ( ; ; )
    {
      word   = feof( fp ) ? "End" : fread_word( fp );
      fMatch = FALSE;

      switch ( UPPER(word[0]) )
        {
        case '*':
          fMatch = TRUE;
          fread_to_eol( fp );
          break;

        case 'A':
          KEY( "Act",           ch->act,                fread_number( fp ) );
          KEY( "AffectedBy",    ch->affected_by,        fread_number( fp ) );
          KEY( "Alignment",     ch->alignment,          fread_number( fp ) );
          KEY( "Armor", ch->armor,              fread_number( fp ) );

          if ( !str_cmp( word, "Addiction"  ) )
            {
              line = fread_line( fp );
              x0=x1=x2=x3=x4=x5=x6=x7=x8=x9=0;
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
              fMatch = TRUE;
              break;
            }

          if ( !str_cmp( word, "Ability"  ) )
            {
              line = fread_line( fp );
              x0=x1=x2=0;
              sscanf( line, "%d %d %d",
                      &x0, &x1, &x2 );
              if ( x0 >= 0 && x0 < MAX_ABILITY )
                {
                  set_level( ch, x0, x1 );
                  set_exp( ch, x0, x2 );
                }
              fMatch = TRUE;
              break;
            }


          if ( !str_cmp( word, "Affect" ) || !str_cmp( word, "AffectData" ) )
            {
              AFFECT_DATA *paf;

              if ( preload )
                {
                  fMatch = TRUE;
                  fread_to_eol( fp );
                  break;
                }
              CREATE( paf, AFFECT_DATA, 1 );
              if ( !str_cmp( word, "Affect" ) )
                {
                  paf->type     = fread_number( fp );
                }
              else
                {
                  char *sname = fread_word(fp);

                  if ( (sn=skill_lookup(sname)) < 0 )
                    {
                      if ( (sn=herb_lookup(sname)) < 0 )
                        bug( "Fread_char: unknown skill.", 0 );
                      else
                        sn += TYPE_HERB;
                    }
                  paf->type = sn;
                }

              paf->duration     = fread_number( fp );
              paf->modifier     = fread_number( fp );
              paf->location     = fread_number( fp );
              paf->bitvector    = fread_number( fp );
              LINK(paf, ch->first_affect, ch->last_affect, next, prev );
              fMatch = TRUE;
              break;
            }

          if ( !str_cmp( word, "AttrMod"  ) )
            {
              line = fread_line( fp );
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
              fMatch = TRUE;
              break;
            }

          if ( !str_cmp( word, "Alias" ) )
            {
              Alias *alias;
	      char nameBuffer[MAX_STRING_LENGTH];
	      char valueBuffer[MAX_STRING_LENGTH];
	      char *name;
	      char *value;

              if ( preload )
                {
                  fMatch = TRUE;
                  fread_to_eol( fp );
                  break;
                }

	      name = fread_string( fp, nameBuffer, sizeof( nameBuffer ) );
	      value = fread_string( fp, valueBuffer, sizeof( valueBuffer ) );
              alias = CreateAlias( name, value );
	      AddAlias( ch, alias );

              fMatch = TRUE;
              break;
            }

          if ( !str_cmp( word, "AttrPerm" ) )
            {
              line = fread_line( fp );
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
              if (!x7 || x7 == 0)
                ch->stats.perm_lck = 13;
              fMatch = TRUE;
              break;
            }
          KEY( "AuthedBy",      ch->pcdata->authed_by,  fread_string_hash( fp ) );
          break;

        case 'B':
          KEY( "Bamfin",        ch->pcdata->bamfin,     fread_string_nohash( fp ) );
          KEY( "Bamfout",       ch->pcdata->bamfout,    fread_string_nohash( fp ) );
          KEY( "Bestowments", ch->pcdata->bestowments, fread_string_nohash( fp ) );
          KEY( "Bio",           ch->pcdata->bio,        fread_string_hash( fp ) );
          KEY( "Bank",  ch->pcdata->bank,       fread_number( fp ) );
          break;

        case 'C':
          if ( !str_cmp( word, "Clan" ) )
            {
              ch->pcdata->clan_name = fread_string_hash( fp );

              if ( !preload
                   &&   ch->pcdata->clan_name[0] != '\0'
                   && ( ch->pcdata->clan = GetClan( ch->pcdata->clan_name )) == NULL )
                {
                  sprintf( buf, "Warning: the organization %s no longer exists, and therefore you no longer\r\nbelong to that organization.\r\n",
                           ch->pcdata->clan_name );
                  send_to_char( buf, ch );
                  STRFREE( ch->pcdata->clan_name );
                  RemoveMember(ch);
                  ch->pcdata->clan_name = STRALLOC( "" );
                }
              else
                UpdateMember(ch);
              fMatch = TRUE;
              break;
            }
          KEY( "Clones",        ch->pcdata->clones,             fread_number( fp ) );

          if ( !str_cmp( word, "Condition" ) )
            {
              line = fread_line( fp );
              sscanf( line, "%d %d %d %d",
                      &x1, &x2, &x3, &x4 );
              ch->pcdata->condition[0] = x1;
              ch->pcdata->condition[1] = x2;
              ch->pcdata->condition[2] = x3;
              ch->pcdata->condition[3] = x4;
              fMatch = TRUE;
              break;
            }

          break;

        case 'D':
          KEY( "Damroll",       ch->damroll,            fread_number( fp ) );
          KEY( "Deaf",  ch->deaf,               fread_number( fp ) );
          KEY( "Description",   ch->description,        fread_string_hash( fp ) );
          if ( !str_cmp( word, "Druglevel"  ) )
            {
              line = fread_line( fp );
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
              fMatch = TRUE;
              break;
            }
          break;

          /* 'E' was moved to after 'S' */
        case 'F':
          KEY( "Flags", ch->pcdata->flags,      fread_number( fp ) );
          if ( !str_cmp( word, "Force" ) )
            {
              line = fread_line( fp );
              x1=x2=x3=x4=x5=x6=0;
              sscanf( line, "%d %d %d %d",
                      &x1, &x2, &x3, &x4);
              ch->stats.perm_frc = x1;
              ch->stats.mod_frc = x2;
              ch->mana = x3;
              ch->max_mana = x4;
              fMatch = TRUE;
              break;
            }
          break;

        case 'G':
          KEY( "Glory",       ch->pcdata->quest_curr, fread_number( fp ) );
          KEY( "Gold",  ch->gold,               fread_number( fp ) );
          /* temporary measure */
          if ( !str_cmp( word, "Guild" ) )
            {
              ch->pcdata->clan_name = fread_string_hash( fp );

              if ( !preload
                   &&   ch->pcdata->clan_name[0] != '\0'
                   && ( ch->pcdata->clan = GetClan( ch->pcdata->clan_name )) == NULL )
                {
                  sprintf( buf, "Warning: the organization %s no longer exists, and therefore you no longer\r\nbelong to that organization.\r\n",
                           ch->pcdata->clan_name );
                  send_to_char( buf, ch );
                  STRFREE( ch->pcdata->clan_name );
                  ch->pcdata->clan_name = STRALLOC( "" );
                }
              fMatch = TRUE;
              break;
            }
          break;

        case 'H':
          if ( !str_cmp(word, "Helled") )
            {
              ch->pcdata->release_date = fread_number(fp);
              ch->pcdata->helled_by = fread_string_hash(fp);
              if ( ch->pcdata->release_date < current_time )
                {
                  STRFREE(ch->pcdata->helled_by);
                  ch->pcdata->helled_by = NULL;
                  ch->pcdata->release_date = 0;
                  ch->pcdata->jail_vnum = 0;
                }
              fMatch = TRUE;
              break;
            }

          KEY( "Hitroll",       ch->hitroll,            fread_number( fp ) );
          KEY( "Homepage",      ch->pcdata->homepage,   fread_string_nohash( fp ) );

          if ( !str_cmp( word, "HpManaMove" ) )
            {
              line = fread_line( fp );
              x1=x2=x3=x4=x5=x6=0;
              sscanf( line, "%d %d %d %d %d %d",
                      &x1, &x2, &x3, &x4, &x5, &x6 );
              ch->hit = x1;
              ch->max_hit = x2;
              ch->move = x5;
              ch->max_move = x6;
              if ( x4 >= 100 )
                {
                  ch->stats.perm_frc = number_range( 1 , 20 );
                  ch->max_mana = x4;
                  ch->mana     = x4;
                }
              else if ( x4 >= 10 )
                {
                  ch->stats.perm_frc = 1;
                  ch->max_mana = x4;
                }
              fMatch = TRUE;
              break;
            }

          break;

        case 'I':
          KEY( "IllegalPK",     ch->pcdata->illegal_pk, fread_number( fp ) );
          KEY( "Immune",        ch->immune,             fread_number( fp ) );

#ifdef SWRIP_USE_IMC
	  if( ( fMatch = imc_loadchar( ch, fp, word ) ) )
	    break;
#endif
          break;
        case 'J':
          KEY( "Jailvnum",    ch->pcdata->jail_vnum,          fread_number( fp ) );
          break;

        case 'K':
          if ( !str_cmp( word, "Killed" ) )
            {
              fMatch = TRUE;
              if ( killcnt >= MAX_KILLTRACK )
                bug( "fread_char: killcnt (%d) >= MAX_KILLTRACK", killcnt );
              else
                {
                  ch->pcdata->killed[killcnt].vnum    = fread_number( fp );
                  ch->pcdata->killed[killcnt++].count = fread_number( fp );
                }
            }
          break;

        case 'L':
          if ( !str_cmp(word, "Lastplayed") )
            {
              lastplayed = fread_number(fp);
              fMatch = TRUE;
              break;
            }
          KEY( "LongDescr",     ch->long_descr,         fread_string_hash( fp ) );
          if ( !str_cmp( word, "Languages" ) )
            {
              ch->speaks = fread_number( fp );
              ch->speaking = fread_number( fp );
              fMatch = TRUE;
            }
          break;

        case 'M':
          KEY( "MainAbility",   ch->ability.main,               fread_number( fp ) );
          KEY( "MDeaths",       ch->pcdata->mdeaths,    fread_number( fp ) );
          KEY( "Mentalstate", ch->mental_state, fread_number( fp ) );
          KEY( "MGlory",      ch->pcdata->quest_accum,fread_number( fp ) );
          KEY( "Minsnoop",      ch->pcdata->min_snoop,  fread_number( fp ) );
          KEY( "MKills",        ch->pcdata->mkills,     fread_number( fp ) );
          KEY( "Mobinvis",      ch->mobinvis,           fread_number( fp ) );
          if ( !str_cmp( word, "MobRange" ) )
            {
              ch->pcdata->m_range_lo = fread_number( fp );
              ch->pcdata->m_range_hi = fread_number( fp );
              fMatch = TRUE;
            }
          break;

        case 'N':
          KEY( "Nextquest",     ch->quest.nextquest,  fread_number( fp ) );

          if ( !str_cmp( word, "Name" ) )
            {
              /*
               * Name already set externally.
               */
              fread_to_eol( fp );
              fMatch = TRUE;
              break;
            }
          break;

        case 'O':
          KEY( "Outcast_time", ch->pcdata->outcast_time, fread_number( fp ) );
          if ( !str_cmp( word, "ObjRange" ) )
            {
              ch->pcdata->o_range_lo = fread_number( fp );
              ch->pcdata->o_range_hi = fread_number( fp );
              fMatch = TRUE;
            }
          break;

        case 'P':
          KEY( "Pagerlen",      ch->pcdata->pagerlen,   fread_number( fp ) );
          KEY( "Password",      ch->pcdata->pwd,        fread_string_nohash( fp ) );
          KEY( "PDeaths",       ch->pcdata->pdeaths,    fread_number( fp ) );
          KEY( "PKills",        ch->pcdata->pkills,     fread_number( fp ) );
          KEY( "Played",        ch->pcdata->played,     fread_number( fp ) );
          KEY( "Position",      ch->position,           fread_number( fp ) );
          KEY( "Prompt",        ch->pcdata->prompt,     fread_string_hash( fp ) );
          if (!str_cmp ( word, "PTimer" ) )
            {
              add_timer( ch , TIMER_PKILLED, fread_number(fp), NULL, 0 );
              fMatch = TRUE;
              break;
            }
          if ( !str_cmp( word, "PlrHome" ) )
            {
              ch->plr_home = get_room_index( fread_number( fp ) );
              if ( !ch->plr_home )
                ch->plr_home = NULL;
              fMatch = TRUE;
              break;
            }
          break;

        case 'Q':
          KEY( "Questpoints",        ch->quest.questpoints,           fread_number( fp ) );

        case 'R':
          KEY( "Race",        ch->race,         fread_number( fp ) );
          KEY( "Rank",        ch->pcdata->rank, fread_string_nohash( fp ) );
          KEY( "Resistant",     ch->resistant,          fread_number( fp ) );
          KEY( "Restore_time",ch->pcdata->restore_time, fread_number( fp ) );

          if ( !str_cmp( word, "Room" ) )
            {
              ch->in_room = get_room_index( fread_number( fp ) );
              if ( !ch->in_room )
                ch->in_room = get_room_index( ROOM_VNUM_LIMBO );
              fMatch = TRUE;
              break;
            }
          if ( !str_cmp( word, "RoomRange" ) )
            {
              ch->pcdata->r_range_lo = fread_number( fp );
              ch->pcdata->r_range_hi = fread_number( fp );
              fMatch = TRUE;
            }
          break;

        case 'S':
          KEY( "Salary",      ch->pcdata->salary,               fread_number( fp ) );
          KEY( "Salary_time",ch->pcdata->salary_date, fread_number( fp ) );
          KEY( "Sex",           ch->sex,                fread_number( fp ) );
          KEY( "ShortDescr",    ch->short_descr,        fread_string_hash( fp ) );
          KEY( "Susceptible",   ch->susceptible,        fread_number( fp ) );
          if ( !str_cmp( word, "SavingThrow" ) )
            {
              ch->saving.wand   = fread_number( fp );
              ch->saving.poison_death = ch->saving.wand;
              ch->saving.para_petri     = ch->saving.wand;
              ch->saving.breath         = ch->saving.wand;
              ch->saving.spell_staff    = ch->saving.wand;
              fMatch = TRUE;
              break;
            }

          if ( !str_cmp( word, "SavingThrows" ) )
            {
              ch->saving.poison_death = fread_number( fp );
              ch->saving.wand   = fread_number( fp );
              ch->saving.para_petri     = fread_number( fp );
              ch->saving.breath         = fread_number( fp );
              ch->saving.spell_staff    = fread_number( fp );
              fMatch = TRUE;
              break;
            }

          if ( !str_cmp( word, "Site" ) )
            {
              if ( !preload )
                {
                  sprintf( buf, "Last connected from: %s\r\n", fread_word( fp ) );
                  send_to_char( buf, ch );
                }
              else
                fread_to_eol( fp );
              fMatch = TRUE;
              if ( preload )
                word = "End";
              else
                break;
            }

          if ( !str_cmp( word, "Skill" ) )
            {
              int value;

              if ( preload )
                word = "End";
              else
                {
                  value = fread_number( fp );
                  if ( file_ver < 3 )
                    sn = skill_lookup( fread_word( fp ) );
                  else
                    sn = bsearch_skill_exact( fread_word( fp ), gsn_first_skill, gsn_first_weapon-1 );
                  if ( sn < 0 )
                    bug( "Fread_char: unknown skill.", 0 );
                  else
                    {
                      ch->pcdata->learned[sn] = value;

                    }
                  fMatch = TRUE;
                  break;
                }
            }

          if ( !str_cmp( word, "Spell" ) )
            {
              int value;

              if ( preload )
                word = "End";
              else
                {
                  value = fread_number( fp );

                  sn = bsearch_skill_exact( fread_word( fp ), gsn_first_spell, gsn_first_skill-1 );
                  if ( sn < 0 )
                    bug( "Fread_char: unknown spell.", 0 );
                  else
                    {
                      ch->pcdata->learned[sn] = value;

                    }
                  fMatch = TRUE;
                  break;
                }
            }
          if ( str_cmp( word, "End" ) )
            break;

        case 'E':
          if ( !str_cmp( word, "End" ) )
            {
              if (!ch->short_descr)
                ch->short_descr = STRALLOC( "" );
              if (!ch->long_descr)
                ch->long_descr  = STRALLOC( "" );
              if (!ch->description)
                ch->description = STRALLOC( "" );
              if (!ch->pcdata->pwd)
                ch->pcdata->pwd = str_dup( "" );
              if (!ch->pcdata->email)
                ch->pcdata->email       = str_dup( "" );
              if (!ch->pcdata->bamfin)
                ch->pcdata->bamfin      = str_dup( "" );
              if (!ch->pcdata->bamfout)
                ch->pcdata->bamfout     = str_dup( "" );
              if (!ch->pcdata->bio)
                ch->pcdata->bio = STRALLOC( "" );
              if (!ch->pcdata->rank)
                ch->pcdata->rank        = str_dup( "" );
              if (!ch->pcdata->bestowments)
                ch->pcdata->bestowments = str_dup( "" );
              if (!ch->pcdata->title)
                ch->pcdata->title       = STRALLOC( "" );
              if (!ch->pcdata->homepage)
                ch->pcdata->homepage    = str_dup( "" );
              if (!ch->pcdata->authed_by)
                ch->pcdata->authed_by = STRALLOC( "" );
              if (!ch->pcdata->prompt )
                ch->pcdata->prompt      = STRALLOC( "" );
              ch->editor                = NULL;
              killcnt = URANGE( 2, ((ch->top_level+3) * MAX_KILLTRACK)/LEVEL_AVATAR, MAX_KILLTRACK );
              if ( killcnt < MAX_KILLTRACK )
                ch->pcdata->killed[killcnt].vnum = 0;
              {
                int ability;
                for ( ability = 0 ; ability < MAX_ABILITY ; ability++ )
                  {
                    if ( get_level( ch, ability ) == 0 )
                      set_level( ch, ability, 1 );
                  }
              }

              if ( !is_immortal( ch ) && !ch->speaking )
                /*      ch->speaking = LANG_COMMON;      */
                ch->speaking = race_table[ch->race].language;

              if ( is_immortal( ch ) )
                {
                  ch->speaks = ~0;
                  if ( ch->speaking == 0 )
                    ch->speaking = ~0;
                }
              if ( !ch->pcdata->prompt )
                ch->pcdata->prompt = STRALLOC("");

              if ( lastplayed != 0 )
                {
                  int hitgain;
                  hitgain = ( ( int ) ( current_time - lastplayed ) / 60 );
                  ch->hit = URANGE( 1 , ch->hit + hitgain , ch->max_hit );
                  ch->move = URANGE( 1 , ch->move + hitgain , ch->max_move );

                  if ( IsForcer( ch ) )
                    ch->mana = URANGE( 0 , ch->mana + hitgain , ch->max_mana );

                  better_mental_state( ch , hitgain );
                }
              for ( sn = 0; sn < top_sn; sn++ )
                {
                  if ( !skill_table[sn]->name )
                    break;

                  if ( skill_table[sn]->guild < 0 || skill_table[sn]->guild >= MAX_ABILITY )
                    continue;

                  if ( ch->pcdata->learned[sn] > 0
		       && get_level( ch, skill_table[sn]->guild ) < skill_table[sn]->min_level )
                    ch->pcdata->learned[sn] = 0;
                }
              return;
            }
          KEY( "Email", ch->pcdata->email,      fread_string_nohash( fp ) );
          break;

        case 'T':

          KEY( "Targ",  ch->pcdata->target,     fread_string_hash( fp ) );
          KEY( "Toplevel",      ch->top_level,          fread_number( fp ) );
          if ( !str_cmp( word, "Tongue" ) )
            {
              int value;

              if ( preload )
                word = "End";
              else
                {
                  value = fread_number( fp );

                  sn = bsearch_skill_exact( fread_word( fp ), gsn_first_tongue, gsn_top_sn-1 );
                  if ( sn < 0 )
                    bug( "Fread_char: unknown tongue.", 0 );
                  else
                    {
                      ch->pcdata->learned[sn] = value;

                    }
                  fMatch = TRUE;
                }
              break;
            }
          KEY( "Trust", ch->trust, fread_number( fp ) );
          /* Let no character be trusted higher than one below maxlevel -- Narn */
          ch->trust = UMIN( ch->trust, MAX_LEVEL - 1 );

          if ( !str_cmp( word, "Title" ) )
            {
              ch->pcdata->title = fread_string_hash( fp );
              if ( isalpha(ch->pcdata->title[0])
                   ||   isdigit(ch->pcdata->title[0]) )
                {
                  sprintf( buf, " %s", ch->pcdata->title );
                  if ( ch->pcdata->title )
                    STRFREE( ch->pcdata->title );
                  ch->pcdata->title = STRALLOC( buf );
                }
              fMatch = TRUE;
              break;
            }

          break;

        case 'V':
          if ( !str_cmp( word, "Vnum" ) )
            {
              ch->pIndexData = get_mob_index( fread_number( fp ) );
              fMatch = TRUE;
              break;
            }
          KEY( "Version",       file_ver,               fread_number( fp ) );
          break;

        case 'W':
          if ( !str_cmp( word, "Weapon" ) )
            {
              int value;

              if ( preload )
                word = "End";
              else
                {
                  value = fread_number( fp );

                  sn = bsearch_skill_exact( fread_word( fp ), gsn_first_weapon, gsn_first_tongue-1 );
                  if ( sn < 0 )
                    bug( "Fread_char: unknown weapon.", 0 );
                  else
                    {
                      ch->pcdata->learned[sn] = value;

                    }
                  fMatch = TRUE;
                }
              break;
            }
          KEY( "Wimpy", ch->wimpy,              fread_number( fp ) );
          KEY( "WizInvis",      ch->pcdata->wizinvis,   fread_number( fp ) );
          KEY( "Wanted",        ch->pcdata->wanted_flags,  fread_number( fp ) );
          break;
        }

      if ( !fMatch )
        {
          sprintf( buf, "Fread_char: no match: %s", word );
          bug( buf, 0 );
        }
    }
}


void fread_obj( Character *ch, FILE *fp, short os_type )
{
  OBJ_DATA *obj;
  const char *word;
  int iNest;
  bool fMatch;
  bool fNest;
  bool fVnum;
  ROOM_INDEX_DATA *room;

  CREATE( obj, OBJ_DATA, 1 );
  obj->count            = 1;
  obj->wear_loc = -1;
  obj->weight           = 1;

  fNest         = TRUE;         /* Requiring a Nest 0 is a waste */
  fVnum         = TRUE;
  iNest         = 0;

  for ( ; ; )
    {
      word   = feof( fp ) ? "End" : fread_word( fp );
      fMatch = FALSE;

      switch ( UPPER(word[0]) )
        {
        case '*':
          fMatch = TRUE;
          fread_to_eol( fp );
          break;

        case 'A':
          if ( !str_cmp( word, "Affect" ) || !str_cmp( word, "AffectData" ) )
            {
              AFFECT_DATA *paf;
              int pafmod;

              CREATE( paf, AFFECT_DATA, 1 );
              if ( !str_cmp( word, "Affect" ) )
                {
                  paf->type     = fread_number( fp );
                }
              else
                {
                  int sn;

                  sn = skill_lookup( fread_word( fp ) );
                  if ( sn < 0 )
                    bug( "Fread_obj: unknown skill.", 0 );
                  else
                    paf->type = sn;
                }
              paf->duration     = fread_number( fp );
              pafmod            = fread_number( fp );
              paf->location     = fread_number( fp );
              paf->bitvector    = fread_number( fp );
              if ( paf->location == APPLY_WEAPONSPELL
                   ||   paf->location == APPLY_WEARSPELL
                   ||   paf->location == APPLY_REMOVESPELL )
                paf->modifier           = slot_lookup( pafmod );
              else
                paf->modifier           = pafmod;
              LINK(paf, obj->first_affect, obj->last_affect, next, prev );
              fMatch                            = TRUE;
              break;
            }
          KEY( "Actiondesc",    obj->action_desc,       fread_string_hash( fp ) );
          break;

        case 'C':
          KEY( "Cost",  obj->cost,              fread_number( fp ) );
          KEY( "Count", obj->count,             fread_number( fp ) );
          break;

        case 'D':
          KEY( "Description",   obj->description,       fread_string_hash( fp ) );
          break;

        case 'E':
          KEY( "ExtraFlags",    obj->extra_flags,       fread_number( fp ) );

          if ( !str_cmp( word, "ExtraDescr" ) )
            {
              EXTRA_DESCR_DATA *ed;

              CREATE( ed, EXTRA_DESCR_DATA, 1 );
              ed->keyword               = fread_string_hash( fp );
              ed->description           = fread_string_hash( fp );
              LINK(ed, obj->first_extradesc, obj->last_extradesc, next, prev );
              fMatch                            = TRUE;
            }

          if ( !str_cmp( word, "End" ) )
            {
              if ( !fNest || !fVnum )
                {
                  bug( "Fread_obj: incomplete object.", 0 );
                  if ( obj->name )
                    STRFREE( obj->name        );
                  if ( obj->description )
                    STRFREE( obj->description );
                  if ( obj->short_descr )
                    STRFREE( obj->short_descr );
                  DISPOSE( obj );
                  return;
                }
              else
                {
                  short wear_loc = obj->wear_loc;

                  if ( !obj->name )
                    obj->name = QUICKLINK( obj->pIndexData->name );
                  if ( !obj->description )
                    obj->description = QUICKLINK( obj->pIndexData->description );
                  if ( !obj->short_descr )
                    obj->short_descr = QUICKLINK( obj->pIndexData->short_descr );
                  if ( !obj->action_desc )
                    obj->action_desc = QUICKLINK( obj->pIndexData->action_desc );
                  LINK(obj, first_object, last_object, next, prev );
                  obj->pIndexData->count += obj->count;
                  if ( !obj->serial )
                    {
                      cur_obj_serial = UMAX((cur_obj_serial + 1 ) & (BV30-1), 1);
                      obj->serial = obj->pIndexData->serial = cur_obj_serial;
                    }
                  if ( fNest )
                    rgObjNest[iNest] = obj;
                  numobjsloaded += obj->count;
                  ++physicalobjects;
                  if ( file_ver > 1 || obj->wear_loc < -1
                       ||   obj->wear_loc >= MAX_WEAR )
                    obj->wear_loc = -1;
                  /* Corpse saving. -- Altrag */
                  if ( os_type == OS_CORPSE )
                    {
                      if ( !room )
                        {
                          bug( "Fread_obj: Corpse without room", 0);
                          room = get_room_index(ROOM_VNUM_LIMBO);
                        }
                      obj = obj_to_room( obj, room );
                    }
                  else if ( iNest == 0 || rgObjNest[iNest] == NULL )
                    {
                      int slot;
                      bool reslot = FALSE;

                      if ( file_ver > 1
                           &&   wear_loc > -1
                           &&   wear_loc < MAX_WEAR )
                        {
                          int x;

                          for ( x = 0; x < MAX_LAYERS; x++ )
                            if ( !save_equipment[wear_loc][x] )
                              {
                                save_equipment[wear_loc][x] = obj;
                                slot = x;
                                reslot = TRUE;
                                break;
                              }
                          if ( x == MAX_LAYERS )
                            bug( "Fread_obj: too many layers %d", wear_loc );
                        }
                      obj = obj_to_char( obj, ch );
                      if ( reslot )
                        save_equipment[wear_loc][slot] = obj;
                    }
                  else
                    {
                      if ( rgObjNest[iNest-1] )
                        {
                          separate_obj( rgObjNest[iNest-1] );
                          obj = obj_to_obj( obj, rgObjNest[iNest-1] );
                        }
                      else
                        bug( "Fread_obj: nest layer missing %d", iNest-1 );
                    }
                  if ( fNest )
                    rgObjNest[iNest] = obj;
                  return;
                }
            }
          break;

        case 'I':
          KEY( "ItemType",      obj->item_type,         fread_number( fp ) );
          break;

        case 'L':
          KEY( "Level", obj->level,             fread_number( fp ) );
          break;

        case 'N':
          KEY( "Name",  obj->name,              fread_string_hash( fp ) );

          if ( !str_cmp( word, "Nest" ) )
            {
              iNest = fread_number( fp );
              if ( iNest < 0 || iNest >= MAX_NEST )
                {
                  bug( "Fread_obj: bad nest %d.", iNest );
                  iNest = 0;
                  fNest = FALSE;
                }
              fMatch = TRUE;
            }
          break;

        case 'R':
          KEY( "Room", room, get_room_index(fread_number(fp)) );

        case 'S':
          KEY( "ShortDescr",    obj->short_descr,       fread_string_hash( fp ) );

          if ( !str_cmp( word, "Spell" ) )
            {
              int iValue;
              int sn;

              iValue = fread_number( fp );
              sn     = skill_lookup( fread_word( fp ) );
              if ( iValue < 0 || iValue > 5 )
                bug( "Fread_obj: bad iValue %d.", iValue );
              else if ( sn < 0 )
                bug( "Fread_obj: unknown skill.", 0 );
              else
                obj->value[iValue] = sn;
              fMatch = TRUE;
              break;
            }

          break;

        case 'T':
          KEY( "Timer", obj->timer,             fread_number( fp ) );
          break;

        case 'V':
          if ( !str_cmp( word, "Values" ) )
            {
              int x1,x2,x3,x4,x5,x6;
              char *ln = fread_line( fp );

              x1=x2=x3=x4=x5=x6=0;
              sscanf( ln, "%d %d %d %d %d %d", &x1, &x2, &x3, &x4, &x5, &x6 );
              /* clean up some garbage */
              /*                if ( file_ver < 3 )
				x5=x6=0; */

              obj->value[0]     = x1;
              obj->value[1]     = x2;
              obj->value[2]     = x3;
              obj->value[3]     = x4;
              obj->value[4]     = x5;
              obj->value[5]     = x6;
              fMatch            = TRUE;
              break;
            }

          if ( !str_cmp( word, "Vnum" ) )
            {
              int vnum;

              vnum = fread_number( fp );
              if ( ( obj->pIndexData = get_obj_index( vnum ) ) == NULL )
                {
                  fVnum = FALSE;
                  bug( "Fread_obj: bad vnum %d.", vnum );
                }
              else
                {
                  fVnum = TRUE;
                  obj->cost = obj->pIndexData->cost;
                  obj->weight = obj->pIndexData->weight;
                  obj->item_type = obj->pIndexData->item_type;
                  obj->wear_flags = obj->pIndexData->wear_flags;
                  obj->extra_flags = obj->pIndexData->extra_flags;
                }
              fMatch = TRUE;
              break;
            }
          break;

        case 'W':
          KEY( "WearFlags",     obj->wear_flags,        fread_number( fp ) );
          KEY( "WearLoc",       obj->wear_loc,          fread_number( fp ) );
          KEY( "Weight",        obj->weight,            fread_number( fp ) );
          break;

        }

      if ( !fMatch )
        {
          EXTRA_DESCR_DATA *ed;
          AFFECT_DATA *paf;

          bug( "Fread_obj: no match.", 0 );
          bug( word, 0 );
          fread_to_eol( fp );
          if ( obj->name )
            STRFREE( obj->name        );
          if ( obj->description )
            STRFREE( obj->description );
          if ( obj->short_descr )
            STRFREE( obj->short_descr );
          while ( (ed=obj->first_extradesc) != NULL )
            {
              STRFREE( ed->keyword );
              STRFREE( ed->description );
              UNLINK( ed, obj->first_extradesc, obj->last_extradesc, next, prev );
              DISPOSE( ed );
            }
          while ( (paf=obj->first_affect) != NULL )
            {
              UNLINK( paf, obj->first_affect, obj->last_affect, next, prev );
              DISPOSE( paf );
            }
          DISPOSE( obj );
          return;
        }
    }
}

void set_alarm( long seconds )
{
  alarm( seconds );
}

void write_corpses( Character *ch, char *name )
{
  OBJ_DATA *corpse;
  FILE *fp = NULL;

  /* Name and ch support so that we dont have to have a char to save their
     corpses.. (ie: decayed corpses while offline) */
  if ( ch && is_npc(ch) )
    {
      bug( "Write_corpses: writing NPC corpse.", 0 );
      return;
    }
  if ( ch )
    name = ch->name;
  /* Go by vnum, less chance of screwups. -- Altrag */
  for ( corpse = first_object; corpse; corpse = corpse->next )
    if ( corpse->pIndexData->vnum == OBJ_VNUM_CORPSE_PC &&
         corpse->in_room != NULL && corpse->value[1] != 1 &&
         !str_cmp(corpse->short_descr+14, name) )
      {
        if ( !fp )
          {
            char buf[127];

            sprintf(buf, "%s%s", CORPSE_DIR, capitalize(name));
            if ( !(fp = fopen(buf, "w")) )
              {
                bug( "Write_corpses: Cannot open file.", 0 );
                perror(buf);
                return;
              }
          }
        fwrite_obj(ch, corpse, fp, 0, OS_CORPSE);
      }
  if ( fp )
    {
      fprintf(fp, "#END\n\n");
      fclose(fp);
    }
  else
    {
      char buf[127];

      sprintf(buf, "%s%s", CORPSE_DIR, capitalize(name));
      remove(buf);
    }
  return;
}

void load_corpses( void )
{
  DIR *dp;
  struct dirent *de;

  if ( !(dp = opendir(CORPSE_DIR)) )
    {
      bug( "Load_corpses: can't open CORPSE_DIR", 0);
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
              char letter;
              char *word;

              letter = fread_letter( fpArea );
              if ( letter == '*' )
                {
                  fread_to_eol(fpArea);
                  continue;
                }
              if ( letter != '#' )
                {
                  bug( "Load_corpses: # not found.", 0 );
                  break;
                }
              word = fread_word( fpArea );
              if ( !str_cmp(word, "CORPSE" ) )
                fread_obj( NULL, fpArea, OS_CORPSE );
              else if ( !str_cmp(word, "OBJECT" ) )
                fread_obj( NULL, fpArea, OS_CARRY );
              else if ( !str_cmp( word, "END" ) )
                break;
              else
                {
                  bug( "Load_corpses: bad section.", 0 );
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
  return;
}

void load_storerooms( void )
{
  DIR *dp;
  struct dirent *de;
  char buf[MAX_INPUT_LENGTH];

  if ( !(dp = opendir(STOREROOM_DIR)) )
    {
      bug( "Load_storeroom: can't open STOREROOM_DIR", 0);
      perror(STOREROOM_DIR);
      return;
    }

  falling = 1;
  while ( (de = readdir(dp)) != NULL )
    {
      if ( de->d_name[0] != '.' )
        {
          int iNest;
          OBJ_DATA *tobj, *tobj_next;
          ROOM_INDEX_DATA *storeroom;

          sprintf(strArea, "%s%s", STOREROOM_DIR, de->d_name );
          fprintf(stderr, "STOREROOM -> %s\n", strArea);
          if ( !(fpArea = fopen(strArea, "r")) )
            {
              perror(strArea);
              continue;
            }

          storeroom = get_room_index(atoi(de->d_name));
          if( !storeroom )
            {
              fpArea = NULL;
              strcpy(strArea, "$");
              closedir(dp);
              falling = 0;
              return;
            }

          if ( !IS_SET( storeroom->room_flags, ROOM_CLANSTOREROOM ) )
            {
              sprintf( buf, "%s%d", STOREROOM_DIR, storeroom->vnum );
              remove( buf );
            }


          rset_supermob(storeroom);
          for ( iNest = 0; iNest < MAX_NEST; iNest++ )
            rgObjNest[iNest] = NULL;

          for ( ; ; )
            {
              char letter;
              char *word;

              letter = fread_letter( fpArea );
              if ( letter == '*' )
                {
                  fread_to_eol( fpArea );
                  continue;
                }

              if ( letter != '#' )
                {
                  bug( "load_storerooms: # not found.", 0 );
                  bug( de->d_name, 0 );
                  break;
                }

              word = fread_word( fpArea );
              if ( !str_cmp( word, "OBJECT" ) ) /* Objects      */
                fread_obj  ( supermob, fpArea, OS_CARRY );
              else
                if ( !str_cmp( word, "END"    ) )       /* Done         */
                  break;
                else
                  {
                    bug( "load_storerooms: bad section.", 0 );
                    bug( de->d_name, 0 );
                    break;
                  }
            }

          fclose( fpArea );

          for ( tobj = supermob->first_carrying; tobj; tobj = tobj_next )
            {
              tobj_next = tobj->next_content;
              obj_from_char( tobj );
              if( tobj->item_type != ITEM_MONEY )
                obj_to_room( tobj, storeroom );
            }

          release_supermob();

        }
    }

  fpArea = NULL;
  strcpy(strArea, "$");
  closedir(dp);
  falling = 0;
  return;
}

void save_storeroom( ROOM_INDEX_DATA *room )
{
  char strsave[MAX_INPUT_LENGTH];
  FILE *fp;
  OBJ_DATA *contents;

  if ( !room )
    {
      bug( "save_storeroom: null ch!", 0 );
      return;
    }

  sprintf( strsave, "%s%d",STOREROOM_DIR, room->vnum );

  if ( ( fp = fopen( strsave, "w" ) ) == NULL )
    {
      perror( strsave );
      bug( "Save_storeroom: fopen", 0 );
      bug( strsave, 0 );

    }
  else
    {
      fchmod(fileno(fp), S_IRUSR|S_IWUSR | S_IRGRP|S_IWGRP | S_IROTH|S_IWOTH);

      contents = room->last_content;
      if (contents)
        fwrite_obj(NULL, contents, fp, 0, OS_CARRY );
      fprintf( fp, "#END\n" );
      fclose( fp );

    }

  return;
}


void load_vendors( void )
{
  DIR *dp;
  Character *mob;
  struct dirent *de;

  if ( !(dp = opendir(VENDOR_DIR)) )
    {
      bug( "Load_vendors: can't open VENDOR_DIR", 0);
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
              char letter;
              char *word;

              letter = fread_letter( fpArea );
              if ( letter == '*' )
                {
                  fread_to_eol(fpArea);
                  continue;
                }
              if ( letter != '#' )
                {
                  bug( "Load_vendor: # not found.", 0 );
                  break;
                }
              word = fread_word( fpArea );
              if ( !str_cmp(word, "VENDOR" ) )
                mob = fread_vendor( fpArea );
              else if ( !str_cmp(word, "OBJECT" ) )
                fread_obj( mob, fpArea, OS_CARRY );
              else if ( !str_cmp( word, "END" ) )
                break;
            }
          fclose(fpArea);
        }
    }
  fpArea = NULL;
  strcpy(strArea, "$");
  closedir(dp);
  falling = 0;
  return;
}
/*
 * This will write one mobile structure pointed to be fp --Shaddai
 */
void fwrite_mobile( FILE *fp, Character *mob )
{
  if ( !is_npc( mob ) || !fp )
    return;
  fprintf( fp, "#MOBILE\n" );
  fprintf( fp, "Vnum    %d\n", mob->pIndexData->vnum );
  if ( mob->in_room )
    fprintf( fp, "Room  %d\n",
             (  mob->in_room == get_room_index( ROOM_VNUM_LIMBO )
                && mob->was_in_room )
             ? mob->was_in_room->vnum
             : mob->in_room->vnum );
  if ( QUICKMATCH( mob->name, mob->pIndexData->player_name) == 0 )
    fprintf( fp, "Name     %s~\n", mob->name );
  if ( QUICKMATCH( mob->short_descr, mob->pIndexData->short_descr) == 0 )
    fprintf( fp, "Short %s~\n", mob->short_descr );
  if ( QUICKMATCH( mob->long_descr, mob->pIndexData->long_descr) == 0 )
    fprintf( fp, "Long  %s~\n", mob->long_descr );
  if ( QUICKMATCH( mob->description, mob->pIndexData->description) == 0 )
    fprintf( fp, "Description %s~\n", mob->description );
  fprintf( fp, "Position %d\n", mob->position );
  fprintf( fp, "Flags %d\n", mob->act );
  /* Might need these later --Shaddai
     de_equip_char( mob );
     re_equip_char( mob );
  */
  if ( mob->first_carrying )
    fwrite_obj( mob, mob->last_carrying, fp, 0, OS_CARRY );
  fprintf( fp, "EndMobile\n" );
  return;
}

/*
 * This will read one mobile structure pointer to by fp --Shaddai
 */
Character *  fread_mobile( FILE *fp )
{
  Character *mob = NULL;
  const char *word;
  bool fMatch;
  int inroom = 0;
  ROOM_INDEX_DATA *pRoomIndex = NULL;

  word   = feof( fp ) ? "EndMobile" : fread_word( fp );
  if ( !str_cmp(word, "Vnum") )
    {
      int vnum;

      vnum = fread_number( fp );
      mob = create_mobile( get_mob_index(vnum) );
      if ( !mob )
        {
          for ( ; ; ) {
            word   = feof( fp ) ? "EndMobile" : fread_word( fp );
            /* So we don't get so many bug messages when something messes up
             * --Shaddai
             */
            if ( !str_cmp( word, "EndMobile" ) )
              break;
          }
          bug("Fread_mobile: No index data for vnum %d", vnum );
          return NULL;
        }
    }
  else
    {
      for ( ; ; ) {
        word   = feof( fp ) ? "EndMobile" : fread_word( fp );
        /* So we don't get so many bug messages when something messes up
         * --Shaddai
         */
        if ( !str_cmp( word, "EndMobile" ) )
          break;
      }
      extract_char(mob, TRUE);
      bug("Fread_mobile: Vnum not found", 0 );
      return NULL;
    }
  for ( ; ;) {
    word   = feof( fp ) ? "EndMobile" : fread_word( fp );
    fMatch = FALSE;
    switch ( UPPER(word[0]) ) {
    case '*':
      fMatch = TRUE;
      fread_to_eol( fp );
      break;
    case '#':
      if ( !str_cmp( word, "#OBJECT" ) )
        fread_obj ( mob, fp, OS_CARRY );
    case 'D':
      KEY( "Description", mob->description, fread_string_hash(fp));
      break;
    case 'E':
      if ( !str_cmp( word, "EndMobile" ) )
        {
          if ( inroom == 0 )
            inroom = ROOM_VNUM_TEMPLE;
          pRoomIndex = get_room_index( inroom );
          if ( !pRoomIndex )
            pRoomIndex = get_room_index( ROOM_VNUM_TEMPLE );
          char_to_room(mob, pRoomIndex);
          return mob;
        }
      break;
    case 'F':
      KEY( "Flags", mob->act, fread_number( fp ));
    case 'L':
      KEY( "Long", mob->long_descr, fread_string_hash(fp ) );
      break;
    case 'N':
      KEY( "Name", mob->name, fread_string_hash( fp ) );
      break;
    case 'P':
      KEY( "Position", mob->position, fread_number( fp ) );
      break;
    case 'R':
      KEY( "Room",  inroom, fread_number(fp));
      break;
    case 'S':
      KEY( "Short", mob->short_descr, fread_string_hash(fp));
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


/*
 * This will write in the saved mobile for a char --Shaddai
 */
void write_char_mobile( Character *ch , char *argument )
{
  FILE *fp;
  Character *mob;
  char buf[MAX_STRING_LENGTH];

  if ( is_npc( ch ) || !ch->pcdata->pet )
    return;

  if ( (fp = fopen( argument, "w")) == NULL )
    {
      sprintf(buf, "Write_char_mobile: couldn't open %s for writing!\r\n",
              argument );
      bug(buf, 0 );
      return;
    }

  mob = ch->pcdata->pet;
  REMOVE_BIT( mob->affected_by, AFF_CHARM );
  fwrite_mobile( fp, mob );
  fclose( fp );
}

/*
 * This will read in the saved mobile for a char --Shaddai
 */
void read_char_mobile( char *argument )
{
  FILE *fp;
  char buf[MAX_STRING_LENGTH];

  if ( (fp = fopen( argument, "r")) == NULL )
    {
      sprintf(buf, "Read_char_mobile: couldn't open %s for reading!\r\n",
              argument );
      bug(buf, 0 );
      return;
    }

  fclose( fp );
}
