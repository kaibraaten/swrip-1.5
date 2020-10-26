#include <chrono>
#include <queue>
#include <utility>
#include <imp/except/impexception.hpp>
#include "scriptscheduler.hpp"
#include "scriptrunner.hpp"
#include "log.hpp"

class ScriptScheduler
{
public:
    ScriptScheduler();
    ~ScriptScheduler();

    void Schedule(std::shared_ptr<ScriptRunner> scriptRunner);
    void Dispatch();

private:
    struct Impl;
    std::unique_ptr<Impl> pImpl;
};

static ScriptScheduler Scheduler;

using Entry = std::pair<std::chrono::time_point<std::chrono::system_clock>, std::shared_ptr<ScriptRunner>>;

struct EntryComparison
{
    bool operator()(const Entry &lhs, const Entry &rhs) const
    {
        return lhs.first > rhs.first;
    }
};

using Queue = std::priority_queue<Entry, std::vector<Entry>, EntryComparison>;

struct ScriptScheduler::Impl
{
    Impl()
    {

    }
    
    Queue PendingScripts;
};

ScriptScheduler::ScriptScheduler()
    : pImpl(std::make_unique<Impl>())
{

}

ScriptScheduler::~ScriptScheduler()
{

}

void ScriptScheduler::Schedule(std::shared_ptr<ScriptRunner> scriptRunner)
{
    pImpl->PendingScripts.push({ std::chrono::system_clock::now(), scriptRunner });
}

void ScriptScheduler::Dispatch()
{
    while(!pImpl->PendingScripts.empty())
    {
        auto entry = pImpl->PendingScripts.top();

        if(entry.first > std::chrono::system_clock::now())
        {
            break;
        }
        else
        {
            pImpl->PendingScripts.pop();
            auto scriptRunner = entry.second;

            try
            {
                double waitDuration = scriptRunner->Resume();

                if(waitDuration > 0)
                {
                    pImpl->PendingScripts.push({ std::chrono::system_clock::now() + std::chrono::milliseconds((int)(waitDuration * 1000)), scriptRunner });
                }
            }
            catch(const Imp::ImpException &ex)
            {
                Log->Bug("%s", ex.what());
            }
        }
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
