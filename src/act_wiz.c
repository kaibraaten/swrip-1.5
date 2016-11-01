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
#include "reset.h"
#include "shop.h"

Ban *FirstBan = NULL;
Ban *LastBan = NULL;

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

  for ( d = FirstDescriptor; d; d = d->Next )
    {
      /* Added showing echoes to players who are editing, so they won't
         miss out on important info like upcoming reboots. --Narn */
      if ( d->ConnectionState == CON_PLAYING || d->ConnectionState == CON_EDITING )
        {
          /* This one is kinda useless except for switched.. */
          if ( tar == ECHOTAR_PC && IsNpc(d->Character) )
            continue;
          else if ( tar == ECHOTAR_IMM && !IsImmortal(d->Character) )
            continue;
          SetCharacterColor( AT_COLOR, d->Character );
          SendToCharacter( argument, d->Character );
          SendToCharacter( "\r\n",   d->Character );
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

  for ( vic = room->FirstPerson; vic; vic = vic->NextInRoom )
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
    return victim->InRoom;

  if ( ( obj = GetObjectAnywhere( ch, arg ) ) != NULL )
    return obj->InRoom;

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

  for ( pban = FirstBan; pban; pban = pban->Next )
    fprintf( fp, "%d %s~~%s~\n", pban->Level, pban->Name, pban->BanTime );

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
      ech_next = ech->Next;

      if ( ech->Fighting )
        StopFighting( ech, true );
      if ( IsNpc(ech) )
        {
          /* if mob is in area, or part of area. */
          if ( urange(pArea->VnumRanges.Mob.First, ech->Prototype->Vnum,
                      pArea->VnumRanges.Mob.Last) == ech->Prototype->Vnum ||
               (ech->InRoom && ech->InRoom->Area == pArea) )
            ExtractCharacter( ech, true );
          continue;
        }
      if ( ech->InRoom && ech->InRoom->Area == pArea )
        do_recall( ech, "" );
    }
  for ( eobj = first_object; eobj; eobj = eobj_next )
    {
      eobj_next = eobj->Next;
      /* if obj is in area, or part of area. */
      if ( urange(pArea->VnumRanges.Object.First, eobj->Prototype->Vnum,
                  pArea->VnumRanges.Object.Last) == eobj->Prototype->Vnum ||
           (eobj->InRoom && eobj->InRoom->Area == pArea) )
        ExtractObject( eobj );
    }
  
  for ( icnt = 0; icnt < MAX_KEY_HASH; icnt++ )
    {
      for ( rid = room_index_hash[icnt]; rid; rid = rid_next )
        {
	  Exit *exit_iter = NULL;
          rid_next = rid->Next;

          for ( exit_iter = rid->FirstExit; exit_iter; exit_iter = exit_next )
            {
              exit_next = exit_iter->Next;

              if ( rid->Area == pArea || exit_iter->ToRoom->Area == pArea )
                {
                  FreeMemory( exit_iter->Keyword );
                  FreeMemory( exit_iter->Description );
                  UNLINK( exit_iter, rid->FirstExit, rid->LastExit, Next, Previous );
                  FreeMemory( exit_iter );
                }
            }

          if ( rid->Area != pArea )
            continue;

	  FreeMemory(rid->Name);
          FreeMemory(rid->Description);

          if ( rid->FirstPerson )
            {
              Bug( "CloseArea: room with people #%d", rid->Vnum );

              for ( ech = rid->FirstPerson; ech; ech = ech_next )
                {
                  ech_next = ech->NextInRoom;

		  if ( ech->Fighting )
                    StopFighting( ech, true );

                  if ( IsNpc(ech) )
                    ExtractCharacter( ech, true );
                  else
                    do_recall( ech, "" );
                }
            }

          if ( rid->FirstContent )
            {
              Bug( "CloseArea: room with contents #%d", rid->Vnum );

              for ( eobj = rid->FirstContent; eobj; eobj = eobj_next )
                {
                  eobj_next = eobj->NextContent;
                  ExtractObject( eobj );
                }
            }
          for ( eed = rid->FirstExtraDescription; eed; eed = eed_next )
            {
              eed_next = eed->Next;
              FreeMemory( eed->Keyword );
              FreeMemory( eed->Description );
              FreeMemory( eed );
            }
          for ( mpact = rid->mprog.mpact; mpact; mpact = mpact_next )
            {
              mpact_next = mpact->Next;
              FreeMemory( mpact->buf );
              FreeMemory( mpact );
            }

	  for ( mprog = rid->mprog.mudprogs; mprog; mprog = mprog_next )
            {
              mprog_next = mprog->Next;
              FreeMemory( mprog->arglist );
              FreeMemory( mprog->comlist );
              FreeMemory( mprog );
            }

          if ( rid == room_index_hash[icnt] )
	    {
	      room_index_hash[icnt] = rid->Next;
	    }
          else
            {
              Room *trid;

              for ( trid = room_index_hash[icnt]; trid; trid = trid->Next )
                if ( trid->Next == rid )
                  break;
	      
              if ( !trid )
                Bug( "Close_area: rid not in hash list %d", rid->Vnum );
              else
                trid->Next = rid->Next;
            }
          FreeMemory(rid);
        }

      for ( mid = mob_index_hash[icnt]; mid; mid = mid_next )
        {
          mid_next = mid->Next;

          if ( mid->Vnum < pArea->VnumRanges.Mob.First
	       || mid->Vnum > pArea->VnumRanges.Mob.Last )
            continue;

          FreeMemory( mid->Name );
          FreeMemory( mid->ShortDescr );
          FreeMemory( mid->LongDescr  );
          FreeMemory( mid->Description );
          if ( mid->Shop )
            {
              UNLINK( mid->Shop, first_shop, last_shop, Next, Previous );
              FreeMemory( mid->Shop );
            }

          if ( mid->RepairShop )
            {
              UNLINK( mid->RepairShop, first_repair, last_repair, Next, Previous );
              FreeMemory( mid->RepairShop );
            }

	  for ( mprog = mid->mprog.mudprogs; mprog; mprog = mprog_next )
            {
              mprog_next = mprog->Next;
              FreeMemory(mprog->arglist);
              FreeMemory(mprog->comlist);
              FreeMemory(mprog);
            }
          if ( mid == mob_index_hash[icnt] )
            mob_index_hash[icnt] = mid->Next;
          else
            {
              ProtoMobile *tmid;

              for ( tmid = mob_index_hash[icnt]; tmid; tmid = tmid->Next )
                if ( tmid->Next == mid )
                  break;
              if ( !tmid )
                Bug( "Close_area: mid not in hash list %s", mid->Vnum );
              else
                tmid->Next = mid->Next;
            }
          FreeMemory(mid);
        }

      for ( oid = obj_index_hash[icnt]; oid; oid = oid_next )
        {
          oid_next = oid->Next;

          if ( oid->Vnum < pArea->VnumRanges.Object.First
	       || oid->Vnum > pArea->VnumRanges.Object.Last )
            continue;

          FreeMemory(oid->Name);
          FreeMemory(oid->ShortDescr);
          FreeMemory(oid->Description);
          FreeMemory(oid->ActionDescription);

          for ( eed = oid->FirstExtraDescription; eed; eed = eed_next )
            {
              eed_next = eed->Next;
              FreeMemory(eed->Keyword);
              FreeMemory(eed->Description);
              FreeMemory(eed);
            }
          for ( paf = oid->FirstAffect; paf; paf = paf_next )
            {
              paf_next = paf->Next;
              FreeMemory(paf);
            }
          for ( mprog = oid->mprog.mudprogs; mprog; mprog = mprog_next )
            {
              mprog_next = mprog->Next;
              FreeMemory(mprog->arglist);
              FreeMemory(mprog->comlist);
              FreeMemory(mprog);
            }
          if ( oid == obj_index_hash[icnt] )
            obj_index_hash[icnt] = oid->Next;
          else
            {
              ProtoObject *toid;

              for ( toid = obj_index_hash[icnt]; toid; toid = toid->Next )
                if ( toid->Next == oid )
                  break;
              if ( !toid )
                Bug( "Close_area: oid not in hash list %s", oid->Vnum );
              else
                toid->Next = oid->Next;
            }
          FreeMemory(oid);
        }
    }
  for ( ereset = pArea->FirstReset; ereset; ereset = ereset_next )
    {
      ereset_next = ereset->Next;
      FreeMemory(ereset);
    }
  FreeMemory(pArea->Name);
  FreeMemory(pArea->Filename);
  FreeMemory(pArea->Author);
  UNLINK( pArea, first_build, last_build, Next, Previous );
  UNLINK( pArea, first_asort, last_asort, NextSort, PreviousSort );
  FreeMemory( pArea );
}

void GenerateRebootString(void)
{
  sprintf(reboot_time, "%s", asctime(new_boot_time));
}
