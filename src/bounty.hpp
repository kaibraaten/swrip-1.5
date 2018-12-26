#ifndef _SWRIP_BOUNTY_HPP_
#define _SWRIP_BOUNTY_HPP_

#include <memory>
#include <string>
#include "types.hpp"

class Bounty
{
public:
  std::string Target;
  long Reward = 0;
  std::string Poster;
};

void AddBounty(const Character *ch, const Character *victim, long amount);
std::shared_ptr<Bounty> GetBounty(const std::string &target);
void LoadBounties();
void RemoveBounty(std::shared_ptr<Bounty> bounty);
void ClaimBounty(Character *ch, const Character *victim);
bool IsBountyOn(const Character *victim);

#endif
