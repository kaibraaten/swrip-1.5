#include <string>
#include <gtest/gtest.h>
#include <gmock/gmock.h>
#include <utility/event.hpp>

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

TEST_F(EventTests, CreateEvent_ReturnsNonNull)
{
  event_t *event = nullptr;

  event = CreateEvent();
  
  EXPECT_NE(event, nullptr);
}

static void addOneToUserdata(void *userdata, void *eventargs)
{
  int *counter = static_cast<int*>(userdata);
  (*counter)++;
}

TEST_F(EventTests, AddedEventIsRaisedExactlyOnce)
{
  event_t *event = CreateEvent();
  int counter = 0;
  AddEventHandler(event, &counter, addOneToUserdata);

  RaiseEvent(event, nullptr);

  EXPECT_EQ(1, counter);
}

TEST_F(EventTests, RemovedEventIsNeverRaised)
{
  event_t *event = CreateEvent();
  int counter = 0;
  AddEventHandler(event, &counter, addOneToUserdata);
  RemoveEventHandler(event, &counter, addOneToUserdata);
  
  RaiseEvent(event, nullptr);

  EXPECT_EQ(0, counter);
}

struct EventArgs
{
  bool WasPassedAlong = false;
};

static void EventArgsArePassedAlong_eventHandler(void *userdata, void *eventargs)
{
  if(eventargs != nullptr)
    {
      EventArgs *args = static_cast<EventArgs*>(eventargs);
      args->WasPassedAlong = true;
    }
}

TEST_F(EventTests, EventArgsArePassedAlong)
{
  event_t *event = CreateEvent();
  EventArgs args;
  AddEventHandler(event, nullptr, EventArgsArePassedAlong_eventHandler);

  RaiseEvent(event, &args);

  EXPECT_TRUE(args.WasPassedAlong);
}

TEST_F(EventTests, AllHandlersWithSameUserdataAreRemovedOneAtATime)
{
  event_t *event = CreateEvent();
  int counter = 0;
  AddEventHandler(event, &counter, addOneToUserdata);
  AddEventHandler(event, &counter, addOneToUserdata);
  AddEventHandler(event, &counter, addOneToUserdata);
  RemoveEventHandler(event, &counter, addOneToUserdata);

  RaiseEvent(event, nullptr);

  EXPECT_EQ(2, counter);
}

TEST_F(EventTests, IdenticalHandlersCanBeAdded)
{
  event_t *event = CreateEvent();
  int counter = 0;
  AddEventHandler(event, &counter, addOneToUserdata);
  AddEventHandler(event, &counter, addOneToUserdata);
  AddEventHandler(event, &counter, addOneToUserdata);
  
  RaiseEvent(event, nullptr);

  EXPECT_EQ(3, counter);
}

TEST_F(EventTests, NullUserdataWorks)
{
  event_t *event = CreateEvent();
  EventArgs args;
  AddEventHandler(event, nullptr, EventArgsArePassedAlong_eventHandler);

  RaiseEvent(event, &args);

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

TEST_F(EventTests, OnOneUserDataWithMultipleHandlerFuns_AddAreDispatched)
{
  int userdata = 0;
  event_t *event = CreateEvent();
  AddEventHandler(event, &userdata, eh1);
  AddEventHandler(event, &userdata, eh2);
  AddEventHandler(event, &userdata, eh3);

  RaiseEvent(event, nullptr);

  EXPECT_EQ(3, userdata);
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

TEST_F(EventTests, OnOneUserDataWithMultipleHandlerFuns_CorrectOneIsRemoved)
{
  unsigned long bits = 0;
  event_t *event = CreateEvent();
  AddEventHandler(event, &bits, eh4);
  AddEventHandler(event, &bits, eh5);
  AddEventHandler(event, &bits, eh6);
  RemoveEventHandler(event, &bits, eh5);
  RaiseEvent(event, nullptr);

  EXPECT_TRUE(bits & EH4);
  EXPECT_FALSE(bits & EH5);
  EXPECT_TRUE(bits & EH6);
}
