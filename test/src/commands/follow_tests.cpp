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
        Log = std::make_shared<FakeLogger>();
        _protomob = MakeMobile(1, INVALID_VNUM, "Foo");
        _follower = std::make_shared<Character>(_protomob);
        _follower->Name = "Follower";
        _leader = std::make_shared<Character>(_protomob);
        _leader->Name = "Leader";
        _fromRoom = std::make_shared<Room>(1);
        _toRoom = std::make_shared<Room>(2);
        _sourceExit = MakeExit(_fromRoom, _toRoom, DIR_NORTH);
        _destinationExit = MakeExit(_toRoom, _fromRoom, DIR_SOUTH);

        CharacterToRoom(_leader, _fromRoom);
        CharacterToRoom(_follower, _fromRoom);
    }

    void TearDown() override
    {
        _leader = nullptr;
        _follower = nullptr;
        _protomob = nullptr;
        _fromRoom = nullptr;
        _toRoom = nullptr;
        _sourceExit = nullptr;
        _destinationExit = nullptr;

        Log = nullptr;
    }

    std::shared_ptr<Character> _leader = nullptr;
    std::shared_ptr<Character> _follower = nullptr;
    std::shared_ptr<ProtoMobile> _protomob;
    std::shared_ptr<Room> _fromRoom;
    std::shared_ptr<Room> _toRoom;
    std::shared_ptr<Exit> _sourceExit;
    std::shared_ptr<Exit> _destinationExit;
};

TEST_F(FollowTests, FollowCommandMakesLeaderFollowersMaster)
{
    do_follow(_follower, "leader");

    EXPECT_EQ(_follower->Master, _leader);
}

TEST_F(FollowTests, FollowSelfMakesMasterNull)
{
    _follower->Master = _leader;

    do_follow(_follower, "self");

    EXPECT_EQ(_follower->Master, nullptr);
}

TEST_F(FollowTests, FollowNonexistantCharacterDoesNothing)
{
    do_follow(_follower, "foobarbaz");

    EXPECT_EQ(_follower->Master, nullptr);
}

TEST_F(FollowTests, MasterIsFollowedIntoNewRoom)
{
    do_follow(_follower, "leader");

    do_north(_leader, "");

    EXPECT_EQ(_follower->InRoom, _leader->InRoom);
    EXPECT_EQ(_follower->InRoom, _toRoom);
}
