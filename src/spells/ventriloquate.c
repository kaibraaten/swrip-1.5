#include <ctype.h>
#include "mud.h"
#include "character.h"

extern char *spell_target_name;

typedef struct VentriloquateData
{
  char *Speaker;
  char *Buffer1;
  char *Buffer2;
  int Level;
} VentriloquateData;

static void PerformVentriloquate( void *element, void *userData )
{
  Character *victim = (Character*) element;
  VentriloquateData *data = (VentriloquateData*) userData;

  if ( !is_name( data->Speaker, victim->name ) )
    {
      bool saved = saves_spell_staff( data->Level, victim );

      set_char_color( AT_SAY, victim );
      send_to_char( saved ? data->Buffer2 : data->Buffer1, victim );
    }
}

ch_ret spell_ventriloquate( int sn, int level, Character *caster, void *vo )
{
  char buf1[MAX_STRING_LENGTH];
  char buf2[MAX_STRING_LENGTH];
  char speaker[MAX_INPUT_LENGTH];
  VentriloquateData data;

  spell_target_name = one_argument( spell_target_name, speaker );

  sprintf( buf1, "%s says '%s'.\r\n",              speaker, spell_target_name );
  sprintf( buf2, "Someone makes %s say '%s'.\r\n", speaker, spell_target_name );

  buf1[0] = UPPER(buf1[0]);

  data.Speaker = speaker;
  data.Buffer1 = buf1;
  data.Buffer2 = buf2;
  data.Level = level;

  List_ForEach( caster->in_room->People, PerformVentriloquate, &data );

  return rNONE;
}
