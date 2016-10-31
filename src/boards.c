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
#include "script.h"

/* Defines for voting on notes. -- Narn */
#define VOTE_NONE 0
#define VOTE_OPEN 1
#define VOTE_CLOSED 2

Board *FirstBoard = NULL;
Board *LastBoard = NULL;

static bool IsNoteTo( const Character *ch, const Note *pnote );
static void RemoveNote( Board *board, Note *pnote );
static bool CanRemove( const Character *ch, const Board *board );
static bool CanRead( const Character *ch, const Board *board );
static bool CanPost( const Character *ch, const Board *board );
static Object *FindQuill( const Character *ch );

static bool CanRemove( const Character *ch, const Board *board )
{
  /* If your trust is high enough, you can remove it. */
  if ( GetTrustLevel( ch ) >= board->MinRemoveLevel )
    return true;

  if ( !IsNullOrEmpty( board->ExtraRemovers ) )
    {
      if ( IsName( ch->Name, board->ExtraRemovers ) )
        return true;
    }

  return false;
}

static bool CanRead( const Character *ch, const Board *board )
{
  /* If your trust is high enough, you can read it. */
  if ( GetTrustLevel( ch ) >= board->MinReadLevel )
    return true;

  /* Your trust wasn't high enough, so check if a read_group or extra
     readers have been set up. */
  if ( !IsNullOrEmpty( board->ReadGroup ) )
    {
      if ( ch->PCData->ClanInfo.Clan
	   && !StrCmp( ch->PCData->ClanInfo.Clan->Name, board->ReadGroup ) )
        return true;

      if ( ch->PCData->ClanInfo.Clan
	   && ch->PCData->ClanInfo.Clan->MainClan
	   && !StrCmp( ch->PCData->ClanInfo.Clan->MainClan->Name, board->ReadGroup ) )
        return true;

    }

  if ( !IsNullOrEmpty( board->ExtraReaders ) )
    {
      if ( IsName( ch->Name, board->ExtraReaders ) )
        return true;
    }

  return false;
}

static bool CanPost( const Character *ch, const Board *board )
{
  /* If your trust is high enough, you can post. */
  if ( GetTrustLevel( ch ) >= board->MinPostLevel )
    return true;

  /* Your trust wasn't high enough, so check if a post_group has been set up. */
  if ( !IsNullOrEmpty( board->PostGroup ) )
    {
      if ( ch->PCData->ClanInfo.Clan
	   && !StrCmp( ch->PCData->ClanInfo.Clan->Name, board->PostGroup ) )
        return true;

      if ( ch->PCData->ClanInfo.Clan
	   && ch->PCData->ClanInfo.Clan->MainClan
	   && !StrCmp( ch->PCData->ClanInfo.Clan->MainClan->Name, board->PostGroup ) )
        return true;
    }

  return false;
}

static void LoadNote( lua_State *L, Board *board )
{
  int idx = lua_gettop( L );
  const int topAtStart = idx;
  int topAfterGets = 0;
  Note *note = NULL;

  AllocateMemory( note, Note, 1 );
  lua_getfield( L, idx, "Sender" );
  lua_getfield( L, idx, "Date" );
  lua_getfield( L, idx, "ToList" );
  lua_getfield( L, idx, "Subject" );
  lua_getfield( L, idx, "Voting" );
  lua_getfield( L, idx, "YesVotes" );
  lua_getfield( L, idx, "NoVotes" );
  lua_getfield( L, idx, "Abstentions" );
  lua_getfield( L, idx, "Text" );
  
  topAfterGets = lua_gettop( L );

  if( !lua_isnil( L, ++idx ) )
    {
      note->Sender = CopyString( lua_tostring( L, idx ) );
    }
  else
    {
      note->Sender = CopyString( "" );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      note->Date = CopyString( lua_tostring( L, idx ) );
    }
  else
    {
      note->Date = CopyString( "" );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      note->ToList = CopyString( lua_tostring( L, idx ) );
    }
  else
    {
      note->ToList = CopyString( "" );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      note->Subject = CopyString( lua_tostring( L, idx ) );
    }
  else
    {
      note->Subject = CopyString( "" );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      note->Voting = lua_toboolean( L, idx );
    }
  else
    {
      note->Voting = false;
    }

  if( !lua_isnil( L, ++idx ) )
    {
      note->YesVotes = CopyString( lua_tostring( L, idx ) );
    }
  else
    {
      note->YesVotes = CopyString( "" );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      note->NoVotes = CopyString( lua_tostring( L, idx ) );
    }
  else
    {
      note->NoVotes = CopyString( "" );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      note->Abstentions = CopyString( lua_tostring( L, idx ) );
    }
  else
    {
      note->Abstentions = CopyString( "" );
    }

   if( !lua_isnil( L, ++idx ) )
    {
      note->Text = CopyString( lua_tostring( L, idx ) );
    }
  else
    {
      note->Text = CopyString( "" );
    }
  
  lua_pop( L, topAfterGets - topAtStart );
  LINK( note, board->FirstNote, board->LastNote, Next, Previous );
}

