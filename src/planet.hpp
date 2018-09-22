#ifndef _SWRIP_PLANET_HPP_
#define _SWRIP_PLANET_HPP_

#include <string>
#include <list>

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
  Clan *GovernedBy = nullptr;
  int Population = 0;
  int Flags = 0;
  double PopularSupport = 0.0;

private:
  struct Impl;
  Impl *pImpl;
};

long GetTaxes( const Planet *planet );

#endif
