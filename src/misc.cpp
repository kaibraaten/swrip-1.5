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

#include <cstring>
#include <ctime>
#include "mud.hpp"
#include "character.hpp"
#include "badname.hpp"
#include "log.hpp"
#include "room.hpp"
#include "object.hpp"
#include "protoobject.hpp"
#include "exit.hpp"
#include "act.hpp"
#include "triggers.hpp"

 /*
  * Function to handle the state changing of a triggerobject (lever)  -Thoric
  */
void PullOrPush(std::shared_ptr<Character> ch, std::shared_ptr<Object> obj, bool pull)
{
    char buf[MAX_STRING_LENGTH];
    std::shared_ptr<Room> room, to_room;
    std::shared_ptr<Exit> pexit, pexit_rev;
    DirectionType edir = DIR_INVALID;
    std::string txt;
    bool isup = IsBitSet(obj->Value[OVAL_BUTTON_TRIGFLAGS], TRIG_UP);

    switch(obj->ItemType)
    {
    default:
        ch->Echo("You can't %s that!\r\n", pull ? "pull" : "push");
        return;
        break;

    case ITEM_SWITCH:
    case ITEM_LEVER:
    case ITEM_PULLCHAIN:
        if((!pull && isup) || (pull && !isup))
        {
            ch->Echo("It is already %s.\r\n", isup ? "up" : "down");
            return;
        }
        break;

    case ITEM_BUTTON:
        if((!pull && isup) || (pull && !isup))
        {
            ch->Echo("It is already %s.\r\n", isup ? "in" : "out");
            return;
        }
        break;
    }

    if(pull && IsBitSet(obj->Prototype->mprog.progtypes, PULL_PROG))
    {
        if(!IsBitSet(obj->Value[OVAL_BUTTON_TRIGFLAGS], TRIG_AUTORETURN))
        {
            RemoveBit(obj->Value[OVAL_BUTTON_TRIGFLAGS], TRIG_UP);
        }

        ObjProgPullTrigger(ch, obj);
        return;
    }

    if(!pull && IsBitSet(obj->Prototype->mprog.progtypes, PUSH_PROG))
    {
        if(!IsBitSet(obj->Value[OVAL_BUTTON_TRIGFLAGS], TRIG_AUTORETURN))
        {
            SetBit(obj->Value[OVAL_BUTTON_TRIGFLAGS], TRIG_UP);
        }

        ObjProgPushTrigger(ch, obj);
        return;
    }

    if(!ObjProgUseTrigger(ch, obj))
    {
        sprintf(buf, "$n %s $p.", pull ? "pulls" : "pushes");
        Act(AT_ACTION, buf, ch, obj, nullptr, ActTarget::Room);
        sprintf(buf, "You %s $p.", pull ? "pull" : "push");
        Act(AT_ACTION, buf, ch, obj, nullptr, ActTarget::Char);
    }

    if(!IsBitSet(obj->Value[OVAL_BUTTON_TRIGFLAGS], TRIG_AUTORETURN))
    {
        if(pull)
        {
            RemoveBit(obj->Value[OVAL_BUTTON_TRIGFLAGS], TRIG_UP);
        }
        else
        {
            SetBit(obj->Value[OVAL_BUTTON_TRIGFLAGS], TRIG_UP);
        }
    }

    if(IsBitSet(obj->Value[OVAL_BUTTON_TRIGFLAGS], TRIG_TELEPORT)
       || IsBitSet(obj->Value[OVAL_BUTTON_TRIGFLAGS], TRIG_TELEPORTALL)
       || IsBitSet(obj->Value[OVAL_BUTTON_TRIGFLAGS], TRIG_TELEPORTPLUS))
    {
        int flags = 0;

        if((room = GetRoom(obj->Value[OVAL_BUTTON_TELEPORT_DESTINATION])) == NULL)
        {
            Log->Bug("PullOrPush: obj points to invalid room %d",
                     obj->Value[OVAL_BUTTON_TELEPORT_DESTINATION]);
            return;
        }

        if(IsBitSet(obj->Value[OVAL_BUTTON_TRIGFLAGS], TRIG_SHOWROOMDESC))
        {
            SetBit(flags, TELE_SHOWDESC);
        }

        if(IsBitSet(obj->Value[OVAL_BUTTON_TRIGFLAGS], TRIG_TELEPORTALL))
        {
            SetBit(flags, TELE_TRANSALL);
        }

        if(IsBitSet(obj->Value[OVAL_BUTTON_TRIGFLAGS], TRIG_TELEPORTPLUS))
        {
            SetBit(flags, TELE_TRANSALLPLUS);
        }

        Teleport(ch, obj->Value[OVAL_BUTTON_TELEPORT_DESTINATION], flags);
        return;
    }

    if(IsBitSet(obj->Value[OVAL_BUTTON_TRIGFLAGS], TRIG_RAND4)
       || IsBitSet(obj->Value[OVAL_BUTTON_TRIGFLAGS], TRIG_RAND6))
    {
        int maxd = 0;

        if((room = GetRoom(obj->Value[OVAL_BUTTON_TELEPORT_DESTINATION])) == NULL)
        {
            Log->Bug("PullOrPush: obj points to invalid room %d",
                     obj->Value[OVAL_BUTTON_TELEPORT_DESTINATION]);
            return;
        }

        if(IsBitSet(obj->Value[OVAL_BUTTON_TRIGFLAGS], TRIG_RAND4))
            maxd = 3;
        else
            maxd = 5;

        RandomizeExits(room, maxd);

        for(auto rch : room->Characters())
        {
            rch->Echo("You hear a loud rumbling sound.\r\n");
            rch->Echo("Something seems different...\r\n");
        }
    }

    if(IsBitSet(obj->Value[OVAL_BUTTON_TRIGFLAGS], TRIG_DOOR))
    {
        room = GetRoom(obj->Value[OVAL_BUTTON_TELEPORT_DESTINATION]);

        if(!room)
        {
            room = obj->InRoom;
        }

        if(!room)
        {
            Log->Bug("PullOrPush: obj points to invalid room %d",
                     obj->Value[OVAL_BUTTON_TELEPORT_DESTINATION]);
            return;
        }

        if(IsBitSet(obj->Value[OVAL_BUTTON_TRIGFLAGS], TRIG_D_NORTH))
        {
            edir = DIR_NORTH;
            txt = "to the north";
        }
        else if(IsBitSet(obj->Value[OVAL_BUTTON_TRIGFLAGS], TRIG_D_SOUTH))
        {
            edir = DIR_SOUTH;
            txt = "to the south";
        }
        else if(IsBitSet(obj->Value[OVAL_BUTTON_TRIGFLAGS], TRIG_D_EAST))
        {
            edir = DIR_EAST;
            txt = "to the east";
        }
        else if(IsBitSet(obj->Value[OVAL_BUTTON_TRIGFLAGS], TRIG_D_WEST))
        {
            edir = DIR_WEST;
            txt = "to the west";
        }
        else if(IsBitSet(obj->Value[OVAL_BUTTON_TRIGFLAGS], TRIG_D_UP))
        {
            edir = DIR_UP;
            txt = "from above";
        }
        else if(IsBitSet(obj->Value[OVAL_BUTTON_TRIGFLAGS], TRIG_D_DOWN))
        {
            edir = DIR_DOWN;
            txt = "from below";
        }
        else
        {
            Log->Bug("PullOrPush: door: no direction flag set.");
            return;
        }

        pexit = GetExit(room, edir);

        if(!pexit)
        {
            if(!IsBitSet(obj->Value[OVAL_BUTTON_TRIGFLAGS], TRIG_PASSAGE))
            {
                Log->Bug("PullOrPush: obj points to non-exit %d",
                         obj->Value[OVAL_BUTTON_TELEPORT_DESTINATION]);
                return;
            }

            to_room = GetRoom(obj->Value[OVAL_BUTTON_2]);

            if(!to_room)
            {
                Log->Bug("PullOrPush: dest points to invalid room %d",
                         obj->Value[OVAL_BUTTON_2]);
                return;
            }

            pexit = MakeExit(room, to_room, edir);
            pexit->Key = -1;
            top_exit++;
            Act(AT_PLAIN, "A passage opens!", ch, NULL, NULL, ActTarget::Char);
            Act(AT_PLAIN, "A passage opens!", ch, NULL, NULL, ActTarget::Room);
            return;
        }

        if(IsBitSet(obj->Value[OVAL_BUTTON_TRIGFLAGS], TRIG_UNLOCK)
           && pexit->Flags.test(Flag::Exit::Locked))
        {
            pexit->Flags.reset(Flag::Exit::Locked);
            Act(AT_PLAIN, "You hear a faint click $T.", ch, NULL, txt, ActTarget::Char);
            Act(AT_PLAIN, "You hear a faint click $T.", ch, NULL, txt, ActTarget::Room);

            if((pexit_rev = pexit->ReverseExit) != NULL
               && pexit_rev->ToRoom == ch->InRoom)
            {
                pexit_rev->Flags.reset(Flag::Exit::Locked);
            }

            return;
        }

        if(IsBitSet(obj->Value[OVAL_BUTTON_TRIGFLAGS], TRIG_LOCK)
           && !pexit->Flags.test(Flag::Exit::Locked))
        {
            pexit->Flags.set(Flag::Exit::Locked);
            Act(AT_PLAIN, "You hear a faint click $T.", ch, NULL, txt, ActTarget::Char);
            Act(AT_PLAIN, "You hear a faint click $T.", ch, NULL, txt, ActTarget::Room);

            if((pexit_rev = pexit->ReverseExit) != NULL
               && pexit_rev->ToRoom == ch->InRoom)
            {
                pexit_rev->Flags.set(Flag::Exit::Locked);
            }

            return;
        }

        if(IsBitSet(obj->Value[OVAL_BUTTON_TRIGFLAGS], TRIG_OPEN)
           && pexit->Flags.test(Flag::Exit::Closed))
        {
            pexit->Flags.reset(Flag::Exit::Closed);

            for(auto rch : room->Characters())
            {
                Act(AT_ACTION, "The $d opens.", rch, NULL, pexit->Keyword, ActTarget::Char);
            }

            if((pexit_rev = pexit->ReverseExit) != NULL
               && pexit_rev->ToRoom == ch->InRoom)
            {
                pexit_rev->Flags.reset(Flag::Exit::Closed);

                for(auto rch : to_room->Characters())
                {
                    Act(AT_ACTION, "The $d opens.",
                        rch, NULL, pexit_rev->Keyword, ActTarget::Char);
                }
            }

            CheckRoomForTraps(ch, TrapDoor[edir]);
            return;
        }

        if(IsBitSet(obj->Value[OVAL_BUTTON_TRIGFLAGS], TRIG_CLOSE)
           && !pexit->Flags.test(Flag::Exit::Closed))
        {
            pexit->Flags.set(Flag::Exit::Closed);

            for(auto rch : room->Characters())
            {
                Act(AT_ACTION, "The $d closes.", rch, NULL, pexit->Keyword, ActTarget::Char);
            }

            if((pexit_rev = pexit->ReverseExit) != NULL
               && pexit_rev->ToRoom == ch->InRoom)
            {
                pexit_rev->Flags.set(Flag::Exit::Closed);

                for(auto rch : to_room->Characters())
                {
                    Act(AT_ACTION, "The $d closes.", rch, NULL, pexit_rev->Keyword, ActTarget::Char);
                }
            }

            CheckRoomForTraps(ch, TrapDoor[edir]);
            return;
        }
    }
}