static void LoadNotes( lua_State *L, Board *board )
{
  int idx = lua_gettop( L );
  lua_getfield( L, idx, "Notes" );

  if( !lua_isnil(L, ++idx))
    {
      lua_pushnil( L );

      while( lua_next( L, -2 ) )
	{
	  LoadNote( L, board );
	  lua_pop( L, 1 );
	}
    }

  lua_pop( L, 1 );
}

static int L_BoardEntry( lua_State *L )
{
  int idx = lua_gettop( L );
  const int topAtStart = idx;
  int topAfterGets = 0;
  Board *board = NULL;
  luaL_checktype( L, 1, LUA_TTABLE );

  AllocateMemory( board, Board, 1 );
  lua_getfield( L, idx, "Name" );
  lua_getfield( L, idx, "BoardObjectVnum" );
  lua_getfield( L, idx, "MinReadLevel" );
  lua_getfield( L, idx, "MinPostLevel" );
  lua_getfield( L, idx, "MinRemoveLevel" );
  lua_getfield( L, idx, "MaxPosts" );
  lua_getfield( L, idx, "Type" );
  lua_getfield( L, idx, "ReadGroup" );
  lua_getfield( L, idx, "PostGroup" );
  lua_getfield( L, idx, "ExtraReaders" );
  lua_getfield( L, idx, "ExtraRemovers");
  
  topAfterGets = lua_gettop( L );

  if( !lua_isnil( L, ++idx ) )
    {
      board->Name = CopyString( lua_tostring( L, idx ) );
    }
    

  if( !lua_isnil( L, ++idx ) )
    {
      board->BoardObject = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      board->MinReadLevel = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      board->MinPostLevel = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      board->MinRemoveLevel = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      board->MaxPosts = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      const char *typeName = lua_tostring( L, idx );
      board->Type = !StrCmp( typeName, "mail" ) ? BOARD_MAIL : BOARD_NOTE;
    }

  if( !lua_isnil( L, ++idx ) )
    {
      board->ReadGroup = CopyString( lua_tostring( L, idx ) );
    }
  else
    {
      board->ReadGroup = CopyString( "" );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      board->PostGroup = CopyString( lua_tostring( L, idx ) );
    }
  else
    {
      board->PostGroup = CopyString( "" );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      board->ExtraReaders = CopyString( lua_tostring( L, idx ) );
    }
  else
    {
      board->ExtraReaders = CopyString( "" );
    }
  
  if( !lua_isnil( L, ++idx ) )
    {
      board->ExtraRemovers = CopyString( lua_tostring( L, idx ) );
    }
  else
    {
      board->ExtraReaders = CopyString( "" );
    }
  
  lua_pop( L, topAfterGets - topAtStart );
  LoadNotes( L, board );

  LINK( board, FirstBoard, LastBoard, Next, Previous );
  return 0;
}

static void ExecuteBoardFile( const char *filePath, void *userData )
{
  LuaLoadDataFile( filePath, L_BoardEntry, "BoardEntry" );
}

void LoadBoards( void )
{
  ForEachLuaFileInDir( BOARD_DIR, ExecuteBoardFile, NULL );
}

static void PushNotes( lua_State *L, const Board *board )
{
  if( board->FirstNote )
    {
      const Note *note = NULL;
      int idx = 1;
      lua_pushstring( L, "Notes" );
      lua_newtable( L );

      for( note = board->FirstNote; note; note = note->Next, ++idx )
	{
	  lua_pushinteger( L, idx );
	  lua_newtable( L );

	  LuaSetfieldString( L, "Sender", note->Sender );
	  LuaSetfieldString( L, "Date", note->Date );
	  LuaSetfieldString( L, "ToList", note->ToList );
	  LuaSetfieldString( L, "Subject", note->Subject );
	  LuaSetfieldBoolean( L, "Voting", note->Voting ? true : false );
	  LuaSetfieldString( L, "YesVotes", note->YesVotes );
	  LuaSetfieldString( L, "NoVotes", note->NoVotes );
	  LuaSetfieldString( L, "Abstentions", note->Abstentions );
	  LuaSetfieldString( L, "Text", note->Text );
	  
	  lua_settable( L, -3 );
	}
      
      lua_settable( L, -3 );
    }
}

