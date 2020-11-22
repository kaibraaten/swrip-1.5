#include "areasavehelper.hpp"
#include "areasavehelperbuiltin.hpp"
#include "areasavehelperplugin.hpp"
#include "area.hpp"

std::shared_ptr<AreaSaveHelper> AreaSaveHelper::Create(std::shared_ptr<Area> area)
{
    if(area->SavingPlugin)
    {
        return std::make_shared<AreaSaveHelperPlugin>(area->SavingPlugin);
    }
    else
    {
        return std::make_shared<AreaSaveHelperBuiltin>(area);
    }
}
