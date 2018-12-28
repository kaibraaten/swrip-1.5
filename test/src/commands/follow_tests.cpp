#include <string>
#include <gtest/gtest.h>
#include <gmock/gmock.h>
#include "mud.hpp"
#include "character.hpp"
#include "protomob.hpp"
#include "fakelogger.hpp"
#include "room.hpp"
#include "exit.hpp"
#include "log.hpp"

class FollowTests : public ::testing::Test
{
protected:
    void SetUp() override
    {
        Log = new FakeLogger();
        _protomob = MakeMobile(1, INVALID_VNUM, "Foo");
        _follower = new Character(_protomob);
        _follower->Name = "Follower";
        _leader = new Character(_protomob);
        _leader->Name = "Leader";
        _fromRoom = new Room();
        _toRoom = new Room();
        _sourceExit = MakeExit(_fromRoom, _toRoom, DIR_NORTH);
        _destinationExit = MakeExit(_toRoom, _fromRoom, DIR_SOUTH);

        CharacterToRoom(_leader, _fromRoom);
        CharacterToRoom(_follower, _fromRoom);
    }

    void TearDown() override
    {
        delete _leader;
        _leader = nullptr;

        delete _follower;
        _follower = nullptr;

        delete _protomob;
        _protomob = nullptr;

        delete _fromRoom;
        _fromRoom = nullptr;

        delete _toRoom;
        _toRoom = nullptr;

        delete _sourceExit;
        _sourceExit = nullptr;

        delete _destinationExit;
        _destinationExit = nullptr;

        delete Log;
        Log = nullptr;
    }

    Character *_leader = nullptr;
    Character *_follower = nullptr;
    ProtoMobile *_protomob = nullptr;
    Room *_fromRoom = nullptr;
    Room *_toRoom = nullptr;
    Exit *_sourceExit = nullptr;
    Exit *_destinationExit = nullptr;
};

#ifndef DEACTIVATE_FAILING_TESTS
TEST_F(FollowTests, FollowCommandMakesLeaderFollowersMaster)
{
    do_follow(_follower, "leader");

    EXPECT_EQ(_follower->Master, _leader);
}
#endif

TEST_F(FollowTests, FollowSelfMakesMasterNull)
{
    _follower->Master = _leader;

    do_follow(_follower, "self");

    EXPECT_EQ(_follower->Master, nullptr);
}

#ifndef DEACTIVATE_FAILING_TESTS
TEST_F(FollowTests, FollowNonexistantCharacterDoesNothing)
{
    do_follow(_follower, "foobarbaz");

    EXPECT_EQ(_follower->Master, nullptr);
}
#endif

#ifndef DEACTIVATE_FAILING_TESTS
TEST_F(FollowTests, MasterIsFollowedIntoNewRoom)
{
    do_follow(_follower, "leader");

    do_north(_leader, "");

    EXPECT_EQ(_follower->InRoom, _leader->InRoom);
    EXPECT_EQ(_follower->InRoom, _toRoom);
}
#endif
