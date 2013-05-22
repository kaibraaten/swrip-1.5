#include "character.h"
#include "mud.h"

/* A trivial rehack of do_mstat.  This doesnt show all the data, but just
 * enough to identify the mob and give its basic condition.  It does however,
 * show the MUDprograms which are set.
 */
void do_mpstat( CHAR_DATA *ch, char *argument )
{
  char        arg[MAX_INPUT_LENGTH];
  MPROG_DATA *mprg;
  CHAR_DATA  *victim;

  one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "MProg stat whom?\r\n", ch );
      return;
    }

  if ( ( victim = get_char_world( ch, arg ) ) == NULL )
    {
      send_to_char( "They aren't here.\r\n", ch );
      return;
    }

  if ( !IS_NPC( victim ) )
    {
      send_to_char( "Only Mobiles can have MobPrograms!\r\n", ch);
      return;
    }

  if ( !( victim->pIndexData->progtypes ) )
    {
      send_to_char( "That Mobile has no Programs set.\r\n", ch);
      return;
    }

  ch_printf( ch, "Name: %s.  Vnum: %d.\r\n",
             victim->name, victim->pIndexData->vnum );

  ch_printf( ch, "Short description: %s.\r\nLong  description: %s",
             victim->short_descr,
             victim->long_descr[0] != '\0' ?
             victim->long_descr : "(none).\r\n" );

  ch_printf( ch, "Hp: %d/%d.  Mana: %d/%d.  Move: %d/%d. \r\n",
             victim->hit,         victim->max_hit,
             victim->mana,        victim->max_mana,
             victim->move,        victim->max_move );

  ch_printf( ch,
             "Lv: %d.  Align: %d.  AC: %d.  Credits: %d.\r\n",
             victim->top_level,        victim->alignment,
             GET_AC( victim ),    victim->gold);

  for ( mprg = victim->pIndexData->mudprogs; mprg; mprg = mprg->next )
    ch_printf( ch, ">%s %s\r\n%s\r\n",
               mprog_type_to_name( mprg->type ),
               mprg->arglist,
               mprg->comlist );
}
