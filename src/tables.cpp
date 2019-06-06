/****************************************************************************
 *                   Star Wars: Rise in Power MUD Codebase                  *
 * ------------------------------------------------------------------------ *
 * SWRiP Code Additions and changes from the SWReality and Smaug Code       *
 * copyright (c) 2001 by Mark Miller (Darrik Vequir)                        *
 * ------------------------------------------------------------------------ *
 * Star Wars Reality Code Additions and changes from the Smaug Code         *
 * copyright (c) 1997 by Sean Cooper                                        *
 * ------------------------------------------------------------------------ *
 * Starwars and Starwars Names copyright(c) Lucas Film Ltd.                 *
 * ------------------------------------------------------------------------ *
 * SMAUG 1.0 (C) 1994, 1995, 1996 by Derek Snider                           *
 * SMAUG code team: Thoric, Altrag, Blodkai, Narn, Haus,                    *
 * Scryn, Rennard, Swordbearer, Gorog, Grishnakh and Tricops                *
 * ------------------------------------------------------------------------ *
 * Merc 2.1 Diku Mud improvments copyright (C) 1992, 1993 by Michael        *
 * Chastain, Michael Quan, and Mitchell Tse.                                *
 * ------------------------------------------------------------------------ *
 * Original Diku Mud copyright (C) 1990, 1991 by Sebastian Hammer,          *
 * Michael Seifert, Hans Henrik Staerfeldt, Tom Madsen, and Katja Nyboe.    *
 ****************************************************************************/

#ifndef _WIN32
#include <strings.h>
#include <dlfcn.h>
#endif
#include "mud.hpp"
#include "skill.hpp"
#include "log.hpp"
#include "systemdata.hpp"

SpellFun *GetSpellFunction(const std::string &name)
{
    SpellFun *fun_handle = NULL;
#ifdef _WIN32
    fun_handle = (SpellFun*)GetProcAddress(SysData.DlHandle, name.c_str());

    if (!fun_handle)
    {
        Log->Bug("Could not find symbol '%s': %s", name.c_str(), GetLastError());
        return spell_notfound;
    }
#else
    fun_handle = (SpellFun*)(long)dlsym(SysData.DlHandle, name.c_str());

    if (!fun_handle)
    {
        Log->Bug("Could not find symbol '%s': %s", name.c_str(), dlerror());
        return spell_notfound;
    }
#endif

    return fun_handle;
}

CmdFun *GetSkillFunction(const std::string &name)
{
    CmdFun *fun_handle = NULL;
#ifdef _WIN32
    fun_handle = (CmdFun*)GetProcAddress(SysData.DlHandle, name.c_str());

    if (!fun_handle)
    {
        Log->Bug("Could not find symbol '%s': %s", name.c_str(), GetLastError());
        return skill_notfound;
    }
#else
    fun_handle = (CmdFun*)(long)dlsym(SysData.DlHandle, name.c_str());

    if (!fun_handle)
    {
        Log->Bug("Could not find symbol '%s': %s", name.c_str(), dlerror());
        return skill_notfound;
    }
#endif

    return fun_handle;
}

