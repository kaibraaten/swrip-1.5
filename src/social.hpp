#ifndef _SWRIP_SOCIAL_HPP_
#define _SWRIP_SOCIAL_HPP_

#include <array>
#include <string>
#include <utility/repository.hpp>
#include "types.hpp"
#include "constants.hpp"

struct Social
{
  char *Name;
  char *CharNoArg;
  char *OthersNoArg;
  char *CharFound;
  char *OthersFound;
  char *VictimFound;
  char *CharAuto;
  char *OthersAuto;
};

void FreeSocial( Social *social );
bool CheckSocial( Character *ch, const char *command, char *argument );

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
  virtual void Save() const override;
  virtual void Load() override;
  virtual Social *FindByName(const std::string &name) const;
};

extern SocialRepository *Socials;
SocialRepository *NewSocialRepository();

#endif
