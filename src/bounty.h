#ifndef _SWRIP_BOUNTY_H_
#define _SWRIP_BOUNTY_H_

#include <utility/repository.h>
#include "types.h"

extern Repository *BountyRepository;

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
Repository *NewBountyRepository(void);

#endif
