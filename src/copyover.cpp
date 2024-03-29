/****************************************************************************
 *              Star Wars: Storm of Vengeance Alpha 0.1                     *
 *==========================================================================*
 * Sw-Storm Alpha 0.1 Code Changes by Iczer/K.lopes w/ help from Maelfius   *
 * Additional Code within go to their respective owners.                    *
 *==========================================================================*
 * Star Wars Reality Code Additions and changes from the Smaug Code         *
 * copyright (c) 1997 by Sean Cooper                                        *
 *==========================================================================*
 * Starwars and Starwars Names copyright(c) Lucas Film Ltd.                 *
 *==========================================================================*
 * SMAUG 1.0 (C) 1994, 1995, 1996 by Derek Snider                           *
 * SMAUG code team: Thoric, Altrag, Blodkai, Narn, Haus,                    *
 * Scryn, Rennard, Swordbearer, Gorog, Grishnakh and Tricops                *
 *==========================================================================*
 * Merc 2.1 Diku Mud improvments copyright (C) 1992, 1993 by Michael        *
 * Chastain, Michael Quan, and Mitchell Tse.                                *
 * Original Diku Mud copyright (C) 1990, 1991 by Sebastian Hammer,          *
 * Michael Seifert, Hans Henrik St{rfeldt, Tom Madsen, and Katja Nyboe.     *
 *==========================================================================*
 *                       Warmboot/Copyover Module                           *
 ****************************************************************************/

 /* Origional Copyover Code by Erwin S. Andreasen http://www.andreasen.org/ */

#ifdef __STRICT_ANSI__
/* To include the prototype for snprintf() */
#define _DEFAULT_SOURCE
#define _BSD_SOURCE
#endif

#include <cctype>
#include <cstdio>
#include <cstring>
#include "descriptor.hpp"
#include "mud.hpp"
#include "character.hpp"
#include "pcdata.hpp"
#include "log.hpp"
#include "repos/playerrepository.hpp"
#include "systemdata.hpp"
#include "repos/descriptorrepository.hpp"
#include "repos/homerepository.hpp"
#include "act.hpp"
#include "impscript/scriptscheduler.hpp"

#define COPYOVER_FILE   DATA_DIR "copyover.dat"

/*  Warm reboot stuff, gotta make sure to thank Erwin for this :) */
extern socket_t control;                /* Controlling descriptor       */

void do_copyover(std::shared_ptr<Character> ch, std::string argument)
{
#ifdef _WIN32
    ch->Echo("Not supported on Windows.\r\n");
#else
    FILE *fp = fopen(COPYOVER_FILE, "w");

    if(!fp)
    {
        ch->Echo("Copyover file not writeable, aborted.\r\n");
        Log->Bug("Could not write to copyover file: %s", COPYOVER_FILE);
        perror("do_copyover:fopen");
        return;
    }

    AbortAllScripts();

    std::string buf = "\r\nA Blinding Flash of light starts heading towards you, before you can think it engulfs you!\r\n";

    /* For each playing descriptor, save its state */
    auto descriptors(Descriptors->Entities());

    for(auto d : descriptors)
    {
        std::shared_ptr<Character> och = d->Original ? d->Original : d->Char;

        if(!d->Char || d->ConnectionState != ConState::Playing)  /* drop those logging on */
        {
            WriteToDescriptor(d.get(), "\r\nSorry, we are rebooting."
                              " Come back in a few minutes.\r\n", 0);
            CloseDescriptor(d, false);  /* throw'em out */
        }
        else
        {
            socket_t cur_desc = d->Socket;

            fprintf(fp, "%d %d %s %s %s\n", cur_desc, 0,
                    och->Name.c_str(), d->Remote.HostIP.c_str(), d->Remote.Hostname.c_str());
            PlayerCharacters->Save(och);
            WriteToDescriptor(d.get(), buf, 0);
        }
    }

    fprintf(fp, "-1\n");
    fclose(fp);

    ImcCopyover();

    std::string buf3 = std::to_string(ImcGetSocket(this_imcmud));

    /* exec - descriptors are inherited */
    buf = std::to_string(SysData.Port);
    std::string buf2 = std::to_string(control);
    std::string filename = "./swrip";
#define _execl execl

    _execl(filename.c_str(), filename.c_str(),
           buf.c_str(), "copyover", buf2.c_str(), buf3.c_str(), nullptr);

    /* Failed - sucessful exec will not return */
    perror("do_copyover: execl");
    ch->Echo("Copyover FAILED!\r\n");
    ch->Echo("%s\r\n", strerror(errno));
#endif
}

/* Recover from a copyover - load players */
void RecoverFromCopyover()
{
    Log->Info("Copyover recovery initiated");

    FILE *fp = fopen(COPYOVER_FILE, "r");

    if(!fp)
    {
        perror("RecoverFromCopyover:fopen");
        Log->Bug("Copyover file not found. Exitting.\r\n");
        exit(1);
    }

    remove(COPYOVER_FILE);      /* In case something crashes
                                     - doesn't prevent reading */
    for(;; )
    {
        int use_mccp = 0;
        socket_t desc = 0;
        char ip[MAX_STRING_LENGTH] = { '\0' };
        char host[MAX_STRING_LENGTH] = { '\0' };
        char name[MAX_STRING_LENGTH] = { '\0' };
        fscanf(fp, "%d %d %s %s %s\n", &desc, &use_mccp, name, ip, host);

        if(desc == -1 || feof(fp))
        {
            break;
        }

        auto d = std::make_shared<Descriptor>(desc);
        d->Remote.Hostname = host;
        d->Remote.HostIP = ip;

        /* Write something, and check if it goes error-free */
        if(!WriteToDescriptor(d.get(), "\r\nThe surge of Light passes leaving you unscathed and your world reshaped anew.\r\n"))
        {
            Log->Bug("RecoverFromCopyover: couldn't write to socket %d", desc);
            FreeDescriptor(d);
            continue;
        }

        Descriptors->Add(d);
        d->ConnectionState = ConState::CopyoverRecover;

        /* Now, find the pfile */
        bool fOld = PlayerCharacters->Load(d, name, false);

        if(!fOld)               /* Player file not found?! */
        {
            WriteToDescriptor(d.get(),
                              "\r\nSomehow, your character was lost in the copyover. Sorry.\r\n",
                              0);
            CloseDescriptor(d, false);
        }
        else                      /* ok! */
        {
            WriteToDescriptor(d.get(), "\r\nCopyover recovery complete.\r\n", 0);

            /* Just In Case,  Someone said this isn't necassary, but _why_
               do we want to dump someone in limbo? */
            if(!d->Char->InRoom)
                d->Char->InRoom = GetRoom(ROOM_VNUM_SCHOOL);

            /* Insert in the char_list */
            AddCharacter(d->Char);

            auto homes = Homes->FindHomesForResident(d->Char->Name);

            for(auto home : homes)
            {
                Homes->Load(home);
            }

            CharacterToRoom(d->Char, d->Char->InRoom);
            do_look(d->Char, "auto noprog");

            Act(AT_ACTION, "$n materializes!", d->Char, nullptr, nullptr,
                ActTarget::Room);
            d->ConnectionState = ConState::Playing;

            if(++num_descriptors > SysData.MaxPlayersEver)
            {
                SysData.MaxPlayersEver = num_descriptors;
            }
        }
    }

    fclose(fp);
}
