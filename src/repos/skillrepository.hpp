#ifndef _SWRIP_SKILLREPOSITORY_HPP_
#define _SWRIP_SKILLREPOSITORY_HPP_

#include <string>
#include <memory>
#include <utility/repository.hpp>
#include "types.hpp"

class SkillRepository : public Ceris::Repository<std::shared_ptr<Skill>>
{
public:
  virtual std::shared_ptr<Skill> GetSkill( int sn ) = 0;
  virtual int LookupSkill( const std::string &name ) = 0;
  
protected:
  SkillRepository() = default;
};

inline std::shared_ptr<SkillRepository> Skills;
std::shared_ptr<SkillRepository> NewSkillRepository();

#endif
