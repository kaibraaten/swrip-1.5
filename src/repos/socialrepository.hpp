#ifndef _SWRIP_SOCIALREPOSITORY_HPP_
#define _SWRIP_SOCIALREPOSITORY_HPP_

#include <memory>
#include <utility/repository.hpp>
#include "types.hpp"

struct CompareSocial
{
  bool operator()(std::shared_ptr<Social> lhs, std::shared_ptr<Social> rhs) const;
};

class SocialRepository : public Ceris::Repository<std::shared_ptr<Social>, CompareSocial>
{
public:
  virtual void Save() const = 0;
  virtual void Load() = 0;
  virtual std::shared_ptr<Social> FindByName(const std::string &name) const = 0;
};

extern std::shared_ptr<SocialRepository> Socials;
std::shared_ptr<SocialRepository> NewSocialRepository();

#endif
