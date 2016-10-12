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

  if ( IsNullOrEmpty( arg ) )
    {
      SendToCharacter( "MProg stat whom?\r\n", ch );
      return;
    }

  if ( ( victim = GetCharacterAnywhere( ch, arg ) ) == NULL )
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

  Echo( ch, "Name: %s.  Vnum: %d.\r\n",
             victim->Name, victim->Prototype->Vnum );

  Echo( ch, "Short description: %s.\r\nLong  description: %s",
	victim->ShortDescr,
	!IsNullOrEmpty( victim->LongDescr )
	? victim->LongDescr : "(none).\r\n" );

  Echo( ch, "Hp: %d/%d.  Mana: %d/%d.  Move: %d/%d. \r\n",
             victim->hit,         victim->MaxHit,
             victim->Mana,        victim->MaxMana,
             victim->Move,        victim->MaxMove );

  Echo( ch,
             "Lv: %d.  Align: %d.  AC: %d.  Credits: %d.\r\n",
             victim->TopLevel,        victim->Alignment,
             GetArmorClass( victim ),    victim->Gold);

  for ( mprg = victim->Prototype->mprog.mudprogs; mprg; mprg = mprg->next )
    Echo( ch, ">%s %s\r\n%s\r\n",
               MobProgTypeToName( mprg->type ),
               mprg->arglist,
               mprg->comlist );
}
