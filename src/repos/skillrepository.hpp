#ifndef _SWRIP_SKILLREPOSITORY_HPP_
#define _SWRIP_SKILLREPOSITORY_HPP_

#include <string>
#include <utility/os.hpp>
#include <utility/repository.hpp>
#include "types.hpp"

class SkillRepository : public Ceris::Repository<Skill*>
{
public:
  virtual Skill *GetSkill( int sn ) = 0;
  virtual int LookupSkill( const std::string &name ) = 0;
  
protected:
  SkillRepository() = default;
};

extern DllImport SkillRepository *Skills;
SkillRepository *NewSkillRepository();

#endif
