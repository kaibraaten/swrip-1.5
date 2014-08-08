#ifndef _SWRIP_SHOPS_H_
#define _SWRIP_SHOPS_H_

#include "types.h"

#define VENDOR_FEE  .05 /*fee vendor charges, taken out of all gode with teh GETGOLD command*/

Character *find_fixer( const Character *ch );
int get_repaircost( const Character *keeper, const OBJ_DATA *obj );
Character *find_keeper( const Character *ch );
Character *find_keeper_q( const Character *ch, bool message );
int get_cost( const Character *ch, const Character *keeper, const OBJ_DATA *obj, bool fBuy );

#endif
