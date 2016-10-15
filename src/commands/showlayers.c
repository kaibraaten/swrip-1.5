#include "mud.h"
#include "grub.h"

extern ProtoObject *obj_index_hash[MAX_KEY_HASH];

/*
 * The "showlayers" command is used to list all layerable eq in the
 * mud so that we can keep track of it. It lists one line for each
 * piece of unique eq. If there are 1,000 shrouds in the game, it
 * doesn't list 1,000 lines for each shroud - just one line for the shroud.
 */

void do_showlayers( Character *ch, char *argument )
{
  ProtoObject *pObj;
  char arg1[MAX_STRING_LENGTH];

  int hash;                                           /* hash counter */
  int cou = 0;                                        /* display counter */
  int display_limit;                                  /* display limit */

  argument = OneArgument (argument, arg1);

  if ( !*arg1 )
    {
      SendToCharacter( "Syntax:\r\n", ch);
      SendToCharacter( "showlayers n  -  display maximum of n lines.\r\n", ch);
      return;
    }

  display_limit = atoi(arg1);
  PagerPrintf(ch, "      Vnum      Wear Layer   Description \r\n");
  for (hash = 0; hash < MAX_KEY_HASH; hash++) /* loop thru obj_index_hash */
    if ( obj_index_hash[hash] )
      for (pObj=obj_index_hash[hash]; pObj; pObj=pObj->Next)
        if (pObj->layers > 0)
          {
            if (++cou <= display_limit)
              PagerPrintf(ch, "%4d&R&w %5d&R&w %9d&R&w %5d&R&w   %s&R&w\r\n",
                           cou, pObj->Vnum, pObj->WearFlags, pObj->layers,
                           pObj->ShortDescr);
          }
}
