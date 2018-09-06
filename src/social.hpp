#ifndef _SWRIP_SOCIAL_HPP_
#define _SWRIP_SOCIAL_HPP_

#include <array>
#include <string>
#include <utility/repository.hpp>
#include "types.hpp"
#include "constants.hpp"

class Social
{
public:
  std::string Name;
  std::string CharNoArg;
  std::string OthersNoArg;
  std::string CharFound;
  std::string OthersFound;
  std::string VictimFound;
  std::string CharAuto;
  std::string OthersAuto;
};

void FreeSocial( Social *social );
bool CheckSocial( Character *ch, const std::string &command, const std::string &argument );

struct CompareSocial
{
  bool operator()(const Social *lhs, const Social *rhs) const
  {
    return StrCmp(lhs->Name, rhs->Name) < 0;
  }
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
