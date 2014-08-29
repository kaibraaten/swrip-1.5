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
#include <time.h>
#include <string.h>
#include "character.h"
#include "mud.h"
#include "editor.h"
#include "clan.h"

/* Defines for voting on notes. -- Narn */
#define VOTE_NONE 0
#define VOTE_OPEN 1
#define VOTE_CLOSED 2

Board *first_board = NULL;
Board *last_board = NULL;

static bool IsNoteTo( const Character *ch, const Note *pnote );
static void RemoveNote( Board *board, Note *pnote );
static bool CanRemove( const Character *ch, const Board *board );
static bool CanRead( const Character *ch, const Board *board );
static bool CanPost( const Character *ch, const Board *board );
static Object *FindQuill( const Character *ch );
static void WriteBoard( const Board *board );
static Board *ReadBoard( char *boardfile, FILE *fp );
static Note *ReadNote( const char *notefile, FILE *fp );

static bool CanRemove( const Character *ch, const Board *board )
{
  /* If your trust is high enough, you can remove it. */
  if ( GetTrustLevel( ch ) >= board->min_remove_level )
    return true;

  if ( board->extra_removers[0] != '\0' )
    {
      if ( IsName( ch->name, board->extra_removers ) )
        return true;
    }

  return false;
}

static bool CanRead( const Character *ch, const Board *board )
{
  /* If your trust is high enough, you can read it. */
  if ( GetTrustLevel( ch ) >= board->min_read_level )
    return true;

  /* Your trust wasn't high enough, so check if a read_group or extra
     readers have been set up. */
  if ( board->read_group[0] != '\0' )
    {
      if ( ch->pcdata->ClanInfo.Clan
	   && !StrCmp( ch->pcdata->ClanInfo.Clan->name, board->read_group ) )
        return true;

      if ( ch->pcdata->ClanInfo.Clan
	   && ch->pcdata->ClanInfo.Clan->mainclan
	   && !StrCmp( ch->pcdata->ClanInfo.Clan->mainclan->name, board->read_group ) )
        return true;

    }

  if ( board->extra_readers[0] != '\0' )
    {
      if ( IsName( ch->name, board->extra_readers ) )
        return true;
    }

  return false;
}

static bool CanPost( const Character *ch, const Board *board )
{
  /* If your trust is high enough, you can post. */
  if ( GetTrustLevel( ch ) >= board->min_post_level )
    return true;

  /* Your trust wasn't high enough, so check if a post_group has been set up. */
  if ( board->post_group[0] != '\0' )
    {
      if ( ch->pcdata->ClanInfo.Clan
	   && !StrCmp( ch->pcdata->ClanInfo.Clan->name, board->post_group ) )
        return true;

      if ( ch->pcdata->ClanInfo.Clan
	   && ch->pcdata->ClanInfo.Clan->mainclan
	   && !StrCmp( ch->pcdata->ClanInfo.Clan->mainclan->name, board->post_group ) )
        return true;
    }

  return false;
}

/*
 * board commands.
 */
void WriteBoardFile( void )
{
  const Board *tboard = NULL;
  FILE *fpout = NULL;
  char filename[256];

  sprintf( filename, "%s%s", BOARD_DIR, BOARD_FILE );
  fpout = fopen( filename, "w" );

  if ( !fpout )
    {
      Bug( "FATAL: cannot open board.txt for writing!\r\n", 0 );
      return;
    }

  for ( tboard = first_board; tboard; tboard = tboard->next )
    {
      fprintf( fpout, "Filename          %s~\n", tboard->note_file        );
      fprintf( fpout, "Vnum              %ld\n", tboard->board_obj        );
      fprintf( fpout, "Min_read_level    %d\n",  tboard->min_read_level   );
      fprintf( fpout, "Min_post_level    %d\n",  tboard->min_post_level   );
      fprintf( fpout, "Min_remove_level  %d\n",  tboard->min_remove_level );
      fprintf( fpout, "Max_posts         %d\n",  tboard->max_posts        );
      fprintf( fpout, "Type              %d\n",  tboard->type             );
      fprintf( fpout, "Read_group        %s~\n", tboard->read_group       );
      fprintf( fpout, "Post_group        %s~\n", tboard->post_group       );
      fprintf( fpout, "Extra_readers     %s~\n", tboard->extra_readers    );
      fprintf( fpout, "Extra_removers    %s~\n", tboard->extra_removers   );

      fprintf( fpout, "End\n" );
    }

  fclose( fpout );
}

Board *GetBoardFromObject( const Object *obj )
{
  Board *board = NULL;

  for ( board = first_board; board; board = board->next )
    {
      if ( board->board_obj == obj->Prototype->vnum )
	{
	  return board;
	}
    }

  return NULL;
}

static bool IsNoteTo( const Character *ch, const Note *pnote )
{
  if ( !StrCmp( ch->name, pnote->sender ) )
    return true;

  if ( IsName( "all", pnote->to_list ) )
    return true;

  if ( IsAvatar(ch) && IsName( "immortal", pnote->to_list ) )
    return true;

  if ( IsName( ch->name, pnote->to_list ) )
    return true;

  return false;
}

