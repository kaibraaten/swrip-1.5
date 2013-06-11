#include "character.h"
#include "mud.h"

static bool MobIsTeacher( void *element, void *userData );

void do_practice( Character *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  int sn;

  if ( IsNpc(ch) )
    return;

  if ( argument[0] == '\0' )
    {
      int       col;
      short     lasttype, cnt;

      col = cnt = 0;    lasttype = SKILL_SPELL;
      set_pager_color( AT_MAGIC, ch );
      for ( sn = 0; sn < top_sn; sn++ )
        {
          if ( !skill_table[sn]->name )
            break;

          if ( skill_table[sn]->guild < 0 || skill_table[sn]->guild >= MAX_ABILITY )
            continue;

          if ( str_cmp(skill_table[sn]->name, "reserved") == 0
               && ( IsImmortal(ch) ) )
            {
              if ( col % 3 != 0 )
                send_to_pager( "&r\r\n", ch );

	      send_to_pager(
                            "&R--------------------------------[Spells]---------------------------------\r\n&r", ch);
              col = 0;
            }
          if ( skill_table[sn]->type != lasttype )
            {
              if ( !cnt )
                send_to_pager( "&r                                (none)\r\n&w", ch );
              else
                if ( col % 3 != 0 )
                  send_to_pager( "\r\n&r", ch );
              pager_printf( ch,
                            "&R--------------------------------%ss---------------------------------\r\n&r",
                            skill_tname[skill_table[sn]->type]);
              col = cnt = 0;
            }
          lasttype = skill_table[sn]->type;

          if ( skill_table[sn]->guild < 0 || skill_table[sn]->guild >= MAX_ABILITY )
            continue;

          if ( ch->pcdata->learned[sn] <= 0
	       && get_level( ch, skill_table[sn]->guild ) < skill_table[sn]->min_level )
            continue;

          if ( ch->pcdata->learned[sn] == 0
               &&   SPELL_FLAG(skill_table[sn], SF_SECRETSKILL) )
            continue;

          ++cnt;
          if ( ch->pcdata->learned[sn] >= 100 )
            {
              pager_printf( ch, "&R%18s %3d%%  &r",
                            skill_table[sn]->name, ch->pcdata->learned[sn] );
            }
          else
            pager_printf( ch, "&r%18s %3d%%  ",
                          skill_table[sn]->name, ch->pcdata->learned[sn] );
          if ( ++col % 3 == 0 )
            send_to_pager( "\r\n&r", ch );
        }

      if ( col % 3 != 0 )
        send_to_pager( "\r\n&r", ch );
    }
  else
    {
      Character *mob = NULL;
      const int adept = 20;
      bool can_prac = TRUE;

      if ( !is_awake(ch) )
        {
          send_to_char( "In your dreams, or what?\r\n", ch );
          return;
        }

      mob = (Character*) List_FindIf( ch->in_room->People, MobIsTeacher, NULL );

      if ( !mob )
        {
          send_to_char( "You can't do that here.\r\n", ch );
          return;
        }

      sn = skill_lookup( argument );

      if ( sn == -1 )
        {
          act( AT_TELL, "$n tells you 'I've never heard of that one...'",
               mob, NULL, ch, TO_VICT );
          return;
        }

      if ( skill_table[sn]->guild < 0  || skill_table[sn]->guild >= MAX_ABILITY )
        {
          act( AT_TELL, "$n tells you 'I cannot teach you that...'",
               mob, NULL, ch, TO_VICT );
          return;
        }

      if ( can_prac &&  !IsNpc(ch)
           && get_level( ch, skill_table[sn]->guild ) < skill_table[sn]->min_level )
        {
          act( AT_TELL, "$n tells you 'You're not ready to learn that yet...'",
               mob, NULL, ch, TO_VICT );
          return;
	}

      if ( is_name( skill_tname[skill_table[sn]->type], CANT_PRAC ) )
        {
          act( AT_TELL, "$n tells you 'I do not know how to teach that.'",
               mob, NULL, ch, TO_VICT );
          return;
        }

      /*
       * Skill requires a special teacher
       */
      if ( skill_table[sn]->teachers && skill_table[sn]->teachers[0] != '\0' )
        {
          sprintf( buf, "%d", mob->pIndexData->vnum );
          if ( !is_name( buf, skill_table[sn]->teachers ) )
            {
              act( AT_TELL, "$n tells you, 'I know not know how to teach that.'",
                   mob, NULL, ch, TO_VICT );
              return;
            }
        }
      else
        {
          act( AT_TELL, "$n tells you, 'I know not know how to teach that.'",
               mob, NULL, ch, TO_VICT );
          return;
        }

      if ( ch->gold < skill_table[sn]->min_level*10 )
        {
          sprintf ( buf , "$n tells you, 'I charge %d credits to teach that. You don't have enough.'" , skill_table[sn]->min_level * 10 );
          act( AT_TELL, "$n tells you 'You don't have enough credits.'",
               mob, NULL, ch, TO_VICT );
          return;
        }

      if ( ch->pcdata->learned[sn] >= adept )
        {
          sprintf( buf, "$n tells you, 'I've taught you everything I can about %s.'",
                   skill_table[sn]->name );
          act( AT_TELL, buf, mob, NULL, ch, TO_VICT );
	  act( AT_TELL, "$n tells you, 'You'll have to practice it on your own now...'",
               mob, NULL, ch, TO_VICT );
        }
      else
        {
          ch->gold -= skill_table[sn]->min_level*10;
          ch->pcdata->learned[sn] += int_app[get_curr_int(ch)].learn;
          act( AT_ACTION, "You practice $T.",
               ch, NULL, skill_table[sn]->name, TO_CHAR );
          act( AT_ACTION, "$n practices $T.",
               ch, NULL, skill_table[sn]->name, TO_ROOM );
          if ( ch->pcdata->learned[sn] >= adept )
            {
              ch->pcdata->learned[sn] = adept;
              act( AT_TELL,
                   "$n tells you. 'You'll have to practice it on your own now...'",
                   mob, NULL, ch, TO_VICT );
            }
        }
    }
}

static bool MobIsTeacher( void *element, void *userData )
{
  const Character *mob = (Character*) element;

  return IsNpc(mob) && IS_SET(mob->act, ACT_PRACTICE);
}
