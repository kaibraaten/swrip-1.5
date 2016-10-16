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
 *  Note *      comments;   (* inside char_data definition *)
 *  DECLARE_CMD_FUN( do_comment      );
 *
 *                2) Add do_comment to interp.c, as usual
 *
 *                3) in save.c the following must be added
 *
 * save.c:107:     if ( ch->PCData->Comments )                                              (* saves comments *)
 * save.c:108:       fwrite_comments( ch, fp );                                           (*  in file *)
 *
 *
 * save.c:411:    ch->PCData->Comments                        = NULL;                   (* nulls ch->PCData->Comments *)
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

static void RemoveComment( Character *ch, Character *victim, Note *pnote );

static void RemoveComment( Character *ch, Character *victim, Note *pnote )
{
  if ( IsNpc( victim ) )
    {
      Bug( "comment remove: NPC", 0 );
      return;
    }
  if ( !victim->PCData->Comments )
    {
      Bug( "comment remove: null board", 0 );
      return;
    }

  if ( !pnote )
    {
      Bug( "comment remove: null pnote", 0 );
      return;
    }

  /*
   * Remove comment from linked list.
   */
  if ( !pnote->Previous )
    victim->PCData->Comments    = pnote->Next;
  else
    pnote->Previous->Next = pnote->Next;

  FreeMemory( pnote->text    );
  FreeMemory( pnote->subject );
  FreeMemory( pnote->to_list );
  FreeMemory( pnote->date    );
  FreeMemory( pnote->sender  );
  FreeMemory( pnote );

  /*
   * Rewrite entire list.
   */
  SaveCharacter(victim);
}

