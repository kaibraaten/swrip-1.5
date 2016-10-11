#include "character.h"
#include "mud.h"

void do_speak( Character *ch, char *argument )
{
  int langs = 0;
  char arg[MAX_INPUT_LENGTH];

  argument = OneArgument(argument, arg );

  if ( !StrCmp( arg, "all" ) && IsImmortal( ch ) )
    {
      SetCharacterColor( AT_SAY, ch );
      ch->speaking = ~LANG_CLAN;
      SendToCharacter( "Now speaking all languages.\r\n", ch );
      return;
    }

  if ( !StringPrefix( arg, "clan" ))
    {
      SetCharacterColor( AT_SAY, ch );
      SendToCharacter( "Clan language? There is no such thing.\r\n", ch );
      return;
    }


  if ( ch->race == RACE_WOOKIEE && StringPrefix( arg, "wookiee" ))
    {
      SetCharacterColor( AT_SAY, ch );
      SendToCharacter( "Your vocal cords refuse to make those sounds.\r\n", ch );
      return;
    }

  if ( ch->race == RACE_VERPINE && StringPrefix( arg, "verpine" ))
    {
      SetCharacterColor( AT_SAY, ch );
      SendToCharacter( "Your jaws cant pronounce that language.\r\n", ch );
      return;
    }

  if ( ch->race == RACE_GAMORREAN && StringPrefix( arg, "gamorrean" ))
    {
      SetCharacterColor( AT_SAY, ch );
      SendToCharacter( "You can barely speak your own language!\r\n", ch );
      return;
    }

  if ( !StringPrefix( arg, "common" ) &&
       ( ch->race == RACE_EWOK || ch->race == RACE_JAWA ))
    {
      SetCharacterColor( AT_SAY, ch );
      SendToCharacter( "You can not speak common, although you may be able to learn to understand it.\r\n", ch );
      return;
    }

  if ( !StringPrefix( arg, "twilek" ) && ch->race != RACE_TWI_LEK )
    {
      SetCharacterColor( AT_SAY, ch );
      SendToCharacter( "To speak the Twi'lek language requires body parts that you don't have.\r\n", ch );
      return;
    }

  if ( !StringPrefix( arg, "binary" ) && !IsDroid(ch) )
    {
      SetCharacterColor( AT_SAY, ch );
      SendToCharacter( "Only droids are able to speak binary.\r\n", ch );
      return;
    }

  if ( !StringPrefix( arg, "verpine" ) && ch->race != RACE_VERPINE )
    {
      SetCharacterColor( AT_SAY, ch );
      SendToCharacter( "You need certain bodyparts you do not have to speak verpine.\r\n", ch );
      return;
    }

  if ( !StringPrefix( arg, "trandoshan" ) && ch->race != RACE_TRANDOSHAN )
    {
      SetCharacterColor( AT_SAY, ch );
      SendToCharacter( "Only a fellow reptile can speak the trandoshan language.\r\n", ch );
      return;
    }

  if ( !StringPrefix( arg, "gamorrean" ) && ch->race != RACE_GAMORREAN )
    {
      SetCharacterColor( AT_SAY, ch );
      SendToCharacter( "The gamorrean language can only be spoken by the pigs themselves!\r\n", ch );
      return;
    }

  if ( !StringPrefix( arg, "ithorian" ) && ch->race != RACE_ITHORIAN )
    {
      SetCharacterColor( AT_SAY, ch );
      SendToCharacter( "You can not replicate the sounds of the ithorian language.\r\n", ch );
      return;
    }

  for ( langs = 0; LanguageArray[langs] != LANG_UNKNOWN; langs++ )
    {
      if ( !StringPrefix( arg, LanguageNames[langs] ) )
	{
	  if ( CharacterKnowsLanguage( ch, LanguageArray[langs], ch ) )
	    {
	      if ( LanguageArray[langs] == LANG_CLAN &&
		   (IsNpc(ch) || !IsClanned( ch ) ) )
		{
		  continue;
		}

	      ch->speaking = LanguageArray[langs];
	      SetCharacterColor( AT_SAY, ch );
	      Echo( ch, "You now speak %s.\r\n", LanguageNames[langs] );
	      return;
	    }
	}
    }

  SetCharacterColor( AT_SAY, ch );
  SendToCharacter( "You do not know that language.\r\n", ch );
}
