#include <cassert>
#include <utility/algorithms.hpp>
#include "timer.hpp"
#include "character.hpp"
#include "mud.hpp"

void DispatchExpiredCommandCallbackTimers(std::shared_ptr<Character> ch)
{
    auto characterTimers = ch->Timers();

    for(const auto &timer : characterTimers)
    {
        if(--timer->Count <= 0)
        {
            if(timer->Type == TimerType::Command)
            {
                CharacterSubState tempsub = ch->SubState;

                ch->SubState = timer->SubState;
                timer->Callback(ch, "");

                if(CharacterDiedRecently(ch))
                {
                    break;
                }

                ch->SubState = tempsub;
            }

            ExtractTimer(ch, timer);
        }
    }
}

void AddTimer(std::shared_ptr<Character> ch, TimerType type, short count,
              std::function<void(std::shared_ptr<Character>, std::string)> callback)
{
    auto timer = GetTimerPointer(ch, type);

    if(!timer)
    {
        timer = std::make_shared<Timer>();
        ch->Add(timer);
    }

    switch(type)
    {
    case TimerType::Command:
        timer->SubState = CharacterSubState::Pause;
        break;

    default:
        timer->SubState = CharacterSubState::None;
        break;
    };
    
    timer->Count = count;
    timer->Type = type;
    timer->Callback = callback;
}

std::shared_ptr<Timer> GetTimerPointer(std::shared_ptr<Character> ch, TimerType type)
{
    return Find(ch->Timers(),
                [type](auto timer)
                {
                    return timer->Type == type;
                });
}

short GetTimer(std::shared_ptr<Character> ch, TimerType type)
{
    std::shared_ptr<Timer> timer = GetTimerPointer(ch, type);

    return timer != nullptr ? timer->Count : 0;
}

void ExtractTimer(std::shared_ptr<Character> ch, std::shared_ptr<Timer> timer)
{
    assert(ch != nullptr);
    assert(timer != nullptr);

    ch->Remove(timer);
}

void RemoveTimer(std::shared_ptr<Character> ch, TimerType type)
{
    std::shared_ptr<Timer> timer = GetTimerPointer(ch, type);

    if(timer != nullptr)
    {
        ExtractTimer(ch, timer);
    }
}

bool HasTimer(std::shared_ptr<Character> ch, TimerType type)
{
    return GetTimer(ch, type) > 0;
}
