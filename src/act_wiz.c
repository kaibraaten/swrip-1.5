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
extern OBJ_INDEX_DATA *obj_index_hash[MAX_KEY_HASH];
extern ProtoMobile *mob_index_hash[MAX_KEY_HASH];
extern Room *room_index_hash[MAX_KEY_HASH];

void echo_to_all( short AT_COLOR, const char *argument, short tar )
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
          set_char_color( AT_COLOR, d->character );
          send_to_char( argument, d->character );
          send_to_char( "\r\n",   d->character );
        }
    }
}

void echo_to_room( short AT_COLOR, Room *room, const char *argument )
{
  Character *vic;

  if ( room == NULL )
    return;


  for ( vic = room->first_person; vic; vic = vic->next_in_room )
    {
      set_char_color( AT_COLOR, vic );
      send_to_char( argument, vic );
      send_to_char( "\r\n",   vic );
    }
}

Room *find_location( Character *ch, char *arg )
{
  Character *victim;
  OBJ_DATA *obj;

  if ( is_number(arg) )
    return get_room_index( atoi( arg ) );

  if ( ( victim = get_char_world( ch, arg ) ) != NULL )
    return victim->in_room;

  if ( ( obj = get_obj_world( ch, arg ) ) != NULL )
    return obj->in_room;

  return NULL;
}

/*
 * Find the position of a target substring in a source string.
 * Returns pointer to the first occurrence of the string pointed to
 * bstr in the string pointed to by astr. It returns a null pointer
 * if no match is found.  --  Gorog (with help from Thoric)
 *
 * Note I made a change when modifying str_infix. If the target string is
 * null, I return NULL (meaning no match was found). str_infix returns
 * false (meaning a match was found).  *grumble*
 */
static const char *str_str( const char *astr, const char *bstr )
{
  int sstr1, sstr2, ichar;
  char c0;

  if ( ( c0 = LOWER(bstr[0]) ) == '\0' )
    return NULL;

  sstr1 = strlen(astr);
  sstr2 = strlen(bstr);

  for ( ichar = 0; ichar <= sstr1 - sstr2; ichar++ )
    if ( c0 == LOWER(astr[ichar]) && !str_prefix(bstr, astr+ichar) )
      return (astr+ichar);

  return NULL;
}

/*
 * Counts the number of times a target string occurs in a source string.
 * case insensitive -- Gorog
 */
int str_count(const char *psource, const char *ptarget)
{
  const char *ptemp = psource;
  int count=0;

  while ( (ptemp = str_str(ptemp, ptarget)) )
    {
      ptemp++;
      count++;
    }

  return count;
}

void save_banlist( void )
{
  Ban *pban;
  FILE *fp;

  if ( !(fp = fopen( BAN_LIST, "w" )) )
    {
      bug( "Save_banlist: Cannot open " BAN_LIST, 0 );
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
void close_area( Area *pArea )
{
  Character *ech;
  Character *ech_next;
  OBJ_DATA *eobj;
  OBJ_DATA *eobj_next;
  int icnt;
  Room *rid;
  Room *rid_next;
  OBJ_INDEX_DATA *oid;
  OBJ_INDEX_DATA *oid_next;
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
          if ( urange(pArea->low_m_vnum, ech->pIndexData->vnum,
                      pArea->hi_m_vnum) == ech->pIndexData->vnum ||
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
      if ( urange(pArea->low_o_vnum, eobj->pIndexData->vnum,
                  pArea->hi_o_vnum) == eobj->pIndexData->vnum ||
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
                  DISPOSE( exit_iter->keyword );
                  DISPOSE( exit_iter->description );
                  UNLINK( exit_iter, rid->first_exit, rid->last_exit, next, prev );
                  DISPOSE( exit_iter );
                }
            }
          if ( rid->area != pArea )
            continue;
          DISPOSE(rid->name);
          DISPOSE(rid->description);
          if ( rid->first_person )
            {
              bug( "close_area: room with people #%d", rid->vnum );
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
              bug( "close_area: room with contents #%d", rid->vnum );
              for ( eobj = rid->first_content; eobj; eobj = eobj_next )
                {
                  eobj_next = eobj->next_content;
                  extract_obj( eobj );
                }
            }
          for ( eed = rid->first_extradesc; eed; eed = eed_next )
            {
              eed_next = eed->next;
              DISPOSE( eed->keyword );
              DISPOSE( eed->description );
              DISPOSE( eed );
            }
          for ( mpact = rid->mprog.mpact; mpact; mpact = mpact_next )
            {
              mpact_next = mpact->next;
              DISPOSE( mpact->buf );
              DISPOSE( mpact );
            }
          for ( mprog = rid->mprog.mudprogs; mprog; mprog = mprog_next )
            {
              mprog_next = mprog->next;
              DISPOSE( mprog->arglist );
              DISPOSE( mprog->comlist );
              DISPOSE( mprog );
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
                bug( "Close_area: rid not in hash list %d", rid->vnum );
              else
                trid->next = rid->next;
            }
          DISPOSE(rid);
        }

      for ( mid = mob_index_hash[icnt]; mid; mid = mid_next )
        {
          mid_next = mid->next;

          if ( mid->vnum < pArea->low_m_vnum || mid->vnum > pArea->hi_m_vnum )
            continue;

          DISPOSE( mid->player_name );
          DISPOSE( mid->short_descr );
          DISPOSE( mid->long_descr  );
          DISPOSE( mid->description );
          if ( mid->pShop )
            {
              UNLINK( mid->pShop, first_shop, last_shop, next, prev );
              DISPOSE( mid->pShop );
            }
          if ( mid->rShop )
            {
              UNLINK( mid->rShop, first_repair, last_repair, next, prev );
              DISPOSE( mid->rShop );
            }
          for ( mprog = mid->mprog.mudprogs; mprog; mprog = mprog_next )
            {
              mprog_next = mprog->next;
              DISPOSE(mprog->arglist);
              DISPOSE(mprog->comlist);
              DISPOSE(mprog);
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
                bug( "Close_area: mid not in hash list %s", mid->vnum );
              else
                tmid->next = mid->next;
            }
          DISPOSE(mid);
        }

      for ( oid = obj_index_hash[icnt]; oid; oid = oid_next )
        {
          oid_next = oid->next;

          if ( oid->vnum < pArea->low_o_vnum || oid->vnum > pArea->hi_o_vnum )
            continue;

          DISPOSE(oid->name);
          DISPOSE(oid->short_descr);
          DISPOSE(oid->description);
          DISPOSE(oid->action_desc);

          for ( eed = oid->first_extradesc; eed; eed = eed_next )
            {
              eed_next = eed->next;
              DISPOSE(eed->keyword);
              DISPOSE(eed->description);
              DISPOSE(eed);
            }
          for ( paf = oid->first_affect; paf; paf = paf_next )
            {
              paf_next = paf->next;
              DISPOSE(paf);
            }
          for ( mprog = oid->mprog.mudprogs; mprog; mprog = mprog_next )
            {
              mprog_next = mprog->next;
              DISPOSE(mprog->arglist);
              DISPOSE(mprog->comlist);
              DISPOSE(mprog);
            }
          if ( oid == obj_index_hash[icnt] )
            obj_index_hash[icnt] = oid->next;
          else
            {
              OBJ_INDEX_DATA *toid;

              for ( toid = obj_index_hash[icnt]; toid; toid = toid->next )
                if ( toid->next == oid )
                  break;
              if ( !toid )
                bug( "Close_area: oid not in hash list %s", oid->vnum );
              else
                toid->next = oid->next;
            }
          DISPOSE(oid);
        }
    }
  for ( ereset = pArea->first_reset; ereset; ereset = ereset_next )
    {
      ereset_next = ereset->next;
      DISPOSE(ereset);
    }
  DISPOSE(pArea->name);
  DISPOSE(pArea->filename);
  DISPOSE(pArea->author);
  UNLINK( pArea, first_build, last_build, next, prev );
  UNLINK( pArea, first_asort, last_asort, next_sort, prev_sort );
  DISPOSE( pArea );
}

