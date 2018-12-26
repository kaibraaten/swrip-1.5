#include <string>
#include <gtest/gtest.h>
#include <gmock/gmock.h>
#include <utility/event.hpp>

using ::testing::_;

class EventTests : public ::testing::Test
{
protected:
  void SetUp() override
  {

  }

  void TearDown() override
  {

  }
};

static void addOneToUserdata(void *userdata, void *eventargs)
{
  int *counter = static_cast<int*>(userdata);
  (*counter)++;
}

TEST_F(EventTests, Glb_AddedEventIsRaisedExactlyOnce)
{
  Ceris::Event<void*> event;
  int counter = 0;
  event.Add( &counter, addOneToUserdata);

  event( nullptr );

  EXPECT_EQ(1, counter);
}

template<typename EventArgs>
struct Observer
{
  virtual ~Observer() = default;  
  virtual void EventHandler1( EventArgs args ) {}
  virtual void EventHandler2( EventArgs args ) {}
  virtual void EventHandler3( EventArgs args ) {}
};

struct MockObserver : public Observer<void*>
{
  MOCK_METHOD1(EventHandler1, void(void*));
  MOCK_METHOD1(EventHandler2, void(void*));
  MOCK_METHOD1(EventHandler3, void(void*));
};

TEST_F(EventTests, Mbr_AddedEventIsRaisedExactlyOnce)
{
  Ceris::Event<void*> event;
  MockObserver observer;
  EXPECT_CALL(observer, EventHandler1(_)).Times(1);
  event.Add( &observer, &MockObserver::EventHandler1 );

  event( nullptr );
}

TEST_F(EventTests, Glb_RemovedEventIsNeverRaised)
{
  Ceris::Event<void*> event;
  int counter = 0;
  event.Add( &counter, addOneToUserdata);
  event.Remove( &counter, addOneToUserdata);
  
  event( nullptr );

  EXPECT_EQ(0, counter);
}

TEST_F(EventTests, Mbr_RemovedEventIsNeverRaised)
{
  Ceris::Event<void*> event;
  MockObserver observer;
  EXPECT_CALL(observer, EventHandler1(_)).Times(0);
  event.Add( &observer, &MockObserver::EventHandler1 );
  event.Remove( &observer, &MockObserver::EventHandler1 );

  event( nullptr );
}

struct EventArgs
{
  bool WasPassedAlong = false;
};

static void EventArgsArePassedAlong_eventHandler(void *userdata, EventArgs *args)
{
  if(args != nullptr)
    {
      args->WasPassedAlong = true;
    }
}

TEST_F(EventTests, Glb_EventArgsArePassedAlong)
{
  Ceris::Event<EventArgs*> event;
  EventArgs args;
  event.Add( EventArgsArePassedAlong_eventHandler);

  event( &args );

  EXPECT_TRUE(args.WasPassedAlong);
}

TEST_F(EventTests, Glb_AllHandlersWithSameUserdataAreRemovedTogether)
{
  Ceris::Event<void*> event;
  int counter = 0;
  event.Add( &counter, addOneToUserdata);
  event.Add( &counter, addOneToUserdata);
  event.Add( &counter, addOneToUserdata);
  event.Remove( &counter, addOneToUserdata);

  event( nullptr );

  EXPECT_EQ(0, counter);
}

TEST_F(EventTests, Glb_IdenticalHandlersCannotBeAdded)
{
  Ceris::Event<void*> event;
  int counter = 0;
  event.Add( &counter, addOneToUserdata);
  event.Add( &counter, addOneToUserdata);
  event.Add( &counter, addOneToUserdata);
  
  event( nullptr );

  EXPECT_EQ(1, counter);
}

TEST_F(EventTests, Mbr_IdenticalHandlersCannotBeAdded)
{
  Ceris::Event<void*> event;
  MockObserver observer;
  EXPECT_CALL( observer, EventHandler1(_) ).Times(1);
  event.Add( &observer, &MockObserver::EventHandler1 );
  event.Add( &observer, &MockObserver::EventHandler1 );
  event.Add( &observer, &MockObserver::EventHandler1 );
  
  event( nullptr );
}

TEST_F(EventTests, Glb_NullUserdataWorks)
{
  Ceris::Event<EventArgs*> event;
  EventArgs args;
  event.Add( EventArgsArePassedAlong_eventHandler);

  event( &args );

  EXPECT_TRUE(args.WasPassedAlong);
}

static void eh1(void *ud, void *args)
{
  int *counter = static_cast<int*>(ud);
  (*counter)++;
}

static void eh2(void *ud, void *args)
{
  int *counter = static_cast<int*>(ud);
  (*counter)++;
}

static void eh3(void *ud, void *args)
{
  int *counter = static_cast<int*>(ud);
  (*counter)++;
}

TEST_F(EventTests, Glb_OnOneUserDataWithMultipleHandlerFuns_AllAreDispatched)
{
  int userdata = 0;
  Ceris::Event<void*> event;
  event.Add( &userdata, eh1 );
  event.Add( &userdata, eh2 );
  event.Add( &userdata, eh3 );

  event( nullptr );

  EXPECT_EQ(3, userdata);
}

TEST_F(EventTests, Mbr_OnOneObserverWithMultipleHandlerFuns_AllAreDispatched)
{
  Ceris::Event<void*> event;
  MockObserver observer;
  EXPECT_CALL( observer, EventHandler1(_) ).Times(1);
  EXPECT_CALL( observer, EventHandler2(_) ).Times(1);
  EXPECT_CALL( observer, EventHandler3(_) ).Times(1);

  event.Add( &observer, &MockObserver::EventHandler1 );
  event.Add( &observer, &MockObserver::EventHandler2 );
  event.Add( &observer, &MockObserver::EventHandler3 );
  
  event( nullptr );
}

const unsigned long EH4 = 1 << 4;
const unsigned long EH5 = 1 << 5;
const unsigned long EH6 = 1 << 6;

static void eh4(void *ud, void *args)
{
  unsigned long *mask = static_cast<unsigned long*>(ud);
  (*mask) |= EH4;
}

static void eh5(void *ud, void *args)
{
  unsigned long *mask = static_cast<unsigned long*>(ud);
  (*mask) |= EH5;
}

static void eh6(void *ud, void *args)
{
  unsigned long *mask = static_cast<unsigned long*>(ud);
  (*mask) |= EH6;
}

TEST_F(EventTests, Glb_OnOneUserDataWithMultipleHandlerFuns_CorrectOneIsRemoved)
{
  unsigned long bits = 0;
  Ceris::Event<void*> event;
  event.Add( &bits, eh4 );
  event.Add( &bits, eh5 );
  event.Add( &bits, eh6 );
  event.Remove( &bits, eh5 );
  event( nullptr );

  EXPECT_TRUE( bits & EH4 );
  EXPECT_FALSE( bits & EH5 );
  EXPECT_TRUE( bits & EH6 );
}

TEST_F(EventTests, Gbl_LambdaWorks)
{
  int counter = 0;
  Ceris::Event<void*> event;
  event.Add( [&counter](void*, void*)
             {
               ++counter;
             });

  event( nullptr );

  EXPECT_EQ( counter, 1 );
}

class MyFunctor
{
public:
  MyFunctor( int &c ) : _counter( c ) { }
  void operator()( void*, void* ) { ++_counter; }
  
private:
  int &_counter;
};

TEST_F(EventTests, Gbl_FunctorWorks)
{
  int counter = 0;
  Ceris::Event<void*> event;
  event.Add( MyFunctor( counter ) );

  event( nullptr );

  EXPECT_EQ( counter, 1 );
}
