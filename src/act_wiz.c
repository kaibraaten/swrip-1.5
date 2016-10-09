/****************************************************************************
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
 * Michael Seifert, Hans Henrik Staerfeldt, Tom Madsen, and Katja Nyboe.    *
 ****************************************************************************/

#include <ctype.h>
#include <string.h>
#include <time.h>
#include "character.h"
#include "mud.h"

Ban *first_ban = NULL;
Ban *last_ban = NULL;

/*
 * Global variables.
 */

char reboot_time[50];
time_t new_boot_time_t;
extern ProtoObject *obj_index_hash[MAX_KEY_HASH];
extern ProtoMobile *mob_index_hash[MAX_KEY_HASH];
extern Room *room_index_hash[MAX_KEY_HASH];

void EchoToAll( short AT_COLOR, const char *argument, short tar )
{
  Descriptor *d;

  if ( IsNullOrEmpty( argument ) )
    return;

  for ( d = first_descriptor; d; d = d->next )
    {
      /* Added showing echoes to players who are editing, so they won't
         miss out on important info like upcoming reboots. --Narn */
      if ( d->connection_state == CON_PLAYING || d->connection_state == CON_EDITING )
        {
          /* This one is kinda useless except for switched.. */
          if ( tar == ECHOTAR_PC && IsNpc(d->character) )
            continue;
          else if ( tar == ECHOTAR_IMM && !IsImmortal(d->character) )
            continue;
          SetCharacterColor( AT_COLOR, d->character );
          SendToCharacter( argument, d->character );
          SendToCharacter( "\r\n",   d->character );
        }
    }
}

void EchoToRoom( short AT_COLOR, const Room *room, const char *argument )
{
  RealEchoToRoom( AT_COLOR, room, argument, true );
}

void EchoToRoomNoNewline( int ecolor, const Room *room, const char *argument )
{
  RealEchoToRoom( ecolor, room, argument, false );
}

void RealEchoToRoom( short color, const Room *room, const char *text, bool sendNewline )
{
  const Character *vic = NULL;

  if ( room == NULL )
    return;

  for ( vic = room->first_person; vic; vic = vic->next_in_room )
    {
      SetCharacterColor( color, vic );
      Echo( vic, text );

      if( sendNewline )
	{
	  Echo( vic, "\r\n" );
	}
    }
}

Room *FindLocation( const Character *ch, const char *arg )
{
  const Character *victim = NULL;
  const Object *obj = NULL;

  if ( IsNumber(arg) )
    return GetRoom( atoi( arg ) );

  if ( ( victim = GetCharacterAnywhere( ch, arg ) ) != NULL )
    return victim->in_room;

  if ( ( obj = GetObjectAnywhere( ch, arg ) ) != NULL )
    return obj->in_room;

  return NULL;
}

void SaveBanlist( void )
{
  Ban *pban;
  FILE *fp;

  if ( !(fp = fopen( BAN_LIST, "w" )) )
    {
      Bug( "Save_banlist: Cannot open " BAN_LIST, 0 );
      perror(BAN_LIST);
      return;
    }

  for ( pban = first_ban; pban; pban = pban->next )
    fprintf( fp, "%d %s~~%s~\n", pban->level, pban->name, pban->ban_time );

  fprintf( fp, "-1\n" );
  fclose( fp );
}

/*
 * This could have other applications too.. move if needed. -- Altrag
 */
