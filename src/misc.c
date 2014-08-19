/****************************************************************************
 *                   Star Wars: Rise in Power MUD Codebase                  *
 *--------------------------------------------------------------------------*
 * SWRiP Code Additions and changes from the SWReality and Smaug Code       *
 * copyright (c) 2001 by Mark Miller (Darrik Vequir)                        *
 *--------------------------------------------------------------------------*
 * Star Wars Reality Code Additions and changes from the Smaug Code         *
 * copyright (c) 1997 by Sean Cooper                                        *
 * -------------------------------------------------------------------------*
 * Starwars and Starwars Names copyright(c) Lucas Film Ltd.                 *
 *--------------------------------------------------------------------------*
 * SMAUG 1.0 (C) 1994, 1995, 1996 by Derek Snider                           *
 * SMAUG code team: Thoric, Altrag, Blodkai, Narn, Haus,                    *
 * Scryn, Rennard, Swordbearer, Gorog, Grishnakh and Tricops                *
 * ------------------------------------------------------------------------ *
 * Merc 2.1 Diku Mud improvments copyright (C) 1992, 1993 by Michael        *
 * Chastain, Michael Quan, and Mitchell Tse.                                *
 * Original Diku Mud copyright (C) 1990, 1991 by Sebastian Hammer,          *
 * Michael Seifert, Hans Henrik Staerfeldt, Tom Madsen, and Katja Nyboe.    *
 ****************************************************************************/

#include <string.h>
#include "mud.h"
#include "character.h"

void ApplyJediBonus( Character *ch )
{
  if ( GetRandomPercent() == 1 )
    {
      ch->max_mana++;
      ChPrintf( ch, "&YYou are wise in your use of the force.\r\n" );
      ChPrintf( ch, "You feel a little stronger in your wisdom.&w\r\n" );
    }
}

void ApplySithPenalty( Character *ch )
{
  if ( GetRandomPercent() == 1 )
    {
      ch->max_mana++;

      if (ch->max_hit > 100)
	{
	  ch->max_hit--;
	}

      ch->hit--;
      ChPrintf( ch, "&zYour body grows weaker as your strength in the dark side grows.&w\r\n" );
    }
}

/*
 * Function to handle the state changing of a triggerobject (lever)  -Thoric
 */
