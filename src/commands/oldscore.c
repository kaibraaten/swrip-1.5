#include "character.h"
#include "mud.h"

void do_oldscore( Character *ch, char *argument )
{
  Affect *paf;
  SKILLTYPE   *skill;

  if ( is_affected_by(ch, AFF_POSSESS) )
    {
      send_to_char("You can't do that in your current state of mind!\r\n", ch);
      return;
    }

  set_char_color( AT_SCORE, ch );
  ch_printf( ch,
             "You are %s%s, level %d.\r\n",
             ch->name,
             is_npc(ch) ? "" : ch->pcdata->title,
             ch->top_level );

  if ( get_trust( ch ) != ch->top_level )
    ch_printf( ch, "You are trusted at level %d.\r\n",
               get_trust( ch ) );

  if ( IS_SET(ch->act, ACT_MOBINVIS) )
    ch_printf( ch, "You are mobinvis at level %d.\r\n",
               ch->mobinvis);


  ch_printf( ch,
             "You have %d/%d hit, %d/%d movement.\r\n",
             ch->hit,  ch->max_hit,
             ch->move, ch->max_move);

  ch_printf( ch,
             "You are carrying %d/%d items with weight %d/%d kg.\r\n",
             ch->carry_number, can_carry_n(ch),
             ch->carry_weight, can_carry_w(ch) );

  ch_printf( ch,
             "Str: %d  Int: %d  Wis: %d  Dex: %d  Con: %d  Cha: %d  Lck: ??  Frc: ??\r\n",
             get_curr_str(ch),
             get_curr_int(ch),
             get_curr_wis(ch),
             get_curr_dex(ch),
             get_curr_con(ch),
             get_curr_cha(ch) );

  ch_printf( ch,
             "You have have %d credits.\r\n" , ch->gold );

  ch_printf( ch, "Autoexit: %s   Autoloot: %s   Autosac: %s   Autocred: %s\r\n",
             (!is_npc(ch) && IS_SET(ch->act, PLR_AUTOEXIT)) ? "yes" : "no",
             (!is_npc(ch) && IS_SET(ch->act, PLR_AUTOLOOT)) ? "yes" : "no",
             (!is_npc(ch) && IS_SET(ch->act, PLR_AUTOSAC) ) ? "yes" : "no",
             (!is_npc(ch) && IS_SET(ch->act, PLR_AUTOGOLD)) ? "yes" : "no" );

  ch_printf( ch, "Wimpy set to %d hit points.\r\n", ch->wimpy );

  if ( !is_npc(ch) && ch->pcdata->condition[COND_DRUNK]   > 10 )
    send_to_char( "You are drunk.\r\n",   ch );
  if ( !is_npc(ch) && ch->pcdata->condition[COND_THIRST] ==  0 )
    send_to_char( "You are thirsty.\r\n", ch );
  if ( !is_npc(ch) && ch->pcdata->condition[COND_FULL]   ==  0 )
    send_to_char( "You are hungry.\r\n",  ch );

  switch( ch->mental_state / 10 )
    {
    default:   send_to_char( "You're completely messed up!\r\n", ch ); break;
    case -10:  send_to_char( "You're barely conscious.\r\n", ch ); break;
    case  -9:  send_to_char( "You can barely keep your eyes open.\r\n", ch ); break;
    case  -8:  send_to_char( "You're extremely drowsy.\r\n", ch ); break;
    case  -7:  send_to_char( "You feel very unmotivated.\r\n", ch ); break;
    case  -6:  send_to_char( "You feel sedated.\r\n", ch ); break;
    case  -5:  send_to_char( "You feel sleepy.\r\n", ch ); break;
    case  -4:  send_to_char( "You feel tired.\r\n", ch ); break;
    case  -3:  send_to_char( "You could use a rest.\r\n", ch ); break;
    case  -2:  send_to_char( "You feel a little under the weather.\r\n", ch ); break;
    case  -1:  send_to_char( "You feel fine.\r\n", ch ); break;
    case   0:  send_to_char( "You feel great.\r\n", ch ); break;
    case   1:  send_to_char( "You feel energetic.\r\n", ch ); break;
    case   2:  send_to_char( "Your mind is racing.\r\n", ch ); break;
    case   3:  send_to_char( "You can't think straight.\r\n", ch ); break;
    case   4:  send_to_char( "Your mind is going 100 miles an hour.\r\n", ch ); break;
    case   5:  send_to_char( "You're high as a kite.\r\n", ch ); break;
    case   6:  send_to_char( "Your mind and body are slipping appart.\r\n", ch ); break;
    case   7:  send_to_char( "Reality is slipping away.\r\n", ch ); break;
    case   8:  send_to_char( "You have no idea what is real, and what is not.\r\n", ch ); break;
    case   9:  send_to_char( "You feel immortal.\r\n", ch ); break;
    case  10:  send_to_char( "You are a Supreme Entity.\r\n", ch ); break;
    }

  switch ( ch->position )
    {
    case POS_DEAD:
      send_to_char( "You are DEAD!!\r\n",               ch );

      break;
    case POS_MORTAL:
      send_to_char( "You are mortally wounded.\r\n",    ch );
      break;
    case POS_INCAP:
      send_to_char( "You are incapacitated.\r\n",       ch );
      break;
    case POS_STUNNED:
      send_to_char( "You are stunned.\r\n",             ch );
      break;
    case POS_SLEEPING:
      send_to_char( "You are sleeping.\r\n",            ch );
      break;
    case POS_RESTING:
      send_to_char( "You are resting.\r\n",             ch );
      break;
    case POS_STANDING:
      send_to_char( "You are standing.\r\n",            ch );
      break;
    case POS_FIGHTING:
      send_to_char( "You are fighting.\r\n",            ch );
      break;
    case POS_MOUNTED:
      send_to_char( "Mounted.\r\n",                     ch );
      break;
    case POS_SHOVE:
      send_to_char( "Being shoved.\r\n",                ch );
      break;
    case POS_DRAG:
      send_to_char( "Being dragged.\r\n",               ch );
      break;
    }

  if ( ch->top_level >= 25 )
    ch_printf( ch, "AC: %d.  ", get_armor_class(ch) );

  send_to_char( "You are ", ch );
  if ( get_armor_class(ch) >=  101 ) send_to_char( "WORSE than naked!\r\n", ch );
  else if ( get_armor_class(ch) >=   80 ) send_to_char( "naked.\r\n",            ch );
  else if ( get_armor_class(ch) >=   60 ) send_to_char( "wearing clothes.\r\n",  ch );
  else if ( get_armor_class(ch) >=   40 ) send_to_char( "slightly armored.\r\n", ch );
  else if ( get_armor_class(ch) >=   20 ) send_to_char( "somewhat armored.\r\n", ch );
  else if ( get_armor_class(ch) >=    0 ) send_to_char( "armored.\r\n",          ch );
  else if ( get_armor_class(ch) >= - 20 ) send_to_char( "well armored.\r\n",     ch );
  else if ( get_armor_class(ch) >= - 40 ) send_to_char( "strongly armored.\r\n", ch );
  else if ( get_armor_class(ch) >= - 60 ) send_to_char( "heavily armored.\r\n",  ch );
  else if ( get_armor_class(ch) >= - 80 ) send_to_char( "superbly armored.\r\n", ch );
  else if ( get_armor_class(ch) >= -100 ) send_to_char( "divinely armored.\r\n", ch );
  else                           send_to_char( "invincible!\r\n",       ch );

  if ( ch->top_level >= 15 )
    ch_printf( ch, "Hitroll: %d  Damroll: %d.\r\n",
               get_hitroll(ch), get_damroll(ch) );

  if ( ch->top_level >= 10 )
    ch_printf( ch, "Alignment: %d.  ", ch->alignment );

  send_to_char( "You are ", ch );
  if ( ch->alignment >  900 ) send_to_char( "angelic.\r\n", ch );
  else if ( ch->alignment >  700 ) send_to_char( "saintly.\r\n", ch );
  else if ( ch->alignment >  350 ) send_to_char( "good.\r\n",    ch );
  else if ( ch->alignment >  100 ) send_to_char( "kind.\r\n",    ch );
  else if ( ch->alignment > -100 ) send_to_char( "neutral.\r\n", ch );
  else if ( ch->alignment > -350 ) send_to_char( "mean.\r\n",    ch );
  else if ( ch->alignment > -700 ) send_to_char( "evil.\r\n",    ch );
  else if ( ch->alignment > -900 ) send_to_char( "demonic.\r\n", ch );
  else                             send_to_char( "satanic.\r\n", ch );

  if ( ch->first_affect )
    {
      send_to_char( "You are affected by:\r\n", ch );
      for ( paf = ch->first_affect; paf; paf = paf->next )
        if ( (skill=get_skilltype(paf->type)) != NULL )
          {
            ch_printf( ch, "Spell: '%s'", skill->name );

            if ( ch->top_level >= 20 )
              ch_printf( ch,
                         " modifies %s by %d for %d rounds",
                         affect_loc_name( paf->location ),
                         paf->modifier,
                         paf->duration );

            send_to_char( ".\r\n", ch );
          }
    }

  if ( !is_npc( ch ) && is_immortal( ch ) )
    {
      ch_printf( ch, "WizInvis level: %d   WizInvis is %s\r\n",
		 ch->pcdata->wizinvis,
                 IS_SET( ch->act, PLR_WIZINVIS ) ? "ON" : "OFF" );
      if ( ch->pcdata->r_range_lo && ch->pcdata->r_range_hi )
        ch_printf( ch, "Room Range: %d - %d\r\n", ch->pcdata->r_range_lo,
                   ch->pcdata->r_range_hi       );
      if ( ch->pcdata->o_range_lo && ch->pcdata->o_range_hi )
        ch_printf( ch, "Obj Range : %d - %d\r\n", ch->pcdata->o_range_lo,
                   ch->pcdata->o_range_hi       );
      if ( ch->pcdata->m_range_lo && ch->pcdata->m_range_hi )
        ch_printf( ch, "Mob Range : %d - %d\r\n", ch->pcdata->m_range_lo,
                   ch->pcdata->m_range_hi       );
    }
}