void get_reboot_string(void)
{
  sprintf(reboot_time, "%s", asctime(new_boot_time));
}

/*
 * Free a social structure                                      -Thoric
 */
void free_social( SOCIALTYPE *social )
{
  if ( social->name )
    DISPOSE( social->name );
  if ( social->char_no_arg )
    DISPOSE( social->char_no_arg );
  if ( social->others_no_arg )
    DISPOSE( social->others_no_arg );
  if ( social->char_found )
    DISPOSE( social->char_found );
  if ( social->others_found )
    DISPOSE( social->others_found );
  if ( social->vict_found )
    DISPOSE( social->vict_found );
  if ( social->char_auto )
    DISPOSE( social->char_auto );
  if ( social->others_auto )
    DISPOSE( social->others_auto );
  DISPOSE( social );
}

/*
 * Remove a social from it's hash index                         -Thoric
 */
void unlink_social( SOCIALTYPE *social )
{
  SOCIALTYPE *tmp, *tmp_next;
  int hash;

  if ( !social )
    {
      bug( "Unlink_social: NULL social", 0 );
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
void add_social( SOCIALTYPE *social )
{
  int hash, x;
  SOCIALTYPE *tmp, *prev;

  if ( !social )
    {
      bug( "Add_social: NULL social", 0 );
      return;
    }

  if ( !social->name )
    {
      bug( "Add_social: NULL social->name", 0 );
      return;
    }

  if ( !social->char_no_arg )
    {
      bug( "Add_social: NULL social->char_no_arg", 0 );
      return;
    }

  /* make sure the name is all lowercase */
  for ( x = 0; social->name[x] != '\0'; x++ )
    social->name[x] = LOWER(social->name[x]);

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
      if ( (x=str_cmp(social->name, tmp->name)) == 0 )
        {
          bug( "Add_social: trying to add duplicate name to bucket %d", hash );
          free_social( social );
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
void free_command( CMDTYPE *command )
{
  if ( command->name )
    DISPOSE( command->name );

  if( command->fun_name )
    DISPOSE( command->fun_name );

  DISPOSE( command );
}

/*
 * Remove a command from it's hash index                        -Thoric
 */
void unlink_command( CMDTYPE *command )
{
  CMDTYPE *tmp, *tmp_next;
  int hash;

  if ( !command )
    {
      bug( "Unlink_command NULL command", 0 );
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
void add_command( CMDTYPE *command )
{
  int hash, x;
  CMDTYPE *tmp, *prev;

  if ( !command )
    {
      bug( "Add_command: NULL command", 0 );
      return;
    }

  if ( !command->name )
    {
      bug( "Add_command: NULL command->name", 0 );
      return;
    }

  if ( !command->do_fun )
    {
      bug( "Add_command: NULL command->do_fun", 0 );
      return;
    }

  /* make sure the name is all lowercase */
  for ( x = 0; command->name[x] != '\0'; x++ )
    command->name[x] = LOWER(command->name[x]);

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
