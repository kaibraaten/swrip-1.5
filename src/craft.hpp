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

class InterpretArgumentsEventArgs
{
public:
    class CraftingSession *CraftingSession = nullptr;
    std::string CommandArguments;
    bool AbortSession = false;
};

class MaterialFoundEventArgs
{
public:
    class CraftingSession *CraftingSession = nullptr;
    std::shared_ptr<class Object> Object;
    bool KeepFinding = false;
};

class SetObjectStatsEventArgs
{
public:
    class CraftingSession *CraftingSession = nullptr;
    std::shared_ptr<class Object> Object;
};

class FinishedCraftingEventArgs
{
public:
    class CraftingSession *CraftingSession = nullptr;
    std::shared_ptr<class Object> Object;
};

class CheckRequirementsEventArgs
{
public:
    class CraftingSession *CraftingSession = nullptr;
    bool AbortSession = false;
};

class AbortCraftingEventArgs
{
public:
    class CraftingSession *CraftingSession = nullptr;
};

class CraftingMaterial
{
public:
    CraftingMaterial() = default;
    CraftingMaterial(ItemTypes type, std::initializer_list<size_t> flagBits);

    ItemTypes ItemType = ITEM_NONE;
    std::bitset<Flag::MAX> Flags;
};

CraftRecipe *AllocateCraftRecipe(int sn, const CraftingMaterial *, int duration,
                                 std::shared_ptr<ProtoObject> protoObject, std::initializer_list<size_t> flags);
void FreeCraftRecipe(CraftRecipe *);
CraftingSession *AllocateCraftingSession(CraftRecipe *, Character *engineer,
                                         const std::string &commandArgument);
void FreeCraftingSession(CraftingSession *);
Character *GetEngineer(const CraftingSession *);
void AddInterpretArgumentsCraftingHandler(CraftingSession *session, void *userData,
                                          void(*handler)(void *, InterpretArgumentsEventArgs *));
void AddCheckRequirementsCraftingHandler(CraftingSession *session, void *userData,
                                         void(*handler)(void *, CheckRequirementsEventArgs *));
void AddMaterialFoundCraftingHandler(CraftingSession *session, void *userData,
                                     void(*handler)(void *, MaterialFoundEventArgs *));
void AddSetObjectStatsCraftingHandler(CraftingSession *session, void *userData,
                                      void(*handler)(void *, SetObjectStatsEventArgs *));
void AddFinishedCraftingHandler(CraftingSession *session, void *userData,
                                void(*handler)(void *, FinishedCraftingEventArgs *));
void AddAbortCraftingHandler(CraftingSession *session, void *userData,
                             void(*handler)(void *, AbortCraftingEventArgs *));

void StartCrafting(CraftingSession *);

bool IsCrafting(const Character *ch);

#endif /* include guard */
