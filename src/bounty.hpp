#ifndef _SWRIP_BOUNTY_H_
#define _SWRIP_BOUNTY_H_

#include "types.hpp"

extern Bounty *FirstBounty;
extern Bounty *LastBounty;

struct Bounty
{
  Bounty *Next;
  Bounty *Previous;
  char   *Target;
  long    Reward;
  char   *Poster;
};

void AddBounty( const Character *ch, const Character *victim, long amount );
Bounty *GetBounty( const char *target );
void LoadBounties( void );
void RemoveBounty( Bounty *bounty );
void ClaimBounty( Character *ch, const Character *victim );
bool IsBountyOn( const Character *victim );

#endif
