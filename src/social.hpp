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
  char *Name = nullptr;
  char *CharNoArg = nullptr;
  char *OthersNoArg = nullptr;
  char *CharFound = nullptr;
  char *OthersFound = nullptr;
  char *VictimFound = nullptr;
  char *CharAuto = nullptr;
  char *OthersAuto = nullptr;
};

void FreeSocial( Social *social );
bool CheckSocial( Character *ch, const std::string &command, char *argument );

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
