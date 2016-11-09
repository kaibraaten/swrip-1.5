#include "mud.hpp"
#include "shop.hpp"

void do_repairshops( Character *ch, std::string argument )
{
  RepairShop *repair;

  if ( !FirstRepairShop )
    {
      SendToCharacter( "There are no repair shops.\r\n", ch );
      return;
    }

  SetCharacterColor( AT_NOTE, ch );

  for ( repair = FirstRepairShop; repair; repair = repair->Next )
    Echo( ch, "Keeper: %5d Profit: %3d Type: %d Open: %2d Close: %2d Fix: %2d %2d %2d\r\n",
               repair->Keeper,       repair->ProfitFix, repair->ShopType,
               repair->BusinessHours.Open,   repair->BusinessHours.Close,
               repair->FixType[0], repair->FixType[1], repair->FixType[2] );
}
