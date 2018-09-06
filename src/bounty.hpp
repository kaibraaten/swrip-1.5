#ifndef _SWRIP_BOUNTY_HPP_
#define _SWRIP_BOUNTY_HPP_

#include <utility/repository.hpp>
#include "types.hpp"

class Bounty
{
public:
  std::string Target;
  long Reward = 0;
  std::string Poster;
};

void AddBounty( const Character *ch, const Character *victim, long amount );
Bounty *GetBounty( const std::string &target );
void LoadBounties( void );
void RemoveBounty( Bounty *bounty );
void ClaimBounty( Character *ch, const Character *victim );
bool IsBountyOn( const Character *victim );

class BountyRepository : public Ceris::Repository<Bounty*>
{
public:
  virtual void Load() = 0;
  virtual void Save() const = 0;
};

extern BountyRepository *Bounties;
BountyRepository *NewBountyRepository();

#endif
