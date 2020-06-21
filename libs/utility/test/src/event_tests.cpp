#include <string>
#include <memory>
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

TEST_F(EventTests, ConstructingCompiles)
{
    Ceris::Event<int> ev1;
    Ceris::Event<int *> ev2;
    Ceris::Event<bool> ev3;
    Ceris::Event<std::string> ev4;
    Ceris::Event<void *> ev5;
    Ceris::Event<char *> ev6;
}

struct MyObservable
{
    void MyCallback1(int eventArgs)
    {

    }
};

TEST_F(EventTests, AddSharedPtrHandlerWithMemberFunctionCompiles)
{
    Ceris::Event<int> ev;
    std::shared_ptr<MyObservable> myObservable = std::make_shared<MyObservable>();
    ev.Add(myObservable, &MyObservable::MyCallback1);
}

TEST_F(EventTests, AddStackObjectHandlerWithMemberFunctionCompiles)
{
    Ceris::Event<int> ev;
    MyObservable myObservable;
    ev.Add(myObservable, &MyObservable::MyCallback1);
}

TEST_F(EventTests, AddHeapObjectHandlerWithMemberFunctionCompiles)
{
    Ceris::Event<int> ev;
    MyObservable *myObservable = new MyObservable();
    ev.Add(myObservable, &MyObservable::MyCallback1);
    delete myObservable;
}

static void MyIntPtrUDHandler(int *ud, char *eventArg)
{

}

static void MyStringUDHandler(std::string ud, char *eventArg)
{

}

static void MyHandler(char *eventArg)
{

}

TEST_F(EventTests, AddHandlerWithFreeFunctionWithUserDataCompiles)
{
    Ceris::Event<char *> ev;
    int *userData;
    ev.Add(userData, MyIntPtrUDHandler);
    std::string userData2;
    ev.Add(userData2, MyStringUDHandler);
}

TEST_F(EventTests, AddHandlerWithFreeFunctionWithoutUserDataCompiles)
{
    Ceris::Event<char *> ev;
    ev.Add(MyHandler);
}

TEST_F(EventTests, AddLambdaHandlerCompiles)
{
    Ceris::Event<int> ev1;
    ev1.Add([](auto args)
            {

            });

    Ceris::Event<int *> ev2;
    ev2.Add([](auto args)
            {

            });

    Ceris::Event<bool> ev3;
    ev3.Add([](auto args)
            {

            });

    Ceris::Event<std::string> ev4;
    ev4.Add([](auto args)
            {

            });

    Ceris::Event<void *> ev5;
    ev5.Add([](auto args)
            {

            });

    Ceris::Event<char *> ev6;
    ev6.Add([](auto args)
            {

            });
}

template<typename EventArgT>
struct MyFunctor
{
    void operator()(EventArgT args)
    {

    }
};

TEST_F(EventTests, AddFunctorHandlerCompiles)
{
    Ceris::Event<int> ev1;
    ev1.Add(MyFunctor<int>());

    Ceris::Event<int *> ev2;
    ev2.Add(MyFunctor<int *>());

    Ceris::Event<bool> ev3;
    ev3.Add(MyFunctor<bool>());

    Ceris::Event<std::string> ev4;
    ev4.Add(MyFunctor<std::string>());

    Ceris::Event<void *> ev5;
    ev5.Add(MyFunctor<void *>());

    Ceris::Event<char *> ev6;
    ev6.Add(MyFunctor<char *>());

    //Ceris::Event<long> ev7;
    //auto handler7 = std::make_shared<MyFunctor<long>>();
    //ev7.Add(handler7);
}

TEST_F(EventTests, RaisingEventCompiles)
{
    Ceris::Event<int> ev1;
    int args1;
    ev1.Raise(args1);

    Ceris::Event<int *> ev2;
    int *args2;
    ev2.Raise(args2);

    Ceris::Event<bool> ev3;
    bool args3;
    ev3.Raise(args3);

    Ceris::Event<std::string> ev4;
    std::string args4;
    ev4.Raise(args4);

    Ceris::Event<void *> ev5;
    void *args5;
    ev5.Raise(args5);

    Ceris::Event<char *> ev6;
    char *args6;
    ev6.Raise(args6);
}

struct MyCountingObservable
{
    void Tick(int arg)
    {
        ++NumTicks;
    }

    int NumTicks;
};

TEST_F(EventTests, RaisingEventWithSharedPtrHandlerWithMemberFunctionDispatchesOnce)
{
    // Arrange
    Ceris::Event<int> ev;
    std::shared_ptr<MyCountingObservable> myObservable = std::make_shared<MyCountingObservable>();
    ev.Add(myObservable, &MyCountingObservable::Tick);

    // Act
    int arg = 0;
    ev.Raise(arg);

    // Assert
    EXPECT_EQ(1, myObservable->NumTicks);
}