void do_comment( Character *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  char arg[MAX_INPUT_LENGTH];
  char arg1[MAX_INPUT_LENGTH];
  Note *pnote = NULL;
  Character *victim = NULL;
  int noteNumber = 0;
  int anum = 0;

  if ( IsNpc(ch) )
    {
      SendToCharacter("Mobs can't use the comment command.\r\n", ch);
      return;
    }

  if ( !ch->Desc )
    {
      Bug( "do_comment: no descriptor", 0 );
      return;
    }

  /* Put in to prevent crashing when someone issues a comment command
     from within the editor. -Narn */
  if ( ch->Desc->ConnectionState == CON_EDITING )
    {
      SendToCharacter("You can't use the comment command from within the editor.\r\n", ch);
      return;
    }

  switch( ch->SubState )
    {
    default:
      break;
    case SUB_WRITING_NOTE:

      if ( !ch->PCData->Note )
        {
          Bug( "do_comment: note got lost?", 0 );
          SendToCharacter( "Your note got lost!\r\n", ch );
          StopEditing(ch);
          return;
        }
      if ( ch->dest_buf != ch->PCData->Note )
        Bug( "do_comment: sub_writing_note: ch->dest_buf != ch->pnote", 0 );
      FreeMemory( ch->PCData->Note->text );
      ch->PCData->Note->text = CopyBuffer( ch );
      StopEditing( ch );
      return;
    }

  SetCharacterColor( AT_NOTE, ch );
  argument = OneArgument( argument, arg );
  SmashTilde( argument );

  if ( !StrCmp( arg, "about" ) )
    {
      victim = GetCharacterAnywhere(ch, argument);

      if (!victim)
        {
          SendToCharacter("They're not logged on!\r\n", ch);   /* maybe fix this? */
          return;
        }

      if ( IsNpc(victim) )
        {
          SendToCharacter("No comments about mobs\r\n", ch);
          return;
        }
    }


  if ( !StrCmp( arg, "list" ) )
    {
      victim = GetCharacterAnywhere(ch, argument);

      if (!victim)
        {
          SendToCharacter("They're not logged on!\r\n", ch);   /* maybe fix this? */
          return;
        }

      if ( IsNpc(victim) )
        {
          SendToCharacter("No comments about mobs\r\n", ch);
          return;
        }

      if ( GetTrustLevel(victim) >= GetTrustLevel( ch ) )
        {
          SendToCharacter( "You're not of the right caliber to do this...\r\n", ch );
          return;
        }

      if ( !victim->PCData->Comments )
        {
          SendToCharacter( "There are no relevant comments.\r\n", ch );
          return;
        }

      for ( pnote = victim->PCData->Comments; pnote; pnote = pnote->Next )
        {
          noteNumber++;
          sprintf( buf, "%2d) %-10s [%s] %s\r\n",
                   noteNumber,
                   pnote->sender,
                   pnote->date,
                   pnote->subject );
          /* Brittany added date to comment list and whois with above change */
          SendToCharacter( buf, ch );
        }

      /* Act( AT_ACTION, "$n glances over the notes.", ch, NULL, NULL, TO_ROOM ); */
      return;
    }

  if ( !StrCmp( arg, "read" ) )
    {
      bool fAll = false;

      argument = OneArgument( argument, arg1 );
      victim = GetCharacterAnywhere(ch, arg1);

      if (!victim)
        {
          SendToCharacter("They're not logged on!\r\n", ch);   /* maybe fix this? */
          return;
        }

      if ( IsNpc(victim) )
        {
          SendToCharacter("No comments about mobs\r\n", ch);
          return;
        }

      if ( GetTrustLevel(victim) >= GetTrustLevel( ch ) )
        {
          SendToCharacter( "You're not of the right caliber to do this...\r\n", ch );
          return;
        }

      if ( !victim->PCData->Comments )
        {
          SendToCharacter( "There are no relevant comments.\r\n", ch );
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
	  SendToCharacter( "Note read which number?\r\n", ch );
	  return;
	}

      noteNumber = 0;

      for ( pnote = victim->PCData->Comments; pnote; pnote = pnote->Next )
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
              SendToCharacter( buf, ch );
              SendToCharacter( pnote->text, ch );
              /* Act( AT_ACTION, "$n reads a note.", ch, NULL, NULL, TO_ROOM ); */
              return;
            }
        }

      SendToCharacter( "No such comment.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg, "write" ) )
    {
      AttachNote( ch );
      ch->SubState = SUB_WRITING_NOTE;
      ch->dest_buf = ch->PCData->Note;
      StartEditing( ch, ch->PCData->Note->text );
      SetEditorDescription( ch, "Player comment" );
      return;
    }

  if ( !StrCmp( arg, "subject" ) )
    {
      AttachNote( ch );
      FreeMemory( ch->PCData->Note->subject );
      ch->PCData->Note->subject = CopyString( argument );
      SendToCharacter( "Ok.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg, "to" ) )
    {
      AttachNote( ch );
      FreeMemory( ch->PCData->Note->to_list );
      ch->PCData->Note->to_list = CopyString( argument );
      SendToCharacter( "Ok.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg, "clear" ) )
    {
      if ( ch->PCData->Note )
        {
          FreeMemory( ch->PCData->Note->text );
          FreeMemory( ch->PCData->Note->subject );
          FreeMemory( ch->PCData->Note->to_list );
          FreeMemory( ch->PCData->Note->date );
          FreeMemory( ch->PCData->Note->sender );
          FreeMemory( ch->PCData->Note );
        }
      ch->PCData->Note = NULL;

      SendToCharacter( "Ok.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg, "show" ) )
    {
      if ( !ch->PCData->Note )
        {
          SendToCharacter( "You have no comment in progress.\r\n", ch );
          return;
        }

      sprintf( buf, "%s: %s\r\nTo: %s\r\n",
               ch->PCData->Note->sender,
               ch->PCData->Note->subject,
               ch->PCData->Note->to_list
               );
      SendToCharacter( buf, ch );
      SendToCharacter( ch->PCData->Note->text, ch );
      return;
    }

  if ( !StrCmp( arg, "post" ) )
    {
      char *strtime;

      if ( !ch->PCData->Note )
        {
          SendToCharacter( "You have no comment in progress.\r\n", ch );
          return;
        }

      argument = OneArgument(argument, arg1);
      victim = GetCharacterAnywhere(ch, arg1);
      if (!victim)
        {
          SendToCharacter("They're not logged on!\r\n", ch);   /* maybe fix this? */
          return;
        }

      if ( IsNpc(victim) )
        {
          SendToCharacter("No comments about mobs\r\n", ch);
          return;
        }

      if (  GetTrustLevel(victim) > GetTrustLevel( ch ) )
        {
          SendToCharacter( "You're not of the right caliber to do this...\r\n", ch );
          return;
        }

      /* Act( AT_ACTION, "$n posts a note.", ch, NULL, NULL, TO_ROOM ); */

      strtime                           = ctime( &current_time );
      strtime[strlen(strtime)-1]        = '\0';
      ch->PCData->Note->date                   = CopyString( strtime );

      pnote             = ch->PCData->Note;
      ch->PCData->Note = NULL;


      /* LIFO to make life easier */
      pnote->Next = victim->PCData->Comments;

      if (victim->PCData->Comments)
        victim->PCData->Comments->Previous = pnote;

      pnote->Previous = NULL;
      victim->PCData->Comments = pnote;

      SaveCharacter(victim);


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

      SendToCharacter( "Ok.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg, "remove" ) )
    {
      argument = OneArgument(argument, arg1);
      victim = GetCharacterAnywhere(ch, arg1);
      if (!victim)
        {
          SendToCharacter("They're not logged on!\r\n", ch);   /* maybe fix this? */
          return;
        }

      if ( IsNpc(victim) )
        {
          SendToCharacter("No comments about mobs\r\n", ch);
          return;
        }

      if ( ( GetTrustLevel(victim) >= GetTrustLevel( ch ) )
            || !IsGreater( ch ) )
        {
          SendToCharacter( "You're not of the right caliber to do this...\r\n", ch );
          return;
        }

      /*argument = OneArgument(argument, arg); */
      if ( !IsNumber( argument ) )
        {
          SendToCharacter( "Comment remove which number?\r\n", ch );
          return;
        }

      anum = atoi( argument );
      noteNumber = 0;

      for ( pnote = victim->PCData->Comments; pnote; pnote = pnote->Next )
        {
          noteNumber++;

          if ( IsGreater( ch ) && noteNumber == anum )
            {
              RemoveComment( ch, victim, pnote );
              SendToCharacter( "Ok.\r\n", ch );
              return;
            }
        }

      SendToCharacter( "No such comment.\r\n", ch );
      return;
    }

  SendToCharacter( "Huh? Type 'help comment' for usage.\r\n", ch );
}


void WriteComments( const Character *ch, FILE *fp )
{
  Note *pnote = NULL;

  if( !ch->PCData || !ch->PCData->Comments)
    return;

  for(pnote=ch->PCData->Comments;pnote;pnote=pnote->Next)
    {
      fprintf( fp,"#COMMENT\n" );
      fprintf( fp,"sender       %s~\n",pnote->sender);
      fprintf( fp,"date         %s~\n",pnote->date);
      fprintf( fp,"to           %s~\n",pnote->to_list);
      fprintf( fp,"subject      %s~\n",pnote->subject);
      fprintf( fp,"text\n%s~\n",pnote->text);
    }
}

void ReadComment( Character *ch, FILE *fp )
{
  if( IsNpc( ch ) )
    return;

  for ( ; ; )
    {
      char letter;
      Note *pnote = NULL;

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

      AllocateMemory( pnote, Note, 1 );

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

      pnote->Next               = ch->PCData->Comments;
      pnote->Previous           = NULL;
      ch->PCData->Comments              = pnote;
      return;
    }

  Bug( "%s: bad key word. strap in!", __FUNCTION__ );
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
