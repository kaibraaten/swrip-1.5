#include "shoprepository.hpp"
#include "shop.hpp"

ShopRepository *Shops = nullptr;
RepairShopRepository *RepairShops = nullptr;

class InMemoryShopRepository : public ShopRepository
{

};

class InMemoryRepairShopRepository : public RepairShopRepository
{

};

ShopRepository *NewShopRepository()
{
  return new InMemoryShopRepository();
}

RepairShopRepository *NewRepairShopRepository()
{
  return new InMemoryRepairShopRepository();
}
