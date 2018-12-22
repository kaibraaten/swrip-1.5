#ifndef _SWRIP_PLANET_HPP_
#define _SWRIP_PLANET_HPP_

#include <memory>
#include <string>
#include <list>
#include <bitset>
#include "constants.hpp"

namespace Flag
{
  namespace Planet
  {
    enum : size_t
      {
       NoCapture
      };
  }
}

class Planet
{
public:
  Planet();
  virtual ~Planet();

  const std::list<Area*> &Areas() const;
  void Add(Area *area);
  void Remove(Area *area);
  
  struct Spaceobject *Spaceobject = nullptr;
  std::string Name;
  long BaseValue = 0;
  std::shared_ptr<Clan> GovernedBy;
  int Population = 0;
  std::bitset<Flag::MAX> Flags;
  double PopularSupport = 0.0;

private:
  struct Impl;
  std::unique_ptr<Impl> pImpl;
};

long GetTaxes( std::shared_ptr<Planet> planet );

#endif
