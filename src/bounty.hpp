#ifndef _SWRIP_BOUNTY_HPP_
#define _SWRIP_BOUNTY_HPP_

#include <utility/oldrepository.hpp>
#include "types.hpp"

extern OldRepository *BountyRepository;

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
OldRepository *NewBountyRepository(void);

#endif
