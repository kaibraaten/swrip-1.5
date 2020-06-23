/****************************************************************************
 *                   Star Wars: Rise in Power MUD Codebase                  *
 *--------------------------------------------------------------------------*
 * SWRiP Code Additions and changes from the SWReality and Smaug Code       *
 * copyright (c) 2001 by Mark Miller (Darrik Vequir)                        *
 *--------------------------------------------------------------------------*
 * Star Wars Reality Code Additions and changes from the Smaug Code         *
 * copyright (c) 1997 by Sean Cooper                                        *
 * -------------------------------------------------------------------------*
 * Starwars and Starwars Names copyright(c) Lucas Film Ltd.                 *
 *--------------------------------------------------------------------------*
 * SMAUG 1.0 (C) 1994, 1995, 1996 by Derek Snider                           *
 * SMAUG code team: Thoric, Altrag, Blodkai, Narn, Haus,                    *
 * Scryn, Rennard, Swordbearer, Gorog, Grishnakh and Tricops                *
 * ------------------------------------------------------------------------ *
 * Merc 2.1 Diku Mud improvments copyright (C) 1992, 1993 by Michael        *
 * Chastain, Michael Quan, and Mitchell Tse.                                *
 * Original Diku Mud copyright (C) 1990, 1991 by Sebastian Hammer,          *
 * Michael Seifert, Hans Henrik Staerfeldt, Tom Madsen, and Katja Nyboe.    *
 ****************************************************************************/

#ifndef _SWRIP_CRAFT_HPP_
#define _SWRIP_CRAFT_HPP_

#include <initializer_list>
#include <bitset>
#include <cstddef>
#include <memory>
#include <utility/event.hpp>
#include "types.hpp"
#include "constants.hpp"

namespace Flag
{
    namespace Crafting
    {
        enum : size_t
        {
            Extract,
            Optional,
            NeedsWorkshop,
            NeedsRefinery
        };
    }
}

class CraftRecipe;
class CraftingMaterial;
class SetObjectStatsEventArgs;
class InterpretArgumentsEventArgs;
class MaterialFoundEventArgs;
class FinishedCraftingEventArgs;
class CheckRequirementsEventArgs;
class AbortCraftingEventArgs;

class CraftingSession
{
public:
    CraftingSession();
    ~CraftingSession();
    Ceris::Event<std::shared_ptr<InterpretArgumentsEventArgs>> OnInterpretArguments;
    Ceris::Event<std::shared_ptr<CheckRequirementsEventArgs>> OnCheckRequirements;
    Ceris::Event<std::shared_ptr<MaterialFoundEventArgs>> OnMaterialFound;
    Ceris::Event<std::shared_ptr<SetObjectStatsEventArgs>> OnSetObjectStats;
    Ceris::Event<std::shared_ptr<FinishedCraftingEventArgs>> OnFinishedCrafting;
    Ceris::Event<std::shared_ptr<AbortCraftingEventArgs>> OnAbort;

    struct Impl;
    std::unique_ptr<Impl> pImpl;
};

class InterpretArgumentsEventArgs
{
public:
    std::shared_ptr<class CraftingSession> CraftingSession;
    std::string CommandArguments;
    bool AbortSession = false;
};

class MaterialFoundEventArgs
{
public:
    std::shared_ptr<class CraftingSession> CraftingSession;
    std::shared_ptr<class Object> Object;
    bool KeepFinding = false;
};

class SetObjectStatsEventArgs
{
public:
    std::shared_ptr<class CraftingSession> CraftingSession;
    std::shared_ptr<class Object> Object;
};

class FinishedCraftingEventArgs
{
public:
    std::shared_ptr<class CraftingSession> CraftingSession;
    std::shared_ptr<class Object> Object;
};

class CheckRequirementsEventArgs
{
public:
    std::shared_ptr<class CraftingSession> CraftingSession;
    bool AbortSession = false;
};

class AbortCraftingEventArgs
{
public:
    std::shared_ptr<class CraftingSession> CraftingSession;
};

class CraftingMaterial
{
public:
    CraftingMaterial() = default;
    CraftingMaterial(ItemTypes type, std::initializer_list<size_t> flagBits);

    ItemTypes ItemType = ITEM_NONE;
    std::bitset<Flag::MAX> Flags;
};

std::shared_ptr<CraftRecipe> AllocateCraftRecipe(int sn, std::initializer_list<CraftingMaterial> materials, int duration,
                                                 std::shared_ptr<ProtoObject> protoObject, std::initializer_list<size_t> flags);
std::shared_ptr<CraftingSession> AllocateCraftingSession(std::shared_ptr<CraftRecipe> recipe,
                                                         std::shared_ptr<Character> engineer,
                                                         const std::string &commandArgument);
std::shared_ptr<Character> GetEngineer(std::shared_ptr<CraftingSession>);
void StartCrafting(std::shared_ptr<CraftingSession>);
bool IsCrafting(std::shared_ptr<Character> ch);

#endif /* include guard */
