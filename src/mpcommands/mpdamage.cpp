#include <cassert>
#include <utility/random.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "log.hpp"
#include "room.hpp"

static ch_ret simple_damage( Character *ch, Character *victim, int dam, int dt );

/*
 * syntax: mpdamage (character) (#hps)
 */
void do_mp_damage( Character *ch, std::string argument )
{
    std::string arg1;
    std::string arg2;
    Character *victim = nullptr;
    int dam = 0;

    if ( IsAffectedBy( ch, Flag::Affect::Charm))
        return;

    if ( !IsNpc( ch ) || ( ch->Desc && GetTrustLevel( ch ) < LEVEL_IMMORTAL )  )
    {
        ch->Echo("Huh?\r\n");
        return;
    }

    argument = OneArgument( argument, arg1 );
    argument = OneArgument( argument, arg2 );

    if ( arg1.empty() )
    {
        ch->Echo("mpdamage whom?\r\n");
        ProgBug( "Mpdamage: invalid argument1", ch );
        return;
    }

    if ( arg2.empty() )
    {
        ch->Echo("mpdamage inflict how many hps?\r\n");
        ProgBug( "Mpdamage: invalid argument2", ch );
        return;
    }

    if ( ( victim = GetCharacterInRoomMudProg( ch, arg1 ) ) == NULL )
    {
        ch->Echo("Victim must be in room.\r\n");
        ProgBug( "Mpdamage: victim not in room", ch );
        return;
    }

    if ( victim == ch )
    {
        ch->Echo("You can't mpdamage yourself.\r\n");
        ProgBug( "Mpdamage: trying to damage self", ch );
        return;
    }

    dam = ToLong(arg2);

    if( dam < 0 || dam > SHRT_MAX )
    {
        ch->Echo("Mpdamage how much?\r\n");
        ProgBug( "Mpdamage: invalid (nonexistent?) argument", ch );
        return;
    }

    /* this is kinda begging for trouble        */
    /*
     * Note from Thoric to whoever put this in...
     * Wouldn't it be better to call InflictDamage(ch, ch, dam, dt)?
     * I hate redundant code
     */
    if ( simple_damage(ch, victim, dam, TYPE_UNDEFINED ) == rVICT_DIED )
    {
        StopFighting( ch, false );
        StopHating( ch );
        StopFearing( ch );
        StopHunting( ch );
    }
}

/*
 * Inflict damage from a mudprogram
 *
 *  note: should be careful about using victim afterwards
 */
