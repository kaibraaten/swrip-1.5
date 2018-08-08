#include "character.hpp"
#include "mud.hpp"

void do_gtell( Character *ch, char *argument )
{
  Character *gch = nullptr;

  if ( IsNullOrEmpty( argument) )
    {
      ch->Echo( "Tell your group what?\r\n" );
      return;
    }

  if ( IsBitSet( ch->Flags, PLR_NO_TELL ) )
    {
      ch->Echo( "Your message didn't get through!\r\n" );
      return;
    }

  /*
   * Note use of SendToCharacter, so gtell works on sleepers.
   */
  /*    sprintf( buf, "%s tells the group '%s'.\r\n", ch->Name, argument );*/
  for ( gch = FirstCharacter; gch; gch = gch->Next )
    {
      if ( IsInSameGroup( gch, ch ) )
        {
	  SetCharacterColor( AT_GTELL, gch );
          /* Groups unscrambled regardless of clan language.  Other languages
             still garble though. -- Altrag */
          if ( CharacterKnowsLanguage( gch, ch->Speaking, gch )
               ||  (IsNpc(ch) && !ch->Speaking) )
            gch->Echo( "%s tells the group '%s'.\r\n", ch->Name, argument );
          else
            gch->Echo( "%s tells the group '%s'.\r\n", ch->Name, Scramble(argument, ch->Speaking) );
        }
    }
}

