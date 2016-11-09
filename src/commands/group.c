#include "character.hpp"
#include "mud.h"

void do_group( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim = NULL;

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      Character *gch = NULL;

      SetCharacterColor( AT_GREEN, ch );
      Echo( ch, "%s's group:\r\n", PERS(ch, ch) );

      for ( gch = FirstCharacter; gch; gch = gch->Next )
        {
          if ( IsInSameGroup( gch, ch ) )
            {
              SetCharacterColor( AT_DGREEN, ch );

              if (IsAffectedBy(gch, AFF_POSSESS))
                Echo( ch,
                           "[%2d %s] %-16s %4s/%4s hp %4s/%4s mv %5s xp\r\n",
                           gch->TopLevel,
                           IsNpc(gch) ? "Mob" : RaceTable[gch->Race].Name,
                           Capitalize( PERS(gch, ch) ),
			   "????",
                           "????",
                           "????",
                           "????",
                           "?????"    );

              else
                Echo( ch,
                           "[%2d %s] %-16s %4d/%4d hp %4d/%4d mv\r\n",
                           gch->TopLevel,
                           IsNpc(gch) ? "Mob" : RaceTable[gch->Race].Name,
                           Capitalize( PERS(gch, ch) ),
                           gch->Hit,
                           gch->MaxHit,
                           gch->Move,
                           gch->MaxMove   );
            }
        }
      return;
    }

  if ( !StrCmp( arg, "disband" ))
    {
      Character *gch = NULL;
      int count = 0;

      if ( ch->Leader || ch->Master )
        {
          SendToCharacter( "You cannot disband a group if you're following someone.\r\n", ch );
          return;
        }

      for ( gch = FirstCharacter; gch; gch = gch->Next )
        {
          if ( IsInSameGroup( ch, gch )
               && ( ch != gch ) )
            {
              gch->Leader = NULL;
              gch->Master = NULL;
              count++;
              SendToCharacter( "Your group is disbanded.\r\n", gch );
            }
        }

      if ( count == 0 )
	SendToCharacter( "You have no group members to disband.\r\n", ch );
      else
        SendToCharacter( "You disband your group.\r\n", ch );

      return;
    }

  if ( !StrCmp( arg, "all" ) )
    {
      Character *rch = NULL;
      int count = 0;

      for ( rch = ch->InRoom->FirstPerson; rch; rch = rch->NextInRoom )
        {
          if ( ch != rch
               && !IsNpc( rch )
               && rch->Master == ch
               && !ch->Master
               && !ch->Leader
               && !IsInSameGroup( rch, ch )
               )
            {
              rch->Leader = ch;
              count++;
            }
        }

      if ( count == 0 )
	{
	  SendToCharacter( "You have no eligible group members.\r\n", ch );
	}
      else
        {
          Act( AT_ACTION, "$n groups $s followers.", ch, NULL, NULL, TO_ROOM );
          SendToCharacter( "You group your followers.\r\n", ch );
        }

      return;
    }

  if ( ( victim = GetCharacterInRoom( ch, arg ) ) == NULL )
    {
      SendToCharacter( "They aren't here.\r\n", ch );
      return;
    }

  if ( ch->Master || ( ch->Leader && ch->Leader != ch ) )
    {
      SendToCharacter( "But you are following someone else!\r\n", ch );
      return;
    }

  if ( victim->Master != ch && ch != victim )
    {
      Act( AT_PLAIN, "$N isn't following you.", ch, NULL, victim, TO_CHAR );
      return;
    }

  if ( IsInSameGroup( victim, ch ) && ch != victim )
    {
      victim->Leader = NULL;
      Act( AT_ACTION, "$n removes $N from $s group.",
	   ch, NULL, victim, TO_NOTVICT );
      Act( AT_ACTION, "$n removes you from $s group.",
	   ch, NULL, victim, TO_VICT );
      Act( AT_ACTION, "You remove $N from your group.",
	   ch, NULL, victim, TO_CHAR );
      return;
    }

  victim->Leader = ch;
  Act( AT_ACTION, "$N joins $n's group.", ch, NULL, victim, TO_NOTVICT );
  Act( AT_ACTION, "You join $n's group.", ch, NULL, victim, TO_VICT );
  Act( AT_ACTION, "$N joins your group.", ch, NULL, victim, TO_CHAR );
}
