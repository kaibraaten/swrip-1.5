#ifndef _SWRIP_TIMER_HPP_
#define _SWRIP_TIMER_HPP_

#include <memory>
#include <functional>
#include <string>
#include "types.hpp"
#include "constants.hpp"

/* TimerType */
enum class TimerType
{
    None,
    RecentFight,
    ShoveDrag,
    Command
};

class Timer
{
public:
    std::function<void(std::shared_ptr<Character>, std::string)> Callback;
    CharacterSubState SubState = CharacterSubState::None;
    TimerType Type = TimerType::None;
    short Count = 0;
};

void DispatchExpiredCommandCallbackTimers(std::shared_ptr<Character> ch);
void AddTimer(std::shared_ptr<Character> ch, TimerType type, short count,
              std::function<void(std::shared_ptr<Character>, std::string)> callback = nullptr);
std::shared_ptr<Timer> GetTimerPointer(std::shared_ptr<Character> ch, TimerType type);
short GetTimer(std::shared_ptr<Character> ch, TimerType type);
bool HasTimer(std::shared_ptr<Character> ch, TimerType type);
void ExtractTimer(std::shared_ptr<Character> ch, std::shared_ptr<Timer> timer);
void RemoveTimer(std::shared_ptr<Character> ch, TimerType type);

#endif
