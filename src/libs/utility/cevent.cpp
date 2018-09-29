#include "cevent.hpp"
#include "event.hpp"

struct event_t
{
  Ceris::Event<void*> WrappedEvent;
};

event_t *CreateEvent( void )
{
  return new event_t;
}

void DestroyEvent( event_t *ev )
{
  delete ev;
}

void AddEventHandler( event_t *ev, void *userdata,
                      EventHandler func )
{
  ev->WrappedEvent.Add( userdata, func );
}

void RemoveEventHandler( event_t *ev, void *userdata,
                         EventHandler func )
{
  ev->WrappedEvent.Remove( userdata, func );
}

void RaiseEvent( event_t *ev, void *EventArgs )
{
  ev->WrappedEvent( EventArgs );
}
