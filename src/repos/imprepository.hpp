#ifndef _SWRIP_REPOS_IMPREPOSITORY_HPP_
#define _SWRIP_REPOS_IMPREPOSITORY_HPP_

#include <memory>
#include <string>
#include <vector>

struct ImpScriptEntry
{
    std::string Package;
    std::string Module;
    std::vector<std::string> Body;
};

class ImpRepository
{
public:
    virtual std::vector<ImpScriptEntry> Entities() const = 0;
    virtual std::vector<ImpScriptEntry> FindByPath(const std::string &path) = 0;
    virtual std::vector<ImpScriptEntry> FindByFullText(const std::string &path) = 0;
};

inline std::shared_ptr<ImpRepository> ImpScripts;
std::shared_ptr<ImpRepository> NewImpRepository();

#endif
