#ifndef _SWRIP_HELPREPOSITORY_HPP_
#define _SWRIP_HELPREPOSITORY_HPP_

#include <memory>
#include <utility/repository.hpp>
#include "types.hpp"

struct CompareHelpFile
{
    bool operator()(const std::shared_ptr<HelpFile> &pHelp, const std::shared_ptr<HelpFile> &tHelp) const;
};

class HelpFileRepository : public Ceris::Repository<std::shared_ptr<HelpFile>, CompareHelpFile>
{
public:
    virtual void Load() = 0;
    virtual void Save() const = 0;
};

inline std::shared_ptr<HelpFileRepository> HelpFiles;
std::shared_ptr<HelpFileRepository> NewHelpFileRepository();

#endif
