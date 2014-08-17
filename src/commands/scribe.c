#include "mud.h"
#include "character.h"

/* Re-worked by Sadiq to allow PCs to scribe up to 3 spells on a single *
 * scroll. Second and third spells progressive increase the chance of   *
 * destroying the scroll.  --Sadiq                                      */
void do_scribe( Character *ch, char *argument )
{
  OBJ_DATA *scroll;
  int sn;
  char buf1[MAX_STRING_LENGTH];
  char buf2[MAX_STRING_LENGTH];
  char buf3[MAX_STRING_LENGTH];
  int mana;

  if ( IsNpc(ch) )
    return;

  if ( argument[0] == '\0' || !StrCmp(argument, "") )
    {
      send_to_char( "Scribe what?\r\n", ch );
      return;
    }

  if ( ms_find_obj(ch) )
    return;

  if ( (sn = find_spell( ch, argument, true )) < 0 && (sn = find_skill( ch, argument, true )) )
    {
      send_to_char( "You have not learned that spell.\r\n", ch );
      return;
    }

  if ( skill_table[sn]->spell_fun == spell_null )
    {
      send_to_char( "That's not a spell!\r\n", ch );
      return;
    }

  if ( SPELL_FLAG(skill_table[sn], SF_NOSCRIBE) )
    {
      send_to_char( "You cannot scribe that spell.\r\n", ch );
      return;
    }

  mana = IsNpc(ch) ? 0 : skill_table[sn]->min_mana;
  mana *=5;

  if ( !IsNpc(ch) && ch->mana < mana )
    {
      send_to_char( "You don't have enough mana.\r\n", ch );
      return;
    }

  if ( ( scroll = GetEquipmentOnCharacter( ch, WEAR_HOLD ) ) == NULL )
    {
      send_to_char( "You must be holding a blank scroll to scribe it.\r\n", ch );
      return;
    }

  if( scroll->pIndexData->vnum != OBJ_VNUM_SCROLL_SCRIBING )
    {
      send_to_char( "You must be holding a blank scroll to scribe it.\r\n", ch );
      return;
    }

  if ( ( scroll->value[1] != -1 ) && ( scroll->value[2] != -1)
       && ( scroll->value[3] != -1)
       && ( scroll->pIndexData->vnum == OBJ_VNUM_SCROLL_SCRIBING ) )
    {
      send_to_char( "That scroll has already contains as much magic as it can hold.\r\n", ch);
      return;
    }

  if ( !process_spell_components( ch, sn ) )
    {
      learn_from_failure( ch, gsn_scribe );
      ch->mana -= (mana / 2);
      return;
    }

  if ( !IsNpc(ch) && GetRandomPercent( ) > ch->pcdata->learned[gsn_scribe] )
    {
      set_char_color ( AT_MAGIC, ch );
      send_to_char("The magic surges outof control and destroys the scroll!.\r\n", ch);
      learn_from_failure( ch, gsn_scribe );
      ch->mana -= (mana / 2);
      extract_obj(scroll);
      return;
    }

  if ( scroll->value[1] == -1 )
    {
      scroll->value[1] = sn;
      scroll->value[0] = ch->top_level;
      sprintf(buf1, "scribed book" );
      FreeMemory(scroll->short_descr);
      scroll->short_descr = CopyString( AOrAn(buf1) );
      sprintf(buf2, "A scribed book lies in the dust." );
      FreeMemory(scroll->description);
      scroll->description = CopyString(buf2);
      sprintf(buf3, "scroll scribing scribed book %s", skill_table[sn]->name);
      FreeMemory(scroll->name);
      scroll->name = CopyString(buf3);

      act( AT_MAGIC, "$n writes a book.",   ch, scroll, NULL, TO_ROOM );
      act( AT_MAGIC, "You write $p.",   ch, scroll, NULL, TO_CHAR );

      learn_from_success( ch, gsn_scribe );
      ch->mana -= mana;
      return;
    }

  if ( scroll->value[2] == -1 )
    {
      if ( GetRandomPercent( ) > 50 )
        {
          set_char_color ( AT_MAGIC, ch );
          send_to_char("The magic surges out of control and destroys the book!.\r\n", ch);
          learn_from_failure( ch, gsn_scribe );
          ch->mana -= (mana / 2);
          extract_obj(scroll);
          return;
        }

      if (scroll->value[0] > ch->top_level )
        {
          scroll->value[0] = ch->top_level;
        }

      scroll->value[2] = sn;
      set_char_color(AT_MAGIC, ch);
      ch_printf( ch, "You imbue the scroll with %s.\r\n", skill_table[sn]->name);
      learn_from_success(ch, gsn_scribe);
      ch->mana -= mana;
      return;
    }

  if ( scroll->value[3] == -1 )
    {
      if ( GetRandomPercent( ) > 30 )
        {
          set_char_color ( AT_MAGIC, ch );
          send_to_char("The magic surges outof control and destroys the scroll!.\r\n", ch);
          learn_from_failure( ch, gsn_scribe );
          ch->mana -= (mana / 2);
          extract_obj(scroll);
          return;
        }

      if (scroll->value[0] > ch->top_level )
        {
          scroll->value[0] = ch->top_level;
        }

      scroll->value[3] = sn;
      set_char_color(AT_MAGIC, ch);
      ch_printf( ch, "You imbue the scroll with %s.\r\n", skill_table[sn]->name);
      learn_from_success(ch, gsn_scribe);
      ch->mana -= mana;
      return;
    }
}