void AttachNote( Character *ch )
{
  Note *pnote = NULL;

  if ( IsNpc( ch ) )
    return;

  if ( ch->pcdata->pnote )
    return;

  AllocateMemory( pnote, Note, 1 );
  pnote->sender = CopyString( ch->name );
  pnote->date           = CopyString( "" );
  pnote->to_list        = CopyString( "" );
  pnote->subject        = CopyString( "" );
  pnote->text           = CopyString( "" );
  ch->pcdata->pnote     = pnote;
}

static void WriteBoard( const Board *board )
{
  FILE *fp = NULL;
  char filename[256];
  const Note *pnote = NULL;

  /*
   * Rewrite entire list.
   */
  sprintf( filename, "%s%s", BOARD_DIR, board->note_file );

  if ( ( fp = fopen( filename, "w" ) ) == NULL )
    {
      perror( filename );
    }
  else
    {
      for ( pnote = board->first_note; pnote; pnote = pnote->next )
        {
          fprintf( fp, "Sender  %s~\nDate    %s~\nTo      %s~\nSubject %s~\nVoting %d\nYesvotes %s~\nNovotes %s~\nAbstentions %s~\nText\n%s~\n\n",
                   pnote->sender,
                   pnote->date,
                   pnote->to_list,
                   pnote->subject,
                   pnote->voting,
                   pnote->yesvotes,
                   pnote->novotes,
                   pnote->abstentions,
                   pnote->text
                   );
        }

      fclose( fp );
    }
}


void FreeNote( Note *pnote )
{
  FreeMemory( pnote->text    );
  FreeMemory( pnote->subject );
  FreeMemory( pnote->to_list );
  FreeMemory( pnote->date    );
  FreeMemory( pnote->sender  );

  if ( pnote->yesvotes )
    FreeMemory( pnote->yesvotes );

  if ( pnote->novotes )
    FreeMemory( pnote->novotes );

  if ( pnote->abstentions )
    FreeMemory( pnote->abstentions );

  FreeMemory( pnote );
}

static void RemoveNote( Board *board, Note *pnote )
{
  if ( !board )
    {
      Bug( "note remove: null board", 0 );
      return;
    }

  if ( !pnote )
    {
      Bug( "note remove: null pnote", 0 );
      return;
    }

  /*
   * Remove note from linked list.
   */
  UNLINK( pnote, board->first_note, board->last_note, next, prev );

  --board->num_posts;
  FreeNote( pnote );
  WriteBoard( board );
}


static Object *FindQuill( const Character *ch )
{
  Object *quill = false;

  for ( quill = ch->last_carrying; quill; quill = quill->prev_content )
    if ( quill->item_type == ITEM_PEN
         && CanSeeObject( ch, quill ) )
      return quill;

  return quill;
}

