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

#ifdef __STRICT_ANSI__
 /* To include the prototype for gethostname() */
#define _DEFAULT_SOURCE
#define _BSD_SOURCE
#endif

#include <sstream>
#include <cassert>
#include <cstring>
#include <ctime>
#include <utility/algorithms.hpp>
#include <colorparser/colorparser.hpp>
#include "log.hpp"
#include "mud.hpp"
#include "character.hpp"
#include "editor.hpp"
#include "help.hpp"
#include "pcdata.hpp"
#include "room.hpp"
#include "object.hpp"
#include "protomob.hpp"
#include "protoobject.hpp"
#include "ban.hpp"
#include "descriptor.hpp"
#include "systemdata.hpp"
#include "repos/banrepository.hpp"
#include "repos/descriptorrepository.hpp"
#include "repos/playerrepository.hpp"

constexpr unsigned short DEFAULT_LISTEN_PORT = 7000;
bool bootup = false;

/*
 * Global variables.
 */
int num_descriptors = 0;
bool mud_down = false;       /* Shutdown                     */
bool wizlock = false;     /* Game is wizlocked            */
time_t boot_time = 0;
HourMinSec set_boot_time_struct;
HourMinSec *set_boot_time = nullptr;
tm *new_boot_time = nullptr;
tm new_boot_struct;
std::string str_boot_time;
time_t current_time = 0;       /* Time of this pulse           */
socket_t control = 0;            /* Controlling descriptor       */
socket_t newdesc = 0;            /* New descriptor               */
fd_set in_set;             /* Set of desc's for reading    */
fd_set out_set;            /* Set of desc's for writing    */
fd_set exc_set;            /* Set of desc's with errors    */
int maxdesc = 0;

/*
 * Other local functions (OS-independent).
 */
static void StopIdling(Character *ch);
static void GameLoop();
static void NewDescriptor(socket_t new_desc);
static void ExecuteOnExit();
static void CaughtAlarm(int dummy);
static bool CheckBadSocket(socket_t desc);
static void AcceptNewSocket(socket_t ctrl);
static std::string ActString(const std::string &format, Character *to, Character *ch,
    const void *arg1, const void *arg2);
static void HandleSocketInput();
static void HandleSocketOutput();
static void Sleep(timeval &last_time);

static void ExecuteOnExit()
{
    OsCleanup();
}

static void InitializeTime()
{
    timeval now_time;

    /*
     * Init time.
     */
    gettimeofday(&now_time, NULL);
    current_time = (time_t)now_time.tv_sec;

    boot_time = time(0);
    str_boot_time = ctime(&current_time);

    /*
     * Init boot time.
     */
    set_boot_time = &set_boot_time_struct;
    set_boot_time->Manual = 0;

    new_boot_time = UpdateTime(localtime(&current_time));

    /* Copies *new_boot_time to new_boot_struct, and then points
       new_boot_time to new_boot_struct again. -- Alty */
    new_boot_struct = *new_boot_time;
    new_boot_time = &new_boot_struct;
    new_boot_time->tm_mday += 1;
    if (new_boot_time->tm_hour > 12)
        new_boot_time->tm_mday += 1;
    new_boot_time->tm_sec = 0;
    new_boot_time->tm_min = 0;
    new_boot_time->tm_hour = 6;

    /* Update new_boot_time (due to day increment) */
    new_boot_time = UpdateTime(new_boot_time);
    new_boot_struct = *new_boot_time;
    new_boot_time = &new_boot_struct;

    /* Set reboot time string for do_time */
    GenerateRebootString();
}

int SwripMain(int argc, char *argv[])
{
    bool fCopyOver = false;
    socket_t imcsocket = INVALID_SOCKET;

    Log = NewLogger();

    SysData.NoNameResolving = true;
    SysData.NewPlayersMustWaitForAuth = true;

    OsSetup();

    atexit(ExecuteOnExit);

    InitializeTime();

    if (argc > 1)
    {
        if (!IsNumber(argv[1]))
        {
            fprintf(stderr, "Usage: %s [port #]\n", argv[0]);
            exit(1);
        }
        else if ((SysData.Port = atoi(argv[1])) <= 1024)
        {
            fprintf(stderr, "Port number must be above 1024.\n");
            exit(1);
        }

        if (argv[2] && argv[2][0])
        {
            fCopyOver = true;
            control = atoi(argv[3]);
            imcsocket = atoi(argv[4]);
        }
        else
        {
            fCopyOver = false;
        }
    }

    /*
     * Run the game.
     */
    bootup = true;

#ifndef _WIN32
    Log->Info("PID: %d", getpid());
#endif

    Log->Info("Starting IMC2");
    ImcStartup(false, imcsocket, fCopyOver);

    Log->Info("Booting Database");
    BootDatabase(fCopyOver);

    Log->Info("Initializing socket");

    if (!fCopyOver)
    {
        control = InitializeSocket(SysData.Port);
    }

    Log->Info("SWRiP 1.5 ready on port %d.", SysData.Port);
    bootup = false;
    GameLoop();
    closesocket(control);
    ImcShutdown(false);

    /*
     * That's all, folks.
     */
    Log->Info("Normal termination of game.");
    exit(0);
    return 0;
}

