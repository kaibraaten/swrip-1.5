#ifndef _SWRIP_MACROREPOSITORY_HPP_
#define _SWRIP_MACROREPOSITORY_HPP_

#include <memory>
#include <utility/repository.hpp>
#include "types.hpp"

class MacroRepository : public Ceris::Repository<std::shared_ptr<MudProgMacroCode>>
{
public:
    virtual void Load() = 0;
    virtual void Save() const = 0;
};

std::shared_ptr<MacroRepository> NewMacroRepository();
extern std::shared_ptr<MacroRepository> Macros;

#endif
