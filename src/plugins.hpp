#ifndef _SWRIP_PLUGINS_HPP_
#define _SWRIP_PLUGINS_HPP_

#include <memory>
#include <string>

class Plugin
{
public:
    Plugin();
    ~Plugin();
    std::string Name() const;
    void Name(const std::string &name);
    std::string Description() const;
    void Description(const std::string &description);
    
private:
    struct Impl;
    std::unique_ptr<Impl> pImpl;
};

inline std::list<std::shared_ptr<Plugin>> Plugins;

void LoadPlugins();
void SavePlugin(std::shared_ptr<Plugin> plugin);

#endif