socket_t InitializeSocket(unsigned short port)
{
    sockaddr_in sa;
#ifdef _WIN32
    const char optval = 1;
#else
    int optval = 1;
#endif
    socklen_t optlen = sizeof(optval);
    socket_t fd = socket(PF_INET, SOCK_STREAM, IPPROTO_TCP);

    if (fd == INVALID_SOCKET)
    {
        perror("Init_socket: socket");
        exit(1);
    }

    if (setsockopt(fd, SOL_SOCKET, SO_REUSEADDR,
        &optval, optlen) == SOCKET_ERROR)
    {
        perror("Init_socket: SO_REUSEADDR");
        closesocket(fd);
        exit(1);
    }

#if defined(SO_DONTLINGER) && !defined(SYSV) && !defined(__sun__)
    linger ld;

    ld.l_onoff = 1;
    ld.l_linger = 1000;

    if (setsockopt(fd, SOL_SOCKET, SO_DONTLINGER,
        (const char*)&ld, sizeof(ld)) == SOCKET_ERROR)
    {
        perror("Init_socket: SO_DONTLINGER");
        closesocket(fd);
        exit(1);
    }
#endif

    memset(&sa, '\0', sizeof(sa));
    sa.sin_family = AF_INET; /* hp->h_addrtype; */
    sa.sin_port = htons(port);

    if (bind(fd, (struct sockaddr *) &sa, sizeof(sa)) == SOCKET_ERROR)
    {
        perror("Init_socket: bind");
        closesocket(fd);
        exit(1);
    }

    if (listen(fd, 50) == SOCKET_ERROR)
    {
        perror("Init_socket: listen");
        closesocket(fd);
        exit(1);
    }

    return fd;
}

/*
 * LAG alarm!                                                   -Thoric
 */
static void CaughtAlarm(int dummy)
{
    Log->Bug("ALARM CLOCK!");
    EchoToAll(AT_IMMORT, "Alas, the hideous mandalorian entity known only as 'Lag' rises once more!\r\n", ECHOTAR_ALL);

    if (newdesc)
    {
        FD_CLR(newdesc, &in_set);
        FD_CLR(newdesc, &out_set);
        Log->Info("clearing newdesc");
    }

    GameLoop();
    closesocket(control);

    Log->Info("Normal termination of game.");
    exit(EXIT_SUCCESS);
}

static bool CheckBadSocket(socket_t desc)
{
    if (FD_ISSET(desc, &exc_set))
    {
        FD_CLR(desc, &in_set);
        FD_CLR(desc, &out_set);
        Log->Info("Bad FD caught and disposed.");
        return true;
    }

    return false;
}

static void AcceptNewSocket(socket_t ctrl)
{
    static timeval null_time;

    /*
     * Poll all active descriptors.
     */
    FD_ZERO(&in_set);
    FD_ZERO(&out_set);
    FD_ZERO(&exc_set);
    FD_SET(ctrl, &in_set);
    maxdesc = ctrl;
    newdesc = 0;

    for (auto d : Descriptors)
    {
        maxdesc = umax(maxdesc, d->Socket);
        FD_SET(d->Socket, &in_set);
        FD_SET(d->Socket, &out_set);
        FD_SET(d->Socket, &exc_set);
    }

    int result = select(maxdesc + 1, &in_set, &out_set, &exc_set, &null_time);

    if (result == SOCKET_ERROR)
    {
        perror("AcceptNewSocket: select: poll");
        exit(EXIT_FAILURE);
    }

    if (FD_ISSET(ctrl, &exc_set))
    {
        Log->Bug("Exception raise on controlling descriptor %d", ctrl);
        FD_CLR(ctrl, &in_set);
        FD_CLR(ctrl, &out_set);
    }
    else if (FD_ISSET(ctrl, &in_set))
    {
        newdesc = ctrl;
        NewDescriptor(newdesc);
    }
}

