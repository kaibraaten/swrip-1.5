#include "character.h"
#include "mud.h"
#include "skill.h"

void do_first_aid( Character *ch, char *argument )
{
  Object   *medpac;
  Character  *victim;
  int         heal;
  char        buf[MAX_STRING_LENGTH];

  if ( ch->Position == POS_FIGHTING )
    {
      SendToCharacter( "You can't do that while fighting!\r\n",ch );
      return;
    }

  medpac = GetEquipmentOnCharacter( ch, WEAR_HOLD );

  if ( !medpac || medpac->ItemType != ITEM_MEDPAC )
    {
      SendToCharacter( "You need to be holding a medpac.\r\n",ch );
      return;
    }

  if ( medpac->Value[OVAL_MEDPAC_DOSES] <= 0 )
    {
      SendToCharacter( "Your medpac seems to be empty.\r\n",ch );
      return;
    }

  if ( IsNullOrEmpty( argument ) )
    victim = ch;
  else
    victim = GetCharacterInRoom( ch, argument );

  if ( !victim )
    {
      Echo( ch, "I don't see any %s here...\r\n" , argument );
      return;
    }

  heal = GetRandomNumberFromRange( 1, 150 );

  if ( heal > ch->PCData->Learned[gsn_first_aid]*2 )
    {
      Echo( ch, "You fail in your attempt at first aid.\r\n");
      LearnFromFailure( ch , gsn_first_aid );
      return;
    }

  if ( victim == ch )
    {
      Echo( ch, "You tend to your wounds.\r\n");
      sprintf( buf , "$n uses %s to help heal $s wounds." , medpac->ShortDescr );
      Act( AT_ACTION, buf, ch, NULL, victim, TO_ROOM );
    }
  else
    {
      sprintf( buf , "You tend to $N's wounds." );
      Act( AT_ACTION, buf, ch, NULL, victim, TO_CHAR );
      sprintf( buf , "$n uses %s to help heal $N's wounds." , medpac->ShortDescr );
      Act( AT_ACTION, buf, ch, NULL, victim, TO_NOTVICT );
      sprintf( buf , "$n uses %s to help heal your wounds." , medpac->ShortDescr );
      Act( AT_ACTION, buf, ch, NULL, victim, TO_VICT );
    }

  --medpac->Value[OVAL_MEDPAC_DOSES];
  victim->Hit += urange ( 0, heal , victim->MaxHit - victim->Hit );

  LearnFromSuccess( ch , gsn_first_aid );
}
