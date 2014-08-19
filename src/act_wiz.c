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

  if ( !argument || argument[0] == '\0' )
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

void EchoToRoom( short AT_COLOR, Room *room, const char *argument )
{
  RealEchoToRoom( AT_COLOR, room, argument, true );
}

void RealEchoToRoom( short color, Room *room, const char *text, bool sendNewline )
{
  Character *vic = NULL;

  if ( room == NULL )
    return;

  for ( vic = room->first_person; vic; vic = vic->next_in_room )
    {
      SetCharacterColor( color, vic );
      ChPrintf( vic, text );

      if( sendNewline )
	{
	  ChPrintf( vic, "\r\n" );
	}
    }
}

Room *FindLocation( const Character *ch, const char *arg )
{
  const Character *victim = NULL;
  const Object *obj = NULL;

  if ( IsNumber(arg) )
    return GetRoom( atoi( arg ) );

  if ( ( victim = get_char_world( ch, arg ) ) != NULL )
    return victim->in_room;

  if ( ( obj = get_obj_world( ch, arg ) ) != NULL )
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
        stop_fighting( ech, true );
      if ( IsNpc(ech) )
        {
          /* if mob is in area, or part of area. */
          if ( urange(pArea->low_m_vnum, ech->Prototype->vnum,
                      pArea->hi_m_vnum) == ech->Prototype->vnum ||
               (ech->in_room && ech->in_room->area == pArea) )
            extract_char( ech, true );
          continue;
        }
      if ( ech->in_room && ech->in_room->area == pArea )
        do_recall( ech, "" );
    }
  for ( eobj = first_object; eobj; eobj = eobj_next )
    {
      eobj_next = eobj->next;
      /* if obj is in area, or part of area. */
      if ( urange(pArea->low_o_vnum, eobj->Prototype->vnum,
                  pArea->hi_o_vnum) == eobj->Prototype->vnum ||
           (eobj->in_room && eobj->in_room->area == pArea) )
        extract_obj( eobj );
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
                    stop_fighting( ech, true );
                  if ( IsNpc(ech) )
                    extract_char( ech, true );
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
                  extract_obj( eobj );
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

          if ( mid->vnum < pArea->low_m_vnum || mid->vnum > pArea->hi_m_vnum )
            continue;

          FreeMemory( mid->player_name );
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

          if ( oid->vnum < pArea->low_o_vnum || oid->vnum > pArea->hi_o_vnum )
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

/*
 * Free a social structure                                      -Thoric
 */
void FreeSocial( Social *social )
{
  if ( social->name )
    FreeMemory( social->name );
  if ( social->char_no_arg )
    FreeMemory( social->char_no_arg );
  if ( social->others_no_arg )
    FreeMemory( social->others_no_arg );
  if ( social->char_found )
    FreeMemory( social->char_found );
  if ( social->others_found )
    FreeMemory( social->others_found );
  if ( social->vict_found )
    FreeMemory( social->vict_found );
  if ( social->char_auto )
    FreeMemory( social->char_auto );
  if ( social->others_auto )
    FreeMemory( social->others_auto );
  FreeMemory( social );
}

/*
 * Remove a social from it's hash index                         -Thoric
 */
void UnlinkSocial( Social *social )
{
  Social *tmp, *tmp_next;
  int hash;

  if ( !social )
    {
      Bug( "Unlink_social: NULL social", 0 );
      return;
    }

  if ( social->name[0] < 'a' || social->name[0] > 'z' )
    hash = 0;
  else
    hash = (social->name[0] - 'a') + 1;

  if ( social == (tmp=social_index[hash]) )
    {
      social_index[hash] = tmp->next;
      return;
    }
  for ( ; tmp; tmp = tmp_next )
    {
      tmp_next = tmp->next;
      if ( social == tmp_next )
        {
          tmp->next = tmp_next->next;
          return;
        }
    }
}

/*
 * Add a social to the social index table                       -Thoric
 * Hashed and insert sorted
 */
void AddSocial( Social *social )
{
  int hash, x;
  Social *tmp, *prev;

  if ( !social )
    {
      Bug( "Add_social: NULL social", 0 );
      return;
    }

  if ( !social->name )
    {
      Bug( "Add_social: NULL social->name", 0 );
      return;
    }

  if ( !social->char_no_arg )
    {
      Bug( "Add_social: NULL social->char_no_arg", 0 );
      return;
    }

  /* make sure the name is all lowercase */
  for ( x = 0; social->name[x] != '\0'; x++ )
    social->name[x] = CharToLowercase(social->name[x]);

  if ( social->name[0] < 'a' || social->name[0] > 'z' )
    hash = 0;
  else
    hash = (social->name[0] - 'a') + 1;

  if ( (prev = tmp = social_index[hash]) == NULL )
    {
      social->next = social_index[hash];
      social_index[hash] = social;
      return;
    }

  for ( ; tmp; tmp = tmp->next )
    {
      if ( (x=StrCmp(social->name, tmp->name)) == 0 )
        {
          Bug( "Add_social: trying to add duplicate name to bucket %d", hash );
          FreeSocial( social );
          return;
        }
      else
        if ( x < 0 )
          {
            if ( tmp == social_index[hash] )
              {
                social->next = social_index[hash];
                social_index[hash] = social;
                return;
              }
            prev->next = social;
            social->next = tmp;
            return;
          }
      prev = tmp;
    }

  /* add to end */
  prev->next = social;
  social->next = NULL;
}

/*
 * Free a command structure                                     -Thoric
 */
void FreeCommand( Command *command )
{
  if ( command->name )
    FreeMemory( command->name );

  if( command->fun_name )
    FreeMemory( command->fun_name );

  FreeMemory( command );
}

/*
 * Remove a command from it's hash index                        -Thoric
 */
void UnlinkCommand( Command *command )
{
  Command *tmp, *tmp_next;
  int hash;

  if ( !command )
    {
      Bug( "Unlink_command NULL command", 0 );
      return;
    }

  hash = command->name[0]%126;

  if ( command == (tmp=command_hash[hash]) )
    {
      command_hash[hash] = tmp->next;
      return;
    }
  for ( ; tmp; tmp = tmp_next )
    {
      tmp_next = tmp->next;
      if ( command == tmp_next )
        {
          tmp->next = tmp_next->next;
          return;
        }
    }
}

/*
 * Add a command to the command hash table                      -Thoric
 */
void AddCommand( Command *command )
{
  int hash, x;
  Command *tmp, *prev;

  if ( !command )
    {
      Bug( "Add_command: NULL command", 0 );
      return;
    }

  if ( !command->name )
    {
      Bug( "Add_command: NULL command->name", 0 );
      return;
    }

  if ( !command->do_fun )
    {
      Bug( "Add_command: NULL command->do_fun", 0 );
      return;
    }

  /* make sure the name is all lowercase */
  for ( x = 0; command->name[x] != '\0'; x++ )
    command->name[x] = CharToLowercase(command->name[x]);

  hash = command->name[0] % 126;

  if ( (prev = tmp = command_hash[hash]) == NULL )
    {
      command->next = command_hash[hash];
      command_hash[hash] = command;
      return;
    }

  /* add to the END of the list */
  for ( ; tmp; tmp = tmp->next )
    if ( !tmp->next )
      {
        tmp->next = command;
        command->next = NULL;
      }
}