static void GameLoop()
{
    timeval last_time;

#ifndef _WIN32
    signal(SIGPIPE, SIG_IGN);
    signal(SIGALRM, CaughtAlarm);
#endif
    gettimeofday(&last_time, nullptr);
    current_time = (time_t)last_time.tv_sec;

    /* Main loop */
    while (!mud_down)
    {
        AcceptNewSocket(control);
        HandleSocketInput();
        UpdateHandler();
        ImcLoop();
        HandleSocketOutput();
        Sleep(last_time);
    }
}

static void HandleSocketInput()
{
    /*
     * Kick out descriptors with raised exceptions
     * or have been idle, then check for input.
     */
    auto inputDescriptors(Descriptors->Entities());

    for (auto d : inputDescriptors)
    {
        d->Idle++;    /* make it so a descriptor can idle out */

        if (FD_ISSET(d->Socket, &exc_set))
        {
            FD_CLR(d->Socket, &in_set);
            FD_CLR(d->Socket, &out_set);

            if (d->Character
                && (d->ConnectionState == CON_PLAYING
                    || d->ConnectionState == CON_EDITING))
            {
                PlayerCharacters->Save(d->Character);
            }

            d->OutBuffer.str("");
            CloseDescriptor(d, true);
            continue;
        }
        else if ((d->Character ? d->Character->TopLevel <= LEVEL_IMMORTAL : false)
            && d->Idle > 7200 && !IsBitSet(d->Character->Flags, PLR_AFK)) /* 30 minutes  */
        {
            if ((d->Character && d->Character->InRoom) ? d->Character->TopLevel <= LEVEL_IMMORTAL : false)
            {
                WriteToDescriptor(d.get(),
                    "Idle 30 minutes. Activating AFK flag.\r\n", 0);
                SetBit(d->Character->Flags, PLR_AFK);
                Act(AT_GREY, "$n is now afk due to idle time.", d->Character, NULL, NULL, TO_ROOM);
                continue;
            }
        }
        else if ((d->Character ? d->Character->TopLevel <= LEVEL_IMMORTAL : true) &&
            ((!d->Character && d->Idle > 360)              /* 2 mins */
                || (d->ConnectionState != CON_PLAYING && d->Idle > 1200) /* 5 mins */
                || d->Idle > 28800))                             /* 2 hrs  */
        {
            if (d->Character ? d->Character->TopLevel <= LEVEL_IMMORTAL : true)
            {
                WriteToDescriptor(d.get(),
                    "Idle timeout... disconnecting.\r\n", 0);
                d->OutBuffer.str("");
                CloseDescriptor(d, true);
                continue;
            }
        }
        else
        {
            d->fCommand = false;

            if (FD_ISSET(d->Socket, &in_set))
            {
                d->Idle = 0;

                if (d->Character)
                {
                    d->Character->IdleTimer = 0;
                }

                if (!d->Read())
                {
                    FD_CLR(d->Socket, &out_set);

                    if (d->Character
                        && (d->ConnectionState == CON_PLAYING
                            || d->ConnectionState == CON_EDITING))
                    {
                        PlayerCharacters->Save(d->Character);
                    }

                    d->OutBuffer.str("");
                    CloseDescriptor(d, false);
                    continue;
                }
            }

            if (d->Character && d->Character->Wait > 0)
            {
                --d->Character->Wait;
                continue;
            }

            d->ReadFromBuffer();

            if (d->HasInput())
            {
                d->fCommand = true;
                StopIdling(d->Character);

                std::string cmdline = d->InComm;
                d->InComm[0] = '\0';

                if (d->Character)
                {
                    SetCurrentGlobalCharacter(d->Character);
                }

                switch (d->ConnectionState)
                {
                default:
                    Nanny(d, cmdline);
                    break;

                case CON_PLAYING:
                    d->Character->CmdRecurse = 0;
                    Interpret(d->Character, cmdline);
                    break;

                case CON_EDITING:
                    EditBuffer(d->Character, cmdline);
                    break;
                }
            }
        }
    }
}

static void HandleSocketOutput()
{
    /*
     * Output.
     */
    auto outputDescriptors(Descriptors->Entities());

    for (auto d : outputDescriptors)
    {
        if ((d->fCommand || !d->OutBuffer.str().empty())
            && FD_ISSET(d->Socket, &out_set))
        {
            if (!d->FlushBuffer(true))
            {
                if (d->Character
                    && (d->ConnectionState == CON_PLAYING
                        || d->ConnectionState == CON_EDITING))
                {
                    PlayerCharacters->Save(d->Character);
                }

                d->OutBuffer.str("");
                CloseDescriptor(d, false);
            }
        }
    }
}

/*
 * Synchronize to a clock.
 * Sleep( last_time + 1/PULSE_PER_SECOND - now ).
 * Careful here of signed versus unsigned arithmetic.
 */
