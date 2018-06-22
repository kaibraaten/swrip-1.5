#include <ctype.h>
#include "mud.h"
#include "character.h"

extern char *spell_target_name;

ch_ret spell_ventriloquate( int sn, int level, Character *ch, void *vo )
{
  char buf1[MAX_STRING_LENGTH];
  char buf2[MAX_STRING_LENGTH];
  char speaker[MAX_INPUT_LENGTH];
  Character *vch;

  spell_target_name = OneArgument( spell_target_name, speaker );

  sprintf( buf1, "%s says '%s'.\r\n",              speaker, spell_target_name );
  sprintf( buf2, "Someone makes %s say '%s'.\r\n", speaker, spell_target_name );
  buf1[0] = CharToUppercase(buf1[0]);

  for ( vch = ch->InRoom->FirstPerson; vch; vch = vch->NextInRoom )
    {
      if ( !IsName( speaker, vch->Name ) )
	{
	  SetCharacterColor( AT_SAY, vch );
	  SendToCharacter( SaveVsSpellStaff( level, vch ) ? buf2 : buf1, vch );
	}
    }

  return rNONE;
}
