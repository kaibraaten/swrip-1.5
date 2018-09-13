#include "boardrepository.hpp"
#include "board.hpp"
#include "script.hpp"
#include "constants.hpp"

#define BOARD_DIR DATA_DIR "boards/"

BoardRepository *Boards = nullptr;

std::string GetBoardFilename( const Board *board )
{
  char fullPath[MAX_STRING_LENGTH];
  sprintf( fullPath, "%s%s", BOARD_DIR, ConvertToLuaFilename( board->Name ).c_str() );

  return fullPath;
}

///////////////////////////////////////
class LuaBoardRepository : public BoardRepository
{
public:
  void Load() override;
  void Save() const override;
  void Save(const Board *board) const override;

private:
  static void LoadNote( lua_State *L, Board *board );
  static void LoadNotes( lua_State *L, Board *board );
  static int L_BoardEntry( lua_State *L );
  static void ExecuteBoardFile( const std::string &filePath, void *userData );
  static void PushNotes( lua_State *L, const Board *board );
  static void PushBoard( lua_State *L, const void *userData );
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

void LuaBoardRepository::LoadNote( lua_State *L, Board *board )
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
      note->Sender = lua_tostring( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      note->Date = lua_tostring( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      note->ToList = lua_tostring( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      note->Subject = lua_tostring( L, idx );
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
      note->YesVotes = lua_tostring( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      note->NoVotes = lua_tostring( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      note->Abstentions = lua_tostring( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      note->Text = lua_tostring( L, idx );
    }

  lua_pop( L, topAfterGets - topAtStart );
  board->Add(note);
}

void LuaBoardRepository::LoadNotes( lua_State *L, Board *board )
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

int LuaBoardRepository::L_BoardEntry( lua_State *L )
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
      board->Name = lua_tostring( L, idx );
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
      board->ReadGroup = lua_tostring( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      board->PostGroup = lua_tostring( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      board->ExtraReaders = lua_tostring( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      board->ExtraRemovers = lua_tostring( L, idx );
    }

  lua_pop( L, topAfterGets - topAtStart );

  LoadNotes( L, board );

  Boards->Add(board);
  return 0;
}

void LuaBoardRepository::ExecuteBoardFile( const std::string &filePath, void *userData )
{
  LuaLoadDataFile( filePath, L_BoardEntry, "BoardEntry" );
}

void LuaBoardRepository::PushNotes( lua_State *L, const Board *board )
{
  if(!board->Notes().empty())
    {
      int idx = 0;
      lua_pushstring( L, "Notes" );
      lua_newtable( L );

      for(const Note *note : board->Notes())
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

void LuaBoardRepository::PushBoard( lua_State *L, const void *userData )
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

////////////////////////////////////
BoardRepository *NewBoardRepository()
{
  return new LuaBoardRepository();
}
