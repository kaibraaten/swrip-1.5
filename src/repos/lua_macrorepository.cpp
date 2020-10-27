#include "lua_macrorepository.hpp"
#include "mprog_ext.hpp"
#include "constants.hpp"
#include "luascript.hpp"

#define MACRO_DATA_FILE DATA_DIR "macros.lua"


class LuaMacroRepository : public MacroRepository
{
public:
    std::shared_ptr<MudProgMacroCode> FindEntry(const std::string &macroname) override;
    std::list<std::string> MacroNameList() const override;
    void Load() override;
    void Save() const override;

private:
    static void PushMacros(lua_State *L, const LuaMacroRepository *repos);
    static int L_MacroEntry(lua_State *L);
};

void LuaMacroRepository::Load()
{
    LuaLoadDataFile(MACRO_DATA_FILE, L_MacroEntry, "MacroEntry");
}

void LuaMacroRepository::Save() const
{
    LuaSaveDataFile(MACRO_DATA_FILE, PushMacros, "macros", this);
}

void LuaMacroRepository::PushMacros(lua_State *L, const LuaMacroRepository *repos)
{
    lua_newtable(L);

    for(const auto &entry : repos->Entities())
    {
        static int idx = 0;
        lua_pushinteger(L, ++idx);
        lua_newtable(L);

        LuaSetfieldString(L, "Text", entry->Text);
        
        lua_settable(L, -3);
    }
    
    lua_setglobal(L, "macros");
}

int LuaMacroRepository::L_MacroEntry(lua_State *L)
{
    std::string macrotext;
    LuaGetfieldString(L, "Text", &macrotext);

    if(!macrotext.empty())
    {
        auto macro = std::make_shared<MudProgMacroCode>(macrotext);
        Macros->Add(macro);
    }

    return 0;
}

std::shared_ptr<MudProgMacroCode> LuaMacroRepository::FindEntry(const std::string &macroname)
{
    return Find([macroname](const auto &i)
                {
                    auto entry = SplitIntoVector(i->Text);
                    auto start = std::find(entry.begin(), entry.end(), "def " + macroname);

                    if(start != entry.end())
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                });
}

std::list<std::string> LuaMacroRepository::MacroNameList() const
{
    std::list<std::string> output;

    for(auto e : Entities())
    {
        auto entry = SplitIntoVector(e->Text);

        for(auto line : entry)
        {
            if(StringPrefix("def ", line) == 0)
            {
                std::string name = line.substr(strlen("def "));
                output.push_back(name);
            }
        }
    }

    return output;
}

std::shared_ptr<MacroRepository> NewLuaMacroRepository()
{
    return std::make_shared<LuaMacroRepository>();
}
