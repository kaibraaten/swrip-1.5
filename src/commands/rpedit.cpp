#include <cassert>
#include <utility/algorithms.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "log.hpp"
#include "room.hpp"

void do_rpedit( Character *ch, std::string argument )
{
    std::string arg1;
    std::string arg2;
    std::string arg3;

    if ( IsNpc( ch ) )
    {
        ch->Echo("Mob's can't rpedit\r\n");
        return;
    }

    if ( !ch->Desc )
    {
        ch->Echo("You have no descriptor\r\n");
        return;
    }

    SmashTilde( argument );
    argument = OneArgument( argument, arg1 );
    argument = OneArgument( argument, arg2 );
    int value = ToLong( arg2 );

    if ( arg1.empty() )
    {
        ch->Echo("Syntax: rpedit <command> [number] <program> <value>\r\n");
        ch->Echo("\r\n");
        ch->Echo("Command being one of:\r\n");
        ch->Echo("  add delete insert edit list\r\n");
        ch->Echo("Program being one of:\r\n");
        ch->Echo("  act speech rand sleep rest rfight enter\r\n");
        ch->Echo("  leave death\r\n");
        ch->Echo("\r\n");
        ch->Echo("You should be standing in room you wish to edit.\r\n");
        return;
    }

    if ( !CanModifyRoom( ch, ch->InRoom ) )
        return;

    bool hasMudProgs = !ch->InRoom->mprog.MudProgs().empty();

    SetCharacterColor( AT_GREEN, ch );

    if ( !StrCmp( arg1, "list" ) )
    {
        int cnt = 0;

        if ( !hasMudProgs )
        {
            ch->Echo("This room has no room programs.\r\n");
            return;
        }

        for(auto mprg : ch->InRoom->mprog.MudProgs())
        {
            ch->Echo("%d>%s %s\r\n%s\r\n",
                     ++cnt,
                     MobProgTypeToName( mprg->type ),
                     mprg->arglist,
                     mprg->comlist.c_str() );
        }

        return;
    }

    if ( !StrCmp( arg1, "edit" ) )
    {
        int mptype = -1;

        if ( !hasMudProgs )
        {
            ch->Echo("This room has no room programs.\r\n");
            return;
        }

        argument = OneArgument( argument, arg3 );

        if ( !arg3.empty() )
        {
            mptype = GetMudProgFlag( arg3 );

            if ( mptype == -1 )
            {
                ch->Echo("Unknown program type.\r\n");
                return;
            }
        }
        else
        {
            mptype = -1;
        }

        if ( value < 1 )
        {
            ch->Echo("Program not found.\r\n");
            return;
        }

        int cnt = 0;

        for(auto mprg : ch->InRoom->mprog.MudProgs())
        {
            if ( ++cnt == value )
            {
                EditMobProg( ch, mprg, mptype, argument );
                ch->InRoom->mprog.progtypes = 0;

                for(auto innerProg : ch->InRoom->mprog.MudProgs())
                {
                    ch->InRoom->mprog.progtypes |= innerProg->type;
                }

                return;
            }
        }

        ch->Echo("Program not found.\r\n");
        return;
    }

    if ( !StrCmp( arg1, "delete" ) )
    {
        if ( !hasMudProgs )
        {
            ch->Echo("That room has no room programs.\r\n");
            return;
        }

        argument = OneArgument( argument, arg3 );

        if ( value < 1 )
        {
            ch->Echo("Program not found.\r\n");
            return;
        }

        int cnt = 0;
        bool found = false;
        int mptype = 0;

        for (auto mprg : ch->InRoom->mprog.MudProgs())
        {
            if ( ++cnt == value )
            {
                mptype = mprg->type;
                found = true;
                break;
            }
        }

        if ( !found )
        {
            ch->Echo("Program not found.\r\n");
            return;
        }

        cnt = 0;
        int num = Count(ch->InRoom->mprog.MudProgs(),
                        [mptype](const auto mprg)
                        {
                            return IsBitSet(mprg->type, mptype);
                        });

        auto result = Filter(ch->InRoom->mprog.MudProgs(),
                             [&cnt, value](auto)
                             {
                                 return (++cnt) == value;
                             });

        assert(!result.empty());

        std::shared_ptr<MPROG_DATA> progToDelete = result.front();

        ch->InRoom->mprog.Remove(progToDelete);

        FreeMemory( progToDelete->arglist );

        if ( num <= 1 )
        {
            RemoveBit( ch->InRoom->mprog.progtypes, mptype );
        }

        ch->Echo("Program removed.\r\n");
        return;
    }

    if ( !StrCmp( arg2, "insert" ) )
    {
        if ( !hasMudProgs )
        {
            ch->Echo("That room has no room programs.\r\n");
            return;
        }

        argument = OneArgument( argument, arg3 );
        int mptype = GetMudProgFlag( arg2 );

        if ( mptype == -1 )
        {
            ch->Echo("Unknown program type.\r\n");
            return;
        }

        if ( value < 1 )
        {
            ch->Echo("Program not found.\r\n");
            return;
        }

        int cnt = 0;

        auto result = Filter(ch->InRoom->mprog.MudProgs(),
                             [&cnt, value](auto mprg)
                             {
                                 return (++cnt) == value;
                             });

        if(!result.empty())
        {
            std::shared_ptr<MPROG_DATA> mprg = std::make_shared<MPROG_DATA>();
            ch->InRoom->mprog.progtypes |= ( 1 << mptype );
            EditMobProg( ch, mprg, mptype, argument );
            ch->InRoom->mprog.InsertBefore(value, mprg);
        }
        else
        {
            ch->Echo("Program not found.\r\n");
        }

        return;
    }

    if ( !StrCmp( arg1, "add" ) )
    {
        int mptype = GetMudProgFlag( arg2 );

        if ( mptype == -1 )
        {
            ch->Echo("Unknown program type.\r\n");
            return;
        }

        std::shared_ptr<MPROG_DATA> mprg = std::make_shared<MPROG_DATA>();

        ch->InRoom->mprog.Add(mprg);
        ch->InRoom->mprog.progtypes |= ( 1 << mptype );
        EditMobProg( ch, mprg, mptype, argument );
        return;
    }

    do_rpedit( ch, "" );
}
