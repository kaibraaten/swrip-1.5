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

void AddBounty(std::shared_ptr<Character> ch, std::shared_ptr<Character> victim, long amount);
std::shared_ptr<Bounty> GetBounty(const std::string &target);
void RemoveBounty(std::shared_ptr<Bounty> bounty);
void ClaimBounty(std::shared_ptr<Character> ch, std::shared_ptr<Character> victim);

#endif
