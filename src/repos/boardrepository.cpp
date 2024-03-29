#include "boardrepository.hpp"
#include "board.hpp"
#include "luascript.hpp"
#include "constants.hpp"
#include "mud.hpp"
#include "protoobject.hpp"

#define BOARD_DIR DATA_DIR "boards/"

std::string GetBoardFilename(const std::shared_ptr<Board> &board)
{
    return FormatString("%s%s", BOARD_DIR, ConvertToLuaFilename(board->Name).c_str());
}

///////////////////////////////////////
class LuaBoardRepository : public BoardRepository
{
public:
    void Load() override;
    void Save() const override;
    void Save(const std::shared_ptr<Board> &board) const override;

private:
    static void LoadNote(lua_State *L, const std::shared_ptr<Board> &board);
    static void LoadNotes(lua_State *L, const std::shared_ptr<Board> &board);
    static int L_BoardEntry(lua_State *L);
    static void ExecuteBoardFile(const std::string &filePath);
    static void PushNotes(lua_State *L, const std::shared_ptr<Board> &board);
    static void PushBoard(lua_State *L, const std::shared_ptr<Board> &board);
};

void LuaBoardRepository::Load()
{
    ForEachLuaFileInDir(BOARD_DIR, ExecuteBoardFile);
}

void LuaBoardRepository::Save() const
{
    for(const auto &board : Boards)
    {
        Save(board);
    }
}

void LuaBoardRepository::Save(const std::shared_ptr<Board> &board) const
{
    LuaSaveDataFile(GetBoardFilename(board), PushBoard, "board", board);
}

void LuaBoardRepository::LoadNote(lua_State *L, const std::shared_ptr<Board> &board)
{
    std::shared_ptr<Note> note = std::make_shared<Note>();

    LuaGetfieldString(L, "Sender", &note->Sender);
    LuaGetfieldString(L, "Date", &note->Date);
    LuaGetfieldString(L, "ToList", &note->ToList);
    LuaGetfieldString(L, "Subject", &note->Subject);
    bool voting = false;
    LuaGetfieldBool(L, "Voting", &voting);
    note->Voting = voting;
    LuaGetfieldString(L, "YesVotes", &note->YesVotes);
    LuaGetfieldString(L, "NoVotes", &note->NoVotes);
    LuaGetfieldString(L, "Abstentions", &note->Abstentions);
    LuaGetfieldString(L, "Text", &note->Text);

    board->Add(note);
}

void LuaBoardRepository::LoadNotes(lua_State *L, const std::shared_ptr<Board> &board)
{
    LuaLoadArray(L, "Notes",
                 [L, board](auto, auto, auto)
                 {
                     LoadNote(L, board);
                 },
                 nullptr);
}

int LuaBoardRepository::L_BoardEntry(lua_State *L)
{
    std::shared_ptr<Board> board = std::make_shared<Board>();

    LuaGetfieldString(L, "Name", &board->Name);
    LuaGetfieldString(L, "BoardObjectVnum",
                      [board](const auto &vnumOrTag)
                      {
                          auto obj = GetProtoObject(vnumOrTag);
                          board->BoardObject = obj->Vnum;
                      });
    LuaGetfieldInt(L, "MinReadLevel", &board->MinReadLevel);
    LuaGetfieldInt(L, "MinPostLevel", &board->MinPostLevel);
    LuaGetfieldInt(L, "MinRemoveLevel", &board->MinRemoveLevel);
    LuaGetfieldInt(L, "MaxPosts", &board->MaxPosts);
    LuaGetfieldString(L, "Type",
                      [board](const std::string &typeName)
                      {
                          board->Type = !StrCmp(typeName, "mail") ? BOARD_MAIL : BOARD_NOTE;
                      });
    LuaGetfieldString(L, "ReadGroup", &board->ReadGroup);
    LuaGetfieldString(L, "PostGroup", &board->PostGroup);
    LuaGetfieldString(L, "ExtraReaders", &board->ExtraReaders);
    LuaGetfieldString(L, "ExtraRemovers", &board->ExtraRemovers);

    LoadNotes(L, board);

    Boards->Add(board);
    return 0;
}

void LuaBoardRepository::ExecuteBoardFile(const std::string &filePath)
{
    LuaLoadDataFile(filePath, L_BoardEntry, "BoardEntry");
}

void LuaBoardRepository::PushNotes(lua_State *L, const std::shared_ptr<Board> &board)
{
    if(!board->Notes().empty())
    {
        int idx = 0;
        lua_pushstring(L, "Notes");
        lua_newtable(L);

        for(auto note : board->Notes())
        {
            ++idx;
            lua_pushinteger(L, idx);
            lua_newtable(L);

            LuaSetfieldString(L, "Sender", note->Sender);
            LuaSetfieldString(L, "Date", note->Date);
            LuaSetfieldString(L, "ToList", note->ToList);
            LuaSetfieldString(L, "Subject", note->Subject);
            LuaSetfieldBoolean(L, "Voting", note->Voting ? true : false);
            LuaSetfieldString(L, "YesVotes", note->YesVotes);
            LuaSetfieldString(L, "NoVotes", note->NoVotes);
            LuaSetfieldString(L, "Abstentions", note->Abstentions);
            LuaSetfieldString(L, "Text", note->Text);

            lua_settable(L, -3);
        }

        lua_settable(L, -3);
    }
}

void LuaBoardRepository::PushBoard(lua_State *L, const std::shared_ptr<Board> &board)
{
    lua_pushinteger(L, 1);
    lua_newtable(L);

    LuaSetfieldString(L, "Name", board->Name);

    auto boardobject = GetProtoObject(board->BoardObject);

    if(boardobject != nullptr)
    {
        LuaSetfieldString(L, "BoardObjectVnum", VnumOrTag(boardobject));
    }
    else
    {
        LuaSetfieldNumber(L, "BoardObjectVnum", board->BoardObject);
    }
    
    LuaSetfieldNumber(L, "MinReadLevel", board->MinReadLevel);
    LuaSetfieldNumber(L, "MinPostLevel", board->MinPostLevel);
    LuaSetfieldNumber(L, "MinRemoveLevel", board->MinRemoveLevel);
    LuaSetfieldNumber(L, "MaxPosts", board->MaxPosts);
    LuaSetfieldString(L, "Type", board->Type == BOARD_NOTE ? "Note" : "Mail");
    LuaSetfieldString(L, "ReadGroup", board->ReadGroup);
    LuaSetfieldString(L, "PostGroup", board->PostGroup);
    LuaSetfieldString(L, "ExtraReaders", board->ExtraReaders);
    LuaSetfieldString(L, "ExtraRemovers", board->ExtraRemovers);

    PushNotes(L, board);

    lua_setglobal(L, "board");
}

////////////////////////////////////
std::shared_ptr<BoardRepository> NewBoardRepository()
{
    return std::make_shared<LuaBoardRepository>();
}
