#include <string.h>
#include "mud.hpp"
#include "character.hpp"
#include "room.hpp"

void do_train( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *mob = nullptr;
  bool successful = false;

  if ( IsNpc(ch) )
    return;

  strcpy( arg, argument );

  switch( ch->SubState )
    {
    default:
      if ( IsNullOrEmpty( arg ) )
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
          if ( IsNpc(potentialTrainer) && IsBitSet(potentialTrainer->Flags, ACT_TRAIN) )
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
          do_train ( ch , "" );
          return;
        }

      if ( !StrCmp( arg, "str" ) || !StrCmp( arg, "strength" ) )
        {
          if( mob->Stats.PermStr <= ch->Stats.PermStr || ch->Stats.PermStr >= 20 + RaceTable[ch->Race].Stats.ModStr || ch->Stats.PermStr >= 25 )
            {
              Act( AT_TELL, "$n tells you 'I cannot help you... you are already stronger than I.'",
                   mob, NULL, ch, TO_VICT );
              return;
            }
          ch->Echo("&GYou begin your weight training.\r\n");
        }
      if ( !StrCmp( arg, "dex" ) || !StrCmp( arg, "dexterity" ) )
        {
          if( mob->Stats.PermDex <= ch->Stats.PermDex || ch->Stats.PermDex >= 20 + RaceTable[ch->Race].Stats.ModDex || ch->Stats.PermDex >= 25 )
            {
              Act( AT_TELL, "$n tells you 'I cannot help you... you are already more dextrous than I.'",
                   mob, NULL, ch, TO_VICT );
	      return;
            }
          ch->Echo("&GYou begin to work at some challenging tests of coordination.\r\n");
        }
      if ( !StrCmp( arg, "int" ) || !StrCmp( arg, "intelligence" ) )
        {
          if( mob->Stats.PermInt <= ch->Stats.PermInt || ch->Stats.PermInt >= 20 + RaceTable[ch->Race].Stats.ModInt || ch->Stats.PermInt >= 25 )
            {
              Act( AT_TELL, "$n tells you 'I cannot help you... you are already more educated than I.'",
                   mob, NULL, ch, TO_VICT );
              return;
            }
          ch->Echo("&GYou begin your studies.\r\n");
        }
      if ( !StrCmp( arg, "wis" ) || !StrCmp( arg, "wisdom" ) )
        {
          if( mob->Stats.PermWis <= ch->Stats.PermWis || ch->Stats.PermWis >= 20 + RaceTable[ch->Race].Stats.ModWis || ch->Stats.PermWis >= 25 )
            {
              Act( AT_TELL, "$n tells you 'I cannot help you... you are already far wiser than I.'",
                   mob, NULL, ch, TO_VICT );
              return;
            }
          ch->Echo("&GYou begin contemplating several ancient texts in an effort to gain wisdom.\r\n");
        }
      if ( !StrCmp( arg, "con" ) || !StrCmp( arg, "constitution" ) )
        {
          if( mob->Stats.PermCon <= ch->Stats.PermCon || ch->Stats.PermCon >= 20 + RaceTable[ch->Race].Stats.ModCon || ch->Stats.PermCon >= 25 )
            {
              Act( AT_TELL, "$n tells you 'I cannot help you... you are already healthier than I.'",
                   mob, NULL, ch, TO_VICT );
              return;
            }
          ch->Echo("&GYou begin your endurance training.\r\n");
        }
      if ( !StrCmp( arg, "cha" ) || !StrCmp( arg, "charisma" ) )
        {
          if( mob->Stats.PermCha <= ch->Stats.PermCha || ch->Stats.PermCha >= 20 + RaceTable[ch->Race].Stats.ModCha || ch->Stats.PermCha >= 25 )
            {
              Act( AT_TELL, "$n tells you 'I cannot help you... you already are more charming than I.'",
                   mob, NULL, ch, TO_VICT );
              return;
            }
          ch->Echo("&GYou begin lessons in maners and ettiquite.\r\n");
        }
      AddTimerToCharacter( ch , TIMER_CMD_FUN , 10 , do_train , SUB_PAUSE );
      ch->dest_buf = CopyString(arg);
      return;

    case SUB_PAUSE:
      if ( !ch->dest_buf )
        return;
      strcpy(arg, (const char*)ch->dest_buf);
      FreeMemory( ch->dest_buf);
      break;

    case SUB_TIMER_DO_ABORT:
      FreeMemory( ch->dest_buf );
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
          ch->Echo("&RYou feel that you have wasted alot of energy for nothing...\r\n");
          return;
        }
      ch->Echo("&GAfter much of excercise you feel a little stronger.\r\n");
      ch->Stats.PermStr++;
      return;
    }

  if ( !StrCmp( arg, "dex" ) || !StrCmp( arg, "dexterity" ) )
    {
      if ( !successful )
        {
          ch->Echo("&RAfter all that training you still feel like a clutz...\r\n");
          return;
        }
      ch->Echo("&GAfter working hard at many challenging tasks you feel a bit more coordinated.\r\n");
      ch->Stats.PermDex++;
      return;
    }

  if ( !StrCmp( arg, "int" ) || !StrCmp( arg, "intelligence" ) )
    {
      if ( !successful )
        {
          ch->Echo("&RHitting the books leaves you only with sore eyes...\r\n");
          return;
        }
      ch->Echo("&GAfter much study you feel alot more knowledgeable.\r\n");
      ch->Stats.PermInt++;
      return;
    }

  if ( !StrCmp( arg, "wis" ) || !StrCmp( arg, "wisdom" ) )
    {
      if ( !successful )
        {
          ch->Echo("&RStudying the ancient texts has left you more confused than wise...\r\n");
          return;
        }

      ch->Echo("&GAfter contemplating several seemingly meaningless events you suddenly \r\nreceive a flash of insight into the workings of the universe.\r\n");
      ch->Stats.PermWis++;
      return;
    }

  if ( !StrCmp( arg, "con" ) || !StrCmp( arg, "constitution" ) )
    {
      if ( !successful )
        {
          ch->Echo("&RYou spend long a long arobics session ecersising very hard but finish \r\nfeeling only tired and out of breath....\r\n");
          return;
        }
      ch->Echo("&GAfter a long tiring excersise session you feel much healthier than before.\r\n");
      ch->Stats.PermCon++;
      return;
    }


  if ( !StrCmp( arg, "cha" ) || !StrCmp( arg, "charisma" ) )
    {
      if ( !successful )
        {
   ch->Echo("&RYou finish your self improvement session feeling a little depressed.\r\n");
          return;
        }
      
      ch->Echo("&GYou spend some time focusing on how to improve your personality and feel \r\nmuch better about yourself and the ways others see you.\r\n");
      ch->Stats.PermCha++;
      return;
    }
}

