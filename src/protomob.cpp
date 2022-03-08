#include "protomob.hpp"
#include "mud.hpp"

struct ProtoMobile::Impl
{
    std::string Tag;
};

ProtoMobile::ProtoMobile(vnum_t vnum)
  : Vnum(vnum),
    pImpl(std::make_unique<Impl>())
{

}

ProtoMobile::ProtoMobile(const ProtoMobile &orig)
    : SpecFuns(orig.SpecFuns),
      Name(orig.Name),
      ShortDescr(orig.ShortDescr),
      LongDescr(orig.LongDescr),
      Description(orig.Description),
      Sex(orig.Sex),
      Level(orig.Level),
      Flags(orig.Flags),
      AffectedBy(orig.AffectedBy),
      Alignment(orig.Alignment),
      ArmorClass(orig.ArmorClass),
      HitNoDice(orig.HitNoDice),
      HitSizeDice(orig.HitSizeDice),
      HitPlus(orig.HitPlus),
      DamNoDice(orig.DamNoDice),
      DamSizeDice(orig.DamSizeDice),
      DamPlus(orig.DamPlus),
      NumberOfAttacks(orig.NumberOfAttacks),
      Gold(orig.Gold),
      exp(orig.exp),
      Resistant(orig.Resistant),
      Immune(orig.Immune),
      Susceptible(orig.Susceptible),
      AttackFlags(orig.AttackFlags),
      DefenseFlags(orig.DefenseFlags),
      Speaks(orig.Speaks),
      Speaking(orig.Speaking),
      Position(orig.Position),
      DefaultPosition(orig.DefaultPosition),
      Height(orig.Height),
      Weight(orig.Weight),
      Race(orig.Race),
      HitRoll(orig.HitRoll),
      DamRoll(orig.DamRoll),
      mprog(orig.mprog),
      Stats(orig.Stats),
      Saving(orig.Saving),
      pImpl(std::make_unique<Impl>())
{

}

ProtoMobile::~ProtoMobile()
{

}

std::string ProtoMobile::Tag() const
{
    return pImpl->Tag;
}

void ProtoMobile::Tag(const std::string &tag)
{
    pImpl->Tag = tag;
}

/////////////////////////////////
// Free functions

std::shared_ptr<ProtoMobile> GetMobFromTag(const std::string &tag)
{
    for(const auto &[_, mob] : ProtoMobs)
    {
        if(!mob->Tag().empty() && StrCmp(mob->Tag(), tag) == 0)
        {
            return mob;
        }
    }

    return nullptr;
}
