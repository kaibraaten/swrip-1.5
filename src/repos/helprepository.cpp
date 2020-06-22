#include "helprepository.hpp"
#include "help.hpp"
#include "script.hpp"

#define HELP_DATA_FILE DATA_DIR "help.lua"

std::shared_ptr<HelpFileRepository> HelpFiles;

static int L_HelpEntry(lua_State *L);
static void PushHelps(lua_State *L);
static void PushHelpFile(lua_State *L, const std::shared_ptr<HelpFile> &);
static std::string MunchLeadingSpace(const std::string &text);

class LuaHelpFileRepository : public HelpFileRepository
{
public:
    void Load() override;
    void Save() const override;
};

void LuaHelpFileRepository::Load()
{
    LuaLoadDataFile(HELP_DATA_FILE, L_HelpEntry, "HelpEntry");
}

void LuaHelpFileRepository::Save() const
{
    LuaSaveDataFile(HELP_DATA_FILE, PushHelps, "helps");
}

std::shared_ptr<HelpFileRepository> NewHelpFileRepository()
{
    return std::make_shared<LuaHelpFileRepository>();
}

bool CompareHelpFile::operator()(const std::shared_ptr<HelpFile> &pHelp,
                                 const std::shared_ptr<HelpFile> &tHelp) const
{
    const char *lhs = pHelp->Keyword[0] == '\'' ? pHelp->Keyword.c_str() + 1 : pHelp->Keyword.c_str();
    const char *rhs = tHelp->Keyword[0] == '\'' ? tHelp->Keyword.c_str() + 1 : tHelp->Keyword.c_str();
    int match = StrCmp(lhs, rhs);

    if(match < 0 || (match == 0 && pHelp->Level > tHelp->Level))
    {
        return true;
    }
    else
    {
        return false;
    }
}

static int L_HelpEntry(lua_State *L)
{
    std::string keyword;
    int level = 0;

    LuaGetfieldString(L, "Keyword", &keyword);
    LuaGetfieldInt(L, "Level", &level);

    std::shared_ptr<HelpFile> help = AllocateHelpFile(keyword, level);

    LuaGetfieldString(L, "Text",
                      [help](const std::string &text)
                      {
                          help->Text = text;
                      });

    if(!StrCmp(GetHelpFileKeyword(help), "greeting"))
    {
        HelpGreeting = help->Text;
    }

    HelpFiles->Add(help);

    return 0;
}

static void PushHelps(lua_State *L)
{
    lua_newtable(L);

    for(const auto &help : HelpFiles)
    {
        PushHelpFile(L, help);
    }

    lua_setglobal(L, "helps");
}

static void PushHelpFile(lua_State *L, const std::shared_ptr<HelpFile> &help)
{
    static int idx = 0;

    lua_pushinteger(L, ++idx);
    lua_newtable(L);

    LuaSetfieldString(L, "Keyword", GetHelpFileKeyword(help));
    LuaSetfieldNumber(L, "Level", GetHelpFileLevel(help));
    LuaSetfieldString(L, "Text", MunchLeadingSpace(help->Text));

    lua_settable(L, -3);
}

/*
 * Stupid leading space muncher fix                             -Thoric
 */
static std::string MunchLeadingSpace(const std::string &text)
{
    if(text.empty())
    {
        return "";
    }

    std::string fixed = StripCarriageReturn(text);

    if(fixed[0] == ' ')
        fixed[0] = '.';

    return fixed;
}
