#ifndef _SWRIP_HELPREPOSITORY_HPP_
#define _SWRIP_HELPREPOSITORY_HPP_

#include <utility/repository.hpp>
#include "types.hpp"

struct CompareHelpFile
{
  bool operator()(const HelpFile *pHelp, const HelpFile *tHelp) const;
};

class HelpFileRepository : public Ceris::Repository<HelpFile*, CompareHelpFile>
{
public:
  virtual void Load() = 0;
  virtual void Save() const = 0;
};

extern HelpFileRepository *HelpFiles;
HelpFileRepository *NewHelpFileRepository();

#endif