void PullOrPush( Character *ch, Object *obj, bool pull )
{
  char buf[MAX_STRING_LENGTH];
  Character *rch = NULL;
  Room *room = NULL,  *to_room = NULL;
  Exit *pexit = NULL, *pexit_rev = NULL;
  DirectionType edir = DIR_INVALID;
  char *txt = NULL;
  bool isup = IsBitSet( obj->value[OVAL_BUTTON_TRIGFLAGS], TRIG_UP );

  switch( obj->item_type )
    {
    default:
      sprintf( buf, "You can't %s that!\r\n", pull ? "pull" : "push" );
      SendToCharacter( buf, ch );
      return;
      break;

    case ITEM_SWITCH:
    case ITEM_LEVER:
    case ITEM_PULLCHAIN:
      if ( (!pull && isup) || (pull && !isup) )
        {
          sprintf( buf, "It is already %s.\r\n", isup ? "up" : "down" );
          SendToCharacter( buf, ch );
          return;
        }
      break;

    case ITEM_BUTTON:
      if ( (!pull && isup) || (pull & !isup) )
        {
          sprintf( buf, "It is already %s.\r\n", isup ? "in" : "out" );
          SendToCharacter( buf, ch );
          return;
        }
      break;
    }

  if( pull && IsBitSet(obj->Prototype->mprog.progtypes,PULL_PROG) )
    {
      if ( !IsBitSet(obj->value[OVAL_BUTTON_TRIGFLAGS], TRIG_AUTORETURN ) )
	{
	  RemoveBit( obj->value[OVAL_BUTTON_TRIGFLAGS], TRIG_UP );
	}

      oprog_pull_trigger( ch, obj );
      return;
    }

  if( !pull && IsBitSet(obj->Prototype->mprog.progtypes,PUSH_PROG) )
    {
      if ( !IsBitSet(obj->value[OVAL_BUTTON_TRIGFLAGS], TRIG_AUTORETURN ) )
	{
	  SetBit( obj->value[OVAL_BUTTON_TRIGFLAGS], TRIG_UP );
	}

      oprog_push_trigger( ch, obj );
      return;
    }

  if ( !oprog_use_trigger( ch, obj, NULL, NULL, NULL ) )
    {
      sprintf( buf, "$n %s $p.", pull ? "pulls" : "pushes" );
      Act( AT_ACTION, buf,  ch, obj, NULL, TO_ROOM );
      sprintf( buf, "You %s $p.", pull ? "pull" : "push" );
      Act( AT_ACTION, buf, ch, obj, NULL, TO_CHAR );
    }

  if ( !IsBitSet(obj->value[OVAL_BUTTON_TRIGFLAGS], TRIG_AUTORETURN ) )
    {
      if ( pull )
	{
	  RemoveBit( obj->value[OVAL_BUTTON_TRIGFLAGS], TRIG_UP );
	}
      else
	{
	  SetBit( obj->value[OVAL_BUTTON_TRIGFLAGS], TRIG_UP );
	}
    }

  if ( IsBitSet( obj->value[OVAL_BUTTON_TRIGFLAGS], TRIG_TELEPORT )
       || IsBitSet( obj->value[OVAL_BUTTON_TRIGFLAGS], TRIG_TELEPORTALL )
       || IsBitSet( obj->value[OVAL_BUTTON_TRIGFLAGS], TRIG_TELEPORTPLUS ) )
    {
      int flags = 0;

      if ( ( room = GetRoom( obj->value[OVAL_BUTTON_TELEPORT_DESTINATION] ) ) == NULL )
        {
          Bug( "PullOrPush: obj points to invalid room %d",
	       obj->value[OVAL_BUTTON_TELEPORT_DESTINATION] );
          return;
        }

      if ( IsBitSet( obj->value[OVAL_BUTTON_TRIGFLAGS], TRIG_SHOWROOMDESC ) )
	{
	  SetBit( flags, TELE_SHOWDESC );
	}

      if ( IsBitSet( obj->value[OVAL_BUTTON_TRIGFLAGS], TRIG_TELEPORTALL ) )
	{
	  SetBit( flags, TELE_TRANSALL );
	}

      if ( IsBitSet( obj->value[OVAL_BUTTON_TRIGFLAGS], TRIG_TELEPORTPLUS ) )
	{
	  SetBit( flags, TELE_TRANSALLPLUS );
	}

      Teleport( ch, obj->value[OVAL_BUTTON_TELEPORT_DESTINATION], flags );
      return;
    }

  if ( IsBitSet( obj->value[OVAL_BUTTON_TRIGFLAGS], TRIG_RAND4 )
       || IsBitSet( obj->value[OVAL_BUTTON_TRIGFLAGS], TRIG_RAND6 ) )
    {
      int maxd = 0;

      if ( ( room = GetRoom( obj->value[OVAL_BUTTON_TELEPORT_DESTINATION] ) ) == NULL )
        {
          Bug( "PullOrPush: obj points to invalid room %d",
	       obj->value[OVAL_BUTTON_TELEPORT_DESTINATION] );
          return;
        }

      if ( IsBitSet( obj->value[OVAL_BUTTON_TRIGFLAGS], TRIG_RAND4 ) )
        maxd = 3;
      else
        maxd = 5;

      RandomizeExits( room, maxd );

      for ( rch = room->first_person; rch; rch = rch->next_in_room )
        {
          SendToCharacter( "You hear a loud rumbling sound.\r\n", rch );
          SendToCharacter( "Something seems different...\r\n", rch );
        }
    }

  if ( IsBitSet( obj->value[OVAL_BUTTON_TRIGFLAGS], TRIG_DOOR ) )
    {
      room = GetRoom( obj->value[OVAL_BUTTON_TELEPORT_DESTINATION] );

      if ( !room )
	{
	  room = obj->in_room;
	}

      if ( !room )
        {
          Bug( "PullOrPush: obj points to invalid room %d",
	       obj->value[OVAL_BUTTON_TELEPORT_DESTINATION] );
          return;
        }

      if ( IsBitSet( obj->value[OVAL_BUTTON_TRIGFLAGS], TRIG_D_NORTH ) )
        {
          edir = DIR_NORTH;
          txt = "to the north";
        }
      else if ( IsBitSet( obj->value[OVAL_BUTTON_TRIGFLAGS], TRIG_D_SOUTH ) )
	{
	  edir = DIR_SOUTH;
	  txt = "to the south";
	}
      else if ( IsBitSet( obj->value[OVAL_BUTTON_TRIGFLAGS], TRIG_D_EAST ) )
	{
	  edir = DIR_EAST;
	  txt = "to the east";
	}
      else if ( IsBitSet( obj->value[OVAL_BUTTON_TRIGFLAGS], TRIG_D_WEST ) )
	{
	  edir = DIR_WEST;
	  txt = "to the west";
	}
      else if ( IsBitSet( obj->value[OVAL_BUTTON_TRIGFLAGS], TRIG_D_UP ) )
	{
	  edir = DIR_UP;
	  txt = "from above";
	}
      else if ( IsBitSet( obj->value[OVAL_BUTTON_TRIGFLAGS], TRIG_D_DOWN ) )
	{
	  edir = DIR_DOWN;
	  txt = "from below";
	}
      else
	{
	  Bug( "PullOrPush: door: no direction flag set.", 0 );
	  return;
	}

      pexit = GetExit( room, edir );

      if ( !pexit )
        {
          if ( !IsBitSet( obj->value[OVAL_BUTTON_TRIGFLAGS], TRIG_PASSAGE ) )
            {
              Bug( "PullOrPush: obj points to non-exit %d",
		   obj->value[OVAL_BUTTON_TELEPORT_DESTINATION] );
              return;
            }

          to_room = GetRoom( obj->value[OVAL_BUTTON_2] );

          if ( !to_room )
            {
              Bug( "PullOrPush: dest points to invalid room %d",
		   obj->value[OVAL_BUTTON_2] );
              return;
            }

          pexit = MakeExit( room, to_room, edir );
          pexit->keyword        = CopyString( "" );
          pexit->description    = CopyString( "" );
          pexit->key            = -1;
          pexit->exit_info      = 0;
          top_exit++;
          Act( AT_PLAIN, "A passage opens!", ch, NULL, NULL, TO_CHAR );
          Act( AT_PLAIN, "A passage opens!", ch, NULL, NULL, TO_ROOM );
          return;
        }

      if ( IsBitSet( obj->value[OVAL_BUTTON_TRIGFLAGS], TRIG_UNLOCK )
           && IsBitSet( pexit->exit_info, EX_LOCKED) )
        {
          RemoveBit(pexit->exit_info, EX_LOCKED);
          Act( AT_PLAIN, "You hear a faint click $T.", ch, NULL, txt, TO_CHAR );
          Act( AT_PLAIN, "You hear a faint click $T.", ch, NULL, txt, TO_ROOM );

          if ( ( pexit_rev = pexit->rexit ) != NULL
               &&   pexit_rev->to_room == ch->in_room )
            RemoveBit( pexit_rev->exit_info, EX_LOCKED );

          return;
        }

      if ( IsBitSet( obj->value[OVAL_BUTTON_TRIGFLAGS], TRIG_LOCK )
           && !IsBitSet( pexit->exit_info, EX_LOCKED) )
        {
          SetBit(pexit->exit_info, EX_LOCKED);
          Act( AT_PLAIN, "You hear a faint click $T.", ch, NULL, txt, TO_CHAR );
          Act( AT_PLAIN, "You hear a faint click $T.", ch, NULL, txt, TO_ROOM );

          if ( ( pexit_rev = pexit->rexit ) != NULL
               &&   pexit_rev->to_room == ch->in_room )
            SetBit( pexit_rev->exit_info, EX_LOCKED );

          return;
        }

      if ( IsBitSet( obj->value[OVAL_BUTTON_TRIGFLAGS], TRIG_OPEN   )
           && IsBitSet( pexit->exit_info, EX_CLOSED) )
        {
          RemoveBit(pexit->exit_info, EX_CLOSED);

          for ( rch = room->first_person; rch; rch = rch->next_in_room )
	    {
	      Act( AT_ACTION, "The $d opens.", rch, NULL, pexit->keyword, TO_CHAR );
	    }

          if ( ( pexit_rev = pexit->rexit ) != NULL
               && pexit_rev->to_room == ch->in_room )
            {
              RemoveBit( pexit_rev->exit_info, EX_CLOSED );

              for ( rch = to_room->first_person; rch; rch = rch->next_in_room )
		{
		  Act( AT_ACTION, "The $d opens.", rch, NULL, pexit_rev->keyword, TO_CHAR );
		}
            }

          CheckRoomForTraps( ch, trap_door[edir]);
          return;
        }

      if ( IsBitSet( obj->value[OVAL_BUTTON_TRIGFLAGS], TRIG_CLOSE   )
           && !IsBitSet( pexit->exit_info, EX_CLOSED) )
        {
          SetBit(pexit->exit_info, EX_CLOSED);

          for ( rch = room->first_person; rch; rch = rch->next_in_room )
	    {
	      Act( AT_ACTION, "The $d closes.", rch, NULL, pexit->keyword, TO_CHAR );
	    }

          if ( ( pexit_rev = pexit->rexit ) != NULL
               && pexit_rev->to_room == ch->in_room )
            {
              SetBit( pexit_rev->exit_info, EX_CLOSED );

              for ( rch = to_room->first_person; rch; rch = rch->next_in_room )
		{
		  Act( AT_ACTION, "The $d closes.", rch, NULL, pexit_rev->keyword, TO_CHAR );
		}
            }

          CheckRoomForTraps( ch, trap_door[edir]);
          return;
        }
    }
}

