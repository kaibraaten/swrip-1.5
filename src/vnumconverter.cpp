#include "vnumconverter.hpp"
#include "builtinvnumconverter.hpp"
#include "pluginvnumconverter.hpp"
#include "area.hpp"

std::shared_ptr<VnumConverter> VnumConverter::Create(std::shared_ptr<Area> area)
{
    if(area->SavingPlugin)
    {
        return std::make_shared<PluginVnumConverter>(area->SavingPlugin);
    }
    else
    {
        return std::make_shared<BuiltinVnumConverter>(area);
    }
}
