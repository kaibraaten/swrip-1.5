/***************************************************************************
 *                   Star Wars: Rise in Power MUD Codebase                  *
 *--------------------------------------------------------------------------*
 * SWRiP Code Additions and changes from the SWReality and Smaug Code       *
 * copyright (c) 2001 by Mark Miller (Darrik Vequir)                        *
 *
 * This is a new automated arena for Smaug 1.4.
 * You can do anything you want with this code, I hope it will be
 * compatible with the DOS version.
 *
 * INSTALLATION:
 * Add to mud.hpp
 * in pc_data ...
 * char *     betted_on;
 * int        bet_amt;
 * down at the bottom of mud.hpp with all the rest of this stuff ...
 * #define GET_BETTED_ON(ch)    ((ch)->betted_on)
 * #define GET_BET_AMT(ch) ((ch)->bet_amt)
 *
 * change around the Makefile to include this file,
 * You also have to set the room flags in the limbo.are for the arena.
 * The arena bit is 67108864 (It's not included in the help roomflags)
 * This snippet is based on the ROM arena snippet by Kevin Hoogheem
 * It was ported to SMAUG1.4 by LrdElder
 * If you have any cool additions or questions just e-mail me at
 * tdison@swetland.net - LrdElder 10/24/98
 * Bugs fixed made for Star Wars: Rise in Power by Ulysses and Darrik Vequir
 */

#include <sstream>
#include <cctype>
#include <cstdio>
#include <cstdlib>
#include <ctime>
#include <utility/random.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "arena.hpp"
#include "log.hpp"
#include "descriptor.hpp"
#include "repos/descriptorrepository.hpp"
#include "act.hpp"

#define ARENA_FIRST_ROOM 29
#define ARENA_LAST_ROOM  43
#define ARENA_END        41   /* vnum of last real arena room*/
#define ARENA_START GetRandomNumberFromRange(ARENA_FIRST_ROOM, ARENA_END)

static void ShowJackpot();
static void FindGameWinner();
static void DoEndGame();
static void StartGame();
static void SilentEnd();
static void FindBetWinners(std::shared_ptr<Character> winner);
static void ResetBets();

void StartArena()
{
    if(!arena.PeopleChallenged)
    {
        if(arena.TimeToStart == 0)
        {
            arena.InStartArena = 0;
            ShowJackpot();
            arena.PeopleIsInArena = 1;    /* start the blood shed */
            arena.TimeLeftInGame = arena.GameLength;
            StartGame();
        }
        else
        {
            std::ostringstream outbuf1;
            std::ostringstream outbuf2;

            if(arena.TimeToStart > 1)
            {
                outbuf1 << FormatString("&WThe Killing Fields are open to levels &R%d &Wthru &R%d\r\n",
                                        arena.MinLevel, arena.MaxLevel);
                outbuf1 << FormatString("%d &Whours to start\r\n", arena.TimeToStart);

                outbuf2 << "The killing fields are open.\r\n";
                outbuf2 << FormatString("&R%d &Whour to start\r\n", arena.TimeToStart);
            }
            else
            {
                outbuf1 << FormatString("&WThe Killing Fields are open to levels &R%d &Wthru &R%d\r\n",
                                        arena.MinLevel, arena.MaxLevel)
                    << "1 &Whour to start\r\n";

                outbuf2 << "The killing fields are open.\r\n"
                    << "&R1 &Whour to start\r\n";
            }

            outbuf1 << "Type &Rarena &Wto enter.\r\n";
            ToChannel(outbuf1.str(), CHANNEL_ARENA, "&RArena&W", arena.MinLevel);

            outbuf2 << "Place your bets!!!\r\n";
            ToChannel(outbuf2.str(), CHANNEL_ARENA, "&RArena&W", 5);
            arena.TimeToStart--;
        }
    }
    else if(!arena.PeopleIsInArena)
    {
        if(arena.TimeToStart == 0)
        {
            arena.PeopleChallenged = 0;
            ShowJackpot();
            arena.PeopleIsInArena = 1;    /* start the blood shed */
            arena.TimeLeftInGame = 5;
            StartGame();
        }
        else
        {
            std::string buf1;

            if(arena.TimeToStart > 1)
            {
                buf1 = FormatString("The duel will start in %d hours. Place your bets!",
                                    arena.TimeToStart);
            }
            else
            {
                buf1 = "The duel will start in 1 hour. Place your bets!";
            }

            ToChannel(buf1, CHANNEL_ARENA, "&RArena&W", 5);
            arena.TimeToStart--;
        }
    }
}

