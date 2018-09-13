#ifndef _SWRIP_SOCIALREPOSITORY_HPP_
#define _SWRIP_SOCIALREPOSITORY_HPP_

#include <utility/repository.hpp>
#include "types.hpp"

struct CompareSocial
{
  bool operator()(const Social *lhs, const Social *rhs) const;
};

class SocialRepository : public Ceris::Repository<Social*, CompareSocial>
{
public:
  virtual void Save() const = 0;
  virtual void Load() = 0;
  virtual Social *FindByName(const std::string &name) const = 0;
};

extern SocialRepository *Socials;
SocialRepository *NewSocialRepository();

#endif