static void Sleep(timeval &last_time)
{
    timeval now_time;
    gettimeofday(&now_time, NULL);
    long usecDelta = ((int)last_time.tv_usec) - ((int)now_time.tv_usec)
        + 1000000 / PULSE_PER_SECOND;
    long secDelta = ((int)last_time.tv_sec) - ((int)now_time.tv_sec);

    while (usecDelta < 0)
    {
        usecDelta += 1000000;
        secDelta -= 1;
    }

    while (usecDelta >= 1000000)
    {
        usecDelta -= 1000000;
        secDelta += 1;
    }

    if (secDelta > 0 || (secDelta == 0 && usecDelta > 0))
    {
        timeval stall_time;
        int result = 0;
#ifdef _WIN32
        fd_set dummy_set;
        FD_ZERO(&dummy_set);
        FD_SET(control, &dummy_set);
#endif
        stall_time.tv_usec = usecDelta;
        stall_time.tv_sec = secDelta;

#if defined(_WIN32)
        result = select(0, NULL, NULL, &dummy_set, &stall_time);
#else
        result = select(0, NULL, NULL, NULL, &stall_time);
#endif
        if (result == SOCKET_ERROR)
        {
            perror("game_loop: select: stall");
            exit(1);
        }
    }

    gettimeofday(&last_time, NULL);
    current_time = (time_t)last_time.tv_sec;
}

static void NewDescriptor(socket_t new_desc)
{
    hostent  *from = nullptr;
    sockaddr_in sock;
    socket_t desc = 0;
    socklen_t size = 0;

    SetAlarm(20);
    size = sizeof(sock);

    if (CheckBadSocket(new_desc))
    {
        SetAlarm(0);
        return;
    }

    SetAlarm(20);

    if ((desc = accept(new_desc, (struct sockaddr *) &sock, &size)) == INVALID_SOCKET)
    {
        perror("New_descriptor: accept");
        SetAlarm(0);
        return;
    }

    if (CheckBadSocket(new_desc))
    {
        SetAlarm(0);
        return;
    }
#if !defined(FNDELAY)
#define FNDELAY O_NDELAY
#endif

    SetAlarm(20);

    if (SetNonBlockingSocket(desc) == SOCKET_ERROR)
    {
        perror("New_descriptor: fcntl: FNDELAY");
        SetAlarm(0);
        return;
    }

    if (CheckBadSocket(new_desc))
    {
        return;
    }

    auto dnew = std::make_shared<Descriptor>(desc);
    dnew->Remote.Port = ntohs(sock.sin_port);

    std::string buf = inet_ntoa(sock.sin_addr);
    sprintf(log_buf, "Sock.sinaddr:  %s, port %hd.",
        buf.c_str(), dnew->Remote.Port);
    Log->LogStringPlus(log_buf, LOG_COMM, SysData.LevelOfLogChannel);

    dnew->Remote.HostIP = buf;

    if (!SysData.NoNameResolving)
    {
        from = gethostbyaddr((char *)&sock.sin_addr,
            sizeof(sock.sin_addr), AF_INET);
    }
    else
    {
        from = NULL;
    }

    dnew->Remote.Hostname = from ? from->h_name : buf;

    auto pban = Bans->Find([dnew](const auto &b)
    {
        return (StringPrefix(b->Site, dnew->Remote.Hostname) == 0
            || StringSuffix(b->Site, dnew->Remote.Hostname) == 0)
            && b->Level >= LEVEL_IMPLEMENTOR;
    });

    if (pban != nullptr)
    {
        WriteToDescriptor(dnew.get(), "Your site has been banned from this Mud.\r\n", 0);
        FreeDescriptor(dnew);
        SetAlarm(0);
        return;
    }

    /*
     * Init descriptor data.
     */
    Descriptors->Add(dnew);

    /*
     * Send the greeting.
     */
    if (HelpGreeting[0] == '.')
        dnew->WriteToBuffer(HelpGreeting.substr(1));
    else
        dnew->WriteToBuffer(HelpGreeting);

    if (++num_descriptors > SysData.MaxPlayersThisBoot)
    {
        SysData.MaxPlayersThisBoot = num_descriptors;
    }

    if (SysData.MaxPlayersThisBoot > SysData.MaxPlayersEver)
    {
        SysData.TimeOfMaxPlayersEver = FormatString("%24.24s", ctime(&current_time));
        SysData.MaxPlayersEver = SysData.MaxPlayersThisBoot;
        sprintf(log_buf, "Broke all-time maximum player record: %d", SysData.MaxPlayersEver);
        Log->LogStringPlus(log_buf, LOG_COMM, SysData.LevelOfLogChannel);
        ToChannel(log_buf, CHANNEL_MONITOR, "Monitor", LEVEL_IMMORTAL);
        SysData.Save();
    }

    SetAlarm(0);
}

