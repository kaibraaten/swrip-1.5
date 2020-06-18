#include "character.hpp"
#include "mud.hpp"

void do_speak( std::shared_ptr<Character> ch, std::string arg )
{
  if ( !StrCmp( arg, "all" ) && IsImmortal( ch ) )
    {
      SetCharacterColor( AT_SAY, ch );
      ch->Speaking = ~LANG_CLAN;
      ch->Echo("Now speaking all languages.\r\n");
      return;
    }

  if ( !StringPrefix( arg, "clan" ))
    {
      SetCharacterColor( AT_SAY, ch );
      ch->Echo("Clan language? There is no such thing.\r\n");
      return;
    }

  if ( ch->Race == RACE_WOOKIEE && StringPrefix( arg, "shyriiwook" ))
    {
      SetCharacterColor( AT_SAY, ch );
      ch->Echo("Your vocal cords refuse to make those sounds.\r\n");
      return;
    }

  if ( ch->Race == RACE_VERPINE && StringPrefix( arg, "verpine" ))
    {
      SetCharacterColor( AT_SAY, ch );
      ch->Echo("Your jaws can't pronounce that language.\r\n");
      return;
    }

  if ( ch->Race == RACE_GAMORREAN && StringPrefix( arg, "gamorrese" ))
    {
      SetCharacterColor( AT_SAY, ch );
      ch->Echo("You can barely speak your own language!\r\n");
      return;
    }

  if ( !StringPrefix( arg, "basic" )
       && ( ch->Race == RACE_EWOK || ch->Race == RACE_JAWA ))
    {
      SetCharacterColor( AT_SAY, ch );
      ch->Echo("You can not speak basic, although you may be able to learn to understand it.\r\n");
      return;
    }

  if ( !StringPrefix( arg, "twileki" ) && ch->Race != RACE_TWI_LEK )
    {
      SetCharacterColor( AT_SAY, ch );
      ch->Echo("To speak the Twi'lek language requires body parts that you don't have.\r\n");
      return;
    }

  if ( !StringPrefix( arg, "binary" ) && !IsDroid(ch) )
    {
      SetCharacterColor( AT_SAY, ch );
      ch->Echo("Only droids are able to speak binary.\r\n");
      return;
    }

  if ( !StringPrefix( arg, "verpine" ) && ch->Race != RACE_VERPINE )
    {
      SetCharacterColor( AT_SAY, ch );
      ch->Echo("You need certain bodyparts you do not have to speak verpine.\r\n");
      return;
    }

  if ( !StringPrefix( arg, "dosh" ) && ch->Race != RACE_TRANDOSHAN )
    {
      SetCharacterColor( AT_SAY, ch );
      ch->Echo("Only a fellow reptile can speak the trandoshan language.\r\n");
      return;
    }

  if ( !StringPrefix( arg, "gamorrese" ) && ch->Race != RACE_GAMORREAN )
    {
      SetCharacterColor( AT_SAY, ch );
      ch->Echo("The gamorrean language can only be spoken by the pigs themselves!\r\n");
      return;
    }

  if ( !StringPrefix( arg, "ithorese" ) && ch->Race != RACE_ITHORIAN )
    {
      SetCharacterColor( AT_SAY, ch );
      ch->Echo("You can not replicate the sounds of the ithorian language.\r\n");
      return;
    }

  for ( int langs = 0; LanguageArray[langs] != LANG_UNKNOWN; langs++ )
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

	      ch->Speaking = LanguageArray[langs];
	      SetCharacterColor( AT_SAY, ch );
              ch->Echo("You now speak %s.\r\n", LanguageNames[langs] );
	      return;
	    }
	}
    }

  SetCharacterColor( AT_SAY, ch );
  ch->Echo("You do not know that language.\r\n");
}
