#include <chrono>
#include <queue>
#include <utility>
#include <imp/except/impexception.hpp>
#include "scriptscheduler.hpp"
#include "scriptrunner.hpp"
#include "log.hpp"

using Entry = std::pair<std::chrono::time_point<std::chrono::system_clock>, std::shared_ptr<ScriptRunner>>;

struct EntryComparison
{
    bool operator()(const Entry& lhs, const Entry& rhs) const
    {
        return lhs.first > rhs.first;
    }
};

using Queue = std::priority_queue<Entry, std::vector<Entry>, EntryComparison>;

class ScriptScheduler
{
public:
    void Schedule(std::shared_ptr<ScriptRunner> scriptRunner);
    void Dispatch();
    void AbortAll();

private:
    Queue _pendingScripts;
};

static ScriptScheduler Scheduler;

void ScriptScheduler::Schedule(std::shared_ptr<ScriptRunner> scriptRunner)
{
    _pendingScripts.push({ std::chrono::system_clock::now(), scriptRunner });
}

void ScriptScheduler::Dispatch()
{
    while(!_pendingScripts.empty())
    {
        auto entry = _pendingScripts.top();

        if(entry.first > std::chrono::system_clock::now())
        {
            break;
        }
        else
        {
            _pendingScripts.pop();
            auto scriptRunner = entry.second;
            double waitDuration = scriptRunner->Resume();

            if(waitDuration > 0)
            {
                _pendingScripts.push({ std::chrono::system_clock::now() + std::chrono::milliseconds((int)(waitDuration * 1000)), scriptRunner });
            }
        }
    }
}

void ScriptScheduler::AbortAll()
{
    while (!_pendingScripts.empty())
    {
        auto entry = _pendingScripts.top();
        entry.second->Abort();
        _pendingScripts.pop();
    }
}

void Schedule(std::shared_ptr<ScriptRunner> scriptRunner)
{
    Scheduler.Schedule(scriptRunner);
}

void DispatchScripts()
{
    Scheduler.Dispatch();
}

void AbortAllScripts()
{
    Scheduler.AbortAll();
}
