#include "character.h"
#include "mud.h"

static Character *GetLanguageTeacherInRoom( Character *ch, int lang );

void do_languages( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  int lang = 0;
  int sn = 0;

  argument = one_argument( argument, arg );

  if ( arg[0] != '\0'
       && !str_prefix( arg, "learn" )
       && !IsImmortal(ch)
       && !IsNpc(ch) )
    {
      Character *sch = NULL;
      char arg2[MAX_INPUT_LENGTH];
      int prct = 0;

      argument = one_argument( argument, arg2 );

      if ( arg2[0] == '\0' )
        {
          send_to_char( "Learn which language?\r\n", ch );
          return;
        }

      for ( lang = 0; lang_array[lang] != LANG_UNKNOWN; lang++ )
        {
          if ( lang_array[lang] == LANG_CLAN )
	    {
	      continue;
	    }

          if ( !str_prefix( arg2, lang_names[lang] ) )
	    {
	      break;
	    }
        }

      if ( lang_array[lang] == LANG_UNKNOWN )
        {
          send_to_char( "That is not a language.\r\n", ch );
          return;
        }

      if ( !is_valid_language( lang_array[lang] ) )
        {
          send_to_char( "You may not learn that language.\r\n", ch );
          return;
        }

      sn = skill_lookup( lang_names[lang] );

      if ( sn < 0 )
        {
          send_to_char( "That is not a language.\r\n", ch );
	  return;
        }

      if ( race_table[ch->race].language & lang_array[lang]
	   || ch->pcdata->learned[sn] >= 99 )
        {
          act( AT_PLAIN, "You are already fluent in $t.", ch,
               lang_names[lang], NULL, TO_CHAR );
          return;
        }

      sch = GetLanguageTeacherInRoom( ch, lang );

      if ( !sch )
        {
          send_to_char( "There is no one who can teach that language here.\r\n", ch );
          return;
        }

      if ( ch->gold < 25 )
        {
          send_to_char( "Language lessons cost 25 credits. You don't have enough.\r\n", ch );
          return;
        }

      ch->gold -= 25;
      /* Max 12% (5 + 4 + 3) at 24+ int and 21+ wis. -- Altrag */
      prct = 5 + (get_curr_int(ch) / 6) + (get_curr_wis(ch) / 7);
      ch->pcdata->learned[sn] += prct;
      ch->pcdata->learned[sn] = UMIN(ch->pcdata->learned[sn], 99);
      SET_BIT( ch->speaks, lang_array[lang] );

      if ( ch->pcdata->learned[sn] == prct )
	{
	  act( AT_PLAIN, "You begin lessons in $t.", ch, lang_names[lang],
	       NULL, TO_CHAR );
	}
      else if ( ch->pcdata->learned[sn] < 60 )
	{
	  act( AT_PLAIN, "You continue lessons in $t.", ch, lang_names[lang],
	       NULL, TO_CHAR );
	}
      else if ( ch->pcdata->learned[sn] < 60 + prct )
	{
	  act( AT_PLAIN, "You feel you can start communicating in $t.", ch,
	       lang_names[lang], NULL, TO_CHAR );
	}
      else if ( ch->pcdata->learned[sn] < 99 )
	{
	  act( AT_PLAIN, "You become more fluent in $t.", ch,
	       lang_names[lang], NULL, TO_CHAR );
	}
      else
	{
	  act( AT_PLAIN, "You now speak perfect $t.", ch, lang_names[lang],
	       NULL, TO_CHAR );
	}

      return;
    }

  for ( lang = 0; lang_array[lang] != LANG_UNKNOWN; lang++ )
    {
      if ( !is_valid_language( lang_array[lang] ) )
	{
	  continue;
	}

      if ( ch->speaking & lang_array[lang]
	   || (IsNpc(ch) && !ch->speaking) )
	{
	  set_char_color( AT_RED, ch );
	}
      else
	{
	  set_char_color( AT_SAY, ch );
	}

      sn = skill_lookup( lang_names[lang] );

      if ( sn < 0 )
	{
	  send_to_char( "(  0) ", ch );
	}
      else
	{
	  ch_printf( ch , "(%3d) ", ch->pcdata->learned[sn] );
	}

      send_to_char( lang_names[lang], ch );
      send_to_char( "\r\n", ch );
    }

  send_to_char( "\r\n", ch );
}

static Character *GetLanguageTeacherInRoom( Character *ch, int lang )
{
  Character *teacher = NULL;
  CerisList *peopleInRoom = List_Copy( ch->in_room->People );
  CerisListIterator *iter = CreateListIterator( peopleInRoom, ForwardsIterator );

  for( ; !ListIterator_IsDone( iter ); ListIterator_Next( iter ) )
    {
      Character *sch = (Character*) ListIterator_GetData( iter );

      if ( IsNpc(sch) && IS_SET(sch->act, ACT_SCHOLAR)
           && knows_language( sch, ch->speaking, ch )
           && knows_language( sch, lang_array[lang], sch )
           && (!sch->speaking || knows_language( ch, sch->speaking, sch ) ) )
        {
          teacher = sch;
          break;
        }
    }

  DestroyListIterator( iter );
  DestroyList( peopleInRoom );

  return teacher;
}
