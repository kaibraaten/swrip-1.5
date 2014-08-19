#include "character.h"
#include "mud.h"

/* Allows PCs to learn spells embedded in object. Should prove interesting. - Samson 8-9-98 */
void do_study( Character *ch, char *argument ) /* study by Absalom */
{
  char arg[MAX_INPUT_LENGTH];
  Object *obj;
  int sn = 0, bookskills = 0, book;

  OneArgument( argument, arg );

  if ( arg[0] == '\0' )
    {
      SendToCharacter( "Study what?\r\n", ch );
      return;
    }

  if ( ( obj = GetCarriedObject( ch, arg ) ) == NULL )
    {
      SendToCharacter( "You do not have that item.\r\n", ch );
      return;
    }

  if ( obj->item_type != ITEM_STAFF && obj->item_type != ITEM_WAND &&
       obj->item_type != ITEM_SCROLL )
    {
      SendToCharacter( "You can only study scrolls, wands, and staves.\r\n", ch );
      return;
    }

  act( AT_MAGIC, "$n studies $p.", ch, obj, NULL, TO_ROOM );
  act( AT_MAGIC, "You study $p.", ch, obj, NULL, TO_CHAR );

  if (obj->item_type == ITEM_STAFF || obj->item_type == ITEM_WAND
      || obj->item_type == ITEM_SCROLL || obj->item_type == ITEM_BOOK)
    {
      if( obj->value[1] >= 0 )
        bookskills++;
      if( obj->value[2] >= 0 )
        bookskills++;
      if( obj->value[3] >= 0 )
        bookskills++;
      book = GetRandomNumberFromRange( 1, bookskills );
      sn = obj->value[book];

      if ( sn < 0 || sn >= MAX_SKILL )
        {
          bug( "Do_study: bad sn %d.", sn );
          return;
        }
      SetWaitState( ch, skill_table[gsn_study]->beats );
      if ( GetRandomPercent() >= 55 + ch->pcdata->learned[gsn_study] * 4/5)
        {
          SendToCharacter("You cannot glean any knowledge from it.\r\n",ch);
          learn_from_failure( ch, gsn_study );
          return;
        }
      if( ch->pcdata->learned[sn] <= 0 )
        act( AT_MAGIC, "You have begun learning the ability to $t!", ch ,skill_table[sn]->name, NULL, TO_CHAR);
      else if( ch->pcdata->learned[sn] < 15 )
        act( AT_MAGIC, "You have learned a bit more of the ability to $t!", ch ,skill_table[sn]->name, NULL, TO_CHAR);
      else
        act( AT_MAGIC, "You have absorbed everything the book teachs you on the ability to $t!", ch ,skill_table[sn]->name, NULL, TO_CHAR);

      ch->pcdata->learned[sn] += urange( 0, 20-ch->pcdata->learned[sn], 5);
      ch->pcdata->learned[sn] += 5;
      learn_from_success( ch, gsn_study );
      return;
    }
}
