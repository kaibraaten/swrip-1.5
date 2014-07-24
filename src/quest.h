#ifndef _SWRIP_QUEST_H_
#define _SWRIP_QUEST_H_

#include "types.h"

#define QUEST_ITEM1 70
#define QUEST_ITEM2 71
#define QUEST_ITEM3 72
#define QUEST_ITEM4 73
#define QUEST_ITEM5 74

#define QUEST_VALUE1 5000
#define QUEST_VALUE2 2000
#define QUEST_VALUE3 2000
#define QUEST_VALUE4 7000
#define QUEST_VALUE5 10000

/* Object vnums for object quest 'tokens'. In Moongate, the tokens are
   things like 'the Shield of Moongate', 'the Sceptre of Moongate'. These
   items are worthless and have the rot-death flag, as they are placed
   into the world when a player receives an object quest. */

#define QUEST_OBJQUEST1 75
#define QUEST_OBJQUEST2 76
#define QUEST_OBJQUEST3 77
#define QUEST_OBJQUEST4 78
#define QUEST_OBJQUEST5 79

void generate_quest( Character *ch, Character *questman );
void quest_update( void );

#endif