void OperateOnNote( Character *ch, char *arg_passed, bool IS_MAIL )
{
  char buf[MAX_STRING_LENGTH];
  char arg[MAX_INPUT_LENGTH];
  Note  *pnote = NULL;
  Board *board = NULL;
  vnum_t vnum = INVALID_VNUM;
  int anum = 0;
  int first_list = 0;
  Object *quill = NULL, *paper = NULL, *tmpobj = NULL;
  ExtraDescription *ed = NULL;
  char notebuf[MAX_STRING_LENGTH];
  char short_desc_buf[MAX_STRING_LENGTH];
  char long_desc_buf[MAX_STRING_LENGTH];
  char keyword_buf[MAX_STRING_LENGTH];
  bool mfound = false;
  bool wasfound = false;

  if ( IsNpc(ch) )
    return;

  if ( !ch->desc )
    {
      Bug( "%s: no descriptor", __FUNCTION__ );
      return;
    }

  switch( ch->substate )
    {
    default:
      break;

    case SUB_WRITING_NOTE:
      if ( ( paper = GetEquipmentOnCharacter(ch, WEAR_HOLD) ) == NULL
           ||     paper->item_type != ITEM_PAPER )
        {
          Bug("%s: player not holding paper", __FUNCTION__);
          StopEditing( ch );
          return;
        }

      ed = (ExtraDescription*)ch->dest_buf;
      FreeMemory( ed->description );
      ed->description = CopyBuffer( ch );
      StopEditing( ch );
      return;
    }

  SetCharacterColor( AT_NOTE, ch );
  arg_passed = OneArgument( arg_passed, arg );
  SmashTilde( arg_passed );

  if ( !StrCmp( arg, "list" ) )
    {
      board = FindBoardHere( ch );
      if ( !board )
        {
          SendToCharacter( "There is no board here to look at.\r\n", ch );
          return;
        }
      if ( !CanRead( ch, board ) )
        {
          SendToCharacter( "You cannot make any sense of the cryptic scrawl on this board...\r\n", ch );
          return;
        }

      first_list = atoi(arg_passed);
      if (first_list)
        {
          if (IS_MAIL)
            {
              SendToCharacter( "You cannot use a list number (at this time) with mail.\r\n", ch);
              return;
            }

          if (first_list < 1)
            {
              SendToCharacter( "You can't read a message before 1!\r\n", ch);
              return;
            }
        }


      if (!IS_MAIL)
        {
          vnum = INVALID_VNUM;
          SetPagerColor( AT_NOTE, ch );
          for ( pnote = board->first_note; pnote; pnote = pnote->next )
            {
              vnum++;
              if ( (first_list && vnum >= first_list) || !first_list )
                PagerPrintf( ch, "%2d%c %-12s%c %-12s %s\r\n",
                              vnum,
                              IsNoteTo( ch, pnote ) ? ')' : '}',
                              pnote->sender,
                              (pnote->voting != VOTE_NONE) ? (pnote->voting == VOTE_OPEN ? 'V' : 'C') : ':',
                              pnote->to_list,
                              pnote->subject );
            }
          Act( AT_ACTION, "$n glances over the messages.", ch, NULL, NULL, TO_ROOM );
          return;
        }
      else
        {
          vnum = INVALID_VNUM;


          if (IS_MAIL) /* SB Mail check for Brit */
            {
              for ( pnote = board->first_note; pnote; pnote = pnote->next )
                if (IsNoteTo( ch, pnote )) mfound = true;

              if ( !mfound && GetTrustLevel(ch) < sysdata.read_all_mail )
                {
                  Echo( ch, "You have no mail.\r\n");
                  return;
                }
            }

          for ( pnote = board->first_note; pnote; pnote = pnote->next )
            if (IsNoteTo( ch, pnote ) || GetTrustLevel(ch) > sysdata.read_all_mail)
              Echo( ch, "%2d%c %s: %s\r\n",
                         ++vnum,
                         IsNoteTo( ch, pnote ) ? '-' : '}',
                         pnote->sender,
                         pnote->subject );
          return;
        }
    }

  if ( !StrCmp( arg, "read" ) )
    {
      bool fAll;

      board = FindBoardHere( ch );
      if ( !board )
        {
          SendToCharacter( "There is no board here to look at.\r\n", ch );
          return;
        }
      if ( !CanRead( ch, board ) )
        {
          SendToCharacter( "You cannot make any sense of the cryptic scrawl on this board...\r\n", ch );
          return;
        }

      if ( !StrCmp( arg_passed, "all" ) )
        {
          fAll = true;
          anum = 0;
        }
      else
        if ( IsNumber( arg_passed ) )
          {
            fAll = false;
            anum = atoi( arg_passed );
          }
        else
          {
            SendToCharacter( "Note read which number?\r\n", ch );
            return;
          }

      SetPagerColor( AT_NOTE, ch );
      if (!IS_MAIL)
        {
          vnum = INVALID_VNUM;

          for ( pnote = board->first_note; pnote; pnote = pnote->next )
            {
              vnum++;

              if ( vnum == anum || fAll )
                {
                  wasfound = true;
                  PagerPrintf( ch, "[%3d] %s: %s\r\n%s\r\nTo: %s\r\n%s",
                                vnum,
                                pnote->sender,
                                pnote->subject,
                                pnote->date,
                                pnote->to_list,
                                pnote->text );

                  if ( pnote->yesvotes[0] != '\0' || pnote->novotes[0] != '\0'
                       || pnote->abstentions[0] != '\0' )
                    {
                      SendToPager( "------------------------------------------------------------\r\n", ch );
                      PagerPrintf( ch, "Votes:\r\nYes:     %s\r\nNo:      %s\r\nAbstain: %s\r\n",
                                    pnote->yesvotes, pnote->novotes, pnote->abstentions );
                    }
                  Act( AT_ACTION, "$n reads a message.", ch, NULL, NULL, TO_ROOM );
                }
            }
          if ( !wasfound )
            Echo( ch, "No such message: %d\r\n", anum);
          return;
        }
      else
        {
          vnum = INVALID_VNUM;

          for ( pnote = board->first_note; pnote; pnote = pnote->next )
            {
              if (IsNoteTo(ch, pnote) || GetTrustLevel(ch) > sysdata.read_all_mail)
                {
                  vnum++;
                  if ( vnum == anum || fAll )
                    {
                      wasfound = true;
                      if ( ch->gold < 10
                           &&   GetTrustLevel(ch) < sysdata.read_mail_free )
                        {
                          SendToCharacter("It costs 10 credits to read a message.\r\n", ch);
                          return;
                        }
                      if (GetTrustLevel(ch) < sysdata.read_mail_free)
                        ch->gold -= 10;
                      PagerPrintf( ch, "[%3d] %s: %s\r\n%s\r\nTo: %s\r\n%s",
                                    vnum,
                                    pnote->sender,
                                    pnote->subject,
                                    pnote->date,
                                    pnote->to_list,
                                    pnote->text );
                    }
                }
            }
          if (!wasfound)
            Echo( ch, "No such message: %d\r\n", anum);
          return;
        }
    }

  /* Voting added by Narn, June '96 */
  if ( !StrCmp( arg, "vote" ) )
    {
      char arg2[MAX_INPUT_LENGTH];
      arg_passed = OneArgument( arg_passed, arg2 );

      board = FindBoardHere( ch );
      if ( !board )
        {
          SendToCharacter( "There is no bulletin board here.\r\n", ch );
          return;
        }
      if ( !CanRead( ch, board ) )
        {
          SendToCharacter( "You cannot vote on this board.\r\n", ch );
          return;
        }

      if ( IsNumber( arg2 ) )
        anum = atoi( arg2 );
      else
        {
          SendToCharacter( "Note vote which number?\r\n", ch );
          return;
        }

      vnum = 1;

      for ( pnote = board->first_note; pnote && vnum < anum; pnote = pnote->next )
        vnum++;

      if ( !pnote )
        {
          SendToCharacter( "No such note.\r\n", ch );
          return;
        }

      /* Options: open close yes no abstain */
      /* If you're the author of the note and can read the board you can open
         and close voting, if you can read it and voting is open you can vote.
      */
      if ( !StrCmp( arg_passed, "open" ) )
        {
          if ( StrCmp( ch->name, pnote->sender ) )
            {
              SendToCharacter( "You are not the author of this message.\r\n", ch );
              return;
            }
          pnote->voting = VOTE_OPEN;
          Act( AT_ACTION, "$n opens voting on a note.", ch, NULL, NULL, TO_ROOM );
          SendToCharacter( "Voting opened.\r\n", ch );
          WriteBoard( board );
          return;
        }

      if ( !StrCmp( arg_passed, "close" ) )
        {
          if ( StrCmp( ch->name, pnote->sender ) )
            {
              SendToCharacter( "You are not the author of this message.\r\n", ch );
              return;
            }
          pnote->voting = VOTE_CLOSED;
          Act( AT_ACTION, "$n closes voting on a note.", ch, NULL, NULL, TO_ROOM );
          SendToCharacter( "Voting closed.\r\n", ch );
          WriteBoard( board );
          return;
        }

      /* Make sure the note is open for voting before going on. */
      if ( pnote->voting != VOTE_OPEN )
        {
          SendToCharacter( "Voting is not open on this note.\r\n", ch );
          return;
        }

      /* Can only vote once on a note. */
      sprintf( buf, "%s %s %s",
               pnote->yesvotes, pnote->novotes, pnote->abstentions );

      if ( IsName( ch->name, buf ) )
        {
          SendToCharacter( "You have already voted on this note.\r\n", ch );
          return;
        }

      if ( !StrCmp( arg_passed, "yes" ) )
        {
          sprintf( buf, "%s %s", pnote->yesvotes, ch->name );
          FreeMemory( pnote->yesvotes );
          pnote->yesvotes = CopyString( buf );
          Act( AT_ACTION, "$n votes on a note.", ch, NULL, NULL, TO_ROOM );
          SendToCharacter( "Ok.\r\n", ch );
          WriteBoard( board );
          return;
        }

      if ( !StrCmp( arg_passed, "no" ) )
        {
          sprintf( buf, "%s %s", pnote->novotes, ch->name );
          FreeMemory( pnote->novotes );
          pnote->novotes = CopyString( buf );
          Act( AT_ACTION, "$n votes on a note.", ch, NULL, NULL, TO_ROOM );
          SendToCharacter( "Ok.\r\n", ch );
          WriteBoard( board );
          return;
        }

      if ( !StrCmp( arg_passed, "abstain" ) )
        {
          sprintf( buf, "%s %s", pnote->abstentions, ch->name );
          FreeMemory( pnote->abstentions );
          pnote->abstentions = CopyString( buf );
          Act( AT_ACTION, "$n votes on a note.", ch, NULL, NULL, TO_ROOM );
          SendToCharacter( "Ok.\r\n", ch );
          WriteBoard( board );
          return;
        }

      OperateOnNote( ch, "", false );
    }

  if ( !StrCmp( arg, "write" ) )
    {
      if ( ch->substate == SUB_RESTRICTED )
        {
          SendToCharacter( "You cannot write a note from within another command.\r\n", ch );
          return;
        }
      if (GetTrustLevel (ch) < sysdata.write_mail_free)
        {
          quill = FindQuill( ch );
          if (!quill)
            {
              SendToCharacter("You need a datapad to record a message.\r\n", ch);
              return;
            }
          if ( quill->value[OVAL_PEN_INK_AMOUNT] < 1 )
            {
              SendToCharacter("Your quill is dry.\r\n", ch);
              return;
            }
        }
      if ( ( paper = GetEquipmentOnCharacter(ch, WEAR_HOLD) ) == NULL
           ||     paper->item_type != ITEM_PAPER )
        {
          if (GetTrustLevel(ch) < sysdata.write_mail_free )
            {
              SendToCharacter("You need to be holding a message disk to write a note.\r\n", ch);
              return;
            }
          paper = CreateObject( GetProtoObject(OBJ_VNUM_NOTE), 0 );
          if ((tmpobj = GetEquipmentOnCharacter(ch, WEAR_HOLD)) != NULL)
            UnequipCharacter(ch, tmpobj);
          paper = ObjectToCharacter(paper, ch);
          EquipCharacter(ch, paper, WEAR_HOLD);
          Act(AT_MAGIC, "$n grabs a message tisk to record a note.",
              ch, NULL, NULL, TO_ROOM);
          Act(AT_MAGIC, "You get a message disk to record your note.",
              ch, NULL, NULL, TO_CHAR);
        }

      if (paper->value[OVAL_PAPER_0] < 2 )
        {
          paper->value[OVAL_PAPER_0] = 1;
          ed = SetOExtra(paper, "_text_");
          ch->substate = SUB_WRITING_NOTE;
          ch->dest_buf = ed;

          if ( GetTrustLevel(ch) < sysdata.write_mail_free )
	    {
	      --quill->value[OVAL_PEN_INK_AMOUNT];
	    }

          StartEditing( ch, ed->description );
	  SetEditorDescription( ch, "Note" );
          return;
        }
      else
        {
          SendToCharacter("You cannot modify this message.\r\n", ch);
          return;
        }
    }

  if ( !StrCmp( arg, "subject" ) )
    {
      if(GetTrustLevel(ch) < sysdata.write_mail_free)
        {
          quill = FindQuill( ch );
          if ( !quill )
            {
              SendToCharacter("You need a datapad to record a disk.\r\n", ch);
              return;
            }
          if ( quill->value[OVAL_PEN_INK_AMOUNT] < 1 )
            {
              SendToCharacter("Your quill is dry.\r\n", ch);
              return;
            }
        }
      if (!arg_passed || arg_passed[0] == '\0')
        {
          SendToCharacter("What do you wish the subject to be?\r\n", ch);
          return;
        }
      if ( ( paper = GetEquipmentOnCharacter(ch, WEAR_HOLD) ) == NULL
           ||     paper->item_type != ITEM_PAPER )
        {
          if(GetTrustLevel(ch) < sysdata.write_mail_free )
            {
              SendToCharacter("You need to be holding a message disk to record a note.\r\n", ch);
              return;
            }
          paper = CreateObject( GetProtoObject(OBJ_VNUM_NOTE), 0 );
          if ((tmpobj = GetEquipmentOnCharacter(ch, WEAR_HOLD)) != NULL)
            UnequipCharacter(ch, tmpobj);
          paper = ObjectToCharacter(paper, ch);
          EquipCharacter(ch, paper, WEAR_HOLD);
          Act(AT_MAGIC, "$n grabs a message disk.",
              ch, NULL, NULL, TO_ROOM);
          Act(AT_MAGIC, "You get a message disk to record your note.",
              ch, NULL, NULL, TO_CHAR);
        }
      if (paper->value[OVAL_PAPER_0] > 1 )
        {
          SendToCharacter("You cannot modify this message.\r\n", ch);
          return;
        }
      else
        {
          paper->value[OVAL_PAPER_1] = 1;
          ed = SetOExtra(paper, "_subject_");
          FreeMemory( ed->description );
          ed->description = CopyString( arg_passed );
          SendToCharacter("Ok.\r\n", ch);
          return;
        }
    }

  if ( !StrCmp( arg, "to" ) )
    {
      struct stat fst;
      char fname[1024];
      if(GetTrustLevel(ch) < sysdata.write_mail_free )
        {
          quill = FindQuill( ch );
          if ( !quill )
            {
              SendToCharacter("You need a datapad to record a message.\r\n", ch);
              return;
            }
          if ( quill->value[OVAL_PEN_INK_AMOUNT] < 1 )
            {
              SendToCharacter("Your quill is dry.\r\n", ch);
              return;
            }
        }
      if (!arg_passed || arg_passed[0] == '\0')
        {
          SendToCharacter("Please specify an addressee.\r\n", ch);
          return;
        }
      if ( ( paper = GetEquipmentOnCharacter(ch, WEAR_HOLD) ) == NULL
           ||     paper->item_type != ITEM_PAPER )
        {
          if(GetTrustLevel(ch) < sysdata.write_mail_free )
            {
              SendToCharacter("You need to be holding a message disk to record a note.\r\n", ch);
              return;
            }
          paper = CreateObject( GetProtoObject(OBJ_VNUM_NOTE), 0 );
          if ((tmpobj = GetEquipmentOnCharacter(ch, WEAR_HOLD)) != NULL)
            UnequipCharacter(ch, tmpobj);
          paper = ObjectToCharacter(paper, ch);
          EquipCharacter(ch, paper, WEAR_HOLD);
          Act(AT_MAGIC, "$n gets a message disk to record a note.",
              ch, NULL, NULL, TO_ROOM);
          Act(AT_MAGIC, "You grab a message disk to record your note.",
              ch, NULL, NULL, TO_CHAR);
        }

      if (paper->value[OVAL_PAPER_2] > 1)
        {
          SendToCharacter("You cannot modify this message.\r\n",ch);
          return;
        }

      arg_passed[0] = CharToUppercase(arg_passed[0]);

      sprintf( fname, "%s%c/%s", PLAYER_DIR, tolower(arg_passed[0]),
               Capitalize( arg_passed ) );

      if ( !IS_MAIL || stat( fname, &fst ) != -1 || !StrCmp(arg_passed, "all") )
        {
          paper->value[OVAL_PAPER_2] = 1;
          ed = SetOExtra(paper, "_to_");
          FreeMemory( ed->description );
          ed->description = CopyString( arg_passed );
          SendToCharacter("Ok.\r\n",ch);
          return;
        }
      else
        {
          SendToCharacter("No player exists by that name.\r\n",ch);
          return;
        }

    }

  if ( !StrCmp( arg, "show" ) )
    {
      char *subject, *to_list, *text;

      if ( ( paper = GetEquipmentOnCharacter(ch, WEAR_HOLD) ) == NULL
           ||     paper->item_type != ITEM_PAPER )
        {
          SendToCharacter("You are not holding a message disk.\r\n", ch);
          return;
        }

      if ( (subject = GetExtraDescription( "_subject_", paper->first_extradesc )) == NULL )
        subject = "(no subject)";
      if ( (to_list = GetExtraDescription( "_to_", paper->first_extradesc )) == NULL )
        to_list = "(nobody)";
      sprintf( buf, "%s: %s\r\nTo: %s\r\n",
               ch->name,
               subject,
               to_list );
      SendToCharacter( buf, ch );
      if ( (text = GetExtraDescription( "_text_", paper->first_extradesc )) == NULL )
        text = "The disk is blank.\r\n";
      SendToCharacter( text, ch );
      return;
    }

  if ( !StrCmp( arg, "post" ) )
    {
      char *strtime, *text;

      if ( ( paper = GetEquipmentOnCharacter(ch, WEAR_HOLD) ) == NULL
           ||     paper->item_type != ITEM_PAPER )
        {
          SendToCharacter("You are not holding a message disk.\r\n", ch);
          return;
        }

      if ( paper->value[OVAL_PAPER_0] == 0 )
        {
          SendToCharacter("There is nothing written on this disk.\r\n", ch);
          return;
        }

      if ( paper->value[OVAL_PAPER_1] == 0 )
        {
          SendToCharacter("This message has no subject... using 'none'.\r\n", ch);
          paper->value[OVAL_PAPER_1] = 1;
          ed = SetOExtra(paper, "_subject_");
          FreeMemory( ed->description );
          ed->description = CopyString( "none" );
        }

      if (paper->value[OVAL_PAPER_2] == 0)
        {
          if ( IS_MAIL )
            {
              SendToCharacter("This message is addressed to no one!\r\n", ch);
              return;
            }
          else
            {
              SendToCharacter("This message is addressed to no one... sending to 'all'!\r\n", ch);
              paper->value[OVAL_PAPER_2] = 1;
              ed = SetOExtra(paper, "_to_");
              FreeMemory( ed->description );
              ed->description = CopyString( "All" );
            }
        }

      board = FindBoardHere( ch );
      if ( !board )
        {
          SendToCharacter( "There is no terminal here to upload your message to.\r\n", ch );
          return;
        }
      if ( !CanPost( ch, board ) )
        {
          SendToCharacter( "You cannot use this terminal. It is encrypted...\r\n", ch );
          return;
        }

      if ( board->num_posts >= board->max_posts )
        {
          SendToCharacter( "This terminal is full. There is no room for your message.\r\n", ch );
          return;
        }

      Act( AT_ACTION, "$n uploads a message.", ch, NULL, NULL, TO_ROOM );

      strtime                           = ctime( &current_time );
      strtime[strlen(strtime)-1]        = '\0';
      AllocateMemory( pnote, Note, 1 );
      pnote->date                       = CopyString( strtime );

      text = GetExtraDescription( "_text_", paper->first_extradesc );
      pnote->text = text ? CopyString( text ) : CopyString( "" );
      text = GetExtraDescription( "_to_", paper->first_extradesc );
      pnote->to_list = text ? CopyString( text ) : CopyString( "all" );
      text = GetExtraDescription( "_subject_", paper->first_extradesc );
      pnote->subject = text ? CopyString( text ) : CopyString( "" );
      pnote->sender  = CopyString( ch->name );
      pnote->voting      = 0;
      pnote->yesvotes    = CopyString( "" );
      pnote->novotes     = CopyString( "" );
      pnote->abstentions = CopyString( "" );

      LINK( pnote, board->first_note, board->last_note, next, prev );
      board->num_posts++;
      WriteBoard( board );
      SendToCharacter( "You upload your message to the terminal.\r\n", ch );
      ExtractObject( paper );
      return;
    }

  if ( !StrCmp( arg, "remove" )
       ||   !StrCmp( arg, "take" )
       ||   !StrCmp( arg, "copy" ) )
    {
      char take;

      board = FindBoardHere( ch );
      if ( !board )
        {
          SendToCharacter( "There is no terminal here to download a note from!\r\n", ch );
          return;
        }
      if ( !StrCmp( arg, "take" ) )
        take = 1;
      else if ( !StrCmp( arg, "copy" ) )
        {
          if ( !IsImmortal(ch) )
            {
              SendToCharacter( "Huh?  Type 'help note' for usage.\r\n", ch );
              return;
            }
          take = 2;
        }
      else
        take = 0;

      if ( !IsNumber( arg_passed ) )
        {
          SendToCharacter( "Note remove which number?\r\n", ch );
          return;
        }

      if ( !CanRead( ch, board ) )
        {
          SendToCharacter( "You can't make any sense of what's posted here, let alone remove anything!\r\n", ch );
          return;
        }

      anum = atoi( arg_passed );
      vnum = INVALID_VNUM;

      for ( pnote = board->first_note; pnote; pnote = pnote->next )
        {
          if (IS_MAIL && ((IsNoteTo(ch, pnote))
                          ||  GetTrustLevel(ch) >= sysdata.take_others_mail))
            vnum++;
          else if (!IS_MAIL)
            vnum++;
          if ( ( IsNoteTo( ch, pnote )
                 ||         CanRemove (ch, board))
               &&   ( vnum == anum ) )
            {
              if ( (IsName("all", pnote->to_list))
                   &&   (GetTrustLevel( ch ) < sysdata.take_others_mail)
                   &&   (take != 2) )
                {
                  SendToCharacter("Notes addressed to 'all' can not be taken.\r\n", ch);
                  return;
                }

              if ( take != 0 )
                {
                  if ( ch->gold < 50 && GetTrustLevel(ch) < sysdata.read_mail_free )
                    {
                      if ( take == 1 )
                        SendToCharacter("It costs 50 credits to take your mail.\r\n", ch);
                      else
                        SendToCharacter("It costs 50 credits to copy your mail.\r\n", ch);
                      return;
                    }
                  if ( GetTrustLevel(ch) < sysdata.read_mail_free )
                    ch->gold -= 50;
                  paper = CreateObject( GetProtoObject(OBJ_VNUM_NOTE), 0 );
                  ed = SetOExtra( paper, "_sender_" );
                  FreeMemory( ed->description );
                  ed->description = CopyString(pnote->sender);
                  ed = SetOExtra( paper, "_text_" );
                  FreeMemory( ed->description );
                  ed->description = CopyString(pnote->text);
                  ed = SetOExtra( paper, "_to_" );
                  FreeMemory( ed->description );
                  ed->description = CopyString( pnote->to_list );
                  ed = SetOExtra( paper, "_subject_" );
                  FreeMemory( ed->description );
                  ed->description = CopyString( pnote->subject );
                  ed = SetOExtra( paper, "_date_" );
                  FreeMemory( ed->description );
                  ed->description = CopyString( pnote->date );
                  ed = SetOExtra( paper, "note" );
                  FreeMemory( ed->description );
                  sprintf(notebuf, "From: ");
                  strcat(notebuf, pnote->sender);
                  strcat(notebuf, "\r\nTo: ");
                  strcat(notebuf, pnote->to_list);
                  strcat(notebuf, "\r\nSubject: ");
                  strcat(notebuf, pnote->subject);
                  strcat(notebuf, "\r\n\r\n");
                  strcat(notebuf, pnote->text);
                  strcat(notebuf, "\r\n");
                  ed->description = CopyString(notebuf);
                  paper->value[OVAL_PAPER_0] = 2;
                  paper->value[OVAL_PAPER_1] = 2;
                  paper->value[OVAL_PAPER_2] = 2;
                  sprintf(short_desc_buf, "a note from %s to %s",
                          pnote->sender, pnote->to_list);
                  FreeMemory(paper->short_descr);
                  paper->short_descr = CopyString(short_desc_buf);
                  sprintf(long_desc_buf, "A note from %s to %s lies on the ground.",
                          pnote->sender, pnote->to_list);
                  FreeMemory(paper->description);
                  paper->description = CopyString(long_desc_buf);
                  sprintf(keyword_buf, "note parchment paper %s",
                          pnote->to_list);
                  FreeMemory(paper->name);
                  paper->name = CopyString(keyword_buf);
                }
              if ( take != 2 )
                RemoveNote( board, pnote );
              SendToCharacter( "Ok.\r\n", ch );
              if ( take == 1 )
                {
                  Act( AT_ACTION, "$n downloads a message.", ch, NULL, NULL, TO_ROOM );
                  ObjectToCharacter(paper, ch);
                }
              else if ( take == 2 )
                {
                  Act( AT_ACTION, "$n copies a message.", ch, NULL, NULL, TO_ROOM );
                  ObjectToCharacter(paper, ch);
                }
              else
                Act( AT_ACTION, "$n removes a message.", ch, NULL, NULL, TO_ROOM );
              return;
            }
        }

      SendToCharacter( "No such message.\r\n", ch );
      return;
    }

  SendToCharacter( "Huh?  Type 'help note' for usage.\r\n", ch );
  return;
}

