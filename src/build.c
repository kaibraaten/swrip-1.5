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
 *                     Online Building and Editing Module                   *
 ****************************************************************************/

#include <string.h>
#include <ctype.h>
#include "mud.h"
#include "character.h"
#include "editor.h"

bool can_rmodify( const Character *ch, const ROOM_INDEX_DATA *room )
{
  short vnum = room->vnum;
  AREA_DATA *pArea;

  if ( is_npc( ch ) )
    return FALSE;

  if ( get_trust( ch ) >= sysdata.level_modify_proto )
    return TRUE;

  if ( !ch->pcdata || !(pArea=ch->pcdata->area) )
    {
      send_to_char( "You must have an assigned area to modify this room.\r\n", ch );
      return FALSE;
    }

  if ( vnum >= pArea->low_r_vnum && vnum <= pArea->hi_r_vnum )
    return TRUE;

  send_to_char( "That room is not in your allocated range.\r\n", ch );
  return FALSE;
}

bool can_omodify( const Character *ch, const OBJ_DATA *obj )
{
  short vnum = obj->pIndexData->vnum;
  AREA_DATA *pArea;

  if ( is_npc( ch ) )
    return FALSE;

  if ( get_trust( ch ) >= sysdata.level_modify_proto )
    return TRUE;

  if ( !ch->pcdata || !(pArea=ch->pcdata->area) )
    {
      send_to_char( "You must have an assigned area to modify this object.\r\n", ch );
      return FALSE;
    }

  if ( vnum >= pArea->low_o_vnum && vnum <= pArea->hi_o_vnum )
    return TRUE;

  send_to_char( "That object is not in your allocated range.\r\n", ch );
  return FALSE;
}

bool can_oedit( const Character *ch, const OBJ_INDEX_DATA *obj )
{
  short vnum = obj->vnum;
  AREA_DATA *pArea;

  if ( is_npc( ch ) )
    return FALSE;

  if ( get_trust( ch ) >= LEVEL_GOD )
    return TRUE;

  if ( !ch->pcdata || !(pArea=ch->pcdata->area) )
    {
      send_to_char( "You must have an assigned area to modify this object.\r\n", ch );
      return FALSE;
    }

  if ( vnum >= pArea->low_o_vnum
       &&   vnum <= pArea->hi_o_vnum )
    return TRUE;

  send_to_char( "That object is not in your allocated range.\r\n", ch );
  return FALSE;
}

bool can_mmodify( const Character *ch, const Character *mob )
{
  short vnum;
  AREA_DATA *pArea;

  if ( mob == ch )
    return TRUE;

  if ( !is_npc( mob ) )
    {
      if ( get_trust( ch ) >= sysdata.level_modify_proto && get_trust(ch) >
           get_trust( mob ) )
        return TRUE;
      else
        send_to_char( "You can't do that.\r\n", ch );
      return FALSE;
    }

  vnum = mob->pIndexData->vnum;

  if ( is_npc( ch ) )
    return FALSE;
  if ( get_trust( ch ) >= sysdata.level_modify_proto )
    return TRUE;
  if ( !ch->pcdata || !(pArea=ch->pcdata->area) )
    {
      send_to_char( "You must have an assigned area to modify this mobile.\r\n", ch );
      return FALSE;
    }
  if ( vnum >= pArea->low_m_vnum
       &&   vnum <= pArea->hi_m_vnum )
    return TRUE;

  send_to_char( "That mobile is not in your allocated range.\r\n", ch );
  return FALSE;
}

bool can_medit( const Character *ch, const MOB_INDEX_DATA *mob )
{
  short vnum = mob->vnum;
  AREA_DATA *pArea;

  if ( is_npc( ch ) )
    return FALSE;
  if ( get_trust( ch ) >= LEVEL_GOD )
    return TRUE;
  if ( !ch->pcdata || !(pArea=ch->pcdata->area) )
    {
      send_to_char( "You must have an assigned area to modify this mobile.\r\n", ch );
      return FALSE;
    }
  if ( vnum >= pArea->low_m_vnum
       &&   vnum <= pArea->hi_m_vnum )
    return TRUE;

  send_to_char( "That mobile is not in your allocated range.\r\n", ch );
  return FALSE;
}

void free_reset( AREA_DATA *are, RESET_DATA *res )
{
  UNLINK( res, are->first_reset, are->last_reset, next, prev );
  DISPOSE( res );
}

void free_area( AREA_DATA *are )
{
  DISPOSE( are->name );
  DISPOSE( are->filename );
  while ( are->first_reset )
    free_reset( are, are->first_reset );
  DISPOSE( are );
  are = NULL;
}

