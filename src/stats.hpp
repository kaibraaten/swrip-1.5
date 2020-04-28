#ifndef _SWRIP_STATS_HPP_
#define _SWRIP_STATS_HPP_

class Stats
{
public:
    Stats(int startvalue = 0)
        : Str(startvalue),
        Int(startvalue),
        Wis(startvalue),
        Dex(startvalue),
        Con(startvalue),
        Cha(startvalue),
        Lck(startvalue),
        Frc(startvalue)
    {

    }

    int Str = 0;
    int Int = 0;
    int Wis = 0;
    int Dex = 0;
    int Con = 0;
    int Cha = 0;
    int Lck = 0;
    int Frc = 0;
};

class SaveVs
{
public:
    int PoisonDeath = 0;
    int Wand = 0;
    int ParaPetri = 0;
    int Breath = 0;
    int SpellStaff = 0;
};

#endif