static ch_ret simple_damage( Character *ch, Character *victim, int dam, int dt )
{
    bool npcvict = false;
    Object *damobj = nullptr;

    assert(ch != nullptr);
    assert(victim != nullptr);

    if ( victim->Position == POS_DEAD )
    {
        return rVICT_DIED;
    }

    npcvict = IsNpc(victim);

    if ( dam )
    {
        if ( IS_FIRE(dt) )
            dam = ModifyDamageBasedOnResistance(victim, dam, Flag::Ris::Fire);
        else if ( IS_COLD(dt) )
            dam = ModifyDamageBasedOnResistance(victim, dam, Flag::Ris::Cold);
        else if ( IS_ACID(dt) )
            dam = ModifyDamageBasedOnResistance(victim, dam, Flag::Ris::Acid);
        else if ( IS_ELECTRICITY(dt) )
            dam = ModifyDamageBasedOnResistance(victim, dam, Flag::Ris::Electricity);
        else if ( IS_ENERGY(dt) )
            dam = ModifyDamageBasedOnResistance(victim, dam, Flag::Ris::Energy);
        else if ( dt == gsn_poison )
            dam = ModifyDamageBasedOnResistance(victim, dam, Flag::Ris::Poison);
        else if ( dt == (TYPE_HIT + 7) || dt == (TYPE_HIT + 8) )
            dam = ModifyDamageBasedOnResistance(victim, dam, Flag::Ris::Blunt);
        else if ( dt == (TYPE_HIT + 2) || dt == (TYPE_HIT + 11) )
            dam = ModifyDamageBasedOnResistance(victim, dam, Flag::Ris::Pierce);
        else if ( dt == (TYPE_HIT + 1) || dt == (TYPE_HIT + 3) )
            dam = ModifyDamageBasedOnResistance(victim, dam, Flag::Ris::Slash);

        if ( dam < 0 )
            dam = 0;
    }

    if ( victim != ch )
    {
        /*
         * Damage modifiers.
         */
        if ( IsAffectedBy(victim, Flag::Affect::Sanctuary))
            dam /= 2;

        if ( IsAffectedBy(victim, Flag::Affect::Protect) && IsEvil(ch) )
            dam -= (int) (dam / 4);

        if ( dam < 0 )
            dam = 0;
    }

    /*
     * Check for EQ damage.... ;)
     */

    if (dam > 10)
    {
        /* get a random body eq part */
        WearLocation dameq  = (WearLocation)GetRandomNumberFromRange(WEAR_LIGHT, WEAR_EYES);
        damobj = GetEquipmentOnCharacter(victim, dameq);

        if ( damobj )
        {
            if ( dam > GetObjectResistance(damobj) )
            {
                SetCurrentGlobalObject(damobj);
                DamageObject(damobj);
            }
        }
    }

    /*
     * Hurt the victim.
     * Inform the victim of his new state.
     */
    victim->HitPoints.Current -= dam;

    if ( !IsNpc(victim)
         &&   GetTrustLevel(victim) >= LEVEL_IMMORTAL
         &&   victim->HitPoints.Current < 1 )
        victim->HitPoints.Current = 1;

    if ( !npcvict
         &&   GetTrustLevel(victim) >= LEVEL_IMMORTAL
         &&        GetTrustLevel(ch)     >= LEVEL_IMMORTAL
         &&   victim->HitPoints.Current < 1 )
        victim->HitPoints.Current = 1;

    UpdatePosition( victim );

    switch( victim->Position )
    {
    case POS_MORTAL:
        Act( AT_DYING, "$n is mortally wounded, and will die soon, if not aided.",
             victim, NULL, NULL, TO_ROOM );
        Act( AT_DANGER, "You are mortally wounded, and will die soon, if not aided.",
             victim, NULL, NULL, TO_CHAR );
        break;

    case POS_INCAP:
        Act( AT_DYING, "$n is incapacitated and will slowly die, if not aided.",
             victim, NULL, NULL, TO_ROOM );
        Act( AT_DANGER, "You are incapacitated and will slowly die, if not aided.",
             victim, NULL, NULL, TO_CHAR );
        break;

    case POS_STUNNED:
        if ( !IsAffectedBy( victim, Flag::Affect::Paralysis))
        {
            Act( AT_ACTION, "$n is stunned, but will probably recover.",
                 victim, NULL, NULL, TO_ROOM );
            Act( AT_HURT, "You are stunned, but will probably recover.",
                 victim, NULL, NULL, TO_CHAR );
        }
        break;

    case POS_DEAD:
        Act( AT_DEAD, "$n is DEAD!!", victim, 0, 0, TO_ROOM );
        Act( AT_DEAD, "You have been KILLED!!\r\n", victim, 0, 0, TO_CHAR );
        break;

    default:
        if ( dam > victim->HitPoints.Max / 4 )
            Act( AT_HURT, "That really did HURT!", victim, 0, 0, TO_CHAR );

        if ( victim->HitPoints.Current < victim->HitPoints.Max / 4 )
            Act( AT_DANGER, "You wish that your wounds would stop BLEEDING so much!",
                 victim, 0, 0, TO_CHAR );

        break;
    }

    /*
     * Payoff for killing things.
     */
    if ( victim->Position == POS_DEAD )
    {
        if ( !npcvict )
        {
            sprintf( log_buf, "%s killed by %s at %ld",
                     victim->Name.c_str(),
                     (IsNpc(ch) ? ch->ShortDescr.c_str() : ch->Name.c_str()),
                     victim->InRoom->Vnum );
            Log->Info( "%s", log_buf );
            ToChannel( log_buf, CHANNEL_MONITOR, "Monitor", LEVEL_IMMORTAL );
        }

        SetCurrentGlobalCharacter(victim);
        RawKill( ch, victim );
        victim = NULL;

        return rVICT_DIED;
    }

    if ( victim == ch )
        return rNONE;

    /*
     * Take care of link dead people.
     */
    if ( !npcvict && !victim->Desc )
    {
        if ( GetRandomNumberFromRange( 0, victim->Wait ) == 0 )
        {
            do_recall( victim, "" );
            return rNONE;
        }
    }

    /*
     * Wimp out?
     */
    if ( npcvict && dam > 0 )
    {
        if ( ( victim->Flags.test(Flag::Mob::Wimpy) && NumberBits( 1 ) == 0
               && victim->HitPoints.Current < victim->HitPoints.Max / 2 )
             ||   ( IsAffectedBy(victim, Flag::Affect::Charm) && victim->Master
                    && victim->Master->InRoom != victim->InRoom ) )
        {
            StartFearing( victim, ch );
            StopHunting( victim );
            do_flee( victim, "" );
        }
    }

    if ( !npcvict
         &&   victim->HitPoints.Current > 0
         &&   victim->HitPoints.Current <= victim->Wimpy
         &&   victim->Wait == 0 )
        do_flee( victim, "" );
    else if ( !npcvict && victim->Flags.test(Flag::Plr::Flee))
        do_flee( victim, "" );

    return rNONE;
}
