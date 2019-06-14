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
#ifndef _WIN32
#include <strings.h>
#endif
#include <cctype>
#include <cassert>
#include "character.hpp"
#include "mud.hpp"
#include "command.hpp"
#include "social.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "log.hpp"
#include "room.hpp"
#include "descriptor.hpp"
#include "alias.hpp"
#include "exit.hpp"

 /*
  * Log-all switch.
  */
bool fLogAll = false;

static std::string ParseTarget(const Character *ch, std::string oldstring);
static std::string GetMultiCommand(Descriptor *d, std::string argument);

/*
 * Character not in position for command?
 */
bool CheckPosition(const Character *ch, PositionType position)
{
    if (ch->Position < position)
    {
        switch (ch->Position)
        {
        case POS_DEAD:
            ch->Echo("A little difficult to do when you are DEAD...\r\n");
            break;

        case POS_MORTAL:
        case POS_INCAP:
            ch->Echo("You are hurt far too bad for that.\r\n");
            break;

        case POS_STUNNED:
            ch->Echo("You are too stunned to do that.\r\n");
            break;

        case POS_SLEEPING:
            ch->Echo("In your dreams, or what?\r\n");
            break;

        case POS_RESTING:
            ch->Echo("Nah... You feel too relaxed...\r\n");
            break;

        case POS_SITTING:
            ch->Echo("You can't do that sitting down.\r\n");
            break;

        case POS_FIGHTING:
            ch->Echo("No way! You are still fighting!\r\n");
            break;

        default:
            break;
        }

        return false;
    }

    return true;
}

/*
 * The main entry point for executing commands.
 * Can be recursively called from 'at', 'order', 'force'.
 */
static std::string ParseTarget(const Character *ch, std::string oldstring)
{
    const char *str = oldstring.c_str();
    int count = 0;
    char buf[MAX_INPUT_LENGTH] = { '\0' };
    char *point = buf;

    while (!IsNullOrEmpty(str))
    {
        if (*str != '$')
        {
            count++;
            *point++ = *str++;
            continue;
        }

        ++str;

        if (*str == '$' && !ch->PCData->AliasFocus.empty())
        {
            char *i = CopyString(ch->PCData->AliasFocus);
            ++str;

            while ((*point = *i) != '\0')
            {
                ++point, ++i, ++count;

                if (count > MAX_INPUT_LENGTH)
                {
                    ch->Echo("Target substitution too long; not processed.\r\n");
                    FreeMemory(i);
                    return oldstring;
                }
            }

            FreeMemory(i);
        }
        else
        {
            *point++ = '$';
            count++;
        }
    }

    buf[count] = '\0';
    return buf;
}

static std::string GetMultiCommand(Descriptor *d, std::string argument)
{
    int counter;
    char leftover[MAX_INPUT_LENGTH] = { '\0' };
    char multicommand[MAX_INPUT_LENGTH] = { '\0' };

    for (counter = 0; argument[counter] != '\0'; counter++)
    {
        if (argument[counter] == '|' && argument[counter + 1] != '|')
        {
            int counter2;
            multicommand[counter] = '\0';
            counter++;

            for (counter2 = 0; argument[counter] != '\0'; counter2++, counter++)
            {
                leftover[counter2] = argument[counter];
            }

            leftover[counter2] = '\0';
            strcpy(d->InComm, leftover);
            return multicommand;
        }
        else if (argument[counter] == '|' && argument[counter + 1] == '|')
        {
            for (int counter2 = counter; argument[counter2] != '\0'; counter2++)
            {
                argument[counter2] = argument[counter2 + 1];
            }
        }

        multicommand[counter] = argument[counter];
    }

    d->InComm[0] = '\0';
    multicommand[counter] = '\0';

    return multicommand;
}

static bool _CommandFunctionEquals(void *cmd, const void *fun)
{
    const Command *command = static_cast<const Command*>(cmd);
    CmdFun *function = reinterpret_cast<CmdFun*>(fun);
    return command->Function == function;
}

struct CommandFindData
{
    Character *ch = nullptr;
    std::string command;
};

static bool _CheckTrustAndBestowments(void *c, const void *d)
{
    const Command *cmd = static_cast<const Command*>(c);
    const CommandFindData *data = static_cast<const CommandFindData*>(d);
    std::string command = data->command;
    const Character *ch = data->ch;
    int trust = GetTrustLevel(ch);

    if (!StringPrefix(command, cmd->Name)
        && (cmd->Level <= trust
            || (!IsNpc(ch) && !ch->PCData->Bestowments.empty()
                && IsName(cmd->Name, ch->PCData->Bestowments)
                && cmd->Level <= (trust + 5))))
    {
        return true;
    }
    else
    {
        return false;
    }
}

