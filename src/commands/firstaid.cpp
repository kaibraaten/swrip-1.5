#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "object.hpp"

void do_first_aid( Character *ch, std::string argument )
{
  Object *medpac = NULL;
  Character *victim = NULL;
  int heal = 0;
  char buf[MAX_STRING_LENGTH];

  if ( ch->Position == POS_FIGHTING )
    {
      ch->Echo( "You can't do that while fighting!\r\n" );
      return;
    }

  medpac = GetEquipmentOnCharacter( ch, WEAR_HOLD );

  if ( !medpac || medpac->ItemType != ITEM_MEDPAC )
    {
      ch->Echo( "You need to be holding a medpac.\r\n" );
      return;
    }

  if ( medpac->Value[OVAL_MEDPAC_DOSES] <= 0 )
    {
      ch->Echo( "Your medpac seems to be empty.\r\n" );
      return;
    }

  if ( argument.empty() )
    victim = ch;
  else
    victim = GetCharacterInRoom( ch, argument );

  if ( !victim )
    {
      ch->Echo( "I don't see any %s here...\r\n" , argument.c_str() );
      return;
    }

  heal = GetRandomNumberFromRange( 1, 150 );

  if ( heal > ch->PCData->Learned[gsn_first_aid]*2 )
    {
      ch->Echo( "You fail in your attempt at first aid.\r\n");
      LearnFromFailure( ch , gsn_first_aid );
      return;
    }

  if ( victim == ch )
    {
      ch->Echo( "You tend to your wounds.\r\n");
      sprintf( buf, "$n uses %s to help heal $s wounds.",
               medpac->ShortDescr.c_str() );
      Act( AT_ACTION, buf, ch, NULL, victim, TO_ROOM );
    }
  else
    {
      sprintf( buf , "You tend to $N's wounds." );
      Act( AT_ACTION, buf, ch, NULL, victim, TO_CHAR );
      sprintf( buf , "$n uses %s to help heal $N's wounds.",
               medpac->ShortDescr.c_str() );
      Act( AT_ACTION, buf, ch, NULL, victim, TO_NOTVICT );
      sprintf( buf , "$n uses %s to help heal your wounds.",
               medpac->ShortDescr.c_str() );
      Act( AT_ACTION, buf, ch, NULL, victim, TO_VICT );
    }

  --medpac->Value[OVAL_MEDPAC_DOSES];
  victim->Hit += urange ( 0, heal , victim->MaxHit - victim->Hit );

  LearnFromSuccess( ch , gsn_first_aid );
}
