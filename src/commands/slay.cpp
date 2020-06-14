#include "character.hpp"
#include "mud.hpp"
#include "act.hpp"

void do_slay(Character *ch, std::string argument)
{
    Character *victim = nullptr;
    std::string arg;
    std::string arg2;

    argument = OneArgument(argument, arg);
    OneArgument(argument, arg2);

    if(arg.empty())
    {
        ch->Echo("Slay whom?\r\n");
        return;
    }

    if((victim = GetCharacterInRoom(ch, arg)) == NULL)
    {
        ch->Echo("They aren't here.\r\n");
        return;
    }

    if(ch == victim)
    {
        ch->Echo("Suicide is a mortal sin.\r\n");
        return;
    }

    if(!IsNpc(victim)
       && (GetTrustLevel(victim) >= LEVEL_GREATER
           || GetTrustLevel(ch) < LEVEL_GREATER))
    {
        ch->Echo("You failed.\r\n");
        return;
    }

    if(!StrCmp(arg2, "immolate"))
    {
        Act(AT_FIRE, "Your fireball turns $N into a blazing inferno.",
            ch, NULL, victim, ActTarget::Char);
        Act(AT_FIRE, "$n releases a searing fireball in your direction.",
            ch, NULL, victim, ActTarget::Vict);
        Act(AT_FIRE, "$n points at $N, who bursts into a flaming inferno.",
            ch, NULL, victim, ActTarget::NotVict);
    }
    else if(!StrCmp(arg2, "shatter"))
    {
        Act(AT_LBLUE, "You freeze $N with a glance and shatter the frozen corpse into tiny shards.",
            ch, NULL, victim, ActTarget::Char);
        Act(AT_LBLUE,
            "$n freezes you with a glance and shatters your frozen body into tiny shards.",
            ch, NULL, victim, ActTarget::Vict);
        Act(AT_LBLUE, "$n freezes $N with a glance and shatters the frozen body into tiny shards.",
            ch, NULL, victim, ActTarget::NotVict);
    }
    else if(!StrCmp(arg2, "demon"))
    {
        Act(AT_IMMORT, "You gesture, and a slavering demon appears. With a horrible grin, the",
            ch, NULL, victim, ActTarget::Char);
        Act(AT_IMMORT, "foul creature turns on $N, who screams in panic before being eaten alive.",
            ch, NULL, victim, ActTarget::Char);
        Act(AT_IMMORT, "$n gestures, and a slavering demon appears. The foul creature turns on",
            ch, NULL, victim, ActTarget::Vict);
        Act(AT_IMMORT, "you with a horrible grin. You scream in panic before being eaten alive.",
            ch, NULL, victim, ActTarget::Vict);
        Act(AT_IMMORT, "$n gestures, and a slavering demon appears. With a horrible grin, the",
            ch, NULL, victim, ActTarget::NotVict);
        Act(AT_IMMORT, "foul creature turns on $N, who screams in panic before being eaten alive.",
            ch, NULL, victim, ActTarget::NotVict);
    }
    else if(!StrCmp(arg2, "pounce") && GetTrustLevel(ch) >= LEVEL_GREATER)
    {
        Act(AT_BLOOD, "Leaping upon $N with bared fangs, you tear open $S throat and toss the corpse to the ground...", ch, NULL, victim, ActTarget::Char);
        Act(AT_BLOOD, "In a heartbeat, $n rips $s fangs through your throat! Your blood sprays and pours to the ground as your life ends...", ch, NULL, victim, ActTarget::Vict);
        Act(AT_BLOOD, "Leaping suddenly, $n sinks $s fangs into $N's throat. As blood sprays and gushes to the ground, $n tosses $N's dying body away.", ch, NULL, victim, ActTarget::NotVict);
    }
    else if(!StrCmp(arg2, "slit") && GetTrustLevel(ch) >= LEVEL_GREATER)
    {
        Act(AT_BLOOD, "You calmly slit $N's throat.", ch, NULL, victim, ActTarget::Char);
        Act(AT_BLOOD, "$n reaches out with a clawed finger and calmly slits your throat.",
            ch, NULL, victim, ActTarget::Vict);
        Act(AT_BLOOD, "$n calmly slits $N's throat.", ch, NULL, victim, ActTarget::NotVict);
    }
    else
    {
        Act(AT_IMMORT, "You slay $N in cold blood!", ch, NULL, victim, ActTarget::Char);
        Act(AT_IMMORT, "$n slays you in cold blood!", ch, NULL, victim, ActTarget::Vict);
        Act(AT_IMMORT, "$n slays $N in cold blood!", ch, NULL, victim, ActTarget::NotVict);
    }

    SetCurrentGlobalCharacter(victim);
    RawKill(ch, victim);
}