void ActionDescription( Character *ch, Object *obj, void *vo )
{
  char charbuf[MAX_STRING_LENGTH];
  char roombuf[MAX_STRING_LENGTH];
  char *srcptr = obj->action_desc;
  char *charptr = charbuf;
  char *roomptr = roombuf;
  const char *ichar = NULL;
  const char *iroom = NULL;

  while ( *srcptr != '\0' )
    {
      if ( *srcptr == '$' )
        {
          srcptr++;
          switch ( *srcptr )
            {
            case 'e':
              ichar = "you";
              iroom = "$e";
              break;

            case 'm':
              ichar = "you";
              iroom = "$m";
              break;

            case 'n':
              ichar = "you";
              iroom = "$n";
              break;

            case 's':
              ichar = "your";
              iroom = "$s";
              break;

            default:
              srcptr--;
              *charptr++ = *srcptr;
              *roomptr++ = *srcptr;
              break;
            }
        }
      else if ( *srcptr == '%' && *++srcptr == 's' )
        {
          ichar = "You";
          iroom = IsNpc( ch ) ? ch->short_descr : ch->name;
        }
      else
        {
          *charptr++ = *srcptr;
          *roomptr++ = *srcptr;
          srcptr++;
          continue;
        }

      while ( ( *charptr = *ichar ) != '\0' )
        {
          charptr++;
          ichar++;
        }

      while ( ( *roomptr = *iroom ) != '\0' )
        {
          roomptr++;
          iroom++;
        }
      srcptr++;
    }

  *charptr = '\0';
  *roomptr = '\0';

  switch( obj->item_type )
    {
    case ITEM_DRINK_CON:
      Act( AT_ACTION, charbuf, ch, obj,
	   LiquidTable[obj->value[OVAL_DRINK_CON_LIQUID_TYPE]].liq_name, TO_CHAR );
      Act( AT_ACTION, roombuf, ch, obj,
	   LiquidTable[obj->value[OVAL_DRINK_CON_LIQUID_TYPE]].liq_name, TO_ROOM );
      return;

    case ITEM_ARMOR:
    case ITEM_WEAPON:
    case ITEM_LIGHT:
    case ITEM_FOOD:
    case ITEM_PILL:
    case ITEM_BLOOD:
    case ITEM_FOUNTAIN:
      Act( AT_ACTION, charbuf, ch, obj, ch, TO_CHAR );
      Act( AT_ACTION, roombuf, ch, obj, ch, TO_ROOM );
      return;

    default:
      return;
    }
}

