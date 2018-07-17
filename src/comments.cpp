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

/*  INSTALLATION: 1) Add following stuff to mud.hpp
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
#include <cctype>
#include <cstdio>
#include <cstring>
#include <ctime>
#include <cassert>
#include "editor.hpp"
#include "mud.hpp"
#include "character.hpp"
#include "board.hpp"
#include "pcdata.hpp"

static void RemoveComment( Character *ch, Character *victim, Note *pnote );

static void RemoveComment( Character *ch, Character *victim, Note *pnote )
{
  if ( IsNpc( victim ) )
    {
      Bug( "comment remove: NPC", 0 );
      return;
    }

  assert(victim->PCData->Comments != NULL);
  assert(pnote != NULL);

  /*
   * Remove comment from linked list.
   */
  RemoveFromList(victim->PCData->Comments, pnote);
  FreeNote(pnote, NULL);

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
      FreeMemory( ch->PCData->Note->Text );
      ch->PCData->Note->Text = CopyBuffer( ch );
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
      ListIterator *iterator = NULL;
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

      if ( ListSize(victim->PCData->Comments) == 0 )
        {
          SendToCharacter( "There are no relevant comments.\r\n", ch );
          return;
        }

      iterator = AllocateListIterator(victim->PCData->Comments);

      while(ListHasMoreElements(iterator))
        {
          pnote = (Note*) GetListData(iterator);
          MoveToNextListElement(iterator);
          noteNumber++;
          sprintf( buf, "%2d) %-10s [%s] %s\r\n",
                   noteNumber,
                   pnote->Sender,
                   pnote->Date,
                   pnote->Subject );
          /* Brittany added date to comment list and whois with above change */
          SendToCharacter( buf, ch );
        }

      FreeListIterator(iterator);
      /* Act( AT_ACTION, "$n glances over the notes.", ch, NULL, NULL, TO_ROOM ); */
      return;
    }

  if ( !StrCmp( arg, "read" ) )
    {
      bool fAll = false;
      ListIterator *iterator = NULL;

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

      if ( ListSize(victim->PCData->Comments) == 0 )
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
      iterator = AllocateListIterator(victim->PCData->Comments);

      while(ListHasMoreElements(iterator))
        {
          pnote = (Note*) GetListData(iterator);
          MoveToNextListElement(iterator);
          noteNumber++;

          if ( noteNumber == anum || fAll )
            {
              sprintf( buf, "[%3d] %s: %s\r\n%s\r\nTo: %s\r\n",
                       noteNumber,
                       pnote->Sender,
                       pnote->Subject,
                       pnote->Date,
                       pnote->ToList
                       );
              SendToCharacter( buf, ch );
              SendToCharacter( pnote->Text, ch );
              /* Act( AT_ACTION, "$n reads a note.", ch, NULL, NULL, TO_ROOM ); */
              FreeListIterator(iterator);
              return;
            }
        }

      FreeListIterator(iterator);
      SendToCharacter( "No such comment.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg, "write" ) )
    {
      AttachNote( ch );
      ch->SubState = SUB_WRITING_NOTE;
      ch->dest_buf = ch->PCData->Note;
      StartEditing( ch, ch->PCData->Note->Text );
      SetEditorDescription( ch, "Player comment" );
      return;
    }

  if ( !StrCmp( arg, "subject" ) )
    {
      AttachNote( ch );
      FreeMemory( ch->PCData->Note->Subject );
      ch->PCData->Note->Subject = CopyString( argument );
      SendToCharacter( "Ok.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg, "to" ) )
    {
      AttachNote( ch );
      FreeMemory( ch->PCData->Note->ToList );
      ch->PCData->Note->ToList = CopyString( argument );
      SendToCharacter( "Ok.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg, "clear" ) )
    {
      if ( ch->PCData->Note )
        {
          FreeMemory( ch->PCData->Note->Text );
          FreeMemory( ch->PCData->Note->Subject );
          FreeMemory( ch->PCData->Note->ToList );
          FreeMemory( ch->PCData->Note->Date );
          FreeMemory( ch->PCData->Note->Sender );
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
               ch->PCData->Note->Sender,
               ch->PCData->Note->Subject,
               ch->PCData->Note->ToList
               );
      SendToCharacter( buf, ch );
      SendToCharacter( ch->PCData->Note->Text, ch );
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
      ch->PCData->Note->Date                   = CopyString( strtime );

      pnote             = ch->PCData->Note;
      ch->PCData->Note = NULL;
      AddToList(victim->PCData->Comments, pnote);

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
                   pnote->Sender,
                   pnote->Date,
                   pnote->ToList,
                   pnote->Subject,
                   pnote->Text
                   );
          fclose( fp );
        }
#endif

      SendToCharacter( "Ok.\r\n", ch );
      return;
    }

  if ( !StrCmp( arg, "remove" ) )
    {
      ListIterator *iterator = NULL;
      bool found = false;
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
      iterator = AllocateListIterator(victim->PCData->Comments);

      while(ListHasMoreElements(iterator))
        {
          pnote = (Note*) GetListData(iterator);
          MoveToNextListElement(iterator);
          noteNumber++;

          if ( IsGreater( ch ) && noteNumber == anum )
            {
              RemoveComment( ch, victim, pnote );
              SendToCharacter( "Ok.\r\n", ch );
              found = true;
              break;
            }
        }

      FreeListIterator(iterator);

      if(!found)
        {
          SendToCharacter( "No such comment.\r\n", ch );
        }

      return;
    }

  SendToCharacter( "Huh? Type 'help comment' for usage.\r\n", ch );
}

static void WriteToFile(Note *pnote, FILE *fp)
{
  fprintf( fp,"#COMMENT\n" );
  fprintf( fp,"sender       %s~\n",pnote->Sender);
  fprintf( fp,"date         %s~\n",pnote->Date);
  fprintf( fp,"to           %s~\n",pnote->ToList);
  fprintf( fp,"subject      %s~\n",pnote->Subject);
  fprintf( fp,"text\n%s~\n",pnote->Text);
}

void WriteComments( const Character *ch, FILE *fp )
{
  assert(ch->PCData != NULL);
  assert(ch->PCData->Comments != NULL);

  ForEachInList(ch->PCData->Comments, (ForEachFunc*)WriteToFile, fp);
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

      pnote->Sender     = ReadStringToTilde( fp );

      if ( StrCmp( ReadWord( fp ), "date" ) )
        break;

      pnote->Date       = ReadStringToTilde( fp );

      if ( StrCmp( ReadWord( fp ), "to" ) )
        break;

      pnote->ToList    = ReadStringToTilde( fp );

      if ( StrCmp( ReadWord( fp ), "subject" ) )
        break;

      pnote->Subject    = ReadStringToTilde( fp );

      if ( StrCmp( ReadWord( fp ), "text" ) )
        break;

      pnote->Text       = ReadStringToTilde( fp );

      AddToList(ch->PCData->Comments, pnote);
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