void FreeDescriptor(std::shared_ptr<Descriptor> d)
{
    closesocket(d->Socket);
    --num_descriptors;
}

void CloseDescriptor(std::shared_ptr<Descriptor> dclose, bool force)
{
    Character *ch = nullptr;

    /* flush outbuf */
    if (!force && !dclose->OutBuffer.str().empty())
        dclose->FlushBuffer(false);

    /* say bye to whoever's snooping this descriptor */
    if (dclose->SnoopBy)
        dclose->SnoopBy->WriteToBuffer("Your victim has left the game.\r\n");

    /* stop snooping everyone else */
    for (auto d : Descriptors)
        if (d->SnoopBy == dclose)
            d->SnoopBy = NULL;

    /* Check for switched people who go link-dead. -- Altrag */
    if (dclose->Original)
    {
        if ((ch = dclose->Character) != NULL)
            do_return(ch, "");
        else
        {
            Log->Bug("Close_socket: dclose->Original without character %s",
                !dclose->Original->Name.empty() ? dclose->Original->Name.c_str() : "unknown");
            dclose->Character = dclose->Original;
            dclose->Original = NULL;
        }
    }

    ch = dclose->Character;

    if (dclose->Character)
    {
        sprintf(log_buf, "Closing link to %s.", ch->Name.c_str());
        Log->LogStringPlus(log_buf, LOG_COMM, umax(SysData.LevelOfLogChannel, ch->TopLevel));

        if (dclose->ConnectionState == CON_PLAYING
            || dclose->ConnectionState == CON_EDITING)
        {
            Act(AT_ACTION, "$n has lost $s link.", ch, NULL, NULL, TO_ROOM);
            ch->Desc = NULL;
        }
        else
        {
            /* clear descriptor pointer to get rid of bug message in log */
            dclose->Character->Desc = NULL;
            FreeCharacter(dclose->Character);
        }
    }

    Descriptors->Remove(dclose);

    if (dclose->Socket == maxdesc)
        --maxdesc;

    FreeDescriptor(dclose);
}

/*
 * Lowest level output function.
 * Write a block of text to the file descriptor.
 * If this gives errors on very long blocks (like 'ofind all'),
 *   try lowering the max block size.
 */
bool WriteToDescriptor(Descriptor *desc, const std::string &orig, int length)
{
    std::string txt = ColorParser::Smaug2Ansi(orig);
    ssize_t nWrite = 0;

    if (length <= 0)
    {
        length = txt.size();
    }

    for (int iStart = 0; iStart < length; iStart += nWrite)
    {
        int nBlock = umin(length - iStart, 4096);
        nWrite = send(desc->Socket, txt.c_str() + iStart, nBlock, 0);

        if (nWrite == SOCKET_ERROR)
        {
            Log->Bug("Write_to_descriptor: error on socket %d: %s",
                desc->Socket, strerror(GETERROR));
            perror("Write_to_descriptor");
            return false;
        }
    }

    return true;
}

static void StopIdling(Character *ch)
{
    if (!ch
        || !ch->Desc
        || ch->Desc->ConnectionState != CON_PLAYING
        || !ch->WasInRoom
        || ch->InRoom != GetRoom(ROOM_VNUM_LIMBO))
        return;

    ch->IdleTimer = 0;
    CharacterFromRoom(ch);
    CharacterToRoom(ch, ch->WasInRoom);
    ch->WasInRoom = NULL;
    Act(AT_ACTION, "$n has returned from the void.", ch, NULL, NULL, TO_ROOM);
}

void SetCharacterColor(short AType, const Character *ch)
{
    std::string buf;
    const Character *och = nullptr;

    if (!ch || !ch->Desc)
        return;

    och = (ch->Desc->Original ? ch->Desc->Original : ch);

    if (!IsNpc(och) && IsBitSet(och->Flags, PLR_ANSI))
    {
        if (AType == 7)
        {
            buf = "\033[m";
        }
        else
        {
            buf = FormatString("\033[0;%d;%s%dm", (AType & 8) == 8,
                            (AType > 15 ? "5;" : ""), (AType & 7) + 30);
        }

        ch->Desc->WriteToBuffer(buf);
    }
}

/*
 * The primary output interface for formatted output.
 */
static std::string NAME(const Character *ch)
{
    return IsNpc(ch) ? ch->ShortDescr : ch->Name;
}