static Board *ReadBoard( char *boardfile, FILE *fp )
{
  Board *board = NULL;
  char letter = '\0';

  do
    {
      letter = getc( fp );

      if ( feof(fp) )
        {
          fclose( fp );
          return NULL;
        }
    }
  while ( isspace(letter) );

  ungetc( letter, fp );

  AllocateMemory( board, Board, 1 );

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
        case 'E':
          KEY( "Extra_readers", board->extra_readers,   ReadStringToTilde( fp ) );
          KEY( "Extra_removers",       board->extra_removers,   ReadStringToTilde( fp ) );
          if ( !StrCmp( word, "End" ) )
            {
              board->num_posts  = 0;
              board->first_note = NULL;
              board->last_note  = NULL;
              board->next       = NULL;
              board->prev       = NULL;
              if ( !board->read_group )
                board->read_group    = CopyString( "" );
              if ( !board->post_group )
                board->post_group    = CopyString( "" );
              if ( !board->extra_readers )
                board->extra_readers = CopyString( "" );
              if ( !board->extra_removers )
                board->extra_removers = CopyString( "" );
              return board;
            }
        case 'F':
          KEY( "Filename",      board->note_file,       ReadStringToTilde( fp ) );
        case 'M':
          KEY( "Min_read_level",        board->min_read_level,  ReadInt( fp ) );
          KEY( "Min_post_level",        board->min_post_level,  ReadInt( fp ) );
          KEY( "Min_remove_level",      board->min_remove_level,ReadInt( fp ) );
          KEY( "Max_posts",             board->max_posts,       ReadInt( fp ) );
        case 'P':
          KEY( "Post_group",    board->post_group,      ReadStringToTilde( fp ) );
        case 'R':
          KEY( "Read_group",    board->read_group,      ReadStringToTilde( fp ) );
        case 'T':
          KEY( "Type",  board->type,            ReadInt( fp ) );
        case 'V':
          KEY( "Vnum",  board->board_obj,       ReadInt( fp ) );
        }

      if ( !fMatch )
        {
          Bug( "%s: no match: %s", __FUNCTION__, word );
        }
    }

  return board;
}

