#ifndef _SWRIP_SHOPS_H_
#define _SWRIP_SHOPS_H_

#include "types.h"

#define VENDOR_FEE  .05 /*fee vendor charges, taken out of all gode with teh GETGOLD command*/

Character *find_fixer( Character *ch );
int get_repaircost( Character *keeper, OBJ_DATA *obj );
Character *find_keeper( Character *ch );
Character *find_keeper_q( Character *ch, bool message );
int get_cost( Character *ch, Character *keeper, OBJ_DATA *obj, bool fBuy );

#endif
