#ifndef _SWRIP_MACROREPOSITORY_HPP_
#define _SWRIP_MACROREPOSITORY_HPP_

#include <memory>
#include <utility/repository.hpp>
#include "types.hpp"

class MacroRepository : public Ceris::Repository<std::shared_ptr<MudProgMacroCode>>
{
public:
    virtual std::shared_ptr<MudProgMacroCode> FindEntry(const std::string &macroname) = 0;
    virtual std::list<std::string> MacroNameList() const = 0;
    virtual void Load() = 0;
    virtual void Save() const = 0;
};

std::shared_ptr<MacroRepository> NewMacroRepository();
inline std::shared_ptr<MacroRepository> Macros;

#endif
