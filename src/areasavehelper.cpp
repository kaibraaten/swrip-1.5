#include "areasavehelper.hpp"
#include "areasavehelperbuiltin.hpp"
#include "areasavehelperplugin.hpp"
#include "area.hpp"

std::shared_ptr<AreaSaveHelper> AreaSaveHelper::Create(std::shared_ptr<Area> area)
{
    if(area->Plugin != nullptr)
    {
        return std::make_shared<AreaSaveHelperPlugin>(area->Plugin);
    }
    else
    {
        return std::make_shared<AreaSaveHelperBuiltin>(area);
    }
}
