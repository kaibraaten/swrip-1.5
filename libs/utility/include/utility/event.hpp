/*
  Copyright (c) 2020 Kai Braaten

  Permission is hereby granted, free of charge, to any person
  obtaining a copy of this software and associated documentation
  files (the "Software"), to deal in the Software without
  restriction, including without limitation the rights to use,
  copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the
  Software is furnished to do so, subject to the following
  conditions:

  The above copyright notice and this permission notice shall be
  included in all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
  OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
  HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
  OTHER DEALINGS IN THE SOFTWARE.
*/

#ifndef _CERIS_EVENT_HPP_
#define _CERIS_EVENT_HPP_

#include <memory>
#include <functional>
#include <unordered_map>
#include <ranges>

namespace Ceris {
template<typename ...EventArgT>
class IEventDispatcher;

template<typename ...EventArgT>
class Event
{
public:
    template<typename ObserverT, typename CallableT>
    unsigned long Add(const ObserverT &observer, const CallableT &callable);

    template<typename CallableT>
    unsigned long Add(const CallableT &callable);

    void Remove(unsigned long id);
    void Raise(const EventArgT &...args);

private:
    unsigned long GetNextId();
    unsigned long AddDispatcher(const std::shared_ptr<IEventDispatcher<EventArgT...>> &dispatcher);

    std::unordered_map<unsigned long, std::shared_ptr<IEventDispatcher<EventArgT...>>> _dispatchers;
};

template<typename ...EventArgT>
class IEventDispatcher
{
public:
    virtual ~IEventDispatcher() = default;
    virtual void Call(const EventArgT &...args) = 0;
};

template<typename ObserverT, typename CallableT, typename ...EventArgT>
class ObserverDispatcher : public IEventDispatcher<EventArgT...>
{
public:
    ObserverDispatcher(const ObserverT &observer, const CallableT &callback);
    void Call(const EventArgT &...args) override;

private:
    ObserverT _observer;
    std::function<void(ObserverT, const EventArgT &...)> _callback;
};

template<typename ObserverT, typename CallableT, typename ...EventArgT>
ObserverDispatcher<ObserverT, CallableT, EventArgT...>::ObserverDispatcher(const ObserverT &observer,
                                                                           const CallableT &callback)
        : _observer(observer),
          _callback(callback)
{

}

template<typename ObserverT, typename CallableT, typename ...EventArgT>
void ObserverDispatcher<ObserverT, CallableT, EventArgT...>::Call(const EventArgT &... args)
{
    _callback(_observer, args...);
}

template<typename CallableT, typename ...EventArgT>
class FreeFunctionDispatcher : public IEventDispatcher<EventArgT...>
{
public:
    FreeFunctionDispatcher(const CallableT &callback);
    void Call(const EventArgT &... args) override;

private:
    std::function<void(const EventArgT &...)> _callback;
};

template<typename CallableT, typename ...EventArgT>
FreeFunctionDispatcher<CallableT, EventArgT...>::FreeFunctionDispatcher(const CallableT &callback)
        : _callback(callback)
{

}

template<typename CallableT, typename ...EventArgT>
void FreeFunctionDispatcher<CallableT, EventArgT...>::Call(const EventArgT &...args)
{
    _callback(args...);
}

template<typename ...EventArgT>
template<typename ObserverT, typename CallableT>
unsigned long Event<EventArgT...>::Add(const ObserverT &observer, const CallableT &callable)
{
    auto dispatcher = std::make_shared<ObserverDispatcher<ObserverT, CallableT, EventArgT...>>(observer, callable);
    return AddDispatcher(dispatcher);
}

template<typename ...EventArgT>
template<typename CallableT>
unsigned long Event<EventArgT...>::Add(const CallableT &callable)
{
    auto dispatcher = std::make_shared<FreeFunctionDispatcher<CallableT, EventArgT...>>(callable);
    return AddDispatcher(dispatcher);
}

template<typename ...EventArgT>
void Event<EventArgT...>::Remove(unsigned long id)
{
    _dispatchers.erase(id);
}

template<typename ...EventArgT>
void Event<EventArgT...>::Raise(const EventArgT &...args)
{
    auto dispatchers = _dispatchers;

    for (const auto &d : dispatchers | std::views::values)
    {
        d->Call(args...);
    }
}

template<typename ...EventArgT>
unsigned long Event<EventArgT...>::AddDispatcher(const std::shared_ptr<IEventDispatcher<EventArgT...>> &dispatcher)
{
    unsigned long id = GetNextId();
    _dispatchers.insert({id, dispatcher});
    return id;
}

template<typename ...EventArgT>
unsigned long Event<EventArgT...>::GetNextId()
{
    static unsigned long _lastId = 0;
    return ++_lastId;
}
}

#endif
