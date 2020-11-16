#ifndef _SWRIP_SHOPREPOSITORY_HPP_
#define _SWRIP_SHOPREPOSITORY_HPP_

#include <memory>
#include <utility/repository.hpp>
#include "types.hpp"

template<typename T>
struct CompareShop
{
    bool operator()(const T lhs, const T rhs) const
    {
        return lhs->Keeper < rhs->Keeper;
    }
};

using ShopRepositoryBase = Ceris::Repository<std::shared_ptr<Shop>, CompareShop<std::shared_ptr<Shop>>>;

class ShopRepository : public ShopRepositoryBase
{
public:

protected:
    ShopRepository() = default;
};

using RepairShopRepositoryBase = Ceris::Repository<std::shared_ptr<RepairShop>, CompareShop<std::shared_ptr<RepairShop>>>;

class RepairShopRepository : public RepairShopRepositoryBase
{
public:

protected:
    RepairShopRepository() = default;
};

inline std::shared_ptr<ShopRepository> Shops;
inline std::shared_ptr<RepairShopRepository> RepairShops;

std::shared_ptr<ShopRepository> NewShopRepository();
std::shared_ptr<RepairShopRepository> NewRepairShopRepository();

#endif