void ActionDescription(std::shared_ptr<Character> ch, std::shared_ptr<Object> obj)
{
    char charbuf[MAX_STRING_LENGTH];
    char roombuf[MAX_STRING_LENGTH];
    const char *srcptr = obj->ActionDescription.c_str();
    char *charptr = charbuf;
    char *roomptr = roombuf;
    const char *ichar = NULL;
    const char *iroom = NULL;

    while(!IsNullOrEmpty(srcptr))
    {
        if(*srcptr == '$')
        {
            srcptr++;
            switch(*srcptr)
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
        else if(*srcptr == '%' && *++srcptr == 's')
        {
            ichar = "You";
            iroom = IsNpc(ch) ? ch->ShortDescr.c_str() : ch->Name.c_str();
        }
        else
        {
            *charptr++ = *srcptr;
            *roomptr++ = *srcptr;
            srcptr++;
            continue;
        }

        while((*charptr = *ichar) != '\0')
        {
            charptr++;
            ichar++;
        }

        while((*roomptr = *iroom) != '\0')
        {
            roomptr++;
            iroom++;
        }
        srcptr++;
    }

    *charptr = '\0';
    *roomptr = '\0';

    switch(obj->ItemType)
    {
    case ITEM_DRINK_CON:
        Act(AT_ACTION, charbuf, ch, obj,
            std::string(LiquidTable[obj->Value[OVAL_DRINK_CON_LIQUID_TYPE]].Name), ActTarget::Char);
        Act(AT_ACTION, roombuf, ch, obj,
            std::string(LiquidTable[obj->Value[OVAL_DRINK_CON_LIQUID_TYPE]].Name), ActTarget::Room);
        return;

    case ITEM_ARMOR:
    case ITEM_WEAPON:
    case ITEM_LIGHT:
    case ITEM_FOOD:
    case ITEM_PILL:
    case ITEM_BLOOD:
    case ITEM_FOUNTAIN:
        Act(AT_ACTION, charbuf, ch, obj, ch, ActTarget::Char);
        Act(AT_ACTION, roombuf, ch, obj, ch, ActTarget::Room);
        return;

    default:
        return;
    }
}

/*
 * This function examines a text string to see if the first "word" is a
 * color indicator (e.g. _red, _whi_, _blu).  -  Gorog
 */
int GetColor(const std::string &argument)    /* get color code from command string */
{
    std::string color;
    const char *cptr = NULL;
    static const char *const color_list =
        "_bla_red_dgr_bro_dbl_pur_cya_cha_dch_ora_gre_yel_blu_pin_lbl_whi";
    static const char *const blink_list =
        "*bla*red*dgr*bro*dbl*pur*cya*cha*dch*ora*gre*yel*blu*pin*lbl*whi";

    OneArgument(argument, color);

    if(color.empty() || (color[0] != '_' && color[0] != '*'))
    {
        return 0;
    }

    if((cptr = strstr(color_list, color.c_str())))
    {
        return (cptr - color_list) / 4;
    }

    if((cptr = strstr(blink_list, color.c_str())))
        return (cptr - blink_list) / 4 + AT_BLINK;

    return 0;
}

static const long VALID_LANGUAGES = LANG_COMMON
| LANG_WOOKIEE | LANG_TWI_LEK | LANG_RODIAN
| LANG_HUTT | LANG_MON_CALAMARI | LANG_NOGHRI | LANG_GAMORREAN
| LANG_JAWA | LANG_ADARIAN | LANG_EWOK | LANG_VERPINE | LANG_DEFEL
| LANG_TRANDOSHAN | LANG_CHADRA_FAN | LANG_QUARREN | LANG_SULLUSTAN
| LANG_BARABEL | LANG_FIRRERREO | LANG_BOTHAN | LANG_TOGORIAN
| LANG_KUBAZ | LANG_YEVETHAN | LANG_GAND | LANG_DUROS | LANG_COYNITE
| LANG_GOTAL | LANG_DEVARONIAN | LANG_FALLEEN | LANG_ITHORIAN
| LANG_BINARY;

bool IsValidLanguage(int language)
{
    return VALID_LANGUAGES & language ? true : false;
}

std::string FormatDate(const time_t *date)
{
    char buffer[MAX_STRING_LENGTH];
    struct tm *t = localtime(date);
    sprintf(buffer, "%02d/%02d-%04d", t->tm_mon + 1, t->tm_mday, t->tm_year + 1900);

    return buffer;
}

