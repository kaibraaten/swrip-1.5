#include "character.h"
#include "mud.h"
#include "skill.h"

void do_practice( Character *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  int sn;

  if ( IsNpc(ch) )
    return;

  if ( argument[0] == '\0' )
    {
      int col = 0;
      short lasttype = SKILL_SPELL, cnt = 0;

      SetPagerColor( AT_MAGIC, ch );

      for ( sn = 0; sn < TopSN; sn++ )
        {
	  Skill *skill = SkillTable[sn];

          if ( !skill->name )
            break;

          if ( skill->guild < 0 || skill->guild >= MAX_ABILITY )
            continue;

	  if( ( skill->type == SKILL_UNKNOWN
	      || skill->type == SKILL_HERB
	      || skill->type == SKILL_TONGUE )
	      && !IsImmortal( ch ) )
	    {
	      lasttype = skill->type;
	      continue;
	    }

          if ( !StrCmp(SkillTable[sn]->name, "reserved") && IsImmortal(ch) )
            {
              if ( col % 3 != 0 )
                SendToPager( "&r\r\n", ch );

	      SendToPager(
                            "&R--------------------------------[Spells]---------------------------------\r\n&r", ch);
              col = 0;
            }

          if ( SkillTable[sn]->type != lasttype )
            {
              if ( col % 3 != 0 )
		SendToPager( "\r\n&r", ch );

              PagerPrintf( ch,
                            "&R--------------------------------%ss---------------------------------\r\n&r",
                            SkillTypeName[SkillTable[sn]->type]);
              col = cnt = 0;
            }

          lasttype = SkillTable[sn]->type;

          if ( SkillTable[sn]->guild < 0 || SkillTable[sn]->guild >= MAX_ABILITY )
            continue;

          if ( ch->pcdata->learned[sn] <= 0
	       && GetAbilityLevel( ch, SkillTable[sn]->guild ) < SkillTable[sn]->min_level )
            continue;

          if ( ch->pcdata->learned[sn] == 0
               &&   SPELL_FLAG(SkillTable[sn], SF_SECRETSKILL) )
            continue;

          ++cnt;
          if ( ch->pcdata->learned[sn] >= 100 )
            {
              PagerPrintf( ch, "&R%18s %3d%%  &r",
                            Capitalize(SkillTable[sn]->name),
			    ch->pcdata->learned[sn] );
            }
          else
            PagerPrintf( ch, "&r%18s %3d%%  ",
                          Capitalize(SkillTable[sn]->name),
			  ch->pcdata->learned[sn] );
          if ( ++col % 3 == 0 )
            SendToPager( "\r\n&r", ch );
        }

      if ( col % 3 != 0 )
        SendToPager( "\r\n&r", ch );
    }
  else
    {
      Character *mob;
      int adept;
      bool can_prac = true;

      if ( !IsAwake(ch) )
        {
          SendToCharacter( "In your dreams, or what?\r\n", ch );
          return;
        }

      for ( mob = ch->in_room->first_person; mob; mob = mob->next_in_room )
        if ( IsNpc(mob) && IsBitSet(mob->act, ACT_PRACTICE) )
          break;

      if ( !mob )
        {
          SendToCharacter( "You can't do that here.\r\n", ch );
          return;
        }


      sn = LookupSkill( argument );

      if ( sn == -1 )
        {
          Act( AT_TELL, "$n tells you 'I've never heard of that one...'",
               mob, NULL, ch, TO_VICT );
          return;
        }

      if ( SkillTable[sn]->guild < 0  || SkillTable[sn]->guild >= MAX_ABILITY )
        {
          Act( AT_TELL, "$n tells you 'I cannot teach you that...'",
               mob, NULL, ch, TO_VICT );
          return;
        }

      if ( can_prac &&  !IsNpc(ch)
           && GetAbilityLevel( ch, SkillTable[sn]->guild ) < SkillTable[sn]->min_level )
        {
          Act( AT_TELL, "$n tells you 'You're not ready to learn that yet...'",
               mob, NULL, ch, TO_VICT );
          return;
	}

      if ( IsName( SkillTypeName[SkillTable[sn]->type], CANT_PRAC ) )
        {
          Act( AT_TELL, "$n tells you 'I do not know how to teach that.'",
               mob, NULL, ch, TO_VICT );
          return;
        }

      /*
       * Skill requires a special teacher
       */
      if ( SkillTable[sn]->teachers && SkillTable[sn]->teachers[0] != '\0' )
        {
          sprintf( buf, "%ld", mob->Prototype->vnum );

          if ( !IsName( buf, SkillTable[sn]->teachers ) )
            {
              Act( AT_TELL, "$n tells you, 'I do not know how to teach that.'",
                   mob, NULL, ch, TO_VICT );
              return;
            }
        }
      else
        {
          Act( AT_TELL, "$n tells you, 'I do not know how to teach that.'",
               mob, NULL, ch, TO_VICT );
          return;
        }

      adept = 20;

      if ( ch->gold < SkillTable[sn]->min_level*10 )
        {
          sprintf ( buf , "$n tells you, 'I charge %d credits to teach that. You don't have enough.'" , SkillTable[sn]->min_level * 10 );
          Act( AT_TELL, "$n tells you 'You don't have enough credits.'",
               mob, NULL, ch, TO_VICT );
          return;
        }

      if ( ch->pcdata->learned[sn] >= adept )
        {
          sprintf( buf, "$n tells you, 'I've taught you everything I can about %s.'",
                   SkillTable[sn]->name );
          Act( AT_TELL, buf, mob, NULL, ch, TO_VICT );
	  Act( AT_TELL, "$n tells you, 'You'll have to practice it on your own now...'",
               mob, NULL, ch, TO_VICT );
        }
      else
        {
          ch->gold -= SkillTable[sn]->min_level*10;
          ch->pcdata->learned[sn] += int_app[GetCurrentIntelligence(ch)].learn;
          Act( AT_ACTION, "You practice $T.",
               ch, NULL, SkillTable[sn]->name, TO_CHAR );
          Act( AT_ACTION, "$n practices $T.",
               ch, NULL, SkillTable[sn]->name, TO_ROOM );
          if ( ch->pcdata->learned[sn] >= adept )
            {
              ch->pcdata->learned[sn] = adept;
              Act( AT_TELL,
                   "$n tells you. 'You'll have to practice it on your own now...'",
                   mob, NULL, ch, TO_VICT );
            }
        }
    }
}
