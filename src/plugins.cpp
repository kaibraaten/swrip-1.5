#include "mud.hpp"
#include "plugins.hpp"

#define PLUGIN_DIR DATA_DIR "plugins/"

struct Plugin::Impl
{
    std::string Name;
    std::string Description;
};

Plugin::Plugin()
    : pImpl(std::make_unique<Impl>())
{

}

Plugin::~Plugin()
{

}

std::string Plugin::Name() const
{
    return pImpl->Name;
}

void Plugin::Name(const std::string &name)
{
    pImpl->Name = name;
}

std::string Plugin::Description() const
{
    return pImpl->Description;
}

void Plugin::Description(const std::string &description)
{
    pImpl->Description = description;
}

//////////////////////////////////////////////////////////
// Free functions

void LoadPlugins()
{

}

void SavePlugin(std::shared_ptr<Plugin> plugin)
{

}
