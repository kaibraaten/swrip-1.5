#include "shoprepository.hpp"
#include "shop.hpp"

class InMemoryShopRepository : public ShopRepository
{

};

class InMemoryRepairShopRepository : public RepairShopRepository
{

};

std::shared_ptr<ShopRepository> NewShopRepository()
{
    return std::make_shared<InMemoryShopRepository>();
}

std::shared_ptr<RepairShopRepository> NewRepairShopRepository()
{
    return std::make_shared<InMemoryRepairShopRepository>();
}
