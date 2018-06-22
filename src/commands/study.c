#include "character.h"
#include "mud.h"
#include "skill.h"

/* Allows PCs to learn spells embedded in object. Should prove interesting. - Samson 8-9-98 */
void do_study( Character *ch, char *argument ) /* study by Absalom */
{
  char arg[MAX_INPUT_LENGTH];
  Object *obj;
  int sn = 0, bookskills = 0, book;

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      SendToCharacter( "Study what?\r\n", ch );
      return;
    }

  if ( ( obj = GetCarriedObject( ch, arg ) ) == NULL )
    {
      SendToCharacter( "You do not have that item.\r\n", ch );
      return;
    }

  if ( obj->ItemType != ITEM_STAFF && obj->ItemType != ITEM_WAND &&
       obj->ItemType != ITEM_SCROLL )
    {
      SendToCharacter( "You can only study scrolls, wands, and staves.\r\n", ch );
      return;
    }

  Act( AT_MAGIC, "$n studies $p.", ch, obj, NULL, TO_ROOM );
  Act( AT_MAGIC, "You study $p.", ch, obj, NULL, TO_CHAR );

  if (obj->ItemType == ITEM_STAFF || obj->ItemType == ITEM_WAND
      || obj->ItemType == ITEM_SCROLL || obj->ItemType == ITEM_BOOK)
    {
      if( obj->Value[1] >= 0 )
        bookskills++;
      if( obj->Value[2] >= 0 )
        bookskills++;
      if( obj->Value[3] >= 0 )
        bookskills++;
      book = GetRandomNumberFromRange( 1, bookskills );
      sn = obj->Value[book];

      if ( sn < 0 || sn >= MAX_SKILL )
        {
          Bug( "Do_study: bad sn %d.", sn );
          return;
        }
      SetWaitState( ch, SkillTable[gsn_study]->Beats );
      if ( GetRandomPercent() >= 55 + ch->PCData->Learned[gsn_study] * 4/5)
        {
          SendToCharacter("You cannot glean any knowledge from it.\r\n",ch);
          LearnFromFailure( ch, gsn_study );
          return;
        }
      if( ch->PCData->Learned[sn] <= 0 )
        Act( AT_MAGIC, "You have begun learning the ability to $t!", ch ,SkillTable[sn]->Name, NULL, TO_CHAR);
      else if( ch->PCData->Learned[sn] < 15 )
        Act( AT_MAGIC, "You have learned a bit more of the ability to $t!", ch ,SkillTable[sn]->Name, NULL, TO_CHAR);
      else
        Act( AT_MAGIC, "You have absorbed everything the book teaches you on the ability to $t!", ch ,SkillTable[sn]->Name, NULL, TO_CHAR);

      ch->PCData->Learned[sn] += urange( 0, 20-ch->PCData->Learned[sn], 5);
      ch->PCData->Learned[sn] += 5;
      LearnFromSuccess( ch, gsn_study );
      return;
    }
}
