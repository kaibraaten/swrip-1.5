#include "character.h"
#include "mud.h"
#include "skill.h"

void do_practice( Character *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  int sn;

  if ( IsNpc(ch) )
    return;

  if ( IsNullOrEmpty( argument ) )
    {
      int col = 0;
      skill_types lasttype = SKILL_SPELL;
      short cnt = 0;

      SetPagerColor( AT_MAGIC, ch );

      for ( sn = 0; sn < TopSN; sn++ )
        {
	  const Skill *skill = SkillTable[sn];

          if ( !skill->Name )
            break;

          if ( skill->Guild < 0 || skill->Guild >= MAX_ABILITY )
            continue;

	  if( ( skill->Type == SKILL_UNKNOWN
	      || skill->Type == SKILL_HERB
	      || skill->Type == SKILL_TONGUE )
	      && !IsImmortal( ch ) )
	    {
	      lasttype = skill->Type;
	      continue;
	    }

          if ( !StrCmp(skill->Name, "reserved") && IsImmortal(ch) )
            {
              if ( col % 3 != 0 )
                SendToPager( "&r\r\n", ch );

	      SendToPager(
                            "&R--------------------------------[Spells]---------------------------------\r\n&r", ch);
              col = 0;
            }

          if ( skill->Type != lasttype )
            {
              if ( col % 3 != 0 )
		SendToPager( "\r\n&r", ch );

              PagerPrintf( ch,
                            "&R--------------------------------%ss---------------------------------\r\n&r",
                            SkillTypeName[skill->Type]);
              col = cnt = 0;
            }

          lasttype = skill->Type;

          if ( skill->Guild < 0 || skill->Guild >= MAX_ABILITY )
            continue;

          if ( ch->PCData->learned[sn] <= 0
	       && GetAbilityLevel( ch, skill->Guild ) < skill->Level )
            continue;

          if ( ch->PCData->learned[sn] == 0
               && SPELL_FLAG( skill, SF_SECRETSKILL) )
            continue;

          ++cnt;

          if ( ch->PCData->learned[sn] >= 100 )
            {
              PagerPrintf( ch, "&R%18s %3d%%  &r",
                            Capitalize(skill->Name),
			    ch->PCData->learned[sn] );
            }
          else
            PagerPrintf( ch, "&r%18s %3d%%  ",
                          Capitalize(skill->Name),
			  ch->PCData->learned[sn] );
          if ( ++col % 3 == 0 )
            SendToPager( "\r\n&r", ch );
        }

      if ( col % 3 != 0 )
        SendToPager( "\r\n&r", ch );
    }
  else
    {
      Character *mob = NULL;
      int adept = 0;
      bool can_prac = true;
      const Skill *skill = NULL;

      if ( !IsAwake(ch) )
        {
          SendToCharacter( "In your dreams, or what?\r\n", ch );
          return;
        }

      for ( mob = ch->InRoom->FirstPerson; mob; mob = mob->next_in_room )
        if ( IsNpc(mob) && IsBitSet(mob->Flags, ACT_PRACTICE) )
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
      else
	{
	  skill = SkillTable[sn];
	}

      if ( skill->Guild < 0  || skill->Guild >= MAX_ABILITY )
        {
          Act( AT_TELL, "$n tells you 'I cannot teach you that...'",
               mob, NULL, ch, TO_VICT );
          return;
        }

      if ( can_prac &&  !IsNpc(ch)
           && GetAbilityLevel( ch, skill->Guild ) < skill->Level )
        {
          Act( AT_TELL, "$n tells you 'You're not ready to learn that yet...'",
               mob, NULL, ch, TO_VICT );
          return;
	}

      if ( IsName( SkillTypeName[skill->Type], CANT_PRAC ) )
        {
          Act( AT_TELL, "$n tells you 'I do not know how to teach that.'",
               mob, NULL, ch, TO_VICT );
          return;
        }

      /*
       * Skill requires a special teacher
       */
      if ( !IsNullOrEmpty( skill->Teachers ) )
        {
          sprintf( buf, "%ld", mob->Prototype->Vnum );

          if ( !IsName( buf, skill->Teachers ) )
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

      if ( ch->Gold < skill->Level*10 )
        {
          sprintf ( buf , "$n tells you, 'I charge %d credits to teach that. You don't have enough.'" , skill->Level * 10 );
          Act( AT_TELL, "$n tells you 'You don't have enough credits.'",
               mob, NULL, ch, TO_VICT );
          return;
        }

      if ( ch->PCData->learned[sn] >= adept )
        {
          sprintf( buf, "$n tells you, 'I've taught you everything I can about %s.'",
                   skill->Name );
          Act( AT_TELL, buf, mob, NULL, ch, TO_VICT );
	  Act( AT_TELL, "$n tells you, 'You'll have to practice it on your own now...'",
               mob, NULL, ch, TO_VICT );
        }
      else
        {
          ch->Gold -= skill->Level * 10;
          ch->PCData->learned[sn] += int_app[GetCurrentIntelligence(ch)].learn;
          Act( AT_ACTION, "You practice $T.",
               ch, NULL, skill->Name, TO_CHAR );
          Act( AT_ACTION, "$n practices $T.",
               ch, NULL, skill->Name, TO_ROOM );
          if ( ch->PCData->learned[sn] >= adept )
            {
              ch->PCData->learned[sn] = adept;
              Act( AT_TELL,
                   "$n tells you. 'You'll have to practice it on your own now...'",
                   mob, NULL, ch, TO_VICT );
            }
        }
    }
}
