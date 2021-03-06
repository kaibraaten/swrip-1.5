#include "character.hpp"
#include "mud.hpp"
#include "exit.hpp"
#include "room.hpp"

/*
 * Syntax mp_open_passage x y z
 *
 * opens a 1-way passage from room x to room y in direction z
 *
 *  won't mess with existing exits
 */
void do_mp_open_passage(std::shared_ptr<Character> ch, std::string argument)
{
    std::string arg1;
    std::string arg2;
    std::string arg3;
    std::shared_ptr<Room> targetRoom;
    std::shared_ptr<Room> fromRoom;
    vnum_t targetRoomVnum = INVALID_VNUM;
    vnum_t fromRoomVnum = INVALID_VNUM;
    DirectionType exit_num = DIR_INVALID;
    std::shared_ptr<Exit> pexit;

    if (IsAffectedBy(ch, Flag::Affect::Charm))
        return;

    if (!IsNpc(ch) || (ch->Desc && GetTrustLevel(ch) < LEVEL_IMMORTAL))
    {
        ch->Echo("Huh?\r\n");
        return;
    }

    argument = OneArgument(argument, arg1);
    argument = OneArgument(argument, arg2);
    argument = OneArgument(argument, arg3);

    if (arg1.empty() || arg2.empty() || arg3.empty())
    {
        ProgBug("MpOpenPassage - Bad syntax", ch);
        return;
    }

    if(arg1[0] == '#')
    {
        auto sourceRoom = GetRoomFromTag(arg1.substr(1));

        if(sourceRoom != nullptr)
        {
            arg1 = std::to_string(sourceRoom->Vnum);
        }
    }
    
    if (!IsNumber(arg1))
    {
        ProgBug("MpOpenPassage - Bad syntax", ch);
        return;
    }

    fromRoomVnum = ToLong(arg1);

    if ((fromRoom = GetRoom(fromRoomVnum)) == NULL)
    {
        ProgBug("MpOpenPassage - Bad syntax", ch);
        return;
    }

    if (!IsNumber(arg2))
    {
        ProgBug("MpOpenPassage - Bad syntax", ch);
        return;
    }

    targetRoomVnum = ToLong(arg2);

    if ((targetRoom = GetRoom(targetRoomVnum)) == NULL)
    {
        ProgBug("MpOpenPassage - Bad syntax", ch);
        return;
    }

    if (!IsNumber(arg3))
    {
        ProgBug("MpOpenPassage - Bad syntax", ch);
        return;
    }

    exit_num = (DirectionType)ToLong(arg3);

    if (exit_num < DIR_NORTH || exit_num > MAX_DIR)
    {
        ProgBug("MpOpenPassage - Bad syntax", ch);
        return;
    }

    if ((pexit = GetExit(fromRoom, exit_num)) != NULL)
    {
        if (!pexit->Flags.test(Flag::Exit::Passage))
            return;

        ProgBug("MpOpenPassage - Exit exists", ch);
        return;
    }

    pexit = MakeExit(fromRoom, targetRoom, exit_num);
    pexit->Key = -1;
    pexit->Flags.set(Flag::Exit::Passage);
}
