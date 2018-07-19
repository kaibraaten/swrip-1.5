#ifndef _SWRIP_BOUNTY_HPP_
#define _SWRIP_BOUNTY_HPP_

#include <utility/repository.hpp>
#include "types.hpp"

struct Bounty
{
  char *Target;
  long Reward;
  char *Poster;
};

void AddBounty( const Character *ch, const Character *victim, long amount );
Bounty *GetBounty( const char *target );
void LoadBounties( void );
void RemoveBounty( Bounty *bounty );
void ClaimBounty( Character *ch, const Character *victim );
bool IsBountyOn( const Character *victim );

class BountyRepository : public Ceris::Repository<Bounty*>
{
public:
  virtual void Load() override;
  virtual void Save() const override;
};

extern BountyRepository *Bounties;
BountyRepository *NewBountyRepository();

#endif
