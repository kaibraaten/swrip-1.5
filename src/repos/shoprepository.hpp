#ifndef _SWRIP_SHOPREPOSITORY_HPP_
#define _SWRIP_SHOPREPOSITORY_HPP_

#include <utility/repository.hpp>
#include "types.hpp"

template<typename T>
struct CompareShop
{
  bool operator()(const T lhs, const T rhs)
  {
    return lhs->Keeper < rhs->Keeper;
  }
};

class ShopRepository : public Ceris::Repository<Shop*, CompareShop<Shop*>>
{
public:

protected:
  ShopRepository() { }
};

class RepairShopRepository : public Ceris::Repository<RepairShop*, CompareShop<RepairShop*>>
{
public:

  protected:
  RepairShopRepository() { }
};

extern ShopRepository *Shops;
extern RepairShopRepository *RepairShops;

ShopRepository *NewShopRepository();
RepairShopRepository *NewRepairShopRepository();

#endif