void assign_area( Character *ch )
{
  char buf[MAX_STRING_LENGTH];
  char buf2[MAX_STRING_LENGTH];
  char taf[1024];
  AREA_DATA *tarea, *tmp;
  bool created = FALSE;

  if ( is_npc( ch ) )
    return;
  if ( get_trust( ch ) >= LEVEL_AVATAR
       &&   ch->pcdata->r_range_lo
       &&   ch->pcdata->r_range_hi )
    {
      tarea = ch->pcdata->area;
      sprintf( taf, "%s.are", capitalize( ch->name ) );
      if ( !tarea )
        {
          for ( tmp = first_build; tmp; tmp = tmp->next )
            if ( !str_cmp( taf, tmp->filename ) )
              {
                tarea = tmp;
                break;
              }
        }
      if ( !tarea )
        {
          sprintf( buf, "Creating area entry for %s", ch->name );
          log_string_plus( buf, LOG_NORMAL, ch->top_level );
          CREATE( tarea, AREA_DATA, 1 );
          LINK( tarea, first_build, last_build, next, prev );
          tarea->first_reset    = NULL;
          tarea->last_reset     = NULL;
          sprintf( buf, "{PROTO} %s's area in progress", ch->name );
          tarea->name           = str_dup( buf );
          tarea->filename       = str_dup( taf );
          sprintf( buf2, "%s", ch->name );
          tarea->author         = STRALLOC( buf2 );
          tarea->age            = 0;
          tarea->nplayer        = 0;
          SET_BIT( tarea->flags, AFLAG_NOQUEST );

          created = TRUE;
        }
      else
        {
          sprintf( buf, "Updating area entry for %s", ch->name );
          log_string_plus( buf, LOG_NORMAL, ch->top_level );
        }
      tarea->low_r_vnum = ch->pcdata->r_range_lo;
      tarea->low_o_vnum = ch->pcdata->o_range_lo;
      tarea->low_m_vnum = ch->pcdata->m_range_lo;
      tarea->hi_r_vnum  = ch->pcdata->r_range_hi;
      tarea->hi_o_vnum  = ch->pcdata->o_range_hi;
      tarea->hi_m_vnum  = ch->pcdata->m_range_hi;
      ch->pcdata->area  = tarea;
      if ( created )
        sort_area( tarea, TRUE );
    }
}

EXTRA_DESCR_DATA *SetRExtra( ROOM_INDEX_DATA *room, char *keywords )
{
  EXTRA_DESCR_DATA *ed;

  for ( ed = room->first_extradesc; ed; ed = ed->next )
    {
      if ( is_name( keywords, ed->keyword ) )
        break;
    }
  if ( !ed )
    {
      CREATE( ed, EXTRA_DESCR_DATA, 1 );
      LINK( ed, room->first_extradesc, room->last_extradesc, next, prev );
      ed->keyword       = STRALLOC( keywords );
      ed->description   = STRALLOC( "" );
      top_ed++;
    }
  return ed;
}

bool DelRExtra( ROOM_INDEX_DATA *room, char *keywords )
{
  EXTRA_DESCR_DATA *rmed;

  for ( rmed = room->first_extradesc; rmed; rmed = rmed->next )
    {
      if ( is_name( keywords, rmed->keyword ) )
        break;
    }
  if ( !rmed )
    return FALSE;
  UNLINK( rmed, room->first_extradesc, room->last_extradesc, next, prev );
  STRFREE( rmed->keyword );
  STRFREE( rmed->description );
  DISPOSE( rmed );
  top_ed--;
  return TRUE;
}

EXTRA_DESCR_DATA *SetOExtra( OBJ_DATA *obj, char *keywords )
{
  EXTRA_DESCR_DATA *ed;

  for ( ed = obj->first_extradesc; ed; ed = ed->next )
    {
      if ( is_name( keywords, ed->keyword ) )
        break;
    }
  if ( !ed )
    {
      CREATE( ed, EXTRA_DESCR_DATA, 1 );
      LINK( ed, obj->first_extradesc, obj->last_extradesc, next, prev );
      ed->keyword       = STRALLOC( keywords );
      ed->description   = STRALLOC( "" );
      top_ed++;
    }
  return ed;
}

bool DelOExtra( OBJ_DATA *obj, char *keywords )
{
  EXTRA_DESCR_DATA *rmed;

  for ( rmed = obj->first_extradesc; rmed; rmed = rmed->next )
    {
      if ( is_name( keywords, rmed->keyword ) )
        break;
    }
  if ( !rmed )
    return FALSE;
  UNLINK( rmed, obj->first_extradesc, obj->last_extradesc, next, prev );
  STRFREE( rmed->keyword );
  STRFREE( rmed->description );
  DISPOSE( rmed );
  top_ed--;
  return TRUE;
}

