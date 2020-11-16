#include "skillrepository.hpp"
#include "skill.hpp"

class TransitionarySkillRepository : public SkillRepository
{
public:
    std::shared_ptr<Skill> GetSkill(int sn) override;
    int LookupSkill(const std::string& name) override;
};

std::shared_ptr<Skill> TransitionarySkillRepository::GetSkill(int sn)
{
    return ::GetSkill(sn);
}

int TransitionarySkillRepository::LookupSkill(const std::string& name)
{
    return ::LookupSkill(name);
}

std::shared_ptr<SkillRepository> NewSkillRepository()
{
    return std::make_shared<TransitionarySkillRepository>();
}
