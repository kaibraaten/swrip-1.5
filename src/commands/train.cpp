#include <cstring>
#include <utility/random.hpp>
#include "mud.hpp"
#include "character.hpp"
#include "room.hpp"
#include "race.hpp"

void do_train( Character *ch, std::string arg )
{
    Character *mob = nullptr;
    bool successful = false;

    if ( IsNpc(ch) )
        return;

    switch( ch->SubState )
    {
    default:
        if ( arg.empty() )
        {
            ch->Echo("Train what?\r\n");
            ch->Echo("\r\nChoices: strength, intelligence, wisdom, dexterity, constitution or charisma\r\n");
            return;
        }

        if ( !IsAwake(ch) )
        {
            ch->Echo("In your dreams, or what?\r\n");
            return;
        }

        for(Character *potentialTrainer : ch->InRoom->Characters())
        {
            if ( IsNpc(potentialTrainer) && potentialTrainer->Flags.test(Flag::Mob::Train))
            {
                mob = potentialTrainer;
                break;
            }
        }

        if ( mob == nullptr )
        {
            ch->Echo("You can't do that here.\r\n");
            return;
        }

        if ( StrCmp( arg, "str" ) && StrCmp( arg, "strength" )
             && StrCmp( arg, "dex" ) && StrCmp( arg, "dexterity" )
             && StrCmp( arg, "con" ) && StrCmp( arg, "constitution" )
             && StrCmp( arg, "cha" ) && StrCmp( arg, "charisma" )
             && StrCmp( arg, "wis" ) && StrCmp( arg, "wisdom" )
             && StrCmp( arg, "int" ) && StrCmp( arg, "intelligence" ) )
        {
            do_train( ch , "" );
            return;
        }

        if ( !StrCmp( arg, "str" ) || !StrCmp( arg, "strength" ) )
        {
            if( mob->PermStats.Str <= ch->PermStats.Str
                || ch->PermStats.Str >= 20 + RaceTable[ch->Race].Stats.ModStr
                || ch->PermStats.Str >= 25 )
            {
                Act( AT_TELL, "$n tells you 'I cannot help you... you are already stronger than me.'",
                     mob, NULL, ch, TO_VICT );
                return;
            }

            ch->Echo("&GYou begin your weight training.\r\n");
        }

        if ( !StrCmp( arg, "dex" ) || !StrCmp( arg, "dexterity" ) )
        {
            if( mob->PermStats.Dex <= ch->PermStats.Dex
                || ch->PermStats.Dex >= 20 + RaceTable[ch->Race].Stats.ModDex
                || ch->PermStats.Dex >= 25 )
            {
                Act( AT_TELL, "$n tells you 'I cannot help you... you are already more dextrous than me.'",
                     mob, NULL, ch, TO_VICT );
                return;
            }

            ch->Echo("&GYou begin to work at some challenging tests of coordination.\r\n");
        }

        if ( !StrCmp( arg, "int" ) || !StrCmp( arg, "intelligence" ) )
        {
            if( mob->PermStats.Int <= ch->PermStats.Int
                || ch->PermStats.Int >= 20 + RaceTable[ch->Race].Stats.ModInt
                || ch->PermStats.Int >= 25 )
            {
                Act( AT_TELL, "$n tells you 'I cannot help you... you are already more educated than me.'",
                     mob, NULL, ch, TO_VICT );
                return;
            }

            ch->Echo("&GYou begin your studies.\r\n");
        }

        if ( !StrCmp( arg, "wis" ) || !StrCmp( arg, "wisdom" ) )
        {
            if( mob->PermStats.Wis <= ch->PermStats.Wis
                || ch->PermStats.Wis >= 20 + RaceTable[ch->Race].Stats.ModWis
                || ch->PermStats.Wis >= 25 )
            {
                Act( AT_TELL, "$n tells you 'I cannot help you... you are already far wiser than me.'",
                     mob, NULL, ch, TO_VICT );
                return;
            }

            ch->Echo("&GYou begin contemplating several ancient texts in an effort to gain wisdom.\r\n");
        }

        if ( !StrCmp( arg, "con" ) || !StrCmp( arg, "constitution" ) )
        {
            if( mob->PermStats.Con <= ch->PermStats.Con
                || ch->PermStats.Con >= 20 + RaceTable[ch->Race].Stats.ModCon
                || ch->PermStats.Con >= 25 )
            {
                Act( AT_TELL, "$n tells you 'I cannot help you... you are already healthier than me.'",
                     mob, NULL, ch, TO_VICT );
                return;
            }

            ch->Echo("&GYou begin your endurance training.\r\n");
        }

        if ( !StrCmp( arg, "cha" ) || !StrCmp( arg, "charisma" ) )
        {
            if( mob->PermStats.Cha <= ch->PermStats.Cha
                || ch->PermStats.Cha >= 20 + RaceTable[ch->Race].Stats.ModCha
                || ch->PermStats.Cha >= 25 )
            {
                Act( AT_TELL, "$n tells you 'I cannot help you... you already are more charming than me.'",
                     mob, NULL, ch, TO_VICT );
                return;
            }

            ch->Echo("&GYou begin lessons in maners and ettiquite.\r\n");
        }

        AddTimerToCharacter( ch , TIMER_CMD_FUN , 10 , do_train , SUB_PAUSE );
        ch->dest_buf = arg;
        return;

    case SUB_PAUSE:
        if (ch->dest_buf.empty())
            return;

        arg = ch->dest_buf;
        ch->dest_buf.erase();
        break;

    case SUB_TIMER_DO_ABORT:
        ch->dest_buf.erase();
        ch->SubState = SUB_NONE;
        ch->Echo("&RYou fail to complete your training.\r\n");
        return;
    }

    ch->SubState = SUB_NONE;

    if ( NumberBits ( 2 ) == 0 )
    {
        successful = true;
    }

    if ( !StrCmp( arg, "str" ) || !StrCmp( arg, "strength" ) )
    {
        if ( !successful )
        {
            ch->Echo("&RYou feel that you have wasted a lot of energy for nothing.\r\n");
            return;
        }

        ch->Echo("&GAfter much excercise you feel a little stronger.\r\n");
        ch->PermStats.Str++;
        return;
    }

    if ( !StrCmp( arg, "dex" ) || !StrCmp( arg, "dexterity" ) )
    {
        if ( !successful )
        {
            ch->Echo("&RAfter all that training you still feel like a clutz.\r\n");
            return;
        }

        ch->Echo("&GAfter working hard at many challenging tasks you feel a bit more coordinated.\r\n");
        ch->PermStats.Dex++;
        return;
    }

    if ( !StrCmp( arg, "int" ) || !StrCmp( arg, "intelligence" ) )
    {
        if ( !successful )
        {
            ch->Echo("&RHitting the books leaves you only with sore eyes.\r\n");
            return;
        }

        ch->Echo("&GAfter much study you feel alot more knowledgeable.\r\n");
        ch->PermStats.Int++;
        return;
    }

    if ( !StrCmp( arg, "wis" ) || !StrCmp( arg, "wisdom" ) )
    {
        if ( !successful )
        {
            ch->Echo("&RStudying the ancient texts has left you more confused than wise.\r\n");
            return;
        }

        ch->Echo("&GAfter contemplating several seemingly meaningless events you suddenly\r\n"
                 "receive a flash of insight into the workings of the universe.\r\n");
        ch->PermStats.Wis++;
        return;
    }

    if ( !StrCmp( arg, "con" ) || !StrCmp( arg, "constitution" ) )
    {
        if ( !successful )
        {
            ch->Echo("&RYou spend a long aerobics session exercising very hard, but finish\r\n"
                     "feeling only tired and out of breath.\r\n");
            return;
        }

        ch->Echo("&GAfter a long, tiring exercise session you feel much healthier than before.\r\n");
        ch->PermStats.Con++;
        return;
    }


    if ( !StrCmp( arg, "cha" ) || !StrCmp( arg, "charisma" ) )
    {
        if ( !successful )
        {
            ch->Echo("&RYou finish your self improvement session feeling a little depressed.\r\n");
            return;
        }

        ch->Echo("&GYou spend some time focusing on how to improve your personality and feel\r\n"
                 "much better about yourself and the ways others see you.\r\n");
        ch->PermStats.Cha++;
        return;
    }
}
