#include "lua_macrorepository.hpp"

class LuaMacroRepository : public MacroRepository
{
public:
    void Load() override;
    void Save() const override;
};

void LuaMacroRepository::Load()
{

}

void LuaMacroRepository::Save() const
{

}

std::shared_ptr<MacroRepository> NewLuaMacroRepository()
{
    return std::make_shared<LuaMacroRepository>();
}
