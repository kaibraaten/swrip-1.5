#ifndef _SWRIP_STATS_HPP_
#define _SWRIP_STATS_HPP_

class Stats
{
public:
  Stats( short startvalue = 0 )
    : Str( startvalue ),
      Int( startvalue ),
      Wis( startvalue ),
      Dex( startvalue ),
      Con( startvalue ),
      Cha( startvalue ),
      Lck( startvalue ),
      Frc( startvalue )
  {

  }

  short Str = 0;
  short Int = 0;
  short Wis = 0;
  short Dex = 0;
  short Con = 0;
  short Cha = 0;
  short Lck = 0;
  short Frc = 0;
};

#endif