static std::string ActString(const std::string &format, Character *to, Character *ch,
    const void *arg1, const void *arg2)
{
    static const char * const he_she[] = { "it",  "he",  "she" };
    static const char * const him_her[] = { "it",  "him", "her" };
    static const char * const his_her[] = { "its", "his", "her" };
    char buf[MAX_STRING_LENGTH] = { '\0' };
    std::string fname;
    char *point = buf;
    const char *str = format.c_str();
    std::string i;
    Character *vch = (Character *)arg2;
    Object *obj1 = (Object  *)arg1;
    Object *obj2 = (Object  *)arg2;

    while (!IsNullOrEmpty(str))
    {
        if (*str != '$')
        {
            *point++ = *str++;
            continue;
        }

        ++str;

        if (!arg2 && *str >= 'A' && *str <= 'Z')
        {
            Log->Bug("%s: missing arg2 for code %c:", __FUNCTION__, *str);
            Log->Bug("%s", format.c_str());
            i = " <@@@> ";
        }
        else
        {
            switch (*str)
            {
            default:
                Log->Bug("%s: bad code %c.", __FUNCTION__, *str);
                i = " <@@@> ";
                break;

            case 't':
                i = (char *)arg1;
                break;

            case 'T':
                i = (char *)arg2;
                break;

            case 'n':
                i = (to ? PERS(ch, to) : NAME(ch));
                break;

            case 'N':
                i = (to ? PERS(vch, to) : NAME(vch));
                break;

            case 'e':
                if (ch->Sex > SEX_FEMALE || ch->Sex < SEX_NEUTRAL)
                {
                    Log->Bug("%s: player %s has sex set at %d!", __FUNCTION__, ch->Name.c_str(),
                        ch->Sex);
                    i = "it";
                }
                else
                {
                    i = he_she[urange(SEX_NEUTRAL, ch->Sex, SEX_FEMALE)];
                }

                break;

            case 'E':
                if (vch->Sex > SEX_FEMALE || vch->Sex < SEX_NEUTRAL)
                {
                    Log->Bug("%s: player %s has sex set at %d!", __FUNCTION__, vch->Name.c_str(),
                        vch->Sex);
                    i = "it";
                }
                else
                {
                    i = he_she[urange(SEX_NEUTRAL, vch->Sex, SEX_FEMALE)];
                }

                break;

            case 'm':
                if (ch->Sex > SEX_FEMALE || ch->Sex < SEX_NEUTRAL)
                {
                    Log->Bug("%s: player %s has sex set at %d!", __FUNCTION__, ch->Name.c_str(),
                        ch->Sex);
                    i = "it";
                }
                else
                {
                    i = him_her[urange(SEX_NEUTRAL, ch->Sex, SEX_FEMALE)];
                }

                break;

            case 'M':
                if (vch->Sex > SEX_FEMALE || vch->Sex < SEX_NEUTRAL)
                {
                    Log->Bug("%s: player %s has sex set at %d!", __FUNCTION__, vch->Name.c_str(),
                        vch->Sex);
                    i = "it";
                }
                else
                {
                    i = him_her[urange(SEX_NEUTRAL, vch->Sex, SEX_FEMALE)];
                }

                break;

            case 's':
                if (ch->Sex > SEX_FEMALE || ch->Sex < SEX_NEUTRAL)
                {
                    Log->Bug("%s: player %s has sex set at %d!", __FUNCTION__, ch->Name.c_str(),
                        ch->Sex);
                    i = "its";
                }
                else
                {
                    i = his_her[urange(SEX_NEUTRAL, ch->Sex, SEX_FEMALE)];
                }

                break;

            case 'S':
                if (vch->Sex > SEX_FEMALE || vch->Sex < SEX_NEUTRAL)
                {
                    Log->Bug("%s: player %s has sex set at %d!", __FUNCTION__, vch->Name.c_str(),
                        vch->Sex);
                    i = "its";
                }
                else
                {
                    i = his_her[urange(SEX_NEUTRAL, vch->Sex, SEX_FEMALE)];
                }
                break;

            case 'q':
                i = (to == ch) ? "" : "s";
                break;

            case 'Q':
                i = (to == ch) ? "your" : his_her[urange(SEX_NEUTRAL, ch->Sex, SEX_FEMALE)];
                break;

            case 'p':
                i = (!to || CanSeeObject(to, obj1)
                    ? GetObjectShortDescription(obj1) : "something");
                break;

            case 'P':
                i = (!to || CanSeeObject(to, obj2)
                    ? GetObjectShortDescription(obj2) : "something");
                break;

            case 'd':
                if (IsNullOrEmpty((const char*)arg2))
                {
                    i = "door";
                }
                else
                {
                    OneArgument(std::string((char *)arg2), fname);
                    i = fname;
                }

                break;
            }
        }

        ++str;
        const char *i_ptr = i.c_str();

        while ((*point = *i_ptr) != '\0')
        {
            ++point, ++i_ptr;
        }
    }

    strcpy(point, "\r\n");
    buf[0] = CharToUppercase(buf[0]);
    return buf;
}

