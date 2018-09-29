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

#ifndef _CERIS_EVENT_HPP_
#define _CERIS_EVENT_HPP_

#include <map>

namespace Ceris {

// Forward declaration needed by Event.
template< typename EventArgsT >
class HandlerFunctionBase;

///////////////////////////////////////////////////////////////////////////////
// Event

template< typename EventArgsT >
class Event
{
public:
  Event();
  ~Event();

  // Dispatch event notification to subscribers.
  void operator()( const EventArgsT &args ) const;

  // Subscribe to the event using a member function as eventhandler.
  template< typename T >
  void Add( T *subscriber, void ( T::*memFn )( EventArgsT ) );

  // Subscribe to the event using a non-member function as eventhandler.
  void Add( void *userdata, void (*)( void*, EventArgsT ) );

  // Unsubscribe all eventhandlers for a specific subscriber. Both member
  // and non-member functions are unsubscribed.
  template< typename T >
  void Remove( T *subscriber, void ( T::*memFn )( EventArgsT ) );

  // Unsubscribe all member function eventhandlers for a subscriber.
  void Remove( void *subscriber );

  // Unsubscribe a non-member function eventhandler.
  void Remove( void *userdata, void (*)( void*, EventArgsT ) );

private:
  Event &operator=( const Event& );
  Event( const Event& );

  typedef std::multimap< void*, HandlerFunctionBase<EventArgsT>* > HandlerContainer;
  template< typename T >
  typename HandlerContainer::const_iterator Find( T *instance, void ( T::*memFn )( EventArgsT ) ) const;
  typename HandlerContainer::const_iterator Find( void *userdata, void (*)( void*, EventArgsT ) ) const;
  HandlerContainer _Handlers;
};

///////////////////////////////////////////////////////////////////////////////
// HandlerFunctionBase

template< typename EventArgsT >
class HandlerFunctionBase
{
public:
  virtual ~HandlerFunctionBase();
  void Exec( const EventArgsT &args );
  virtual bool Equals( const HandlerFunctionBase* ) const = 0;

private:
  virtual void Call( const EventArgsT &args ) = 0;
};

template< typename EventArgsT >
HandlerFunctionBase< EventArgsT >::~HandlerFunctionBase()
{

}

template< typename EventArgsT >
void HandlerFunctionBase< EventArgsT >::Exec( const EventArgsT &a )
{
  Call( a );
}

///////////////////////////////////////////////////////////////////////////////
// MemberFunctionHandler

template< typename T, typename EventArgsT >
class MemberFunctionHandler : public HandlerFunctionBase< EventArgsT >
{
public:
  typedef void ( T::*MemberFunc )( EventArgsT );
  MemberFunctionHandler( T *instance, MemberFunc memFn );
  bool Equals( const HandlerFunctionBase<EventArgsT> * ) const;

private:
  void Call( const EventArgsT &args );

  T *_Instance;
  MemberFunc _Function;
};

template< typename T, typename EventArgsT >
MemberFunctionHandler< T, EventArgsT >::MemberFunctionHandler(T *instance,
							      MemberFunc memFn)
  : _Instance( instance ),
    _Function( memFn )
{

}

template< typename T, typename EventArgsT >
void MemberFunctionHandler< T, EventArgsT >::Call( const EventArgsT &args )
{
  ( _Instance->*_Function )( args );
}

template< typename T, typename EventArgsT >
bool MemberFunctionHandler< T, EventArgsT >::Equals( const HandlerFunctionBase< EventArgsT > *rhv ) const
{
  const MemberFunctionHandler< T, EventArgsT > *h2 = dynamic_cast<const MemberFunctionHandler< T, EventArgsT >* >( rhv );

  if( !h2 )
    {
      return false;
    }

  return _Instance == h2->_Instance && _Function == h2->_Function;
}

///////////////////////////////////////////////////////////////////////////////
// GlobalFunctionHandler

template< typename EventArgsT >
class GlobalFunctionHandler : public HandlerFunctionBase< EventArgsT >
{
public:
  typedef void (*Func )( void *userdata, EventArgsT args );
  GlobalFunctionHandler( void *userdata, Func memFn );
  bool Equals( const HandlerFunctionBase< EventArgsT >* ) const;

private:
  void Call( const EventArgsT &args );