static void PushBoard( lua_State *L, const void *userData )
{
  const Board *board = (const Board*) userData;
  lua_pushinteger( L, 1 );
  lua_newtable( L );

  LuaSetfieldString( L, "Name", board->Name );
  LuaSetfieldNumber( L, "BoardObjectVnum", board->BoardObject );
  LuaSetfieldNumber( L, "MinReadLevel", board->MinReadLevel );
  LuaSetfieldNumber( L, "MinPostLevel", board->MinPostLevel );
  LuaSetfieldNumber( L, "MinRemoveLevel", board->MinRemoveLevel );
  LuaSetfieldNumber( L, "MaxPosts", board->MaxPosts );
  LuaSetfieldString( L, "Type", board->Type == BOARD_NOTE ? "Note" : "Mail" );
  LuaSetfieldString( L, "ReadGroup", board->ReadGroup );
  LuaSetfieldString( L, "PostGroup", board->PostGroup );
  LuaSetfieldString( L, "ExtraReaders", board->ExtraReaders );
  LuaSetfieldString( L, "ExtraRemovers", board->ExtraRemovers );

  PushNotes( L, board );

  lua_setglobal( L, "board" );
}

bool SaveBoard( const Board *board, char dummyUserData )
{
  char fullPath[MAX_STRING_LENGTH];
  sprintf( fullPath, "%s%s", BOARD_DIR, ConvertToLuaFilename( board->Name ) );
  LuaSaveDataFile( fullPath, PushBoard, "board", board );  
  return true;
}

void SaveBoards( void )
{
  ForEach( Board, FirstBoard, Next, SaveBoard, 0 );
}

Board *GetBoardFromObject( const Object *obj )
{
  Board *board = NULL;

  for ( board = FirstBoard; board; board = board->Next )
    {
      if ( board->BoardObject == obj->Prototype->Vnum )
	{
	  return board;
	}
    }

  return NULL;
}

static bool IsNoteTo( const Character *ch, const Note *pnote )
{
  if ( !StrCmp( ch->Name, pnote->Sender ) )
    return true;

  if ( IsName( "all", pnote->ToList ) )
    return true;

  if ( IsAvatar(ch) && IsName( "immortal", pnote->ToList ) )
    return true;

  if ( IsName( ch->Name, pnote->ToList ) )
    return true;

  return false;
}

void AttachNote( Character *ch )
{
  Note *pnote = NULL;

  if ( IsNpc( ch ) )
    return;

  if ( ch->PCData->Note )
    return;

  AllocateMemory( pnote, Note, 1 );
  pnote->Sender = CopyString( ch->Name );
  pnote->Date           = CopyString( "" );
  pnote->ToList        = CopyString( "" );
  pnote->Subject        = CopyString( "" );
  pnote->Text           = CopyString( "" );
  ch->PCData->Note     = pnote;
}

void FreeNote( Note *pnote )
{
  FreeMemory( pnote->Text );
  FreeMemory( pnote->Subject );
  FreeMemory( pnote->ToList );
  FreeMemory( pnote->Date );
  FreeMemory( pnote->Sender );

  if ( pnote->YesVotes )
    FreeMemory( pnote->YesVotes );

  if ( pnote->NoVotes )
    FreeMemory( pnote->NoVotes );

  if ( pnote->Abstentions )
    FreeMemory( pnote->Abstentions );

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
  UNLINK( pnote, board->FirstNote, board->LastNote, Next, Previous );

  --board->NumberOfPosts;
  FreeNote( pnote );
  SaveBoard( board, 0 );
}