void Act(short AType, const std::string &format, Character *ch, const void *arg1, const void *arg2, int type)
{
    std::string txt;
    Character *to = nullptr;
    Character *vch = (Character *)arg2;

    /*
     * Discard null and zero-length messages.
     */
    if (format.empty())
        return;

    if (!ch)
    {
        Log->Bug("Act: null ch. (%s)", format.c_str());
        return;
    }

    if (!ch->InRoom)
        to = NULL;
    else if (type == TO_CHAR)
        to = ch;
    else
        to = ch->InRoom->Characters().front();

    /*
     * ACT_SECRETIVE handling
     */
    if (IsNpc(ch) && IsBitSet(ch->Flags, ACT_SECRETIVE) && type != TO_CHAR)
        return;

    if (type == TO_VICT)
    {
        if (!vch)
        {
            Log->Bug("Act: null vch with TO_VICT.");
            Log->Bug("%s (%s)", ch->Name.c_str(), format.c_str());
            return;
        }
        if (!vch->InRoom)
        {
            Log->Bug("Act: vch in NULL room!");
            Log->Bug("%s -> %s (%s)", ch->Name.c_str(), vch->Name.c_str(), format.c_str());
            return;
        }
        to = vch;
        /*        to = vch->InRoom->first_person;*/
    }

    if (MOBtrigger && type != TO_CHAR && type != TO_VICT && to)
    {
        txt = ActString(format, NULL, ch, arg1, arg2);

        if (IsBitSet(to->InRoom->mprog.progtypes, ACT_PROG))
        {
            RoomProgActTrigger(txt, to->InRoom, ch, (Object *)arg1, (void *)arg2);
        }

        std::list<Object*> objectsToTrigger = Filter(to->InRoom->Objects(),
            [](auto to_obj)
        {
            return IsBitSet(to_obj->Prototype->mprog.progtypes, ACT_PROG);
        });

        for (Object *to_obj : objectsToTrigger)
        {
            ObjProgActTrigger(txt, to_obj, ch, (Object *)arg1, (void *)arg2);
        }
    }

    /* Anyone feel like telling me the point of looping through the whole
       room when we're only sending to one char anyways..? -- Alty */
    std::list<Character*> charactersInRoom;

    if (type == TO_CHAR || type == TO_VICT)
    {
        charactersInRoom.push_back(to);
    }
    else
    {
        charactersInRoom = ch->InRoom->Characters();
    }

    for (Character *person : charactersInRoom)
    {
        to = person;

        if (((!to || !to->Desc)
            && (IsNpc(to) && !IsBitSet(to->Prototype->mprog.progtypes, ACT_PROG)))
            || !IsAwake(to))
            continue;

        if (!CanSeeCharacter(to, ch) && type != TO_VICT)
            continue;

        if (type == TO_CHAR && to != ch)
            continue;

        if (type == TO_VICT && (to != vch || to == ch))
            continue;

        if (type == TO_ROOM && to == ch)
            continue;

        if (type == TO_NOTVICT && (to == ch || to == vch))
            continue;

        if (!CanSeeCharacter(to, ch) && type != TO_VICT)
            continue;

        txt = ActString(format, to, ch, arg1, arg2);

        if (to && to->Desc)
        {
            SetCharacterColor(AType, to);
            to->Echo("%s", txt.c_str());
        }

        if (MOBtrigger)
        {
            /* Note: use original string, not string with ANSI. -- Alty */
            MobProgActTrigger(txt, to, ch, (Object *)arg1, (void *)arg2);
        }
    }

    MOBtrigger = true;
    return;
}

static std::string DefaultPrompt(const Character *ch)
{
    std::ostringstream buf;

    if (IsJedi(ch) || IsImmortal(ch))
    {
        buf << "&pForce:&P$m/&p$M  &pAlign:&P$a\r\n";
    }

    buf << "&BHealth:&C$h&B/$H  &BMovement:&C$v&B/$V";
    buf << "&C >&w";

    return buf.str();
}