void CloseArea( Area *pArea )
{
  Character *ech;
  Character *ech_next;
  Object *eobj;
  Object *eobj_next;
  int icnt;
  Room *rid;
  Room *rid_next;
  ProtoObject *oid;
  ProtoObject *oid_next;
  ProtoMobile *mid;
  ProtoMobile *mid_next;
  Reset *ereset;
  Reset *ereset_next;
  ExtraDescription *eed;
  ExtraDescription *eed_next;
  Exit *exit_next;
  MPROG_ACT_LIST *mpact;
  MPROG_ACT_LIST *mpact_next;
  MPROG_DATA *mprog;
  MPROG_DATA *mprog_next;
  Affect *paf;
  Affect *paf_next;

  for ( ech = first_char; ech; ech = ech_next )
    {
      ech_next = ech->next;

      if ( ech->fighting )
        StopFighting( ech, true );
      if ( IsNpc(ech) )
        {
          /* if mob is in area, or part of area. */
          if ( urange(pArea->VnumRanges.FirstMob, ech->Prototype->vnum,
                      pArea->VnumRanges.LastMob) == ech->Prototype->vnum ||
               (ech->in_room && ech->in_room->area == pArea) )
            ExtractCharacter( ech, true );
          continue;
        }
      if ( ech->in_room && ech->in_room->area == pArea )
        do_recall( ech, "" );
    }
  for ( eobj = first_object; eobj; eobj = eobj_next )
    {
      eobj_next = eobj->next;
      /* if obj is in area, or part of area. */
      if ( urange(pArea->VnumRanges.FirstObject, eobj->Prototype->vnum,
                  pArea->VnumRanges.LastObject) == eobj->Prototype->vnum ||
           (eobj->in_room && eobj->in_room->area == pArea) )
        ExtractObject( eobj );
    }
  for ( icnt = 0; icnt < MAX_KEY_HASH; icnt++ )
    {
      for ( rid = room_index_hash[icnt]; rid; rid = rid_next )
        {
	  Exit *exit_iter = NULL;
          rid_next = rid->next;

          for ( exit_iter = rid->first_exit; exit_iter; exit_iter = exit_next )
            {
              exit_next = exit_iter->next;
              if ( rid->area == pArea || exit_iter->to_room->area == pArea )
                {
                  FreeMemory( exit_iter->keyword );
                  FreeMemory( exit_iter->description );
                  UNLINK( exit_iter, rid->first_exit, rid->last_exit, next, prev );
                  FreeMemory( exit_iter );
                }
            }
          if ( rid->area != pArea )
            continue;
          FreeMemory(rid->name);
          FreeMemory(rid->description);
          if ( rid->first_person )
            {
              Bug( "CloseArea: room with people #%d", rid->vnum );
              for ( ech = rid->first_person; ech; ech = ech_next )
                {
                  ech_next = ech->next_in_room;
                  if ( ech->fighting )
                    StopFighting( ech, true );
                  if ( IsNpc(ech) )
                    ExtractCharacter( ech, true );
                  else
                    do_recall( ech, "" );
                }
            }
          if ( rid->first_content )
            {
              Bug( "CloseArea: room with contents #%d", rid->vnum );
              for ( eobj = rid->first_content; eobj; eobj = eobj_next )
                {
                  eobj_next = eobj->next_content;
                  ExtractObject( eobj );
                }
            }
          for ( eed = rid->first_extradesc; eed; eed = eed_next )
            {
              eed_next = eed->next;
              FreeMemory( eed->keyword );
              FreeMemory( eed->description );
              FreeMemory( eed );
            }
          for ( mpact = rid->mprog.mpact; mpact; mpact = mpact_next )
            {
              mpact_next = mpact->next;
              FreeMemory( mpact->buf );
              FreeMemory( mpact );
            }
          for ( mprog = rid->mprog.mudprogs; mprog; mprog = mprog_next )
            {
              mprog_next = mprog->next;
              FreeMemory( mprog->arglist );
              FreeMemory( mprog->comlist );
              FreeMemory( mprog );
            }
          if ( rid == room_index_hash[icnt] )
            room_index_hash[icnt] = rid->next;
          else
            {
              Room *trid;

              for ( trid = room_index_hash[icnt]; trid; trid = trid->next )
                if ( trid->next == rid )
                  break;
              if ( !trid )
                Bug( "Close_area: rid not in hash list %d", rid->vnum );
              else
                trid->next = rid->next;
            }
          FreeMemory(rid);
        }

      for ( mid = mob_index_hash[icnt]; mid; mid = mid_next )
        {
          mid_next = mid->next;

          if ( mid->vnum < pArea->VnumRanges.FirstMob
	       || mid->vnum > pArea->VnumRanges.LastMob )
            continue;

          FreeMemory( mid->name );
          FreeMemory( mid->short_descr );
          FreeMemory( mid->long_descr  );
          FreeMemory( mid->description );
          if ( mid->pShop )
            {
              UNLINK( mid->pShop, first_shop, last_shop, next, prev );
              FreeMemory( mid->pShop );
            }
          if ( mid->rShop )
            {
              UNLINK( mid->rShop, first_repair, last_repair, next, prev );
              FreeMemory( mid->rShop );
            }
          for ( mprog = mid->mprog.mudprogs; mprog; mprog = mprog_next )
            {
              mprog_next = mprog->next;
              FreeMemory(mprog->arglist);
              FreeMemory(mprog->comlist);
              FreeMemory(mprog);
            }
          if ( mid == mob_index_hash[icnt] )
            mob_index_hash[icnt] = mid->next;
          else
            {
              ProtoMobile *tmid;

              for ( tmid = mob_index_hash[icnt]; tmid; tmid = tmid->next )
                if ( tmid->next == mid )
                  break;
              if ( !tmid )
                Bug( "Close_area: mid not in hash list %s", mid->vnum );
              else
                tmid->next = mid->next;
            }
          FreeMemory(mid);
        }

      for ( oid = obj_index_hash[icnt]; oid; oid = oid_next )
        {
          oid_next = oid->next;

          if ( oid->vnum < pArea->VnumRanges.FirstObject
	       || oid->vnum > pArea->VnumRanges.LastObject )
            continue;

          FreeMemory(oid->name);
          FreeMemory(oid->short_descr);
          FreeMemory(oid->description);
          FreeMemory(oid->action_desc);

          for ( eed = oid->first_extradesc; eed; eed = eed_next )
            {
              eed_next = eed->next;
              FreeMemory(eed->keyword);
              FreeMemory(eed->description);
              FreeMemory(eed);
            }
          for ( paf = oid->first_affect; paf; paf = paf_next )
            {
              paf_next = paf->next;
              FreeMemory(paf);
            }
          for ( mprog = oid->mprog.mudprogs; mprog; mprog = mprog_next )
            {
              mprog_next = mprog->next;
              FreeMemory(mprog->arglist);
              FreeMemory(mprog->comlist);
              FreeMemory(mprog);
            }
          if ( oid == obj_index_hash[icnt] )
            obj_index_hash[icnt] = oid->next;
          else
            {
              ProtoObject *toid;

              for ( toid = obj_index_hash[icnt]; toid; toid = toid->next )
                if ( toid->next == oid )
                  break;
              if ( !toid )
                Bug( "Close_area: oid not in hash list %s", oid->vnum );
              else
                toid->next = oid->next;
            }
          FreeMemory(oid);
        }
    }
  for ( ereset = pArea->first_reset; ereset; ereset = ereset_next )
    {
      ereset_next = ereset->next;
      FreeMemory(ereset);
    }
  FreeMemory(pArea->name);
  FreeMemory(pArea->filename);
  FreeMemory(pArea->author);
  UNLINK( pArea, first_build, last_build, next, prev );
  UNLINK( pArea, first_asort, last_asort, next_sort, prev_sort );
  FreeMemory( pArea );
}

void GenerateRebootString(void)
{
  sprintf(reboot_time, "%s", asctime(new_boot_time));
}
