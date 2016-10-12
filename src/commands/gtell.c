#include "character.h"
#include "mud.h"

void do_gtell( Character *ch, char *argument )
{
  Character *gch;

  if ( IsNullOrEmpty( argument) )
    {
      SendToCharacter( "Tell your group what?\r\n", ch );
      return;
    }

  if ( IsBitSet( ch->Flags, PLR_NO_TELL ) )
    {
      SendToCharacter( "Your message didn't get through!\r\n", ch );
      return;
    }

  /*
   * Note use of SendToCharacter, so gtell works on sleepers.
   */
  /*    sprintf( buf, "%s tells the group '%s'.\r\n", ch->Name, argument );*/
  for ( gch = first_char; gch; gch = gch->next )
    {
      if ( IsInSameGroup( gch, ch ) )
        {
	  SetCharacterColor( AT_GTELL, gch );
          /* Groups unscrambled regardless of clan language.  Other languages
             still garble though. -- Altrag */
          if ( CharacterKnowsLanguage( gch, ch->Speaking, gch )
               ||  (IsNpc(ch) && !ch->Speaking) )
            Echo( gch, "%s tells the group '%s'.\r\n", ch->Name, argument );
          else
            Echo( gch, "%s tells the group '%s'.\r\n", ch->Name, Scramble(argument, ch->Speaking) );
        }
    }
}
