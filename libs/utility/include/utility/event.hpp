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
#include <map>

namespace Ceris
{
    template<typename EventArgT>
    class IEventDispatcher;

    template<typename EventArgT>
    class Event
    {
    public:
        template<typename ObserverT, typename CallableT>
        unsigned long Add(const ObserverT &observer, const CallableT &callable);

        template<typename CallableT>
        unsigned long Add(const CallableT &callable);

        void Remove(unsigned long id);

        void Raise(EventArgT &args);

    private:
        //static unsigned long _lastId;
        unsigned long GetNextId();
        unsigned long AddDispatcher(std::shared_ptr<IEventDispatcher<EventArgT>> dispatcher);

        std::multimap<unsigned long, std::shared_ptr<IEventDispatcher<EventArgT>>> _dispatchers;
    };

    template<typename EventArgT>
    class IEventDispatcher
    {
    public:
        virtual ~IEventDispatcher()
        {

        }

        virtual void Call(EventArgT &args) = 0;
    };

    template<typename EventArgT, typename ObserverT, typename CallableT>
    class ObserverDispatcher : public IEventDispatcher<EventArgT>
    {
    public:
        ObserverDispatcher(const ObserverT &observer, const CallableT &callback);
        void Call(EventArgT &args) override;

    private:
        ObserverT _observer;
        std::function<void(ObserverT, EventArgT)> _callback;
    };

    template<typename EventArgT, typename ObserverT, typename CallableT>
    ObserverDispatcher<EventArgT, ObserverT, CallableT>::ObserverDispatcher(const ObserverT &observer, const CallableT &callback)
        : _observer(observer),
        _callback(callback)
    {

    }

    template<typename EventArgT, typename ObserverT, typename CallableT>
    void ObserverDispatcher<EventArgT, ObserverT, CallableT>::Call(EventArgT &args)
    {
        _callback(_observer, args);
    }

    template<typename EventArgT, typename CallableT>
    class FreeFunctionDispatcher : public IEventDispatcher<EventArgT>
    {
    public:
        FreeFunctionDispatcher(const CallableT &callback);
        void Call(EventArgT &args) override;

    private:
        std::function<void(EventArgT)> _callback;
    };

    template<typename EventArgT, typename CallableT>
    FreeFunctionDispatcher<EventArgT, CallableT>::FreeFunctionDispatcher(const CallableT &callback)
        : _callback(callback)
    {

    }

    template<typename EventArgT, typename CallableT>
    void FreeFunctionDispatcher<EventArgT, CallableT>::Call(EventArgT &args)
    {
        _callback(args);
    }

    template<typename EventArgT>
    template<typename ObserverT, typename CallableT>
    unsigned long Event<EventArgT>::Add(const ObserverT &observer, const CallableT &callable)
    {
        auto dispatcher = std::make_shared<ObserverDispatcher<EventArgT, ObserverT, CallableT>>(observer, callable);
        return AddDispatcher(dispatcher);
    }

    template<typename EventArgT>
    template<typename CallableT>
    unsigned long Event<EventArgT>::Add(const CallableT &callable)
    {
        auto dispatcher = std::make_shared<FreeFunctionDispatcher<EventArgT, CallableT>>(callable);
        return AddDispatcher(dispatcher);
    }

    template<typename EventArgT>
    void Event<EventArgT>::Remove(unsigned long id)
    {
        _dispatchers.erase(id);
    }

    template<typename EventArgT>
    void Event<EventArgT>::Raise(EventArgT &args)
    {
        auto dispatchers = _dispatchers;

        for(auto d : dispatchers)
        {
            d.second->Call(args);
        }
    }

    template<typename EventArgT>
    unsigned long Event<EventArgT>::AddDispatcher(std::shared_ptr<IEventDispatcher<EventArgT>> dispatcher)
    {
        unsigned long id = GetNextId();
        _dispatchers.insert(std::make_pair(id, dispatcher));
        return id;
    }

    template<typename EventArgT>
    unsigned long Event<EventArgT>::GetNextId()
    {
        static unsigned long _lastId = 0;
        return ++_lastId;
    }
}

#endif
