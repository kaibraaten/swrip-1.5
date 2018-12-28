#include "skillrepository.hpp"
#include "skill.hpp"

DllExport SkillRepository *Skills = nullptr;

class TransitionarySkillRepository : public SkillRepository
{
public:
  Skill *GetSkill( int sn ) override;
  int LookupSkill( const std::string &name ) override;
};

Skill *TransitionarySkillRepository::GetSkill( int sn )
{
  return ::GetSkill( sn );
}

int TransitionarySkillRepository::LookupSkill( const std::string &name )
{
  return ::LookupSkill( name );
}

SkillRepository *NewSkillRepository()
{
  return new TransitionarySkillRepository();
}
