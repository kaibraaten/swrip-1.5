#include "mud.hpp"
#include "character.hpp"
#include "exit.hpp"
#include "room.hpp"

/*
 * Syntax mp_close_passage x y
 *
 * closes a passage in room x leading in direction y
 *
 * the exit must have EX_PASSAGE set
 */
void do_mp_close_passage(std::shared_ptr<Character> ch, std::string argument)
{
    std::string arg1;
    std::string arg2;
    std::shared_ptr<Room> fromRoom;
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

    if (arg1.empty() || arg2.empty())
    {
        ProgBug("MpClosePassage - Bad syntax", ch);
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
        ProgBug("MpClosePassage - Bad syntax", ch);
        return;
    }
    
    fromRoomVnum = ToLong(arg1);

    if ((fromRoom = GetRoom(fromRoomVnum)) == NULL)
    {
        ProgBug("MpClosePassage - Bad syntax", ch);
        return;
    }

    if (!IsNumber(arg2))
    {
        ProgBug("MpClosePassage - Bad syntax", ch);
        return;
    }

    exit_num = (DirectionType)ToLong(arg2);

    if (exit_num < DIR_NORTH || exit_num > MAX_DIR)
    {
        ProgBug("MpClosePassage - Bad syntax", ch);
        return;
    }

    if ((pexit = GetExit(fromRoom, exit_num)) == NULL)
    {
        return;    /* already closed, ignore...  so rand_progs */
        /*                            can close without spam */
    }

    if (!pexit->Flags.test(Flag::Exit::Passage))
    {
        ProgBug("MpClosePassage - Exit not a passage", ch);
        return;
    }

    ExtractExit(fromRoom, pexit);
}
