#include "character.hpp"
#include "mud.hpp"

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
      ch->Echo("MProg stat whom?\r\n");
      return;
    }

  if ( ( victim = GetCharacterAnywhere( ch, arg ) ) == NULL )
    {
      ch->Echo("They aren't here.\r\n");
      return;
    }

  if ( !IsNpc( victim ) )
    {
      ch->Echo("Only Mobiles can have MobPrograms!\r\n");
      return;
    }

  if ( !( victim->Prototype->mprog.progtypes ) )
    {
      ch->Echo("That Mobile has no Programs set.\r\n");
      return;
    }

  ch->Echo("Name: %s.  Vnum: %d.\r\n",
             victim->Name, victim->Prototype->Vnum );

  ch->Echo("Short description: %s.\r\nLong  description: %s",
	victim->ShortDescr,
	!IsNullOrEmpty( victim->LongDescr )
	? victim->LongDescr : "(none).\r\n" );

  ch->Echo("Hp: %d/%d.  Mana: %d/%d.  Move: %d/%d. \r\n",
             victim->Hit,         victim->MaxHit,
             victim->Mana,        victim->MaxMana,
             victim->Move,        victim->MaxMove );

  ch->Echo("Lv: %d.  Align: %d.  AC: %d.  Credits: %d.\r\n",
           victim->TopLevel,        victim->Alignment,
           GetArmorClass( victim ),    victim->Gold);

  for ( mprg = victim->Prototype->mprog.mudprogs; mprg; mprg = mprg->Next )
    ch->Echo(">%s %s\r\n%s\r\n",
               MobProgTypeToName( mprg->type ),
               mprg->arglist,
               mprg->comlist );
}
