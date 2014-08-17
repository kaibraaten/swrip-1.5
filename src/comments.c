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
 * ------------------------------------------------------------------------ *
 * Comments: 'notes' attached to players to keep track of outstanding       *
 *           and problem players.  -haus 6/25/1995                          *
 ****************************************************************************/

/*  INSTALLATION: 1) Add following stuff to mud.h
 *
 *  NOTE_DATA *      comments;   (* inside char_data definition *)
 *  DECLARE_DO_FUN( do_comment      );
 *
 *                2) Add do_comment to interp.c, as usual
 *
 *                3) in save.c the following must be added
 *
 * save.c:107:     if ( ch->pcdata->comments )                                              (* saves comments *)
 * save.c:108:       fwrite_comments( ch, fp );                                           (*  in file *)
 *
 *
 * save.c:411:    ch->pcdata->comments                        = NULL;                   (* nulls ch->pcdata->comments *)
 *
 *
 * save.c:457:         else if ( !StrCmp( word, "COMMENT") ) fread_comment(ch, fp ); (*snags #COMMENT*)
 *
 *                4) That looks like it to these eyes.  Lemme know if i forgot anything.
 *
 *
 * EXAMPLE:  See end of this file.
 *
 */

#include <sys/types.h>
#include <ctype.h>
#include <stdio.h>
#include <string.h>
#include <time.h>
#include "editor.h"
#include "mud.h"
#include "character.h"

void note_attach(Character *ch);

void comment_remove( Character *ch, Character *victim, NOTE_DATA *pnote )
{
  if ( IsNpc( victim ) )
    {
      bug( "comment remove: NPC", 0 );
      return;
    }
  if ( !victim->pcdata->comments )
    {
      bug( "comment remove: null board", 0 );
      return;
    }

  if ( !pnote )
    {
      bug( "comment remove: null pnote", 0 );
      return;
    }

  /*
   * Remove comment from linked list.
   */
  if ( !pnote->prev )
    victim->pcdata->comments    = pnote->next;
  else
    pnote->prev->next = pnote->next;

  FreeMemory( pnote->text    );
  FreeMemory( pnote->subject );
  FreeMemory( pnote->to_list );
  FreeMemory( pnote->date    );
  FreeMemory( pnote->sender  );
  FreeMemory( pnote );

  /*
   * Rewrite entire list.
   */
  save_char_obj(victim);
}

