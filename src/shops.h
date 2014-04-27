#ifndef _SWRIP_SHOPS_H_
#define _SWRIP_SHOPS_H_

#include "types.h"

#define VENDOR_FEE  .05 /*fee vendor charges, taken out of all gode with teh GETGOLD command*/

CHAR_DATA *find_fixer( CHAR_DATA *ch );
int get_repaircost( CHAR_DATA *keeper, OBJ_DATA *obj );
CHAR_DATA *find_keeper( CHAR_DATA *ch );
CHAR_DATA *find_keeper_q( CHAR_DATA *ch, bool message );
int get_cost( CHAR_DATA *ch, CHAR_DATA *keeper, OBJ_DATA *obj, bool fBuy );

#endif