  void *_UserData;
  Func _Function;
};

template< typename EventArgsT >
GlobalFunctionHandler< EventArgsT >::GlobalFunctionHandler( void *ud,
							    Func memFn )
  : _UserData( ud ),
    _Function( memFn )
{

}

template< typename EventArgsT >
void GlobalFunctionHandler< EventArgsT >::Call( const EventArgsT &args )
{
  (*_Function)( _UserData, args );
}

template< typename EventArgsT >
bool GlobalFunctionHandler< EventArgsT >::Equals( const HandlerFunctionBase< EventArgsT > *rhv ) const
{
  const GlobalFunctionHandler< EventArgsT > *h2 = dynamic_cast<const GlobalFunctionHandler< EventArgsT >* >( rhv );

  if( !h2 )
    {
      return false;
    }

  return _UserData == h2->_UserData && _Function == h2->_Function;
}

///////////////////////////////////////////////////////////////////////////////
// Event
template< typename EventArgsT >
Event< EventArgsT >::Event()
{

}

template< typename EventArgsT >
Event< EventArgsT >::~Event()
{
  for( typename HandlerContainer::iterator i = _Handlers.begin();
       i != _Handlers.end(); ++i )
    {
      delete i->second;
    }
}

template< typename EventArgsT >
template< typename T >
typename std::multimap< void*, HandlerFunctionBase<EventArgsT>* >::const_iterator Event< EventArgsT >::Find( T *instance, void ( T::*memFn )( EventArgsT ) ) const
{
  MemberFunctionHandler< T, EventArgsT > handler( instance, memFn );

  for( typename HandlerContainer::const_iterator i = _Handlers.begin();
       i != _Handlers.end(); ++i )
    {
      if( handler.Equals( i->second ) )
	{
	  return i;
	}
    }

  return _Handlers.end();
}

template< typename EventArgsT >
typename std::multimap< void*, HandlerFunctionBase<EventArgsT>* >::const_iterator Event< EventArgsT >::Find( void *userdata, void (*fun)( void*, EventArgsT ) ) const
{
  GlobalFunctionHandler< EventArgsT > handler( userdata, fun );

  for( typename HandlerContainer::const_iterator i = _Handlers.begin();
       i != _Handlers.end(); ++i )
    {
      if( handler.Equals( i->second ) )
        {
          return i;
        }
    }

  return _Handlers.end();
}

template< typename EventArgsT >
template< typename T >
void Event< EventArgsT >::Add( T *instance,
				  void ( T::*memFn )( EventArgsT ) )
{
  if( Find( instance, memFn ) == _Handlers.end() )
    {
      _Handlers.insert( std::make_pair( instance, new MemberFunctionHandler< T, EventArgsT >( instance, memFn ) ) );
    }
}

template< typename EventArgsT >
void Event< EventArgsT >::Add( void *userdata,
				  void (*fun)( void*, EventArgsT ) )
{
  if( Find( userdata, fun ) == _Handlers.end() )
    {
      _Handlers.insert( std::make_pair( userdata, new GlobalFunctionHandler<EventArgsT>( userdata, fun ) ) );
    }
}

template< typename EventArgsT >
void Event< EventArgsT >::Remove( void *thingy )
{
  if( thingy )
    {
      _Handlers.erase( thingy );
    }
}

template< typename EventArgsT >
void Event< EventArgsT >::Remove( void *userdata,
				  void (*fun)( void*, EventArgsT ) )
{
  HandlerContainer tmp = _Handlers;
  GlobalFunctionHandler< EventArgsT > handler( userdata, fun );

  for( typename HandlerContainer::iterator i = _Handlers.begin();
       i != _Handlers.end(); ++i )
    {
      if( handler.Equals( i->second ) )
        {
	  _Handlers.erase( i );
	  break;
        }
    }
}

template< typename EventArgsT >
template< typename T >
void Event< EventArgsT >::Remove( T *instance,
				  void ( T::*memFn )( EventArgsT ) )
{
  HandlerContainer tmp = _Handlers;
  MemberFunctionHandler< T, EventArgsT > handler( instance, memFn );

  for( typename HandlerContainer::iterator i = _Handlers.begin();
       i != _Handlers.end(); ++i )
    {
      if( handler.Equals( i->second ) )
        {
          _Handlers.erase( i );
	  break;
        }
    }
}

template< typename EventArgsT >
void Event< EventArgsT >::operator()( const EventArgsT &args ) const
{
  // Use a copy so it's safe for handlers to unregister during dispatch
  HandlerContainer tmp = _Handlers;

  for(typename HandlerContainer::iterator i = tmp.begin(); i != tmp.end(); ++i)
    {
      i->second->Exec( args );
    }
}

}

#endif // include guard