void do_comment( Character *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  char arg[MAX_INPUT_LENGTH];
  char arg1[MAX_INPUT_LENGTH];
  NOTE_DATA *pnote = NULL;
  Character *victim = NULL;
  int noteNumber = 0;
  int anum = 0;

  if ( IsNpc(ch) )
    {
      send_to_char("Mobs can't use the comment command.\r\n", ch);
      return;
    }

  if ( !ch->desc )
    {
      bug( "do_comment: no descriptor", 0 );
      return;
    }

  /* Put in to prevent crashing when someone issues a comment command
     from within the editor. -Narn */
  if ( ch->desc->connection_state == CON_EDITING )
    {
      send_to_char("You can't use the comment command from within the editor.\r\n", ch);
      return;
    }

  switch( ch->substate )
    {
    default:
      break;
    case SUB_WRITING_NOTE:

      if ( !ch->pcdata->pnote )
        {
          bug( "do_comment: note got lost?", 0 );
          send_to_char( "Your note got lost!\r\n", ch );
          StopEditing(ch);
          return;
        }
      if ( ch->dest_buf != ch->pcdata->pnote )
        bug( "do_comment: sub_writing_note: ch->dest_buf != ch->pnote", 0 );
      FreeMemory( ch->pcdata->pnote->text );
      ch->pcdata->pnote->text = CopyBuffer( ch );
      StopEditing( ch );
      return;
    }

  set_char_color( AT_NOTE, ch );
  argument = OneArgument( argument, arg );
  SmashTilde( argument );

  if ( !StrCmp( arg, "about" ) )
    {
      victim = get_char_world(ch, argument);

      if (!victim)
        {
          send_to_char("They're not logged on!\r\n", ch);   /* maybe fix this? */
          return;
        }

      if ( IsNpc(victim) )
        {
          send_to_char("No comments about mobs\r\n", ch);
          return;
        }
    }


  if ( !StrCmp( arg, "list" ) )
    {
      victim = get_char_world(ch, argument);

      if (!victim)
        {
          send_to_char("They're not logged on!\r\n", ch);   /* maybe fix this? */
          return;
        }

      if ( IsNpc(victim) )
        {
          send_to_char("No comments about mobs\r\n", ch);
          return;
        }

      if ( GetTrustLevel(victim) >= GetTrustLevel( ch ) )
        {
          send_to_char( "You're not of the right caliber to do this...\r\n", ch );
          return;
        }

      if ( !victim->pcdata->comments )
        {
          send_to_char( "There are no relevant comments.\r\n", ch );
          return;
        }

      for ( pnote = victim->pcdata->comments; pnote; pnote = pnote->next )
        {
          noteNumber++;
          sprintf( buf, "%2d) %-10s [%s] %s\r\n",
                   noteNumber,
                   pnote->sender,
                   pnote->date,
                   pnote->subject );
          /* Brittany added date to comment list and whois with above change */
          send_to_char( buf, ch );
        }

      /* act( AT_ACTION, "$n glances over the notes.", ch, NULL, NULL, TO_ROOM ); */
      return;
    }

  if ( !StrCmp( arg, "read" ) )
    {
      bool fAll = false;

      argument = OneArgument( argument, arg1 );
      victim = get_char_world(ch, arg1);

      if (!victim)
        {
          send_to_char("They're not logged on!\r\n", ch);   /* maybe fix this? */
          return;
        }

      if ( IsNpc(victim) )
        {
          send_to_char("No comments about mobs\r\n", ch);
          return;
        }

      if ( GetTrustLevel(victim) >= GetTrustLevel( ch ) )
        {
          send_to_char( "You're not of the right caliber to do this...\r\n", ch );
          return;
        }

      if ( !victim->pcdata->comments )
        {
          send_to_char( "There are no relevant comments.\r\n", ch );
          return;
        }

      if ( !StrCmp( argument, "all" ) )
        {
          fAll = true;
          anum = 0;
        }
      else if ( IsNumber( argument ) )
	{
	  fAll = false;
	  anum = atoi( argument );
	}
      else
	{
	  send_to_char( "Note read which number?\r\n", ch );
	  return;
	}

      noteNumber = 0;

      for ( pnote = victim->pcdata->comments; pnote; pnote = pnote->next )
        {
          noteNumber++;

          if ( noteNumber == anum || fAll )
            {
              sprintf( buf, "[%3d] %s: %s\r\n%s\r\nTo: %s\r\n",
                       noteNumber,
                       pnote->sender,
                       pnote->subject,
                       pnote->date,
                       pnote->to_list
                       );
              send_to_char( buf, ch );
              send_to_char( pnote->text, ch );
              /* act( AT_ACTION, "$n reads a note.", ch, NULL, NULL, TO_ROOM ); */
              return;
            }
        }

      send_to_char( "No such comment.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg, "write" ) )
    {
      note_attach( ch );
      ch->substate = SUB_WRITING_NOTE;
      ch->dest_buf = ch->pcdata->pnote;
      StartEditing( ch, ch->pcdata->pnote->text );
      SetEditorDescription( ch, "Player comment" );
      return;
    }

  if ( !StrCmp( arg, "subject" ) )
    {
      note_attach( ch );
      FreeMemory( ch->pcdata->pnote->subject );
      ch->pcdata->pnote->subject = CopyString( argument );
      send_to_char( "Ok.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg, "to" ) )
    {
      note_attach( ch );
      FreeMemory( ch->pcdata->pnote->to_list );
      ch->pcdata->pnote->to_list = CopyString( argument );
      send_to_char( "Ok.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg, "clear" ) )
    {
      if ( ch->pcdata->pnote )
        {
          FreeMemory( ch->pcdata->pnote->text );
          FreeMemory( ch->pcdata->pnote->subject );
          FreeMemory( ch->pcdata->pnote->to_list );
          FreeMemory( ch->pcdata->pnote->date );
          FreeMemory( ch->pcdata->pnote->sender );
          FreeMemory( ch->pcdata->pnote );
        }
      ch->pcdata->pnote = NULL;

      send_to_char( "Ok.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg, "show" ) )
    {
      if ( !ch->pcdata->pnote )
        {
          send_to_char( "You have no comment in progress.\r\n", ch );
          return;
        }

      sprintf( buf, "%s: %s\r\nTo: %s\r\n",
               ch->pcdata->pnote->sender,
               ch->pcdata->pnote->subject,
               ch->pcdata->pnote->to_list
               );
      send_to_char( buf, ch );
      send_to_char( ch->pcdata->pnote->text, ch );
      return;
    }

  if ( !StrCmp( arg, "post" ) )
    {
      char *strtime;

      if ( !ch->pcdata->pnote )
        {
          send_to_char( "You have no comment in progress.\r\n", ch );
          return;
        }

      argument = OneArgument(argument, arg1);
      victim = get_char_world(ch, arg1);
      if (!victim)
        {
          send_to_char("They're not logged on!\r\n", ch);   /* maybe fix this? */
          return;
        }

      if ( IsNpc(victim) )
        {
          send_to_char("No comments about mobs\r\n", ch);
          return;
        }

      if (  GetTrustLevel(victim) > GetTrustLevel( ch ) )
        {
          send_to_char( "You're not of the right caliber to do this...\r\n", ch );
          return;
        }

      /* act( AT_ACTION, "$n posts a note.", ch, NULL, NULL, TO_ROOM ); */

      strtime                           = ctime( &current_time );
      strtime[strlen(strtime)-1]        = '\0';
      ch->pcdata->pnote->date                   = CopyString( strtime );

      pnote             = ch->pcdata->pnote;
      ch->pcdata->pnote = NULL;


      /* LIFO to make life easier */
      pnote->next = victim->pcdata->comments;
      if (victim->pcdata->comments)
        victim->pcdata->comments->prev = pnote;
      pnote->prev = NULL;
      victim->pcdata->comments = pnote;

      save_char_obj(victim);


#ifdef NOTDEFD
      sprintf( notefile, "%s/%s", BOARD_DIR, board->note_file );

      if ( ( fp = fopen( notefile, "a" ) ) == NULL )
        {
          perror( notefile );
        }
      else
        {
          fprintf( fp, "Sender  %s~\nDate    %s~\nTo      %s~\nSubject %s~\nText\n%s~\n\n",
                   pnote->sender,
                   pnote->date,
                   pnote->to_list,
                   pnote->subject,
                   pnote->text
                   );
          fclose( fp );
        }
#endif

      send_to_char( "Ok.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg, "remove" ) )
    {
      argument = OneArgument(argument, arg1);
      victim = get_char_world(ch, arg1);
      if (!victim)
        {
          send_to_char("They're not logged on!\r\n", ch);   /* maybe fix this? */
          return;
        }

      if ( IsNpc(victim) )
        {
          send_to_char("No comments about mobs\r\n", ch);
          return;
        }

      if (  (GetTrustLevel(victim) >= GetTrustLevel( ch ) )
            || ( GetTrustLevel( ch ) < 58                ) )   /* switch to some LEVEL_ thingie */
        {
          send_to_char( "You're not of the right caliber to do this...\r\n", ch );
          return;
        }

      /*argument = OneArgument(argument, arg); */
      if ( !IsNumber( argument ) )
        {
          send_to_char( "Comment remove which number?\r\n", ch );
          return;
        }

      anum = atoi( argument );
      noteNumber = 0;

      for ( pnote = victim->pcdata->comments; pnote; pnote = pnote->next )
        {
          noteNumber++;

          if ( ( 58 <= GetTrustLevel( ch ) )    /* switch to some LEVEL_ thingie */
               &&   ( noteNumber == anum ) )
            {
              comment_remove( ch, victim, pnote );
              send_to_char( "Ok.\r\n", ch );
              /* act( AT_ACTION, "$n removes a note.", ch, NULL, NULL, TO_ROOM ); */
              return;
            }
        }

      send_to_char( "No such comment.\r\n", ch );
      return;
    }

  send_to_char( "Huh? Type 'help comment' for usage.\r\n", ch );
}


void fwrite_comments( Character *ch, FILE *fp )
{
  NOTE_DATA *pnote = NULL;

  if( !ch->pcdata || !ch->pcdata->comments)
    return;

  for(pnote=ch->pcdata->comments;pnote;pnote=pnote->next)
    {
      fprintf( fp,"#COMMENT\n" );
      fprintf( fp,"sender       %s~\n",pnote->sender);
      fprintf( fp,"date         %s~\n",pnote->date);
      fprintf( fp,"to           %s~\n",pnote->to_list);
      fprintf( fp,"subject      %s~\n",pnote->subject);
      fprintf( fp,"text\n%s~\n",pnote->text);
    }
}

void fread_comment( Character *ch, FILE *fp )
{
  NOTE_DATA *pnote;

  if( IsNpc( ch ) )
    return;

  for ( ; ; )
    {
      char letter;

      do
        {
          letter = getc( fp );
          if ( feof(fp) )
            {
              fclose( fp );
              return;
            }
        }
      while ( isspace(letter) );
      ungetc( letter, fp );

      AllocateMemory( pnote, NOTE_DATA, 1 );

      if ( StrCmp( ReadWord( fp ), "sender" ) )
        break;
      pnote->sender     = ReadStringToTilde( fp );

      if ( StrCmp( ReadWord( fp ), "date" ) )
        break;
      pnote->date       = ReadStringToTilde( fp );

      if ( StrCmp( ReadWord( fp ), "to" ) )
        break;
      pnote->to_list    = ReadStringToTilde( fp );

      if ( StrCmp( ReadWord( fp ), "subject" ) )
        break;
      pnote->subject    = ReadStringToTilde( fp );

      if ( StrCmp( ReadWord( fp ), "text" ) )
        break;
      pnote->text       = ReadStringToTilde( fp );

      pnote->next               = ch->pcdata->comments;
      pnote->prev               = NULL;
      ch->pcdata->comments              = pnote;
      return;
    }

  bug( "fread_comment: bad key word. strap in!", 0 );
  /* exit( 1 ); */
}




/*
  <758hp 100m 690mv> <#10316> loadup boo
  Log: Haus: loadup boo
  Log: Reading in player data for: Boo
  Done.
  <758hp 100m 690mv> <#10316> poke boo
  You poke him in the ribs.
  <758hp 100m 690mv> <#10316> comment subject boo's a nutcase!
  Ok.
  <758hp 100m 690mv> <#10316> comment to all
  Ok.
  <758hp 100m 690mv> <#10316> comment write
  Begin entering your text now (/? = help /s = save /c = clear /l = list)
  -----------------------------------------------------------------------
  > He transed shimmy to temple square!
  > /s
  Done.
  <758hp 100m 690mv> <#10316> comment post boo
  Ok.
  <758hp 100m 690mv> <#10316> comment list boo
  1) Haus: boo's a nutcase!
  <758hp 100m 690mv> <#10316> comment read boo 1
  [  1] Haus: boo's a nutcase!
  Sun Jun 25 18:26:54 1995
  To: all
  He transed shimmy to temple square!
  <758hp 100m 690mv> <#10316> comment remove boo 1
  Ok.
  <758hp 100m 690mv> <#10316> comment list boo
  There are no relevent comments.
*/