static void StartGame()
{
    for(auto d : Descriptors)
    {
        auto ch = d->Char;
        
        if(ch != nullptr && IsPlaying(ch))
        {
            if(IsInArena(ch))
            {
                ch->Echo("\r\nThe floor falls out from below, dropping you in the arena.\r\n");
                CharacterFromRoom(ch);
                CharacterToRoom(ch, GetRoom(ARENA_START));
                do_look(ch, "auto");
            }
        }
    }

    UpdateArena();
}

void UpdateArena()
{
    if(CharactersInArena() == 1)
    {
        arena.PeopleIsInArena = 0;
        arena.PeopleChallenged = 0;
        FindGameWinner();
    }
    else if(arena.TimeLeftInGame == 0)
    {
        DoEndGame();
    }
    else if(CharactersInArena() == 0)
    {
        arena.PeopleIsInArena = 0;
        arena.PeopleChallenged = 0;
        SilentEnd();
    }
    else if(arena.TimeLeftInGame % 5)
    {
        std::string buf = FormatString("With %d hours left in the game there are %d players left.",
                                       arena.TimeLeftInGame, CharactersInArena());
        ToChannel(buf, CHANNEL_ARENA, "&RArena&W", 5);
    }
    else if(arena.TimeLeftInGame == 1)
    {
        std::string buf = FormatString("With 1 hour left in the game there are %d players left.",
                                       CharactersInArena());
        ToChannel(buf, CHANNEL_ARENA, "&RArena&W", 5);
    }
    else if(arena.TimeLeftInGame <= 4)
    {
        std::string buf = FormatString("With %d hours left in the game there are %d players left.",
                                       arena.TimeLeftInGame, CharactersInArena());
        ToChannel(buf, CHANNEL_ARENA, "&RArena&W", 5);
    }

    arena.TimeLeftInGame--;
}

static void FindGameWinner()
{
    for(auto d : Descriptors)
    {
        auto ch = d->Original ? d->Original : d->Char;

        if(ch == NULL)
        {
            continue;
        }

        if(IsInArena(ch)
           && !IsImmortal(ch))
        {
            CharacterFromRoom(ch);
            CharacterToRoom(ch, GetRoom(ch->ReTran));
            do_look(ch, "auto");
            Act(AT_YELLOW, "$n falls from the sky.", ch, nullptr, nullptr, ActTarget::Room);
            StopFighting(ch, true);

            if(ch->HitPoints.Current > 1)
            {
                HallOfFameElement *fame_node = NULL;
                char buf[MAX_INPUT_LENGTH];

                if(arena.TimeLeftInGame == 1)
                {
                    sprintf(buf, "After 1 hour of battle %s is declared the winner", ch->Name.c_str());
                    ToChannel(buf, CHANNEL_ARENA, "&RArena&W", 5);
                }
                else
                {
                    sprintf(buf, "After %d hours of battle %s is declared the winner",
                            arena.GameLength - arena.TimeLeftInGame, ch->Name.c_str());
                    ToChannel(buf, CHANNEL_ARENA, "&RArena&W", 5);
                }

                ch->Gold += arena.ArenaPot / 2;
                ch->Echo("You have been awarded %d credits for winning the arena\r\n",
                         arena.ArenaPot / 2);

                Log->Info("%s awarded %d credits for winning arena", ch->Name.c_str(),
                          arena.ArenaPot / 2);

                fame_node = new HallOfFameElement();
                fame_node->Name = ch->Name;
                fame_node->Date = time(0);
                fame_node->Award = (arena.ArenaPot / 2);
                FameList.push_front(fame_node);

                SaveHallOfFame();
                FindBetWinners(ch);
                arena.PeopleIsInArena = 0;
                ResetBets();
                arena.PeopleChallenged = 0;
            }

            ch->HitPoints.Current = ch->HitPoints.Max;
            ch->Mana.Current = ch->Mana.Max;
            ch->Fatigue.Current = ch->Fatigue.Max;
            ch->Challenged.reset();
        }
    }
}

