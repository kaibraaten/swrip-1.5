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

#include <cctype>
#include <ctime>
#include <cstring>
#include "character.hpp"
#include "mud.hpp"
#include "editor.hpp"
#include "clan.hpp"
#include "script.hpp"
#include "board.hpp"
#include "pcdata.hpp"
#include "log.hpp"
#include "room.hpp"

/* Defines for voting on notes. -- Narn */
#define VOTE_NONE 0
#define VOTE_OPEN 1
#define VOTE_CLOSED 2

BoardRepository *Boards = nullptr;

class _IsNoteTo
{
public:
  _IsNoteTo(const Character *recipient)
    : ch(recipient)
  {

  }

  bool operator()(const Note *pnote) const
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

private:
  const Character *ch;
};

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
  Note *note = new Note();

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
  AddNote(board, note);
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
  luaL_checktype( L, 1, LUA_TTABLE );

  Board *board = new Board();
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

  Boards->Add(board);
  return 0;
}

static void ExecuteBoardFile( const std::string &filePath, void *userData )
{
  LuaLoadDataFile( filePath, L_BoardEntry, "BoardEntry" );
}

static void PushNotes( lua_State *L, const Board *board )
{
  if(!board->Notes.empty())
    {
      int idx = 0;
      lua_pushstring( L, "Notes" );
      lua_newtable( L );

      for(const Note *note : board->Notes)
	{
          ++idx;
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

const char *GetBoardFilename( const Board *board )
{
  static char fullPath[MAX_STRING_LENGTH];
  sprintf( fullPath, "%s%s", BOARD_DIR, ConvertToLuaFilename( board->Name ) );

  return fullPath;
}

Board *GetBoardFromObject( const Object *obj )
{
  return Boards->Find([obj](const auto &board)
                          {
                            return board->BoardObject == obj->Prototype->Vnum;
                          });
}

void AttachNote( Character *ch )
{
  if ( IsNpc( ch ) )
    return;

  if ( ch->PCData->Note )
    return;

  Note *pnote = new Note();
  pnote->Sender = CopyString( ch->Name );
  pnote->Date           = CopyString( "" );
  pnote->ToList        = CopyString( "" );
  pnote->Subject        = CopyString( "" );
  pnote->Text           = CopyString( "" );
  ch->PCData->Note     = pnote;
}

void FreeNote( Note *pnote, void *unused )
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

  delete pnote;
}

static void RemoveNote( Board *board, Note *pnote )
{
  if ( !board )
    {
      Log->Bug( "note remove: null board", 0 );
      return;
    }

  if ( !pnote )
    {
      Log->Bug( "note remove: null pnote", 0 );
      return;
    }

  /*
   * Remove note from linked list.
   */
  board->Notes.remove(pnote);

  FreeNote( pnote, NULL );
  Boards->Save(board);
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

void OperateOnNote( Character *ch, const std::string &stl_arg_passed, bool IS_MAIL )
{
  char arg_passed_buf[MAX_STRING_LENGTH] = { '\0' };
  char *arg_passed = arg_passed_buf;
  char buf[MAX_STRING_LENGTH] = { '\0' };
  char arg[MAX_INPUT_LENGTH] = { '\0' };
  Board *board = NULL;
  int anum = 0;
  int first_list = 0;
  Object *quill = NULL, *paper = NULL, *tmpobj = NULL;
  ExtraDescription *ed = NULL;
  char notebuf[MAX_STRING_LENGTH] = { '\0' };
  char short_desc_buf[MAX_STRING_LENGTH] = { '\0' };
  char long_desc_buf[MAX_STRING_LENGTH] = { '\0' };
  char keyword_buf[MAX_STRING_LENGTH] = { '\0' };

  if ( IsNpc(ch) )
    return;

  if ( !ch->Desc )
    {
      Log->Bug( "%s: no descriptor", __FUNCTION__ );
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
          Log->Bug("%s: player not holding paper", __FUNCTION__);
          StopEditing( ch );
          return;
        }

      ed = (ExtraDescription*)ch->dest_buf;
      FreeMemory( ed->Description );
      ed->Description = CopyBuffer( ch );
      StopEditing( ch );
      return;
    }

  strcpy(arg_passed, stl_arg_passed.c_str());
  SetCharacterColor( AT_NOTE, ch );
  arg_passed = OneArgument( arg_passed, arg );
  SmashTilde( arg_passed );

  if ( !StrCmp( arg, "list" ) )
    {
      board = FindBoardHere( ch );

      if ( !board )
        {
          ch->Echo( "There is no board here to look at.\r\n" );
          return;
        }

      if ( !CanRead( ch, board ) )
        {
          ch->Echo( "You cannot make any sense of the cryptic scrawl on this board...\r\n" );
          return;
        }

      first_list = atoi(arg_passed);

      if (first_list)
        {
          if (IS_MAIL)
            {
              ch->Echo( "You cannot use a list number (at this time) with mail.\r\n" );
              return;
            }

          if (first_list < 1)
            {
              ch->Echo( "You can't read a message before 1!\r\n" );
              return;
            }
        }

      if (!IS_MAIL)
        {
          int count = 0;
          SetCharacterColor( AT_NOTE, ch );
          _IsNoteTo _isNoteTo(ch);

          for(const Note *note : board->Notes)
            {
              count++;

              if ( (first_list && count >= first_list) || !first_list )
                ch->Echo( "%2d%c %-12s%c %-12s %s\r\n",
                          count,
                          _isNoteTo( note ) ? ')' : '}',
                          note->Sender,
                          (note->Voting != VOTE_NONE) ? (note->Voting == VOTE_OPEN ? 'V' : 'C') : ':',
                          note->ToList,
                          note->Subject );
            }

          Act( AT_ACTION, "$n glances over the messages.", ch, NULL, NULL, TO_ROOM );

	  if( count == 0 )
            {
              ch->Echo( "There are no messages on this board.\r\n" );
            }
	  
          return;
        }
      else
        {
          int count = 0;

          if (IS_MAIL) /* SB Mail check for Brit */
            {
              bool mfound = find_if(board->Notes.begin(), board->Notes.end(), _IsNoteTo(ch)) != board->Notes.end();

              if ( !mfound && GetTrustLevel(ch) < SysData.ReadAllMail )
                {
                  ch->Echo( "You have no mail.\r\n");
                  return;
                }
            }

          _IsNoteTo _isNoteTo(ch);

          for(const Note *note : board->Notes)
            {
              if (_isNoteTo( note ) || GetTrustLevel(ch) > SysData.ReadAllMail)
                {
                  ch->Echo( "%2d%c %s: %s\r\n",
                            ++count,
                            _isNoteTo( note ) ? '-' : '}',
                            note->Sender,
                            note->Subject );
                }
            }

          return;
        }
    }
  else if ( !StrCmp( arg, "read" ) )
    {
      bool fAll = false;

      board = FindBoardHere( ch );

      if ( !board )
        {
          ch->Echo( "There is no board here to look at.\r\n" );
          return;
        }
      
      if ( !CanRead( ch, board ) )
        {
          ch->Echo( "You cannot make any sense of the cryptic scrawl on this board...\r\n" );
          return;
        }

      if ( !StrCmp( arg_passed, "all" ) )
        {
          fAll = true;
          anum = 0;
        }
      else if ( IsNumber( arg_passed ) )
        {
          fAll = false;
          anum = atoi( arg_passed );
        }
      else
        {
          ch->Echo( "Note read which number?\r\n" );
          return;
        }

      SetCharacterColor( AT_NOTE, ch );

      if (!IS_MAIL)
        {
          int counter = 0;
          bool wasfound = false;

          for(const Note *note : board->Notes)
            {
              counter++;

              if ( counter == anum || fAll )
                {
                  wasfound = true;
                  ch->Echo( "[%3d] %s: %s\r\n%s\r\nTo: %s\r\n%s",
                            counter,
                            note->Sender,
                            note->Subject,
                            note->Date,
                            note->ToList,
                            note->Text );

                  if ( !IsNullOrEmpty( note->YesVotes )
		       || !IsNullOrEmpty( note->NoVotes )
                       || !IsNullOrEmpty( note->Abstentions ) )
                    {
                      ch->Echo("------------------------------------------------------------\r\n");
                      ch->Echo( "Votes:\r\nYes:     %s\r\nNo:      %s\r\nAbstain: %s\r\n",
                                note->YesVotes, note->NoVotes, note->Abstentions );
                    }

                  Act( AT_ACTION, "$n reads a message.", ch, NULL, NULL, TO_ROOM );
                }
            }

          if ( !wasfound )
            {
              ch->Echo( "No such message: %d\r\n", anum);
            }

          return;
        }
      else
        {
          int counter = 0;
          bool wasfound = false;
          _IsNoteTo _isNoteTo(ch);

          for(const Note *note : board->Notes)
            {
              if (_isNoteTo(note) || GetTrustLevel(ch) > SysData.ReadAllMail)
                {
                  counter++;

                  if ( counter == anum || fAll )
                    {
                      wasfound = true;

                      if ( ch->Gold < 10
                           &&   GetTrustLevel(ch) < SysData.ReadMailFree )
                        {
                          ch->Echo("It costs 10 credits to read a message.\r\n");
                          return;
                        }

                      if (GetTrustLevel(ch) < SysData.ReadMailFree)
                        {
                          ch->Gold -= 10;
                        }

                      ch->Echo( "[%3d] %s: %s\r\n%s\r\nTo: %s\r\n%s",
                                counter,
                                note->Sender,
                                note->Subject,
                                note->Date,
                                note->ToList,
                                note->Text );
                    }
                }
            }

          if (!wasfound)
            {
              ch->Echo( "No such message: %d\r\n", anum);
            }

          return;
        }
    }
  else if ( !StrCmp( arg, "vote" ) )
    {
      char arg2[MAX_INPUT_LENGTH];
      int counter = 0;
      bool found = false;
      Note *note = nullptr;
      arg_passed = OneArgument( arg_passed, arg2 );
      board = FindBoardHere( ch );

      if ( !board )
        {
          ch->Echo( "There is no bulletin board here.\r\n" );
          return;
        }

      if ( !CanRead( ch, board ) )
        {
          ch->Echo( "You cannot vote on this board.\r\n" );
          return;
        }

      if ( IsNumber( arg2 ) )
        {
          anum = atoi( arg2 );
        }
      else
        {
          ch->Echo( "Note vote which number?\r\n" );
          return;
        }

      counter = 1;

      for(std::list<Note*>::const_iterator i = board->Notes.begin();
          i != board->Notes.end(); ++i)
        {
          note = *i;
          ++counter;

          if(counter == anum)
            {
              found = true;
              break;
            }
        }

      if ( !found )
        {
          ch->Echo( "No such note.\r\n" );
          return;
        }

      /* Options: open close yes no abstain */
      /* If you're the author of the note and can read the board you can open
         and close voting, if you can read it and voting is open you can vote.
      */
      if ( !StrCmp( arg_passed, "open" ) )
        {
          if ( StrCmp( ch->Name, note->Sender ) )
            {
              ch->Echo( "You are not the author of this message.\r\n" );
              return;
            }
          
          note->Voting = VOTE_OPEN;
          Act( AT_ACTION, "$n opens voting on a note.", ch, NULL, NULL, TO_ROOM );
          ch->Echo( "Voting opened.\r\n" );
          Boards->Save(board);
          return;
        }

      if ( !StrCmp( arg_passed, "close" ) )
        {
          if ( StrCmp( ch->Name, note->Sender ) )
            {
              ch->Echo( "You are not the author of this message.\r\n" );
              return;
            }
          
          note->Voting = VOTE_CLOSED;
          Act( AT_ACTION, "$n closes voting on a note.", ch, NULL, NULL, TO_ROOM );
          ch->Echo( "Voting closed.\r\n" );
          Boards->Save(board);
          return;
        }

      /* Make sure the note is open for voting before going on. */
      if ( note->Voting != VOTE_OPEN )
        {
          ch->Echo( "Voting is not open on this note.\r\n" );
          return;
        }

      /* Can only vote once on a note. */
      sprintf( buf, "%s %s %s",
               note->YesVotes, note->NoVotes, note->Abstentions );

      if ( IsName( ch->Name, buf ) )
        {
          ch->Echo( "You have already voted on this note.\r\n" );
          return;
        }

      if ( !StrCmp( arg_passed, "yes" ) )
        {
          sprintf( buf, "%s %s", note->YesVotes, ch->Name );
          FreeMemory( note->YesVotes );
          note->YesVotes = CopyString( buf );
          Act( AT_ACTION, "$n votes on a note.", ch, NULL, NULL, TO_ROOM );
          ch->Echo( "Ok.\r\n" );
          Boards->Save(board);
          return;
        }

      if ( !StrCmp( arg_passed, "no" ) )
        {
          sprintf( buf, "%s %s", note->NoVotes, ch->Name );
          FreeMemory( note->NoVotes );
          note->NoVotes = CopyString( buf );
          Act( AT_ACTION, "$n votes on a note.", ch, NULL, NULL, TO_ROOM );
          ch->Echo( "Ok.\r\n" );
          Boards->Save(board);
          return;
        }

      if ( !StrCmp( arg_passed, "abstain" ) )
        {
          sprintf( buf, "%s %s", note->Abstentions, ch->Name );
          FreeMemory( note->Abstentions );
          note->Abstentions = CopyString( buf );
          Act( AT_ACTION, "$n votes on a note.", ch, NULL, NULL, TO_ROOM );
          ch->Echo( "Ok.\r\n" );
          Boards->Save(board);
          return;
        }

      OperateOnNote( ch, "", false );
    }
  else if ( !StrCmp( arg, "write" ) )
    {
      if ( ch->SubState == SUB_RESTRICTED )
        {
          ch->Echo( "You cannot write a note from within another command.\r\n" );
          return;
        }

      if (GetTrustLevel (ch) < SysData.WriteMailFree)
        {
          quill = FindQuill( ch );

          if (!quill)
            {
              ch->Echo("You need a datapad to record a message.\r\n");
              return;
            }

          if ( quill->Value[OVAL_PEN_INK_AMOUNT] < 1 )
            {
              ch->Echo("Your quill is dry.\r\n");
              return;
            }
        }

      if ( ( paper = GetEquipmentOnCharacter(ch, WEAR_HOLD) ) == NULL
           || paper->ItemType != ITEM_PAPER )
        {
          if (GetTrustLevel(ch) < SysData.WriteMailFree )
            {
              ch->Echo("You need to be holding a message disk to write a note.\r\n");
              return;
            }

          paper = CreateObject( GetProtoObject(OBJ_VNUM_NOTE), 0 );

          if ((tmpobj = GetEquipmentOnCharacter(ch, WEAR_HOLD)) != NULL)
            {
              UnequipCharacter(ch, tmpobj);
            }

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
          ch->Echo("You cannot modify this message.\r\n");
          return;
        }
    }
  else if ( !StrCmp( arg, "subject" ) )
    {
      if(GetTrustLevel(ch) < SysData.WriteMailFree)
        {
          quill = FindQuill( ch );

          if ( !quill )
            {
              ch->Echo("You need a datapad to record a disk.\r\n");
              return;
            }

	  if ( quill->Value[OVAL_PEN_INK_AMOUNT] < 1 )
            {
              ch->Echo("Your quill is dry.\r\n");
              return;
            }
        }
      
      if ( IsNullOrEmpty( arg_passed ) )
        {
          ch->Echo("What do you wish the subject to be?\r\n");
          return;
        }

      if ( ( paper = GetEquipmentOnCharacter(ch, WEAR_HOLD) ) == NULL
           ||     paper->ItemType != ITEM_PAPER )
        {
          if(GetTrustLevel(ch) < SysData.WriteMailFree )
            {
              ch->Echo("You need to be holding a message disk to record a note.\r\n");
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
          ch->Echo("You cannot modify this message.\r\n");
          return;
        }
      else
        {
          paper->Value[OVAL_PAPER_1] = 1;
          ed = SetOExtra(paper, "_subject_");
          FreeMemory( ed->Description );
          ed->Description = CopyString( arg_passed );
          ch->Echo("Ok.\r\n");
          return;
        }
    }
  else if ( !StrCmp( arg, "to" ) )
    {
      struct stat fst;
      char fname[1024];

      if(GetTrustLevel(ch) < SysData.WriteMailFree )
        {
          quill = FindQuill( ch );

          if ( !quill )
            {
              ch->Echo("You need a datapad to record a message.\r\n");
              return;
            }
          
          if ( quill->Value[OVAL_PEN_INK_AMOUNT] < 1 )
            {
              ch->Echo("Your quill is dry.\r\n");
              return;
            }
        }

      if ( IsNullOrEmpty( arg_passed ) )
        {
          ch->Echo("Please specify an addressee.\r\n");
          return;
        }

      if ( ( paper = GetEquipmentOnCharacter(ch, WEAR_HOLD) ) == NULL
           ||     paper->ItemType != ITEM_PAPER )
        {
          if(GetTrustLevel(ch) < SysData.WriteMailFree )
            {
              ch->Echo("You need to be holding a message disk to record a note.\r\n");
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
          ch->Echo("You cannot modify this message.\r\n");
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
          ch->Echo("Ok.\r\n");
          return;
        }
      else
        {
          ch->Echo("No player exists by that name.\r\n");
          return;
        }
    }
  else if ( !StrCmp( arg, "show" ) )
    {
      char *subject, *to_list, *text;

      if ( ( paper = GetEquipmentOnCharacter(ch, WEAR_HOLD) ) == NULL
           ||     paper->ItemType != ITEM_PAPER )
        {
          ch->Echo("You are not holding a message disk.\r\n");
          return;
        }

      if ( (subject = GetExtraDescription( "_subject_", paper->FirstExtraDescription )) == NULL )
        subject = "(no subject)";
      if ( (to_list = GetExtraDescription( "_to_", paper->FirstExtraDescription )) == NULL )
        to_list = "(nobody)";

      ch->Echo( "%s: %s\r\nTo: %s\r\n",
                ch->Name,
                subject,
                to_list );

      if ( (text = GetExtraDescription( "_text_", paper->FirstExtraDescription )) == NULL )
        text = "The disk is blank.\r\n";

      ch->Echo(text);
      return;
    }
  else if ( !StrCmp( arg, "post" ) )
    {
      if ( ( paper = GetEquipmentOnCharacter(ch, WEAR_HOLD) ) == NULL
           ||     paper->ItemType != ITEM_PAPER )
        {
          ch->Echo("You are not holding a message disk.\r\n");
          return;
        }

      if ( paper->Value[OVAL_PAPER_0] == 0 )
        {
          ch->Echo("There is nothing written on this disk.\r\n");
          return;
        }

      if ( paper->Value[OVAL_PAPER_1] == 0 )
        {
          ch->Echo("This message has no subject... using 'none'.\r\n");
          paper->Value[OVAL_PAPER_1] = 1;
          ed = SetOExtra(paper, "_subject_");
          FreeMemory( ed->Description );
          ed->Description = CopyString( "none" );
        }

      if (paper->Value[OVAL_PAPER_2] == 0)
        {
          if ( IS_MAIL )
            {
              ch->Echo("This message is addressed to no one!\r\n");
              return;
            }
          else
            {
              ch->Echo("This message is addressed to no one... sending to 'all'!\r\n");
              paper->Value[OVAL_PAPER_2] = 1;
              ed = SetOExtra(paper, "_to_");
              FreeMemory( ed->Description );
              ed->Description = CopyString( "All" );
            }
        }

      board = FindBoardHere( ch );

      if ( !board )
        {
          ch->Echo( "There is no terminal here to upload your message to.\r\n" );
          return;
        }

      if ( !CanPost( ch, board ) )
        {
          ch->Echo( "You cannot use this terminal. It is encrypted...\r\n" );
          return;
        }

      if ( board->Notes.size() >= (size_t)board->MaxPosts )
        {
          ch->Echo( "This terminal is full. There is no room for your message.\r\n" );
          return;
        }

      Act( AT_ACTION, "$n uploads a message.", ch, NULL, NULL, TO_ROOM );

      char *strtime                     = ctime( &current_time );
      strtime[strlen(strtime)-1]        = '\0';
      Note *note = new Note();
      note->Date                       = CopyString( strtime );

      char *text = GetExtraDescription( "_text_", paper->FirstExtraDescription );
      note->Text = text ? CopyString( text ) : CopyString( "" );
      text = GetExtraDescription( "_to_", paper->FirstExtraDescription );
      note->ToList = text ? CopyString( text ) : CopyString( "all" );
      text = GetExtraDescription( "_subject_", paper->FirstExtraDescription );
      note->Subject = text ? CopyString( text ) : CopyString( "" );
      note->Sender  = CopyString( ch->Name );
      note->Voting      = 0;
      note->YesVotes    = CopyString( "" );
      note->NoVotes     = CopyString( "" );
      note->Abstentions = CopyString( "" );

      AddNote(board, note);
      Boards->Save(board);
      ch->Echo( "You upload your message to the terminal.\r\n" );
      ExtractObject( paper );
      return;
    }
  else if ( !StrCmp( arg, "remove" )
            || !StrCmp( arg, "take" )
            || !StrCmp( arg, "copy" ) )
    {
      enum
      {
        NOTE_REMOVE,
        NOTE_TAKE,
        NOTE_COPY
      };

      int take = 0;
      int counter = 0;
      board = FindBoardHere( ch );

      if ( !board )
        {
          ch->Echo( "There is no terminal here to download a note from!\r\n" );
          return;
        }

      if ( !StrCmp( arg, "take" ) )
        {
          take = NOTE_TAKE;
        }
      else if ( !StrCmp( arg, "copy" ) )
        {
          if ( !IsImmortal(ch) )
            {
              ch->Echo( "Huh?  Type 'help note' for usage.\r\n" );
              return;
            }

          take = NOTE_COPY;
        }
      else
        {
          take = NOTE_REMOVE;
        }

      if ( !IsNumber( arg_passed ) )
        {
          ch->Echo( "Note remove which number?\r\n" );
          return;
        }

      if ( !CanRead( ch, board ) )
        {
          ch->Echo( "You can't make any sense of what's posted here, let alone remove anything!\r\n" );
          return;
        }

      anum = atoi( arg_passed );
      _IsNoteTo _isNoteTo(ch);

      for(Note *note : board->Notes)
        {
          if (IS_MAIL && ((_isNoteTo(note))
                          || GetTrustLevel(ch) >= SysData.TakeOthersMail))
            {
              counter++;
            }
          else if (!IS_MAIL)
            {
              counter++;
            }

          if ( ( _isNoteTo(note)
                 || CanRemove(ch, board))
               &&   ( counter == anum ) )
            {
              if ( IsName("all", note->ToList)
                   && GetTrustLevel( ch ) < SysData.TakeOthersMail
                   && take != NOTE_COPY )
                {
                  ch->Echo("Notes addressed to 'all' can not be taken.\r\n");
                  return;
                }

              if ( take != NOTE_REMOVE )
                {
                  if ( ch->Gold < 50 && GetTrustLevel(ch) < SysData.ReadMailFree )
                    {
                      if ( take == NOTE_TAKE )
                        ch->Echo("It costs 50 credits to take your mail.\r\n");
                      else
                        ch->Echo("It costs 50 credits to copy your mail.\r\n");

                      return;
                    }

                  if ( GetTrustLevel(ch) < SysData.ReadMailFree )
                    ch->Gold -= 50;

                  paper = CreateObject( GetProtoObject(OBJ_VNUM_NOTE), 0 );
                  ed = SetOExtra( paper, "_sender_" );
                  FreeMemory( ed->Description );
                  ed->Description = CopyString(note->Sender);
                  ed = SetOExtra( paper, "_text_" );
                  FreeMemory( ed->Description );
                  ed->Description = CopyString(note->Text);
                  ed = SetOExtra( paper, "_to_" );
                  FreeMemory( ed->Description );
                  ed->Description = CopyString( note->ToList );
                  ed = SetOExtra( paper, "_subject_" );
                  FreeMemory( ed->Description );
                  ed->Description = CopyString( note->Subject );
                  ed = SetOExtra( paper, "_date_" );
                  FreeMemory( ed->Description );
                  ed->Description = CopyString( note->Date );
                  ed = SetOExtra( paper, "note" );
                  FreeMemory( ed->Description );
                  sprintf(notebuf, "From: ");
                  strcat(notebuf, note->Sender);
                  strcat(notebuf, "\r\nTo: ");
                  strcat(notebuf, note->ToList);
                  strcat(notebuf, "\r\nSubject: ");
                  strcat(notebuf, note->Subject);
                  strcat(notebuf, "\r\n\r\n");
                  strcat(notebuf, note->Text);
                  strcat(notebuf, "\r\n");
                  ed->Description = CopyString(notebuf);
                  paper->Value[OVAL_PAPER_0] = 2;
                  paper->Value[OVAL_PAPER_1] = 2;
                  paper->Value[OVAL_PAPER_2] = 2;
                  sprintf(short_desc_buf, "a note from %s to %s",
                          note->Sender, note->ToList);
                  FreeMemory(paper->ShortDescr);
                  paper->ShortDescr = CopyString(short_desc_buf);
                  sprintf(long_desc_buf, "A note from %s to %s lies on the ground.",
                          note->Sender, note->ToList);
                  FreeMemory(paper->Description);
                  paper->Description = CopyString(long_desc_buf);
                  sprintf(keyword_buf, "note parchment paper %s",
                          note->ToList);
                  FreeMemory(paper->Name);
                  paper->Name = CopyString(keyword_buf);
                }

              if ( take != NOTE_COPY )
                {
                  RemoveNote( board, note );
                }

              ch->Echo( "Ok.\r\n" );

              if(take == NOTE_REMOVE)
                {
                  Act( AT_ACTION, "$n removes a message.", ch, NULL, NULL, TO_ROOM );
                }
              else if ( take == NOTE_TAKE )
                {
                  Act( AT_ACTION, "$n downloads a message.", ch, NULL, NULL, TO_ROOM );
                  ObjectToCharacter(paper, ch);
                }
              else if ( take == NOTE_COPY )
                {
                  Act( AT_ACTION, "$n copies a message.", ch, NULL, NULL, TO_ROOM );
                  ObjectToCharacter(paper, ch);
                }
              else
                {
                  Log->Bug("OperateOnNote(): Invalid value for take: %d", take);
                  abort();
                }
            }
        }

      ch->Echo( "No such message.\r\n" );
      return;
    }

  ch->Echo( "Huh? Type 'help note' for usage.\r\n" );
}

void CountMailMessages(const Character *ch)
{
  size_t cnt = 0;

  for(const Board *board : Boards->Entities())
    {
      if ( board->Type == BOARD_MAIL && CanRead(ch, board) )
	{
          cnt += count_if(board->Notes.begin(), board->Notes.end(), _IsNoteTo(ch));
	}
    }

  if ( cnt != 0)
    {
      ch->Echo("You have %d mail messages waiting.\r\n", cnt);
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

Board *GetBoard( const std::string &name )
{
  return Boards->Find([name](const auto &board){ return StrCmp(board->Name, name) == 0; });
}

Board *AllocateBoard(const std::string &name)
{
  Board *board = new Board();
  board->Name           = CopyString( ToLower(name) );
  board->ReadGroup      = CopyString( "" );
  board->PostGroup      = CopyString( "" );
  board->ExtraReaders   = CopyString( "" );
  board->ExtraRemovers  = CopyString( "" );

  return board;
}

void FreeBoard(Board *board)
{
  if(board->Name != NULL)
    {
      FreeMemory(board->Name);
    }

  if(board->ReadGroup != NULL)
    {
      FreeMemory(board->ReadGroup);
    }

  if(board->PostGroup != NULL)
    {
      FreeMemory(board->PostGroup);
    }

  if(board->ExtraReaders != NULL)
    {
      FreeMemory(board->ExtraReaders);
    }

  if(board->ExtraRemovers != NULL)
    {
      FreeMemory(board->ExtraRemovers);
    }

  delete board;
}

void AddNote(Board *board, Note *note)
{
  board->Notes.push_back(note);
}

///////////////////////////////////////
class LuaBoardRepository : public BoardRepository
{
public:
  void Load() override;
  void Save() const override;
  void Save(const Board *board) const override;
};

void LuaBoardRepository::Load()
{
  ForEachLuaFileInDir( BOARD_DIR, ExecuteBoardFile, NULL );
}

void LuaBoardRepository::Save() const
{
  for(const Board *board : Boards->Entities())
    {
      Save(board);
    }
}

void LuaBoardRepository::Save(const Board *board) const
{
  LuaSaveDataFile( GetBoardFilename( board ), PushBoard, "board", board );
}

////////////////////////////////////
BoardRepository *NewBoardRepository()
{
  return new LuaBoardRepository();
}

