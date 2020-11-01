#ifndef _SWRIP_REPOS_IMPREPOSITORY_HPP_
#define _SWRIP_REPOS_IMPREPOSITORY_HPP_

#include <memory>
#include <string>
#include <list>

struct ImpScriptEntry
{
    std::string Package;
    std::string Module;
    std::list<std::string> Body;
};

class ImpRepository
{
public:
    virtual std::list<ImpScriptEntry> Entities() const = 0;
    virtual std::list<ImpScriptEntry> FindByPath(const std::string &path) = 0;
    virtual std::list<ImpScriptEntry> FindByFullText(const std::string &path) = 0;
};

extern std::shared_ptr<ImpRepository> ImpScripts;
std::shared_ptr<ImpRepository> NewImpRepository();

#endif
