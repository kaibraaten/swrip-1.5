#include <cassert>
#include <utility/algorithms.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "log.hpp"
#include "protomob.hpp"

/*
 * Mobprogram editing - cumbersome                              -Thoric
 */
void do_mpedit( Character *ch, std::string argument )
{
    std::string arg1;
    std::string arg2;
    std::string arg3;
    std::string arg4;

    if ( IsNpc( ch ) )
    {
        ch->Echo("Mob's can't EditMobProg\r\n");
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
    argument = OneArgument( argument, arg3 );
    int value = ToLong( arg3 );

    if ( arg1.empty() || arg2.empty() )
    {
        ch->Echo("Syntax: mpedit <victim> <command> [number] <program> <value>\r\n");
        ch->Echo("\r\n");
        ch->Echo("Command being one of:\r\n");
        ch->Echo("  add delete insert edit list\r\n");
        ch->Echo("Program being one of:\r\n");
        ch->Echo("  act speech rand fight hitprcnt greet allgreet\r\n");
        ch->Echo("  entry give bribe death time hour script\r\n");
        return;
    }

    Character *victim = nullptr;

    if ( GetTrustLevel( ch ) < LEVEL_GREATER )
    {
        victim = GetCharacterInRoom( ch, arg1 );

        if ( victim == nullptr )
        {
            ch->Echo("They aren't here.\r\n");
            return;
        }
    }
    else
    {
        victim = GetCharacterAnywhere( ch, arg1 );

        if ( victim == nullptr )
        {
            ch->Echo("No one like that in all the realms.\r\n");
            return;
        }
    }

    if ( GetTrustLevel( ch ) < GetTrustLevel( victim ) || !IsNpc(victim) )
    {
        ch->Echo("You can't do that!\r\n");
        return;
    }

    if ( !CanModifyCharacter( ch, victim ) )
        return;

    if ( !victim->Flags.test(Flag::Mob::Prototype))
    {
        ch->Echo("A mobile must have a prototype flag to be mpset.\r\n");
        return;
    }

    const auto mobProgs = victim->Prototype->mprog.MudProgs();

    SetCharacterColor( AT_GREEN, ch );

    if ( !StrCmp( arg2, "list" ) )
    {
        if ( mobProgs.empty() )
        {
            ch->Echo("That mobile has no mob programs.\r\n");
            return;
        }

        int cnt = 0;

        for(auto mprg : mobProgs)
        {
            ch->Echo("%d>%s %s\r\n%s\r\n",
                     ++cnt,
                     MobProgTypeToName( mprg->type ),
                     mprg->arglist.c_str(),
                     mprg->comlist.c_str() );
        }

        return;
    }

    if ( !StrCmp( arg2, "edit" ) )
    {
        if ( mobProgs.empty() )
        {
            ch->Echo("That mobile has no mob programs.\r\n");
            return;
        }

        argument = OneArgument( argument, arg4 );

        int mptype = 0;

        if ( !arg4.empty() )
        {
            mptype = GetMudProgFlag( arg4 );

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

        for(auto mprg : mobProgs)
        {
            if ( ++cnt == value )
            {
                EditMobProg( ch, mprg, mptype, argument );
                victim->Prototype->mprog.progtypes = 0;

                for(auto inner : mobProgs)
                {
                    victim->Prototype->mprog.progtypes |= inner->type;
                }

                return;
            }
        }

        ch->Echo("Program not found.\r\n");
        return;
    }

    if ( !StrCmp( arg2, "delete" ) )
    {
        if ( mobProgs.empty() )
        {
            ch->Echo("That mobile has no mob programs.\r\n");
            return;
        }

        argument = OneArgument( argument, arg4 );

        if ( value < 1 )
        {
            ch->Echo("Program not found.\r\n");
            return;
        }

        int cnt = 0;
        bool found = false;
        int mptype = 0;

        for(auto mprg : mobProgs)
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
        int num = count_if(std::begin(mobProgs), std::end(mobProgs),
                           [mptype](const auto mprg)
                           {
                               return IsBitSet(mprg->type, mptype);
                           });
        auto result = Filter(mobProgs,
                             [&cnt, value](auto)
                             {
                                 return (++cnt) == value;
                             });

        assert(!result.empty());

        std::shared_ptr<MPROG_DATA> progToDelete = result.front();
        victim->Prototype->mprog.Remove(progToDelete);

        if ( num <= 1 )
        {
            RemoveBit( victim->Prototype->mprog.progtypes, mptype );
        }

        ch->Echo("Program removed.\r\n");
        return;
    }

    if ( !StrCmp( arg2, "insert" ) )
    {
        if ( mobProgs.empty() )
        {
            ch->Echo("That mobile has no mob programs.\r\n");
            return;
        }

        argument = OneArgument( argument, arg4 );
        int mptype = GetMudProgFlag( arg4 );

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
        auto result = Filter(mobProgs,
                             [&cnt, value](auto mprg)
                             {
                                 return (++cnt) == value;
                             });

        if(!result.empty())
        {
            std::shared_ptr<MPROG_DATA> mprg = std::make_shared<MPROG_DATA>();
            victim->Prototype->mprog.progtypes |= ( 1 << mptype );
            EditMobProg( ch, mprg, mptype, argument );
            victim->Prototype->mprog.InsertBefore(value, mprg);
        }
        else
        {
            ch->Echo("Program not found.\r\n");
        }

        return;
    }

    if ( !StrCmp( arg2, "add" ) )
    {
        int mptype = GetMudProgFlag( arg3 );

        if ( mptype == -1 )
        {
            ch->Echo("Unknown program type.\r\n");
            return;
        }

        std::shared_ptr<MPROG_DATA> mprg = std::make_shared<MPROG_DATA>();

        victim->Prototype->mprog.Add(mprg);
        victim->Prototype->mprog.progtypes     |= ( 1 << mptype );
        EditMobProg( ch, mprg, mptype, argument );
        return;
    }

    do_mpedit( ch, "" );
}