void Interpret(Character *ch, std::string argument)
{
    assert(ch != nullptr);

    std::string command;
    char logline[MAX_INPUT_LENGTH];
    std::shared_ptr<Timer> timer;
    Command *cmd = NULL;
    int loglvl = 0;
    bool found = false;
    struct timeval time_used;
    long tmptime = 0;

    if (ch->SubState == SUB_REPEATCMD)
    {
        CmdFun *fun = ch->LastCommand;

        assert(fun != nullptr);

        const List *commands = GetEntities(CommandRepository);
        cmd = (Command*)FindIfInList(commands, _CommandFunctionEquals, (const void*)fun);
        found = cmd != NULL;

        if (!found)
        {
            Log->Bug("Interpret: SUB_REPEATCMD: last_cmd invalid");
            return;
        }

        sprintf(logline, "(%s) %s", cmd->Name.c_str(), argument.c_str());
    }

    if (!cmd)
    {
        /* Changed the order of these ifchecks to prevent crashing. */
        if (argument.empty())
        {
            Log->Bug("Interpret: null argument!");
            return;
        }

        /*
         * Strip leading spaces.
         */
        argument = TrimStringStart(argument);

        if (argument.empty())
        {
            return;
        }

        timer = GetTimerPointer(ch, TIMER_CMD_FUN);

        /*
         * Implement freeze command.
         */
        if (!IsNpc(ch) && IsBitSet(ch->Flags, PLR_FREEZE))
        {
            ch->Echo("You're totally frozen!\r\n");
            return;
        }

        /*
         * Grab the command word.
         * Special parsing so ' can be a command,
         *   also no spaces needed after punctuation.
         */
        strcpy(logline, argument.c_str());

        if (ch->Desc && (strchr(argument.c_str(), '|') != nullptr))
        {
            argument = GetMultiCommand(ch->Desc, argument);
        }

        if (!IsNpc(ch) && ch->PCData && !ch->PCData->AliasFocus.empty())
        {
            if (strchr(argument.c_str(), '$') != nullptr)
            {
                argument = ParseTarget(ch, argument);
            }
        }

        if (!isalpha(argument[0]) && !isdigit(argument[0]))
        {
            command = argument[0];
            argument = argument.substr(1);
            argument = TrimStringStart(argument);
        }
        else
        {
            argument = OneArgument(argument, command);
        }

        /*
         * Look for command in command table.
         * Check for council powers and/or bestowments
         */
        struct CommandFindData findData;
        const List *commands = GetEntities(CommandRepository);
        findData.ch = ch;
        findData.command = command;
        cmd = (Command*)FindIfInList(commands, _CheckTrustAndBestowments, &findData);

        if (cmd != NULL)
        {
            found = true;
        }
        else
        {
            found = false;
        }

        /*
         * Turn off afk bit when any command performed.
         */
        if (IsBitSet(ch->Flags, PLR_AFK) && (StrCmp(command, "AFK")))
        {
            RemoveBit(ch->Flags, PLR_AFK);
            Act(AT_GREY, "$n is no longer afk.", ch, NULL, NULL, TO_ROOM);
        }
    }

    /*
     * Log and snoop.
     */
    if (found && cmd->Log == LOG_NEVER)
    {
        strcpy(logline, "XXXXXXXX XXXXXXXX XXXXXXXX");
    }

    loglvl = found ? cmd->Log : LOG_NORMAL;

    if ((!IsNpc(ch) && IsBitSet(ch->Flags, PLR_LOG))
        || fLogAll
        || loglvl == LOG_BUILD
        || loglvl == LOG_HIGH
        || loglvl == LOG_ALWAYS)
    {
        /* Added by Narn to show who is switched into a mob that executes
           a logged command.  Check for descriptor in case force is used. */
        if (ch->Desc && ch->Desc->Original)
        {
            sprintf(log_buf, "Log %s (%s): %s", ch->Name.c_str(),
                ch->Desc->Original->Name.c_str(), logline);
        }
        else
        {
            sprintf(log_buf, "Log %s: %s", ch->Name.c_str(), logline);
        }

        /*
         * Make it so a 'log all' will send most output to the log
         * file only, and not spam the log channel to death       -Thoric
         */
        if (fLogAll && loglvl == LOG_NORMAL
            && (IsNpc(ch) || !IsBitSet(ch->Flags, PLR_LOG)))
        {
            loglvl = LOG_ALL;
        }

        Log->LogStringPlus(log_buf, loglvl, ch->TopLevel);
    }

    if (ch->Desc && ch->Desc->SnoopBy)
    {
        ch->Desc->SnoopBy->WriteToBuffer(ch->Name, 0);
        ch->Desc->SnoopBy->WriteToBuffer("% ", 2);
        ch->Desc->SnoopBy->WriteToBuffer(logline, 0);
        ch->Desc->SnoopBy->WriteToBuffer("\r\n", 2);
    }

    if (timer)
    {
        CharacterSubState tempsub = ch->SubState;

        ch->SubState = SUB_TIMER_DO_ABORT;
        timer->DoFun(ch, "");

        if (CharacterDiedRecently(ch))
        {
            return;
        }

        if (ch->SubState != SUB_TIMER_CANT_ABORT)
        {
            ch->SubState = tempsub;
            ExtractTimer(ch, timer);
        }
        else
        {
            ch->SubState = tempsub;
            return;
        }
    }

    /*
     * Look for command in skill and socials table.
     */
    if (!found)
    {
        if (!CheckSkill(ch, command, argument)
            && !CheckAlias(ch, command, argument)
            && !CheckSocial(ch, command, argument)
            && !ImcCommandHook(ch, command, argument))
        {
            std::shared_ptr<Exit> pexit;

            /* check for an auto-matic exit command */
            if ((pexit = FindDoor(ch, command, true)) != NULL
                && pexit->Flags.test(Flag::Exit::Auto))
            {
                if (pexit->Flags.test(Flag::Exit::Closed)
                    && (!IsAffectedBy(ch, AFF_PASS_DOOR)
                        || pexit->Flags.test(Flag::Exit::NoPassdoor)))
                {
                    if (!pexit->Flags.test(Flag::Exit::Secret))
                    {
                        Act(AT_PLAIN, "The $d is closed.",
                            ch, NULL, pexit->Keyword.c_str(), TO_CHAR);
                    }
                    else
                    {
                        ch->Echo("You cannot do that here.\r\n");
                    }

                    return;
                }

                MoveCharacter(ch, pexit);
                return;
            }

            ch->Echo("Huh?\r\n");
        }

        return;
    }

    /*
     * Character not in position for command?
     */
    if (!CheckPosition(ch, cmd->Position))
    {
        return;
    }

    /* Berserk check for flee.. maybe add drunk to this?.. but too much
       hardcoding is annoying.. -- Altrag */
    if (!StrCmp(cmd->Name, "flee")
        && IsAffectedBy(ch, AFF_BERSERK))
    {
        ch->Echo("You aren't thinking very clearly...\r\n");
        return;
    }

    /*
     * Dispatch the command.
     */
    ch->PreviousCommand = ch->LastCommand;    /* haus, for automapping */
    ch->LastCommand = cmd->Function;
    StartTimer(&time_used);
    cmd->Function(ch, argument);
    StopTimer(&time_used);

    /*
     * Update the record of how many times this command has been used (haus)
     */
    UpdateNumberOfTimesUsed(&time_used, cmd->UseRec);
    tmptime = umin(time_used.tv_sec, 19) * 1000000 + time_used.tv_usec;

    /* laggy command notice: command took longer than 1.5 seconds */
    if (tmptime > 1500000)
    {
        sprintf(log_buf, "[*****] LAG: %s: %s %s (R:%ld S:%d.%06d)",
            ch->Name.c_str(),
            cmd->Name.c_str(),
            (cmd->Log == LOG_NEVER ? "XXX" : argument.c_str()),
            ch->InRoom ? ch->InRoom->Vnum : 0,
            (int)(time_used.tv_sec),
            (int)(time_used.tv_usec));
        Log->LogStringPlus(log_buf, LOG_NORMAL, GetTrustLevel(ch));
    }
}

