#include "character.h"
#include "mud.h"

void do_affected ( Character *ch, char *argument )
{
  char arg [MAX_INPUT_LENGTH];
  Affect *paf;
  Skill *skill;

  if ( IsNpc(ch) )
    return;

  argument = OneArgument( argument, arg );

  if ( !StrCmp( arg, "by" ) )
    {
      SetCharacterColor( AT_BLUE, ch );
      SendToCharacter( "\r\nImbued with:\r\n", ch );
      SetCharacterColor( AT_SCORE, ch );
      Echo( ch, "%s\r\n", FlagString( ch->affected_by, affected_flags ) );
      if ( ch->top_level >= 20 )
        {
          SendToCharacter( "\r\n", ch );
          if ( ch->resistant > 0 )
            {
              SetCharacterColor ( AT_BLUE, ch );
              SendToCharacter( "Resistances:  ", ch );
              SetCharacterColor( AT_SCORE, ch );
              Echo( ch, "%s\r\n", FlagString(ch->resistant, ris_flags) );
            }
          if ( ch->immune > 0 )
            {
              SetCharacterColor( AT_BLUE, ch );
              SendToCharacter( "Immunities:   ", ch);
	      SetCharacterColor( AT_SCORE, ch );
              Echo( ch, "%s\r\n", FlagString(ch->immune, ris_flags) );
            }
          if ( ch->susceptible > 0 )
            {
              SetCharacterColor( AT_BLUE, ch );
              SendToCharacter( "Suscepts:     ", ch );
              SetCharacterColor( AT_SCORE, ch );
              Echo( ch, "%s\r\n", FlagString(ch->susceptible, ris_flags) );
            }
        }
      return;
    }

  if ( !ch->first_affect )
    {
      SetCharacterColor( AT_SCORE, ch );
      SendToCharacter( "\r\nNo cantrip or skill affects you.\r\n", ch );
    }
  else
    {
      SendToCharacter( "\r\n", ch );
      for (paf = ch->first_affect; paf; paf = paf->next)
        if ( (skill=GetSkill(paf->type)) != NULL )
          {
            SetCharacterColor( AT_BLUE, ch );
            SendToCharacter( "Affected:  ", ch );
            SetCharacterColor( AT_SCORE, ch );
            if ( ch->top_level >= 20 )
              {
                if (paf->duration < 25 ) SetCharacterColor( AT_WHITE, ch );
                if (paf->duration < 6  ) SetCharacterColor( AT_WHITE + AT_BLINK, ch );
                Echo( ch, "(%5d)   ", paf->duration );
              }
            Echo( ch, "%-18s\r\n", skill->name );
          }
    }
  return;
}