bool check_bad_name( const char *name )
{
  FILE *fp = fopen(BAD_NAME_FILE,"r");

  if( fp == NULL )
    {
      Bug("Bad Name file missing. Creating.");
      fp = fopen(BAD_NAME_FILE,"w+");
      fprintf(fp,"ShitEater~\n");
      fprintf(fp,"$~");
      fclose(fp);
      return false;
    }

  while (!feof(fp))
    {
      const char *ln = ReadStringToTilde(fp);

      if (IsName(name,ln))
        {
          fclose(fp);
          return true;
        }

      if (IsName("$",ln))
        {
          fclose(fp);
          return false;
        }
    }

  fclose(fp);
  return false;
}

int add_bad_name(const char *name)
{
  FILE *fp = NULL;
  const char *ln = NULL;
  fpos_t pos;

  if (check_bad_name(name))
    {
      return 0;
    }

  if( !( fp = fopen(BAD_NAME_FILE,"r+") ) )
    {
      Bug("Error opening Bad Name file.");
      return -1;
    }

  ln = ReadStringToTilde(fp);

  while(!IsName("$",ln) && !feof(fp))
    {
      ln = ReadStringToTilde(fp);
    }

  /* Delete the $~ from the end of the file */
  fgetpos(fp, &pos);

  fsetpos(fp, &pos -2);
  fsetpos(fp, &pos);
  fprintf(fp,"%s~\n",name);
  fprintf(fp,"$~");
  fclose(fp);
  return 1;
}