void SendTimer(timerset *vtime, Character *ch)
{
    timeval ntime;
    int carry = 0;

    if (vtime->NumberOfTimesUsed == 0)
    {
        return;
    }

    ntime.tv_sec = vtime->TotalTime.tv_sec / vtime->NumberOfTimesUsed;
    carry = (vtime->TotalTime.tv_sec % vtime->NumberOfTimesUsed) * 1000000;
    ntime.tv_usec = (vtime->TotalTime.tv_usec + carry) / vtime->NumberOfTimesUsed;
    ch->Echo("Has been used %d times this boot.\r\n", vtime->NumberOfTimesUsed);
    ch->Echo("Time (in secs): min %ld.%06ld; avg: %ld.%06ld; max %ld.%06ld\r\n",
        vtime->MinTime.tv_sec, vtime->MinTime.tv_usec, ntime.tv_sec,
        ntime.tv_usec, vtime->MaxTime.tv_sec, vtime->MaxTime.tv_usec);
}

void UpdateNumberOfTimesUsed(timeval *time_used, timerset *userec)
{
    userec->NumberOfTimesUsed++;

    if (!timerisset(&userec->MinTime)
        || timercmp(time_used, &userec->MinTime, < ))
    {
        userec->MinTime.tv_sec = time_used->tv_sec;
        userec->MinTime.tv_usec = time_used->tv_usec;
    }

    if (!timerisset(&userec->MaxTime)
        || timercmp(time_used, &userec->MaxTime, > ))
    {
        userec->MaxTime.tv_sec = time_used->tv_sec;
        userec->MaxTime.tv_usec = time_used->tv_usec;
    }

    userec->TotalTime.tv_sec += time_used->tv_sec;
    userec->TotalTime.tv_usec += time_used->tv_usec;

    while (userec->TotalTime.tv_usec >= 1000000)
    {
        userec->TotalTime.tv_sec++;
        userec->TotalTime.tv_usec -= 1000000;
    }
}
