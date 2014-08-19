#include "character.h"
#include "mud.h"

/* A trivial rehack of do_mstat.  This doesnt show all the data, but just
 * enough to identify the mob and give its basic condition.  It does however,
 * show the MUDprograms which are set.
 */
void do_mpstat( Character *ch, char *argument )
{
  char        arg[MAX_INPUT_LENGTH];
  MPROG_DATA *mprg;
  Character  *victim;

  OneArgument( argument, arg );

  if ( arg[0] == '\0' )
    {
      SendToCharacter( "MProg stat whom?\r\n", ch );
      return;
    }

  if ( ( victim = get_char_world( ch, arg ) ) == NULL )
    {
      SendToCharacter( "They aren't here.\r\n", ch );
      return;
    }

  if ( !IsNpc( victim ) )
    {
      SendToCharacter( "Only Mobiles can have MobPrograms!\r\n", ch);
      return;
    }

  if ( !( victim->Prototype->mprog.progtypes ) )
    {
      SendToCharacter( "That Mobile has no Programs set.\r\n", ch);
      return;
    }

  ChPrintf( ch, "Name: %s.  Vnum: %d.\r\n",
             victim->name, victim->Prototype->vnum );

  ChPrintf( ch, "Short description: %s.\r\nLong  description: %s",
             victim->short_descr,
             victim->long_descr[0] != '\0' ?
             victim->long_descr : "(none).\r\n" );

  ChPrintf( ch, "Hp: %d/%d.  Mana: %d/%d.  Move: %d/%d. \r\n",
             victim->hit,         victim->max_hit,
             victim->mana,        victim->max_mana,
             victim->move,        victim->max_move );

  ChPrintf( ch,
             "Lv: %d.  Align: %d.  AC: %d.  Credits: %d.\r\n",
             victim->top_level,        victim->alignment,
             GetArmorClass( victim ),    victim->gold);

  for ( mprg = victim->Prototype->mprog.mudprogs; mprg; mprg = mprg->next )
    ChPrintf( ch, ">%s %s\r\n%s\r\n",
               mprog_type_to_name( mprg->type ),
               mprg->arglist,
               mprg->comlist );
}