static void ShowJackpot()
{
    std::ostringstream buf;
    buf << "\r\nLets get ready to RUMBLE!!!!!!!!\r\n"
        << "The jack pot for this arena is " << arena.ArenaPot << " credits\r\n"
        << arena.BetPot << " credits have been bet on this arena.\r\n";
    ToChannel(buf.str(), CHANNEL_ARENA, "&RArena&W", 5);
}

static void SilentEnd()
{
    arena.PeopleIsInArena = 0;
    arena.PeopleChallenged = 0;
    arena.InStartArena = 0;
    arena.StartTime = 0;
    arena.GameLength = 0;
    arena.TimeToStart = 0;
    arena.TimeLeftInGame = 0;
    arena.ArenaPot = 0;
    arena.BetPot = 0;

    ToChannel("It looks like no one was brave enough to enter the Arena.", CHANNEL_ARENA, "&RArena&W", 5);
    ResetBets();
}

static void DoEndGame()
{
    for(auto d : Descriptors)
    {
        auto ch = d->Char;
        
        if(ch != nullptr && IsPlaying(ch))
        {
            if(IsInArena(ch))
            {
                ch->HitPoints.Current = ch->HitPoints.Max;
                ch->Mana.Current = ch->Mana.Max;
                ch->Fatigue.Current = ch->Fatigue.Max;
                ch->Challenged.reset();
                StopFighting(ch, true);
                CharacterFromRoom(ch);
                CharacterToRoom(ch, GetRoom(ch->ReTran));
                do_look(ch, "auto");
                Act(AT_TELL, "$n falls from the sky.", ch, NULL, NULL, ActTarget::Room);
            }
        }
    }

    std::string buf = FormatString("After %d hours of battle the Match is a draw", arena.GameLength);
    ToChannel(buf, CHANNEL_ARENA, "&RArena&W", 5);
    arena.TimeLeftInGame = 0;
    arena.PeopleIsInArena = 0;
    arena.PeopleChallenged = 0;
    ResetBets();
}

int CharactersInArena()
{
    int num = 0;

    for(auto d : Descriptors)
    {
        auto ch = d->Original ? d->Original : d->Char;

        if(ch == nullptr)
        {
            continue;
        }

        if(IsInArena(ch))
        {
            if(!IsImmortal(ch) && ch->HitPoints.Current > 1)
            {
                num++;
            }
        }
    }

    return num;
}

static void FindBetWinners(std::shared_ptr<Character> winner)
{
    for(auto d : Descriptors)
    {
        if(d->Char != nullptr && IsPlaying(d->Char))
        {
            auto wch = d->Original ? d->Original : d->Char;

            if(wch == nullptr)
            {
                continue;
            }

            if((!IsNpc(wch)) && (GET_BET_AMT(wch) > 0) && (GET_BETTED_ON(wch).lock() == winner))
            {
                wch->Echo("You have won %d credits on your bet.\r\n",
                          (GET_BET_AMT(wch)) * 2);
                wch->Gold += GET_BET_AMT(wch) * 2;
                GET_BETTED_ON(wch).reset();
                GET_BET_AMT(wch) = 0;
            }
        }
    }
}

/*
 * Reset bets for those that did not win.
 * Added by Ulysses, rewritten by Darrik Vequir.
 */
static void ResetBets()
{
    for(auto ch = FirstCharacter; ch; ch = ch->Next)
    {
        if(ch == nullptr)
        {
            continue;
        }

        if(!IsNpc(ch))
        {
            GET_BETTED_ON(ch).reset();
            GET_BET_AMT(ch) = 0;
        }
    }
}