EXTRA_DESCR_DATA *SetOExtraProto( OBJ_INDEX_DATA *obj, char *keywords )
{
  EXTRA_DESCR_DATA *ed;

  for ( ed = obj->first_extradesc; ed; ed = ed->next )
    {
      if ( is_name( keywords, ed->keyword ) )
        break;
    }
  if ( !ed )
    {
      CREATE( ed, EXTRA_DESCR_DATA, 1 );
      LINK( ed, obj->first_extradesc, obj->last_extradesc, next, prev );
      ed->keyword       = STRALLOC( keywords );
      ed->description   = STRALLOC( "" );
      top_ed++;
    }
  return ed;
}

bool DelOExtraProto( OBJ_INDEX_DATA *obj, char *keywords )
{
  EXTRA_DESCR_DATA *rmed;

  for ( rmed = obj->first_extradesc; rmed; rmed = rmed->next )
    {
      if ( is_name( keywords, rmed->keyword ) )
        break;
    }
  if ( !rmed )
    return FALSE;
  UNLINK( rmed, obj->first_extradesc, obj->last_extradesc, next, prev );
  STRFREE( rmed->keyword );
  STRFREE( rmed->description );
  DISPOSE( rmed );
  top_ed--;
  return TRUE;
}

void fold_area( AREA_DATA *tarea, char *filename, bool install )
{
  RESET_DATA            *treset;
  ROOM_INDEX_DATA       *room;
  MOB_INDEX_DATA        *pMobIndex;
  OBJ_INDEX_DATA        *pObjIndex;
  MPROG_DATA            *mprog;
  EXIT_DATA             *xit;
  EXTRA_DESCR_DATA      *ed;
  Affect           *paf;
  SHOP_DATA             *pShop;
  REPAIR_DATA           *pRepair;
  char           buf[MAX_STRING_LENGTH];
  FILE          *fpout;
  int                    vnum;
  int                    val0, val1, val2, val3, val4, val5;
  bool           complexmob;
  char backup[MAX_STRING_LENGTH];

  sprintf( buf, "Saving %s...", tarea->filename );
  log_string_plus( buf, LOG_NORMAL, LEVEL_GREATER );

  /*sprintf( buf, "%s.bak", filename );
    rename( filename, buf );*/
  sprintf( buf, "%s%s", AREA_DIR, filename );
  sprintf( backup, "%s%s.bak", AREA_DIR, filename );
  rename( buf, backup );

  if ( ( fpout = fopen( buf, "w" ) ) == NULL )
    {
      bug( "fold_area: fopen", 0 );
      perror( filename );
      return;
    }

  fprintf( fpout, "#AREA   %s~\n\n\n\n", tarea->name );

  fprintf( fpout, "#AUTHOR %s~\n\n", tarea->author );
  fprintf( fpout, "#RANGES\n");
  fprintf( fpout, "%d %d %d %d\n", tarea->low_soft_range,
           tarea->hi_soft_range,
           tarea->low_hard_range,
           tarea->hi_hard_range );
  fprintf( fpout, "$\n\n");
  if ( tarea->resetmsg )        /* Rennard */
    fprintf( fpout, "#RESETMSG %s~\n\n", tarea->resetmsg );
  if ( tarea->reset_frequency )
    fprintf( fpout, "#FLAGS\n%d %d\n\n",
             tarea->flags, tarea->reset_frequency );
  else
    fprintf( fpout, "#FLAGS\n%d\n\n", tarea->flags );

  fprintf( fpout, "#ECONOMY %d %d\n\n", tarea->high_economy, tarea->low_economy );

  /* save mobiles */
  fprintf( fpout, "#MOBILES\n" );
  for ( vnum = tarea->low_m_vnum; vnum <= tarea->hi_m_vnum; vnum++ )
    {
      if ( (pMobIndex = get_mob_index( vnum )) == NULL )
        continue;
      if ( install )
        REMOVE_BIT( pMobIndex->act, ACT_PROTOTYPE );
      if ( pMobIndex->stats.perm_str != 13    ||   pMobIndex->stats.perm_int   != 13
           ||   pMobIndex->stats.perm_wis != 13       ||   pMobIndex->stats.perm_dex   != 13
           ||   pMobIndex->stats.perm_con != 13       ||   pMobIndex->stats.perm_cha   != 13
           ||   pMobIndex->stats.perm_lck != 13
           ||   pMobIndex->hitroll  != 0        ||   pMobIndex->damroll    != 0
           ||   pMobIndex->race  != 0
           ||   pMobIndex->attacks       != 0   ||   pMobIndex->defenses   != 0
           ||   pMobIndex->height        != 0   ||   pMobIndex->weight     != 0
           ||   pMobIndex->speaks        != 0   ||   pMobIndex->speaking   != 0
           ||   pMobIndex->xflags        != 0   ||   pMobIndex->numattacks != 0
           ||   pMobIndex->vip_flags !=0 )
        complexmob = TRUE;
      else
        complexmob = FALSE;
      fprintf( fpout, "#%d\n",  vnum                            );
      fprintf( fpout, "%s~\n",  pMobIndex->player_name          );
      fprintf( fpout,   "%s~\n",        pMobIndex->short_descr          );
      fprintf( fpout,   "%s~\n",        strip_cr(pMobIndex->long_descr) );
      fprintf( fpout, "%s~\n",  strip_cr(pMobIndex->description));
      fprintf( fpout, "%d %d %d %c\n",pMobIndex->act,
               pMobIndex->affected_by,
               pMobIndex->alignment,
               complexmob ? 'Z' : 'S'           );
      /* C changed to Z for swreality vip_flags  */

      fprintf( fpout, "%d %d %d ",      pMobIndex->level,
               pMobIndex->mobthac0,
               pMobIndex->ac                    );
      fprintf( fpout, "%dd%d+%d ",      pMobIndex->hitnodice,
               pMobIndex->hitsizedice,
               pMobIndex->hitplus               );
      fprintf( fpout, "%dd%d+%d\n",     pMobIndex->damnodice,
               pMobIndex->damsizedice,
               pMobIndex->damplus               );
      fprintf( fpout, "%d 0\n", pMobIndex->gold                 );
      fprintf( fpout, "%d %d %d\n",     pMobIndex->position,
               pMobIndex->defposition,
               pMobIndex->sex                   );
      if ( complexmob )
        {
          fprintf( fpout, "%d %d %d %d %d %d %d\n",
                   pMobIndex->stats.perm_str,
                   pMobIndex->stats.perm_int,
                   pMobIndex->stats.perm_wis,
                   pMobIndex->stats.perm_dex,
                   pMobIndex->stats.perm_con,
                   pMobIndex->stats.perm_cha,
                   pMobIndex->stats.perm_lck );
          fprintf( fpout, "%d %d %d %d %d\n",
                   pMobIndex->saving.poison_death,
                   pMobIndex->saving.wand,
                   pMobIndex->saving.para_petri,
                   pMobIndex->saving.breath,
                   pMobIndex->saving.spell_staff );
          fprintf( fpout, "%d 0 %d %d %d %d %d\n",
                   pMobIndex->race,
                   pMobIndex->height,
                   pMobIndex->weight,
                   pMobIndex->speaks,
                   pMobIndex->speaking,
                   pMobIndex->numattacks );
          fprintf( fpout, "%d %d %d %d %d %d %d %d\n",
                   pMobIndex->hitroll,
                   pMobIndex->damroll,
                   pMobIndex->xflags,
                   pMobIndex->resistant,
                   pMobIndex->immune,
                   pMobIndex->susceptible,
                   pMobIndex->attacks,
                   pMobIndex->defenses );
          fprintf( fpout, "%d 0 0 0 0 0 0 0\n",
                   pMobIndex->vip_flags );
        }
      if ( pMobIndex->mprog.mudprogs )
        {
          for ( mprog = pMobIndex->mprog.mudprogs; mprog; mprog = mprog->next )
            fprintf( fpout, "> %s %s~\n%s~\n",
                     mprog_type_to_name( mprog->type ),
                     mprog->arglist, strip_cr(mprog->comlist) );
          fprintf( fpout, "|\n" );
        }
    }
  fprintf( fpout, "#0\n\n\n" );
  if ( install && vnum < tarea->hi_m_vnum )
    tarea->hi_m_vnum = vnum - 1;

  /* save objects */
  fprintf( fpout, "#OBJECTS\n" );
  for ( vnum = tarea->low_o_vnum; vnum <= tarea->hi_o_vnum; vnum++ )
    {
      if ( (pObjIndex = get_obj_index( vnum )) == NULL )
        continue;
      if ( install )
        REMOVE_BIT( pObjIndex->extra_flags, ITEM_PROTOTYPE );
      fprintf( fpout, "#%d\n",  vnum                            );
      fprintf( fpout, "%s~\n",  pObjIndex->name                 );
      fprintf( fpout, "%s~\n",  pObjIndex->short_descr          );
      fprintf( fpout, "%s~\n",  pObjIndex->description          );
      fprintf( fpout, "%s~\n",  pObjIndex->action_desc          );
      if ( pObjIndex->layers )
        fprintf( fpout, "%d %d %d %d\n",        pObjIndex->item_type,
                 pObjIndex->extra_flags,
                 pObjIndex->wear_flags,
                 pObjIndex->layers      );
      else
        fprintf( fpout, "%d %d %d\n",   pObjIndex->item_type,
                 pObjIndex->extra_flags,
                 pObjIndex->wear_flags          );

      val0 = pObjIndex->value[0];
      val1 = pObjIndex->value[1];
      val2 = pObjIndex->value[2];
      val3 = pObjIndex->value[3];
      val4 = pObjIndex->value[4];
      val5 = pObjIndex->value[5];
      switch ( pObjIndex->item_type )
        {
        case ITEM_PILL:
        case ITEM_POTION:
        case ITEM_SCROLL:
          if ( IS_VALID_SN(val1) ) val1 = skill_table[val1]->slot;
          if ( IS_VALID_SN(val2) ) val2 = skill_table[val2]->slot;
          if ( IS_VALID_SN(val3) ) val3 = skill_table[val3]->slot;
          break;
        case ITEM_DEVICE:
          if ( IS_VALID_SN(val3) ) val3 = skill_table[val3]->slot;
          break;
        case ITEM_SALVE:
          if ( IS_VALID_SN(val4) ) val4 = skill_table[val4]->slot;
          if ( IS_VALID_SN(val5) ) val5 = skill_table[val5]->slot;
          break;
        }
      if ( val4 || val5 )
        fprintf( fpout, "%d %d %d %d %d %d\n",val0,
                 val1,
                 val2,
                 val3,
                 val4,
                 val5 );
      else
        fprintf( fpout, "%d %d %d %d\n",        val0,
                 val1,
                 val2,
                 val3 );

      fprintf( fpout, "%d %d %d\n",     pObjIndex->weight,
               pObjIndex->cost,
               pObjIndex->rent ? pObjIndex->rent :
               (int) (pObjIndex->cost / 10)             );

      for ( ed = pObjIndex->first_extradesc; ed; ed = ed->next )
        fprintf( fpout, "E\n%s~\n%s~\n",
                 ed->keyword, strip_cr( ed->description )       );

      for ( paf = pObjIndex->first_affect; paf; paf = paf->next )
        fprintf( fpout, "A\n%d %d\n", paf->location,
                 ((paf->location == APPLY_WEAPONSPELL
                   || paf->location == APPLY_WEARSPELL
                   || paf->location == APPLY_REMOVESPELL
                   || paf->location == APPLY_STRIPSN)
                  && IS_VALID_SN(paf->modifier))
                 ? skill_table[paf->modifier]->slot : paf->modifier             );

      if ( pObjIndex->mprog.mudprogs )
        {
          for ( mprog = pObjIndex->mprog.mudprogs; mprog; mprog = mprog->next )
            fprintf( fpout, "> %s %s~\n%s~\n",
                     mprog_type_to_name( mprog->type ),
                     mprog->arglist, strip_cr(mprog->comlist) );
          fprintf( fpout, "|\n" );
        }
    }
  fprintf( fpout, "#0\n\n\n" );
  if ( install && vnum < tarea->hi_o_vnum )
    tarea->hi_o_vnum = vnum - 1;

  /* save rooms   */
  fprintf( fpout, "#ROOMS\n" );
  for ( vnum = tarea->low_r_vnum; vnum <= tarea->hi_r_vnum; vnum++ )
    {
      if ( (room = get_room_index( vnum )) == NULL )
        continue;
      if ( install )
        {
          Character *victim, *vnext;
          OBJ_DATA  *obj, *obj_next;

          /* remove prototype flag from room */
          REMOVE_BIT( room->room_flags, ROOM_PROTOTYPE );
          /* purge room of (prototyped) mobiles */
          for ( victim = room->first_person; victim; victim = vnext )
            {
              vnext = victim->next_in_room;
              if ( is_npc(victim) )
                extract_char( victim, TRUE );
            }
          /* purge room of (prototyped) objects */
          for ( obj = room->first_content; obj; obj = obj_next )
            {
              obj_next = obj->next_content;
              extract_obj( obj );
            }
        }
      fprintf( fpout, "#%d\n",  vnum                            );
      fprintf( fpout, "%s~\n",  room->name                      );
      fprintf( fpout, "%s~\n",  strip_cr( room->description )   );
      if ( (room->tele_delay > 0 && room->tele_vnum > 0) || room->tunnel > 0 )
        fprintf( fpout, "0 %d %d %d %d %d\n",   room->room_flags,
                 room->sector_type,
                 room->tele_delay,
                 room->tele_vnum,
                 room->tunnel           );
      else
        fprintf( fpout, "0 %d %d\n",    room->room_flags,
                 room->sector_type      );
      for ( xit = room->first_exit; xit; xit = xit->next )
        {
          if ( IS_SET(xit->exit_info, EX_PORTAL) ) /* don't fold portals */
            continue;
          fprintf( fpout, "D%d\n",              xit->vdir );
          fprintf( fpout, "%s~\n",              strip_cr( xit->description ) );
          fprintf( fpout, "%s~\n",              strip_cr( xit->keyword ) );
          if ( xit->distance > 1 )
            fprintf( fpout, "%d %d %d %d\n",    xit->exit_info & ~EX_BASHED,
                     xit->key,
                     xit->vnum,
                     xit->distance );
          else
            fprintf( fpout, "%d %d %d\n",       xit->exit_info & ~EX_BASHED,
                     xit->key,
                     xit->vnum );
        }
      for ( ed = room->first_extradesc; ed; ed = ed->next )
        fprintf( fpout, "E\n%s~\n%s~\n",
                 ed->keyword, strip_cr( ed->description ));

      if ( room->mprog.mudprogs )
        {
          for ( mprog = room->mprog.mudprogs; mprog; mprog = mprog->next )
            fprintf( fpout, "> %s %s~\n%s~\n",
                     mprog_type_to_name( mprog->type ),
                     mprog->arglist, strip_cr(mprog->comlist) );
          fprintf( fpout, "|\n" );
        }
      fprintf( fpout, "S\n" );
    }
  fprintf( fpout, "#0\n\n\n" );
  if ( install && vnum < tarea->hi_r_vnum )
    tarea->hi_r_vnum = vnum - 1;

  /* save resets   */
  fprintf( fpout, "#RESETS\n" );
  for ( treset = tarea->first_reset; treset; treset = treset->next )
    {
      switch( treset->command ) /* extra arg1 arg2 arg3 */
        {
        default:  case '*': break;
        case 'm': case 'M':
        case 'o': case 'O':
        case 'p': case 'P':
        case 'e': case 'E':
        case 'd': case 'D':
        case 't': case 'T':
          fprintf( fpout, "%c %d %d %d %d\n", UPPER(treset->command),
                   treset->extra, treset->arg1, treset->arg2, treset->arg3 );
          break;
        case 'g': case 'G':
        case 'r': case 'R':
          fprintf( fpout, "%c %d %d %d\n", UPPER(treset->command),
                   treset->extra, treset->arg1, treset->arg2 );
          break;
        }
    }
  fprintf( fpout, "S\n\n\n" );

  /* save shops */
  fprintf( fpout, "#SHOPS\n" );
  for ( vnum = tarea->low_m_vnum; vnum <= tarea->hi_m_vnum; vnum++ )
    {
      if ( (pMobIndex = get_mob_index( vnum )) == NULL )
        continue;
      if ( (pShop = pMobIndex->pShop) == NULL )
        continue;
      fprintf( fpout, " %d   %2d %2d %2d %2d %2d   %3d %3d",
               pShop->keeper,
               pShop->buy_type[0],
               pShop->buy_type[1],
               pShop->buy_type[2],
               pShop->buy_type[3],
               pShop->buy_type[4],
               pShop->profit_buy,
               pShop->profit_sell );
      fprintf( fpout, "        %2d %2d    ; %s\n",
               pShop->business_hours.open,
               pShop->business_hours.close,
               pMobIndex->short_descr );
    }
  fprintf( fpout, "0\n\n\n" );

  /* save repair shops */
  fprintf( fpout, "#REPAIRS\n" );
  for ( vnum = tarea->low_m_vnum; vnum <= tarea->hi_m_vnum; vnum++ )
    {
      if ( (pMobIndex = get_mob_index( vnum )) == NULL )
        continue;
      if ( (pRepair = pMobIndex->rShop) == NULL )
        continue;
      fprintf( fpout, " %d   %2d %2d %2d         %3d %3d",
               pRepair->keeper,
               pRepair->fix_type[0],
               pRepair->fix_type[1],
               pRepair->fix_type[2],
               pRepair->profit_fix,
               pRepair->shop_type );
      fprintf( fpout, "        %2d %2d    ; %s\n",
               pRepair->business_hours.open,
               pRepair->business_hours.close,
               pMobIndex->short_descr );
    }
  fprintf( fpout, "0\n\n\n" );

  /* save specials */
  fprintf( fpout, "#SPECIALS\n" );
  for ( vnum = tarea->low_m_vnum; vnum <= tarea->hi_m_vnum; vnum++ )
    {
      if ( (pMobIndex = get_mob_index( vnum )) == NULL )
        continue;
      if ( pMobIndex->spec_fun )
        fprintf( fpout, "M  %d %s\n",   pMobIndex->vnum,
                 lookup_spec( pMobIndex->spec_fun ) );
      if ( pMobIndex->spec_2 )
        fprintf( fpout, "M  %d %s\n",   pMobIndex->vnum,
                 lookup_spec( pMobIndex->spec_2 ) );
    }
  fprintf( fpout, "S\n\n\n" );

  /* END */
  fprintf( fpout, "#$\n" );
  fclose( fpout );
}

