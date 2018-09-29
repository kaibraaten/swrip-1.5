/*
  Copyright (c) 2012 - 2018 Kai Braaten

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

#ifndef _CERIS_CEVENT_HPP_
#define _CERIS_CEVENT_HPP_

struct event_t;
typedef void (*EventHandler)( void *userdata, void *eventargs );

/*
 * Allocate memory and initialize a new event.
 */
event_t *CreateEvent( void );

/*
 * Free all memory used by an event.
 */
void DestroyEvent( event_t *ev );

/*
 * Register a callback function with an event, and supply some userdata if
 * needed. The userdata is optional, so NULL is valid.
 */
void AddEventHandler( event_t *ev, void *userdata,
		      EventHandler func );

/*
 * Unregister a callback. Userdata must be the same as supplied to
 * RegisterEventHandler(). NULL is valid if it was used in registration.
 */
void RemoveEventHandler( event_t *ev, void *userdata,
			 EventHandler func );

/*
 * Dispatch all EventHandlerCallbacks registered with a specific event.
 * The userdata supplied to RegisterEventHandler() will be the callback's
 * first argument. The eventargs provided here will be the callback's
 * second argument.
 */
void RaiseEvent( event_t *ev, void *eventargs );

#endif /* Include guard  */