void DisplayPrompt(Descriptor *d)
{
    const Character *ch = d->Character;
    const Character *och = d->Original ? d->Original : d->Character;
    const bool ansi = !IsNpc(och) && IsBitSet(och->Flags, PLR_ANSI);
    std::string promptBuffer;
    const char *prompt = nullptr;
    char buf[MAX_STRING_LENGTH] = { '\0' };
    char *pbuf = buf;
    int the_stat = 0;
    const char variableMarker = '$';

    assert(ch != nullptr);

    if (!IsNpc(ch) && ch->SubState != SUB_NONE && !ch->PCData->SubPrompt.empty())
    {
        prompt = ch->PCData->SubPrompt.c_str();
    }
    else if (IsNpc(ch) || ch->PCData->Prompt.empty())
    {
        promptBuffer = DefaultPrompt(ch);
        prompt = promptBuffer.c_str();
    }
    else
    {
        prompt = ch->PCData->Prompt.c_str();
    }

    if (ansi)
    {
        strcpy(pbuf, "\033[m");
        d->PreviousColor = 0x07;
        pbuf += 3;
    }

    for (; *prompt; prompt++)
    {
        /*
         * '&' = foreground color/intensity bit
         * '^' = background color/blink bit
         * '$' = prompt commands
         * Note: foreground changes will revert background to 0 (black)
         */
        if (*prompt != variableMarker)
        {
            *(pbuf++) = *prompt;
            continue;
        }

        ++prompt;

        if (!*prompt)
            break;

        if (*prompt == *(prompt - 1))
        {
            *(pbuf++) = *prompt;
            continue;
        }

        switch (*(prompt - 1))
        {
        default:
            Log->Bug("Display_prompt: bad command char '%c'.", *(prompt - 1));
            break;

        case variableMarker:
            *pbuf = '\0';
            the_stat = 0x80000000;

            switch (*prompt)
            {
            case variableMarker:
                *pbuf++ = variableMarker;
                *pbuf = '\0';
                break;

            case 'a':
                if (ch->TopLevel >= 10)
                    the_stat = ch->Alignment;
                else if (IsGood(ch))
                    strcpy(pbuf, "good");
                else if (IsEvil(ch))
                    strcpy(pbuf, "evil");
                else
                    strcpy(pbuf, "neutral");
                break;

            case 'h':
                the_stat = ch->HitPoints.Current;
                break;

            case 'H':
                the_stat = ch->HitPoints.Max;
                break;

            case 'm':
                if (IsImmortal(ch) || IsJedi(ch))
                    the_stat = ch->Mana.Current;
                else
                    the_stat = 0;
                break;

            case 'M':
                if (IsImmortal(ch) || IsJedi(ch))
                    the_stat = ch->Mana.Max;
                else
                    the_stat = 0;
                break;

            case 'p':
                if (ch->Position == POS_RESTING)
                    strcpy(pbuf, "resting");
                else if (ch->Position == POS_SLEEPING)
                    strcpy(pbuf, "sleeping");
                else if (ch->Position == POS_SITTING)
                    strcpy(pbuf, "sitting");
                break;

            case 'u':
                the_stat = num_descriptors;
                break;

            case 'U':
                the_stat = SysData.MaxPlayersThisBoot;
                break;

            case 'v':
                the_stat = ch->Fatigue.Current;
                break;

            case 'V':
                the_stat = ch->Fatigue.Max;
                break;

            case 'g':
                the_stat = ch->Gold;
                break;

            case 'r':
                if (IsImmortal(och))
                    the_stat = ch->InRoom->Vnum;
                break;

            case 'R':
                if (IsBitSet(och->Flags, PLR_ROOMVNUM))
                    sprintf(pbuf, "<#%ld> ", ch->InRoom->Vnum);
                break;

            case 'i':
                if ((!IsNpc(ch) && IsBitSet(ch->Flags, PLR_WIZINVIS)) ||
                    (IsNpc(ch) && IsBitSet(ch->Flags, ACT_MOBINVIS)))
                    sprintf(pbuf, "(Invis %d) ", (IsNpc(ch) ? ch->MobInvis : ch->PCData->WizInvis));
                else if (IsAffectedBy(ch, AFF_INVISIBLE))
                    sprintf(pbuf, "(Invis) ");
                break;

            case 'I':
                the_stat = (IsNpc(ch) ? (IsBitSet(ch->Flags, ACT_MOBINVIS) ? ch->MobInvis : 0)
                    : (IsBitSet(ch->Flags, PLR_WIZINVIS) ? ch->PCData->WizInvis : 0));
                break;
            }

            if ((unsigned int)the_stat != 0x80000000)
                sprintf(pbuf, "%d", the_stat);

            pbuf += strlen(pbuf);
            break;
        }
    }

    *pbuf = '\0';
    d->WriteToBuffer(buf, (pbuf - buf));
}
