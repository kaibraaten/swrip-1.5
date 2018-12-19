#include "mud.hpp"
#include "shop.hpp"
#include "character.hpp"
#include "repos/shoprepository.hpp"

void do_repairshops( Character *ch, std::string argument )
{
  if ( RepairShops->Count() == 0)
    {
      ch->Echo("There are no repair shops.\r\n");
      return;
    }

  SetCharacterColor( AT_NOTE, ch );

  for(const RepairShop *repair : RepairShops->Entities())
    {
      ch->Echo("Keeper: %5ld Profit: %3d Type: %d Open: %2d Close: %2d Fix: %2d %2d %2d\r\n",
               repair->Keeper,       repair->ProfitFix, repair->ShopType,
               repair->BusinessHours.Open,   repair->BusinessHours.Close,
               repair->FixType[0], repair->FixType[1], repair->FixType[2] );
    }
}