struct MyCountingObservableWithRef
{
    MyCountingObservableWithRef(int &numTicks)
        : NumTicks(numTicks)
    {

    }

    void Tick(int arg)
    {
        ++NumTicks;
    }

    int &NumTicks;
};

TEST_F(EventTests, RaisingEventWithStackObjectHandlerWithMemberFunctionDispatchesOnce)
{
    // Arrange
    Ceris::Event<int> ev;
    int ticks = 0;
    MyCountingObservableWithRef myObservable(ticks);
    ev.Add(myObservable, &MyCountingObservableWithRef::Tick);

    // Act
    int arg = 0;
    ev.Raise(arg);

    // Assert
    EXPECT_EQ(1, ticks);
}


TEST_F(EventTests, RaisingEventWithHeapObjectHandlerWithMemberFunctionDispatchesOnce)
{
    // Arrange
    Ceris::Event<int> ev;
    MyCountingObservable *myObservable = new MyCountingObservable();
    ev.Add(myObservable, &MyCountingObservable::Tick);

    // Act
    int arg = 0;
    ev.Raise(arg);

    // Assert
    EXPECT_EQ(1, myObservable->NumTicks);

    delete myObservable;
}

static void MyCountingFunction(int *userData, char *eventArgs)
{
    ++(*userData);
}

TEST_F(EventTests, RaisingEventWithFreeFunctionWithUserDataDispatchesOnce)
{
    Ceris::Event<char *> ev;
    int userData = 0;
    ev.Add(&userData, MyCountingFunction);

    char *foo;
    ev.Raise(foo);

    EXPECT_EQ(1, userData);
}

static int data = 0;

static void MyOtherCountingFunction(char *eventArgs)
{
    ++data;
}

TEST_F(EventTests, RaisingEventWithFreeFunctionWithoutUserDataDispatchesOnce)
{
    Ceris::Event<char *> ev;
    data = 0;
    ev.Add(MyOtherCountingFunction);

    char *foo;
    ev.Raise(foo);

    EXPECT_EQ(1, data);
}

TEST_F(EventTests, RaisingEventWithLambdaHandlerDispatchesOnce)
{
    int counter = 0;
    Ceris::Event<std::string> ev;
    ev.Add([&counter](auto args)
           {
               ++counter;
           });

    std::string foo;
    ev.Raise(foo);

    EXPECT_EQ(1, counter);
}

struct MyCountingFunctor
{
    MyCountingFunctor(int &buffer)
        : Counter(buffer)
    {

    }

    void operator()(int args)
    {
        ++Counter;
    }

    int &Counter;
};

TEST_F(EventTests, RaisingEventWithFunctorHandlerDispatchesOnce)
{
    Ceris::Event<int> ev1;
    int buffer = 0;
    MyCountingFunctor func(buffer);
    ev1.Add(func);

    int foo;
    ev1.Raise(foo);

    EXPECT_EQ(1, buffer);
}

TEST_F(EventTests, RemovedEventIsNeverRaised)
{
    // Arrange
    Ceris::Event<int> ev;
    std::shared_ptr<MyCountingObservable> myObservable = std::make_shared<MyCountingObservable>();
    unsigned long id = ev.Add(myObservable, &MyCountingObservable::Tick);
    ev.Remove(id);

    // Act
    int arg = 0;
    ev.Raise(arg);

    // Assert
    EXPECT_EQ(0, myObservable->NumTicks);
}

struct EventArgs
{
    bool WasPassedAlong = false;
};

static void EventArgsArePassedAlong_eventHandler(EventArgs *args)
{
    args->WasPassedAlong = true;
}

TEST_F(EventTests, EventArgsArePassedAlong)
{
    Ceris::Event<EventArgs*> event;
    EventArgs *args = new EventArgs();
    event.Add(EventArgsArePassedAlong_eventHandler);

    event.Raise(args);

    EXPECT_TRUE(args->WasPassedAlong);

    delete args;
}

static void eh1(int *ud, int args)
{
    int *counter = static_cast<int *>(ud);
    (*counter)++;
}

static void eh2(int *ud, int args)
{
    int *counter = static_cast<int *>(ud);
    (*counter)++;
}

static void eh3(int *ud, int args)
{
    int *counter = static_cast<int *>(ud);
    (*counter)++;
}

TEST_F(EventTests, Glb_OnOneUserDataWithMultipleHandlerFuns_AllAreDispatched)
{
    int userdata = 0;
    Ceris::Event<int> event;
    event.Add(&userdata, eh1);
    event.Add(&userdata, eh2);
    event.Add(&userdata, eh3);

    int foo;
    event.Raise(foo);

    EXPECT_EQ(3, userdata);
}
