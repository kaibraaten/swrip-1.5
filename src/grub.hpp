/****************************************************************************
 *                   Star Wars: Rise in Power MUD Codebase                  *
 *--------------------------------------------------------------------------*
 * SWRiP Code Additions and changes from the SWReality and Smaug Code       *
 * copyright (c) 2001 by Mark Miller (Darrik Vequir)                        *
 * -----------------------------------------------------------|   (0...0)   *
 * SMAUG 1.4 (C) 1994, 1995, 1996, 1998  by Derek Snider      |    ).:.(    *
 * -----------------------------------------------------------|    {o o}    *
 * SMAUG code team: Thoric, Altrag, Blodkai, Narn, Haus,      |   / ' ' \   *
 * Scryn, Rennard, Swordbearer, Gorog, Grishnakh, Nivek,      |~'~.VxvxV.~'~*
 * Tricops and Fireblade                                      |             *
 * ------------------------------------------------------------------------ *
 *                      Gorog's Revenge on Unruly Bastards                  *
 ****************************************************************************/

#ifndef _SWRIP_GRUB_HPP_
#define _SWRIP_GRUB_HPP_

#include <utility/utility.hpp>
#include "constants.hpp"

#define MAX_DISPLAY_LINES  14000      /* Size of Sort Array             */
#define MAX_SITE_LENGTH       16
#define MAX_FIELD_LENGTH      20
#define MAX_NUM_OPS           32
#define GR_NUM_FIELDS         12
#define GO_NUM_FIELDS         24

struct gr_struct;
struct go_struct;

using GR_STRUCT = gr_struct;
using GO_STRUCT = go_struct;

struct field_struct         /* field table - info re each field          */
{
    char nam[MAX_FIELD_LENGTH];
    bool num;             /* is field numeric or char string?          */
};

struct operand_struct        /* operand table - info about each operand   */
{
    int             field;
    int             op;
    long            nval;        /* value for numeric operands            */
    char            sval[MAX_FIELD_LENGTH];
    bool            num;          /* is field numeric or char string?      */
};

enum gr_field_type          /* enumerates the fields in the input record */
{
    name, sex, pclass, race, level, room, gold, clan, council,
    site, last, pkill
};

struct gr_struct               /* input record containing pfile info    */
{
    char name[MAX_NAME_LENGTH];
    char sex;
    char pclass;
    char race;
    char level;
    vnum_t room;
    long gold;
    char clan;
    char council;
    char site[MAX_SITE_LENGTH];
    long last;
    char pkill;
};

struct go_struct                /* input record containing object data  */
{
    short n[22];
    const char *s[2];
};

bool go_eval_str(const std::string &lval, int op, const std::string &rval);
bool go_eval_num(long lval, int op, long rval);

#endif