void write_area_list( void )
{
  AREA_DATA *tarea;
  FILE *fpout;

  fpout = fopen( AREA_DIR AREA_LIST, "w" );
  if ( !fpout )
    {
      bug( "FATAL: cannot open area.lst for writing!\r\n", 0 );
      return;
    }

  for ( tarea = first_area; tarea; tarea = tarea->next )
    fprintf( fpout, "%s\n", tarea->filename );

  fprintf( fpout, "$\n" );
  fclose( fpout );
}

void add_reset_nested( AREA_DATA *tarea, OBJ_DATA *obj )
{
  int limit;

  for ( obj = obj->first_content; obj; obj = obj->next_content )
    {
      limit = obj->pIndexData->count;
      if ( limit < 1 )
        limit = 1;
      add_reset( tarea, 'P', 1, obj->pIndexData->vnum, limit,
                 obj->in_obj->pIndexData->vnum );
      if ( obj->first_content )
        add_reset_nested( tarea, obj );
    }
}

/*
 * Parse a reset command string into a reset_data structure
 */
RESET_DATA *parse_reset( AREA_DATA *tarea, char *argument, Character *ch )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char arg3[MAX_INPUT_LENGTH];
  char arg4[MAX_INPUT_LENGTH];
  char letter;
  int extra, val1, val2, val3;
  int value;
  ROOM_INDEX_DATA *room;
  EXIT_DATA     *pexit;

  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );
  argument = one_argument( argument, arg3 );
  argument = one_argument( argument, arg4 );
  extra = 0; letter = '*';
  val1 = atoi( arg2 );
  val2 = atoi( arg3 );
  val3 = atoi( arg4 );
  if ( arg1[0] == '\0' )
    {
      send_to_char( "Reset commands: mob obj give equip door rand trap hide.\r\n", ch );
      return NULL;
    }

  if ( !str_cmp( arg1, "hide" ) )
    {
      if ( arg2[0] != '\0' && !get_obj_index(val1) )
        {
          send_to_char( "Reset: HIDE: no such object\r\n", ch );
          return NULL;
        }
      else
        val1 = 0;
      extra = 1;
      val2 = 0;
      val3 = 0;
      letter = 'H';
    }
  else
    if ( arg2[0] == '\0' )
      {
        send_to_char( "Reset: not enough arguments.\r\n", ch );
        return NULL;
      }
    else
      if ( val1 < 1 || val1 > MAX_VNUM )
        {
          send_to_char( "Reset: value out of range.\r\n", ch );
          return NULL;
        }
      else
        if ( !str_cmp( arg1, "mob" ) )
          {
            if ( !get_mob_index(val1) )
              {
                send_to_char( "Reset: MOB: no such mobile\r\n", ch );
                return NULL;
              }
            if ( !get_room_index(val2) )
              {
                send_to_char( "Reset: MOB: no such room\r\n", ch );
                return NULL;
              }
            if ( val3 < 1 )
              val3 = 1;
            letter = 'M';
          }
        else
          if ( !str_cmp( arg1, "obj" ) )
            {
              if ( !get_obj_index(val1) )
                {
                  send_to_char( "Reset: OBJ: no such object\r\n", ch );
                  return NULL;
                }
              if ( !get_room_index(val2) )
                {
                  send_to_char( "Reset: OBJ: no such room\r\n", ch );
                  return NULL;
                }
              if ( val3 < 1 )
                val3 = 1;
              letter = 'O';
            }
          else
            if ( !str_cmp( arg1, "give" ) )
              {
                if ( !get_obj_index(val1) )
                  {
                    send_to_char( "Reset: GIVE: no such object\r\n", ch );
                    return NULL;
                  }
                if ( val2 < 1 )
                  val2 = 1;
                val3 = val2;
                val2 = 0;
                extra = 1;
                letter = 'G';
              }
            else
              if ( !str_cmp( arg1, "equip" ) )
                {
                  if ( !get_obj_index(val1) )
                    {
                      send_to_char( "Reset: EQUIP: no such object\r\n", ch );
                      return NULL;
                    }
                  if ( !is_number(arg3) )
                    val2 = get_wearloc(arg3);
                  if ( val2 < 0 || val2 >= MAX_WEAR )
                    {
                      send_to_char( "Reset: EQUIP: invalid wear location\r\n", ch );
                      return NULL;
                    }
                  if ( val3 < 1 )
                    val3 = 1;
                  extra  = 1;
                  letter = 'E';
                }
              else
                if ( !str_cmp( arg1, "put" ) )
                  {
                    if ( !get_obj_index(val1) )
                      {
                        send_to_char( "Reset: PUT: no such object\r\n", ch );
                        return NULL;
                      }
                    if ( val2 > 0 && !get_obj_index(val2) )
                      {
                        send_to_char( "Reset: PUT: no such container\r\n", ch );
                        return NULL;
                      }
                    extra = UMAX(val3, 0);
                    argument = one_argument(argument, arg4);
                    val3 = (is_number(argument) ? atoi(arg4) : 0);
                    if ( val3 < 0 )
                      val3 = 0;
                    letter = 'P';
                  }
                else
                  if ( !str_cmp( arg1, "door" ) )
                    {
                      if ( (room = get_room_index(val1)) == NULL )
                        {
                          send_to_char( "Reset: DOOR: no such room\r\n", ch );
                          return NULL;
                        }
                      if ( val2 < 0 || val2 > 9 )
                        {
                          send_to_char( "Reset: DOOR: invalid exit\r\n", ch );
                          return NULL;
                        }
                      if ( (pexit = get_exit(room, val2)) == NULL
                           ||   !IS_SET( pexit->exit_info, EX_ISDOOR ) )
                        {
                          send_to_char( "Reset: DOOR: no such door\r\n", ch );
                          return NULL;
                        }
                      if ( val3 < 0 || val3 > 2 )
                        {
                          send_to_char( "Reset: DOOR: invalid door state (0 = open, 1 = close, 2 = lock)\r\n", ch );
                          return NULL;
                        }
                      letter = 'D';
                      value = val3;
                      val3  = val2;
                      val2  = value;
                    }
                  else
                    if ( !str_cmp( arg1, "rand" ) )
                      {
                        if ( !get_room_index(val1) )
                          {
                            send_to_char( "Reset: RAND: no such room\r\n", ch );
                            return NULL;
                          }
                        if ( val2 < 0 || val2 > 9 )
                          {
                            send_to_char( "Reset: RAND: invalid max exit\r\n", ch );
                            return NULL;
                          }
                        val3 = val2;
                        val2 = 0;
                        letter = 'R';
                      }
                    else
                      if ( !str_cmp( arg1, "trap" ) )
                        {
                          if ( val2 < 1 || val2 > MAX_TRAPTYPE )
                            {
                              send_to_char( "Reset: TRAP: invalid trap type\r\n", ch );
                              return NULL;
                            }
                          if ( val3 < 0 || val3 > 10000 )
                            {
                              send_to_char( "Reset: TRAP: invalid trap charges\r\n", ch );
                              return NULL;
                            }
                          while ( argument[0] != '\0' )
                            {
                              argument = one_argument( argument, arg4 );
                              value = get_trapflag( arg4 );
                              if ( value >= 0 || value < 32 )
                                SET_BIT( extra, 1 << value );
                              else
                                {
                                  send_to_char( "Reset: TRAP: bad flag\r\n", ch );
                                  return NULL;
                                }
                            }
                          if ( IS_SET(extra, TRAP_ROOM) && IS_SET(extra, TRAP_OBJ) )
                            {
                              send_to_char( "Reset: TRAP: Must specify room OR object, not both!\r\n", ch );
                              return NULL;
                            }
                          if ( IS_SET(extra, TRAP_ROOM) && !get_room_index(val1) )
                            {
                              send_to_char( "Reset: TRAP: no such room\r\n", ch );
                              return NULL;
                            }
                          if ( IS_SET(extra, TRAP_OBJ)  && val1>0 && !get_obj_index(val1) )
                            {
                              send_to_char( "Reset: TRAP: no such object\r\n", ch );
                              return NULL;
                            }
                          if (!IS_SET(extra, TRAP_ROOM) && !IS_SET(extra, TRAP_OBJ) )
                            {
                              send_to_char( "Reset: TRAP: Must specify ROOM or OBJECT\r\n", ch );
                              return NULL;
                            }
                          /* fix order */
                          value = val1;
                          val1  = val2;
                          val2  = value;
                          letter = 'T';
                        }
  if ( letter == '*' )
    return NULL;
  else
    return make_reset( letter, extra, val1, val3, val2 );
}

void mpedit( Character *ch, MPROG_DATA *mprg, int mptype, char *argument )
{
  if ( mptype != -1 )
    {
      mprg->type = 1 << mptype;
      if ( mprg->arglist )
        STRFREE( mprg->arglist );
      mprg->arglist = STRALLOC( argument );
    }
  ch->substate = SUB_MPROG_EDIT;
  ch->dest_buf = mprg;
  if ( !mprg->comlist )
    mprg->comlist = STRALLOC( "" );
  start_editing( ch, mprg->comlist );
}

/*
 * RoomProg Support
 */
void rpedit( Character *ch, MPROG_DATA *mprg, int mptype, char *argument )
{
  if ( mptype != -1 )
    {
      mprg->type = 1 << mptype;
      if ( mprg->arglist )
        STRFREE( mprg->arglist );
      mprg->arglist = STRALLOC( argument );
    }
  ch->substate = SUB_MPROG_EDIT;
  ch->dest_buf = mprg;
  if(!mprg->comlist)
    mprg->comlist = STRALLOC("");
  start_editing( ch, mprg->comlist );
}