/*
 * This function examines a text string to see if the first "word" is a
 * color indicator (e.g. _red, _whi_, _blu).  -  Gorog
 */
int GetColor(const char *origarg)    /* get color code from command string */
{
  char argument[MAX_INPUT_LENGTH];
  char color[MAX_INPUT_LENGTH];
  const char *cptr = NULL;
  static char const * color_list =
    "_bla_red_dgr_bro_dbl_pur_cya_cha_dch_ora_gre_yel_blu_pin_lbl_whi";
  static char const * blink_list =
    "*bla*red*dgr*bro*dbl*pur*cya*cha*dch*ora*gre*yel*blu*pin*lbl*whi";

  strcpy(argument, origarg);
  OneArgument (argument, color);

  if (color[0]!='_' && color[0]!='*')
    return 0;

  if ( (cptr = strstr(color_list, color)) )
    return (cptr - color_list) / 4;

  if ( (cptr = strstr(blink_list, color)) )
    return (cptr - blink_list) / 4 + AT_BLINK;

  return 0;
}

static const long VALID_LANGUAGES  = LANG_COMMON
  | LANG_WOOKIEE | LANG_TWI_LEK | LANG_RODIAN
  | LANG_HUTT | LANG_MON_CALAMARI | LANG_NOGHRI | LANG_GAMORREAN
  | LANG_JAWA | LANG_ADARIAN | LANG_EWOK | LANG_VERPINE | LANG_DEFEL
  | LANG_TRANDOSHAN | LANG_CHADRA_FAN | LANG_QUARREN | LANG_SULLUSTAN
  | LANG_BARABEL | LANG_FIRRERREO | LANG_BOTHAN | LANG_TOGORIAN
  | LANG_KUBAZ | LANG_YEVETHAN | LANG_GAND | LANG_DUROS | LANG_COYNITE
  | LANG_GOTAL | LANG_DEVARONIAN | LANG_FALLEEN | LANG_ITHORIAN
  | LANG_BINARY;

bool IsValidLanguage( int language )
{
  return VALID_LANGUAGES & language ? true : false;
}

const char *get_race( const Character *ch)
{
  if ( ch->race < MAX_NPC_RACE && ch->race >= 0)
    return ( npc_race[ch->race] );

  return "Unknown";
}

void SetCharacterTitle( Character *ch, const char *title )
{
  char buf[MAX_STRING_LENGTH];
  char *bufptr = buf;

  if ( IsNpc(ch) )
    {
      Bug( "Set_title: NPC.", 0 );
      return;
    }

  strcpy(bufptr, title);

  bufptr = TrimString(buf, ' ');

  FreeMemory( ch->pcdata->title );
  ch->pcdata->title = CopyString( buf );
}