static Note *ReadNote( const char *notefile, FILE *fp )
{
  for ( ; ; )
    {
      Note *pnote = NULL;
      char letter = '\0';
      const char *word = NULL;

      do
        {
          letter = getc( fp );

          if ( feof(fp) )
            {
              fclose( fp );
              return NULL;
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

      word = ReadWord( fp );

      if ( !StrCmp( word, "voting" ) )
        {
          pnote->voting = ReadInt( fp );

          if ( StrCmp( ReadWord( fp ), "yesvotes" ) )
            break;

          pnote->yesvotes       = ReadStringToTilde( fp );

          if ( StrCmp( ReadWord( fp ), "novotes" ) )
            break;

          pnote->novotes        = ReadStringToTilde( fp );

          if ( StrCmp( ReadWord( fp ), "abstentions" ) )
            break;

          pnote->abstentions    = ReadStringToTilde( fp );

          word = ReadWord( fp );
        }

      if ( StrCmp( word, "text" ) )
        break;

      pnote->text       = ReadStringToTilde( fp );

      if ( !pnote->yesvotes )
	pnote->yesvotes        = CopyString( "" );

      if ( !pnote->novotes )
	pnote->novotes = CopyString( "" );

      if ( !pnote->abstentions )
	pnote->abstentions     = CopyString( "" );

      return pnote;
    }

  Bug( "%s: bad key word.", __FUNCTION__ );
  exit( 1 );
}

/*
 * Load boards file.
 */
void LoadBoards( void )
{
  FILE *board_fp = NULL;
  Board *board = NULL;
  char boardfile[256];

  sprintf( boardfile, "%s%s", BOARD_DIR, BOARD_FILE );

  if ( ( board_fp = fopen( boardfile, "r" ) ) == NULL )
    return;

  while ( (board = ReadBoard( boardfile, board_fp )) != NULL )
    {
      FILE *note_fp = NULL;
      Note *pnote = NULL;
      char notefile[256];

      LINK( board, first_board, last_board, next, prev );
      sprintf( notefile, "%s%s", BOARD_DIR, board->note_file );
      LogPrintf( notefile );

      if ( ( note_fp = fopen( notefile, "r" ) ) != NULL )
        {
          while ( (pnote = ReadNote( notefile, note_fp )) != NULL )
            {
              LINK( pnote, board->first_note, board->last_note, next, prev );
              board->num_posts++;
            }
        }
    }
}

void CountMailMessages(const Character *ch)
{
  const Board *board = NULL;
  const Note *note = NULL;
  int cnt = 0;

  for ( board = first_board; board; board = board->next )
    {
      if ( board->type == BOARD_MAIL && CanRead(ch, board) )
	{
	  for ( note = board->first_note; note; note = note->next )
	    {
	      if ( IsNoteTo(ch, note) )
		{
		  ++cnt;
		}
	    }
	}
    }

  if ( cnt )
    {
      Echo(ch, "You have %d mail messages waiting.\r\n", cnt);
    }
}

Board *FindBoardHere( const Character *ch )
{
  const Object *obj;
  Board *board = NULL;

  for ( obj = ch->in_room->first_content; obj; obj = obj->next_content )
    {
      if ( (board = GetBoardFromObject(obj)) != NULL )
	{
	  return board;
	}
    }

  return NULL;
}
