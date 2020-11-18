#include <utility/algorithms.hpp>
#include <utility/utility.hpp>
#include "mud.hpp"
#include "plugins.hpp"
#include "log.hpp"

#define PLUGIN_DIR DATA_DIR "plugins/"

struct Plugin::Impl
{
    Impl(const std::string &id)
        : Id(id),
          Name(id)
    {

    }

    std::string Id;
    std::string Name;
    std::string Description;
};

Plugin::Plugin(const std::string &id)
    : pImpl(std::make_unique<Impl>(id))
{

}

Plugin::~Plugin()
{

}

std::string Plugin::Id() const
{
    return pImpl->Id;
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
    Log->Info("Saving plugin %s (%s)", plugin->Name().c_str(), plugin->Id().c_str());
}

std::shared_ptr<Plugin> FindPlugin(const std::string &id)
{
    auto byId = [id](const auto &p)
                {
                    return StrCmp(p->Id(), id) == 0;
                };
    return Find(Plugins, byId);
}

std::shared_ptr<Plugin> CreatePlugin(const std::string &id)
{
    if(FindPlugin(id) == nullptr)
    {
        auto newPlugin = std::make_shared<Plugin>(id);
        Plugins.push_back(newPlugin);
        return newPlugin;
    }
    else
    {
        return nullptr;
    }
}