static Object *FindQuill( const Character *ch )
{
  Object *quill = NULL;

  for ( quill = ch->LastCarrying; quill; quill = quill->PreviousContent )
    if ( quill->ItemType == ITEM_PEN
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

  if ( !ch->Desc )
    {
      Bug( "%s: no descriptor", __FUNCTION__ );
      return;
    }

  switch( ch->SubState )
    {
    default:
      break;

    case SUB_WRITING_NOTE:
      if ( ( paper = GetEquipmentOnCharacter(ch, WEAR_HOLD) ) == NULL
           ||     paper->ItemType != ITEM_PAPER )
        {
          Bug("%s: player not holding paper", __FUNCTION__);
          StopEditing( ch );
          return;
        }

      ed = (ExtraDescription*)ch->dest_buf;
      FreeMemory( ed->Description );
      ed->Description = CopyBuffer( ch );
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
          for ( pnote = board->FirstNote; pnote; pnote = pnote->Next )
            {
              vnum++;
              if ( (first_list && vnum >= first_list) || !first_list )
                PagerPrintf( ch, "%2d%c %-12s%c %-12s %s\r\n",
                              vnum,
                              IsNoteTo( ch, pnote ) ? ')' : '}',
                              pnote->Sender,
                              (pnote->Voting != VOTE_NONE) ? (pnote->Voting == VOTE_OPEN ? 'V' : 'C') : ':',
                              pnote->ToList,
                              pnote->Subject );
            }
          Act( AT_ACTION, "$n glances over the messages.", ch, NULL, NULL, TO_ROOM );
          return;
        }
      else
        {
          vnum = INVALID_VNUM;


          if (IS_MAIL) /* SB Mail check for Brit */
            {
              for ( pnote = board->FirstNote; pnote; pnote = pnote->Next )
                if (IsNoteTo( ch, pnote )) mfound = true;

              if ( !mfound && GetTrustLevel(ch) < SysData.ReadAllMail )
                {
                  Echo( ch, "You have no mail.\r\n");
                  return;
                }
            }

          for ( pnote = board->FirstNote; pnote; pnote = pnote->Next )
            if (IsNoteTo( ch, pnote ) || GetTrustLevel(ch) > SysData.ReadAllMail)
              Echo( ch, "%2d%c %s: %s\r\n",
                         ++vnum,
                         IsNoteTo( ch, pnote ) ? '-' : '}',
                         pnote->Sender,
                         pnote->Subject );
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

          for ( pnote = board->FirstNote; pnote; pnote = pnote->Next )
            {
              vnum++;

              if ( vnum == anum || fAll )
                {
                  wasfound = true;
                  PagerPrintf( ch, "[%3d] %s: %s\r\n%s\r\nTo: %s\r\n%s",
                                vnum,
                                pnote->Sender,
                                pnote->Subject,
                                pnote->Date,
                                pnote->ToList,
                                pnote->Text );

                  if ( !IsNullOrEmpty( pnote->YesVotes )
		       || !IsNullOrEmpty( pnote->NoVotes )
                       || !IsNullOrEmpty( pnote->Abstentions ) )
                    {
                      SendToPager( "------------------------------------------------------------\r\n", ch );
                      PagerPrintf( ch, "Votes:\r\nYes:     %s\r\nNo:      %s\r\nAbstain: %s\r\n",
                                    pnote->YesVotes, pnote->NoVotes, pnote->Abstentions );
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

          for ( pnote = board->FirstNote; pnote; pnote = pnote->Next )
            {
              if (IsNoteTo(ch, pnote) || GetTrustLevel(ch) > SysData.ReadAllMail)
                {
                  vnum++;
                  if ( vnum == anum || fAll )
                    {
                      wasfound = true;
                      if ( ch->Gold < 10
                           &&   GetTrustLevel(ch) < SysData.ReadMailFree )
                        {
                          SendToCharacter("It costs 10 credits to read a message.\r\n", ch);
                          return;
                        }
                      if (GetTrustLevel(ch) < SysData.ReadMailFree)
                        ch->Gold -= 10;
                      PagerPrintf( ch, "[%3d] %s: %s\r\n%s\r\nTo: %s\r\n%s",
                                    vnum,
                                    pnote->Sender,
                                    pnote->Subject,
                                    pnote->Date,
                                    pnote->ToList,
                                    pnote->Text );
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

      for ( pnote = board->FirstNote; pnote && vnum < anum; pnote = pnote->Next )
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
          if ( StrCmp( ch->Name, pnote->Sender ) )
            {
              SendToCharacter( "You are not the author of this message.\r\n", ch );
              return;
            }
          pnote->Voting = VOTE_OPEN;
          Act( AT_ACTION, "$n opens voting on a note.", ch, NULL, NULL, TO_ROOM );
          SendToCharacter( "Voting opened.\r\n", ch );
          SaveBoard( board, 0 );
          return;
        }

      if ( !StrCmp( arg_passed, "close" ) )
        {
          if ( StrCmp( ch->Name, pnote->Sender ) )
            {
              SendToCharacter( "You are not the author of this message.\r\n", ch );
              return;
            }
          pnote->Voting = VOTE_CLOSED;
          Act( AT_ACTION, "$n closes voting on a note.", ch, NULL, NULL, TO_ROOM );
          SendToCharacter( "Voting closed.\r\n", ch );
          SaveBoard( board, 0 );
          return;
        }

      /* Make sure the note is open for voting before going on. */
      if ( pnote->Voting != VOTE_OPEN )
        {
          SendToCharacter( "Voting is not open on this note.\r\n", ch );
          return;
        }

      /* Can only vote once on a note. */
      sprintf( buf, "%s %s %s",
               pnote->YesVotes, pnote->NoVotes, pnote->Abstentions );

      if ( IsName( ch->Name, buf ) )
        {
          SendToCharacter( "You have already voted on this note.\r\n", ch );
          return;
        }

      if ( !StrCmp( arg_passed, "yes" ) )
        {
          sprintf( buf, "%s %s", pnote->YesVotes, ch->Name );
          FreeMemory( pnote->YesVotes );
          pnote->YesVotes = CopyString( buf );
          Act( AT_ACTION, "$n votes on a note.", ch, NULL, NULL, TO_ROOM );
          SendToCharacter( "Ok.\r\n", ch );
          SaveBoard( board, 0 );
          return;
        }

      if ( !StrCmp( arg_passed, "no" ) )
        {
          sprintf( buf, "%s %s", pnote->NoVotes, ch->Name );
          FreeMemory( pnote->NoVotes );
          pnote->NoVotes = CopyString( buf );
          Act( AT_ACTION, "$n votes on a note.", ch, NULL, NULL, TO_ROOM );
          SendToCharacter( "Ok.\r\n", ch );
          SaveBoard( board, 0 );
          return;
        }

      if ( !StrCmp( arg_passed, "abstain" ) )
        {
          sprintf( buf, "%s %s", pnote->Abstentions, ch->Name );
          FreeMemory( pnote->Abstentions );
          pnote->Abstentions = CopyString( buf );
          Act( AT_ACTION, "$n votes on a note.", ch, NULL, NULL, TO_ROOM );
          SendToCharacter( "Ok.\r\n", ch );
          SaveBoard( board, 0 );
          return;
        }

      OperateOnNote( ch, "", false );
    }

  if ( !StrCmp( arg, "write" ) )
    {
      if ( ch->SubState == SUB_RESTRICTED )
        {
          SendToCharacter( "You cannot write a note from within another command.\r\n", ch );
          return;
        }
      if (GetTrustLevel (ch) < SysData.WriteMailFree)
        {
          quill = FindQuill( ch );
          if (!quill)
            {
              SendToCharacter("You need a datapad to record a message.\r\n", ch);
              return;
            }
          if ( quill->Value[OVAL_PEN_INK_AMOUNT] < 1 )
            {
              SendToCharacter("Your quill is dry.\r\n", ch);
              return;
            }
        }
      if ( ( paper = GetEquipmentOnCharacter(ch, WEAR_HOLD) ) == NULL
           ||     paper->ItemType != ITEM_PAPER )
        {
          if (GetTrustLevel(ch) < SysData.WriteMailFree )
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

      if (paper->Value[OVAL_PAPER_0] < 2 )
        {
          paper->Value[OVAL_PAPER_0] = 1;
          ed = SetOExtra(paper, "_text_");
          ch->SubState = SUB_WRITING_NOTE;
          ch->dest_buf = ed;

          if ( GetTrustLevel(ch) < SysData.WriteMailFree )
	    {
	      --quill->Value[OVAL_PEN_INK_AMOUNT];
	    }

          StartEditing( ch, ed->Description );
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
      if(GetTrustLevel(ch) < SysData.WriteMailFree)
        {
          quill = FindQuill( ch );

          if ( !quill )
            {
              SendToCharacter("You need a datapad to record a disk.\r\n", ch);
              return;
            }

	  if ( quill->Value[OVAL_PEN_INK_AMOUNT] < 1 )
            {
              SendToCharacter("Your quill is dry.\r\n", ch);
              return;
            }
        }
      
      if ( IsNullOrEmpty( arg_passed ) )
        {
          SendToCharacter("What do you wish the subject to be?\r\n", ch);
          return;
        }

      if ( ( paper = GetEquipmentOnCharacter(ch, WEAR_HOLD) ) == NULL
           ||     paper->ItemType != ITEM_PAPER )
        {
          if(GetTrustLevel(ch) < SysData.WriteMailFree )
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
      if (paper->Value[OVAL_PAPER_0] > 1 )
        {
          SendToCharacter("You cannot modify this message.\r\n", ch);
          return;
        }
      else
        {
          paper->Value[OVAL_PAPER_1] = 1;
          ed = SetOExtra(paper, "_subject_");
          FreeMemory( ed->Description );
          ed->Description = CopyString( arg_passed );
          SendToCharacter("Ok.\r\n", ch);
          return;
        }
    }

  if ( !StrCmp( arg, "to" ) )
    {
      struct stat fst;
      char fname[1024];
      if(GetTrustLevel(ch) < SysData.WriteMailFree )
        {
          quill = FindQuill( ch );
          if ( !quill )
            {
              SendToCharacter("You need a datapad to record a message.\r\n", ch);
              return;
            }
          if ( quill->Value[OVAL_PEN_INK_AMOUNT] < 1 )
            {
              SendToCharacter("Your quill is dry.\r\n", ch);
              return;
            }
        }
      if ( IsNullOrEmpty( arg_passed ) )
        {
          SendToCharacter("Please specify an addressee.\r\n", ch);
          return;
        }
      if ( ( paper = GetEquipmentOnCharacter(ch, WEAR_HOLD) ) == NULL
           ||     paper->ItemType != ITEM_PAPER )
        {
          if(GetTrustLevel(ch) < SysData.WriteMailFree )
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

      if (paper->Value[OVAL_PAPER_2] > 1)
        {
          SendToCharacter("You cannot modify this message.\r\n",ch);
          return;
        }

      arg_passed[0] = CharToUppercase(arg_passed[0]);

      sprintf( fname, "%s%c/%s", PLAYER_DIR, tolower(arg_passed[0]),
               Capitalize( arg_passed ) );

      if ( !IS_MAIL || stat( fname, &fst ) != -1 || !StrCmp(arg_passed, "all") )
        {
          paper->Value[OVAL_PAPER_2] = 1;
          ed = SetOExtra(paper, "_to_");
          FreeMemory( ed->Description );
          ed->Description = CopyString( arg_passed );
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
           ||     paper->ItemType != ITEM_PAPER )
        {
          SendToCharacter("You are not holding a message disk.\r\n", ch);
          return;
        }

      if ( (subject = GetExtraDescription( "_subject_", paper->FirstExtraDescription )) == NULL )
        subject = "(no subject)";
      if ( (to_list = GetExtraDescription( "_to_", paper->FirstExtraDescription )) == NULL )
        to_list = "(nobody)";
      sprintf( buf, "%s: %s\r\nTo: %s\r\n",
               ch->Name,
               subject,
               to_list );
      SendToCharacter( buf, ch );
      if ( (text = GetExtraDescription( "_text_", paper->FirstExtraDescription )) == NULL )
        text = "The disk is blank.\r\n";
      SendToCharacter( text, ch );
      return;
    }

  if ( !StrCmp( arg, "post" ) )
    {
      char *strtime, *text;

      if ( ( paper = GetEquipmentOnCharacter(ch, WEAR_HOLD) ) == NULL
           ||     paper->ItemType != ITEM_PAPER )
        {
          SendToCharacter("You are not holding a message disk.\r\n", ch);
          return;
        }

      if ( paper->Value[OVAL_PAPER_0] == 0 )
        {
          SendToCharacter("There is nothing written on this disk.\r\n", ch);
          return;
        }

      if ( paper->Value[OVAL_PAPER_1] == 0 )
        {
          SendToCharacter("This message has no subject... using 'none'.\r\n", ch);
          paper->Value[OVAL_PAPER_1] = 1;
          ed = SetOExtra(paper, "_subject_");
          FreeMemory( ed->Description );
          ed->Description = CopyString( "none" );
        }

      if (paper->Value[OVAL_PAPER_2] == 0)
        {
          if ( IS_MAIL )
            {
              SendToCharacter("This message is addressed to no one!\r\n", ch);
              return;
            }
          else
            {
              SendToCharacter("This message is addressed to no one... sending to 'all'!\r\n", ch);
              paper->Value[OVAL_PAPER_2] = 1;
              ed = SetOExtra(paper, "_to_");
              FreeMemory( ed->Description );
              ed->Description = CopyString( "All" );
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

      if ( board->NumberOfPosts >= board->MaxPosts )
        {
          SendToCharacter( "This terminal is full. There is no room for your message.\r\n", ch );
          return;
        }

      Act( AT_ACTION, "$n uploads a message.", ch, NULL, NULL, TO_ROOM );

      strtime                           = ctime( &current_time );
      strtime[strlen(strtime)-1]        = '\0';
      AllocateMemory( pnote, Note, 1 );
      pnote->Date                       = CopyString( strtime );

      text = GetExtraDescription( "_text_", paper->FirstExtraDescription );
      pnote->Text = text ? CopyString( text ) : CopyString( "" );
      text = GetExtraDescription( "_to_", paper->FirstExtraDescription );
      pnote->ToList = text ? CopyString( text ) : CopyString( "all" );
      text = GetExtraDescription( "_subject_", paper->FirstExtraDescription );
      pnote->Subject = text ? CopyString( text ) : CopyString( "" );
      pnote->Sender  = CopyString( ch->Name );
      pnote->Voting      = 0;
      pnote->YesVotes    = CopyString( "" );
      pnote->NoVotes     = CopyString( "" );
      pnote->Abstentions = CopyString( "" );

      LINK( pnote, board->FirstNote, board->LastNote, Next, Previous );
      board->NumberOfPosts++;
      SaveBoard( board, 0 );
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

      for ( pnote = board->FirstNote; pnote; pnote = pnote->Next )
        {
          if (IS_MAIL && ((IsNoteTo(ch, pnote))
                          ||  GetTrustLevel(ch) >= SysData.TakeOthersMail))
            vnum++;
          else if (!IS_MAIL)
            vnum++;
          if ( ( IsNoteTo( ch, pnote )
                 ||         CanRemove (ch, board))
               &&   ( vnum == anum ) )
            {
              if ( (IsName("all", pnote->ToList))
                   &&   (GetTrustLevel( ch ) < SysData.TakeOthersMail)
                   &&   (take != 2) )
                {
                  SendToCharacter("Notes addressed to 'all' can not be taken.\r\n", ch);
                  return;
                }

              if ( take != 0 )
                {
                  if ( ch->Gold < 50 && GetTrustLevel(ch) < SysData.ReadMailFree )
                    {
                      if ( take == 1 )
                        SendToCharacter("It costs 50 credits to take your mail.\r\n", ch);
                      else
                        SendToCharacter("It costs 50 credits to copy your mail.\r\n", ch);
                      return;
                    }
                  if ( GetTrustLevel(ch) < SysData.ReadMailFree )
                    ch->Gold -= 50;
                  paper = CreateObject( GetProtoObject(OBJ_VNUM_NOTE), 0 );
                  ed = SetOExtra( paper, "_sender_" );
                  FreeMemory( ed->Description );
                  ed->Description = CopyString(pnote->Sender);
                  ed = SetOExtra( paper, "_text_" );
                  FreeMemory( ed->Description );
                  ed->Description = CopyString(pnote->Text);
                  ed = SetOExtra( paper, "_to_" );
                  FreeMemory( ed->Description );
                  ed->Description = CopyString( pnote->ToList );
                  ed = SetOExtra( paper, "_subject_" );
                  FreeMemory( ed->Description );
                  ed->Description = CopyString( pnote->Subject );
                  ed = SetOExtra( paper, "_date_" );
                  FreeMemory( ed->Description );
                  ed->Description = CopyString( pnote->Date );
                  ed = SetOExtra( paper, "note" );
                  FreeMemory( ed->Description );
                  sprintf(notebuf, "From: ");
                  strcat(notebuf, pnote->Sender);
                  strcat(notebuf, "\r\nTo: ");
                  strcat(notebuf, pnote->ToList);
                  strcat(notebuf, "\r\nSubject: ");
                  strcat(notebuf, pnote->Subject);
                  strcat(notebuf, "\r\n\r\n");
                  strcat(notebuf, pnote->Text);
                  strcat(notebuf, "\r\n");
                  ed->Description = CopyString(notebuf);
                  paper->Value[OVAL_PAPER_0] = 2;
                  paper->Value[OVAL_PAPER_1] = 2;
                  paper->Value[OVAL_PAPER_2] = 2;
                  sprintf(short_desc_buf, "a note from %s to %s",
                          pnote->Sender, pnote->ToList);
                  FreeMemory(paper->ShortDescr);
                  paper->ShortDescr = CopyString(short_desc_buf);
                  sprintf(long_desc_buf, "A note from %s to %s lies on the ground.",
                          pnote->Sender, pnote->ToList);
                  FreeMemory(paper->Description);
                  paper->Description = CopyString(long_desc_buf);
                  sprintf(keyword_buf, "note parchment paper %s",
                          pnote->ToList);
                  FreeMemory(paper->Name);
                  paper->Name = CopyString(keyword_buf);
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

#if 0
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
          KEY( "Extra_readers", board->ExtraReaders,   ReadStringToTilde( fp ) );
          KEY( "Extra_removers",       board->ExtraRemovers,   ReadStringToTilde( fp ) );
          if ( !StrCmp( word, "End" ) )
            {
              board->NumberOfPosts  = 0;
              board->FirstNote = NULL;
              board->LastNote  = NULL;
              board->Next       = NULL;
              board->Previous       = NULL;

              if ( !board->ReadGroup )
                board->ReadGroup    = CopyString( "" );

	      if ( !board->PostGroup )
                board->PostGroup    = CopyString( "" );

	      if ( !board->ExtraReaders )
                board->ExtraReaders = CopyString( "" );

	      if ( !board->ExtraRemovers )
                board->ExtraRemovers = CopyString( "" );

	      return board;
            }
        case 'F':
          KEY( "Filename",      board->Name,       ReadStringToTilde( fp ) );
        case 'M':
          KEY( "Min_read_level",        board->MinReadLevel,  ReadInt( fp ) );
          KEY( "Min_post_level",        board->MinPostLevel,  ReadInt( fp ) );
          KEY( "Min_remove_level",      board->MinRemoveLevel,ReadInt( fp ) );
          KEY( "Max_posts",             board->MaxPosts,       ReadInt( fp ) );
        case 'P':
          KEY( "Post_group",    board->PostGroup,      ReadStringToTilde( fp ) );
        case 'R':
          KEY( "Read_group",    board->ReadGroup,      ReadStringToTilde( fp ) );
        case 'T':
          KEY( "Type",  board->Type,            ReadInt( fp ) );
        case 'V':
          KEY( "Vnum",  board->BoardObject,       ReadInt( fp ) );
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

      word = ReadWord( fp );

      if ( !StrCmp( word, "voting" ) )
        {
          pnote->Voting = ReadInt( fp );

          if ( StrCmp( ReadWord( fp ), "yesvotes" ) )
            break;

          pnote->YesVotes       = ReadStringToTilde( fp );

          if ( StrCmp( ReadWord( fp ), "novotes" ) )
            break;

          pnote->NoVotes        = ReadStringToTilde( fp );

          if ( StrCmp( ReadWord( fp ), "abstentions" ) )
            break;

          pnote->Abstentions    = ReadStringToTilde( fp );

          word = ReadWord( fp );
        }

      if ( StrCmp( word, "text" ) )
        break;

      pnote->Text       = ReadStringToTilde( fp );

      if ( !pnote->YesVotes )
	pnote->YesVotes        = CopyString( "" );

      if ( !pnote->NoVotes )
	pnote->NoVotes = CopyString( "" );

      if ( !pnote->Abstentions )
	pnote->Abstentions     = CopyString( "" );

      return pnote;
    }

  Bug( "%s: bad key word.", __FUNCTION__ );
  exit( 1 );
}
#endif

void CountMailMessages(const Character *ch)
{
  const Board *board = NULL;
  const Note *note = NULL;
  int cnt = 0;

  for ( board = FirstBoard; board; board = board->Next )
    {
      if ( board->Type == BOARD_MAIL && CanRead(ch, board) )
	{
	  for ( note = board->FirstNote; note; note = note->Next )
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

  for ( obj = ch->InRoom->FirstContent; obj; obj = obj->NextContent )
    {
      if ( (board = GetBoardFromObject(obj)) != NULL )
	{
	  return board;
	}
    }

  return NULL;
}
