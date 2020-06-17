#include <utility/random.hpp>
#include "object.hpp"
#include "mud.hpp"
#include "protoobject.hpp"
#include "constants.hpp"
#include "log.hpp"

struct Object::Impl
{
    std::list<std::shared_ptr<ExtraDescription>> ExtraDescriptions;
    std::list<std::shared_ptr<Affect>> Affects;
    std::list<std::shared_ptr<Object>> Objects;
};

Object::Object()
    : pImpl(std::make_unique<Impl>())
{
    Value.fill(0);
}

Object::Object(std::shared_ptr<ProtoObject> pObjIndex, int level)
    : pImpl(std::make_unique<Impl>())
{
    Value.fill(0);

    Prototype = pObjIndex;
    Level = level;
    cur_obj_serial = umax((cur_obj_serial + 1) & (BV30 - 1), 1);
    Serial = Prototype->Serial = cur_obj_serial;

    Name = pObjIndex->Name;
    ShortDescr = pObjIndex->ShortDescr;
    Description = pObjIndex->Description;
    ActionDescription = pObjIndex->ActionDescription;
    ItemType = pObjIndex->ItemType;
    Flags = pObjIndex->Flags;
    WearFlags = pObjIndex->WearFlags;

    for (int oval = 0; oval < MAX_OVAL; ++oval)
    {
        Value[oval] = pObjIndex->Value[oval];
    }

    Weight = pObjIndex->Weight;
    Cost = pObjIndex->Cost;

    /*
     * Mess with object properties.
     */
    switch (ItemType)
    {
    default:
        Log->Bug("%s: vnum %ld bad type.", __FUNCTION__, pObjIndex->Vnum);
        Log->Bug("------------------------>  %d", ItemType);
        break;

    case ITEM_FIGHTERCOMP:
    case ITEM_MIDCOMP:
    case ITEM_CAPITALCOMP:
    case ITEM_GOVERNMENT:
    case ITEM_SPACECRAFT:
    case ITEM_RAWSPICE:
    case ITEM_LENS:
    case ITEM_CRYSTAL:
    case ITEM_DURAPLAST:
    case ITEM_DURASTEEL:
    case ITEM_SUPERCONDUCTOR:
    case ITEM_COMLINK:
    case ITEM_MEDPAC:
    case ITEM_FABRIC:
    case ITEM_RARE_METAL:
    case ITEM_MAGNET:
    case ITEM_THREAD:
    case ITEM_CHEMICAL:
    case ITEM_SPICE:
    case ITEM_SMUT:
    case ITEM_OVEN:
    case ITEM_MIRROR:
    case ITEM_CIRCUIT:
    case ITEM_TOOLKIT:
    case ITEM_LIGHT:
    case ITEM_TREASURE:
    case ITEM_FURNITURE:
    case ITEM_TRASH:
    case ITEM_CONTAINER:
    case ITEM_DRINK_CON:
    case ITEM_KEY:
    case ITEM_STAFF:
    case ITEM_SCOPE:
        break;

    case ITEM_FOOD:
        /*
         * optional food condition (rotting food)         -Thoric
         * value1 is the max condition of the food
         * value4 is the optional initial condition
         */
        if (Value[OVAL_FOOD_OPTIONAL_INITIAL_CONDITION])
        {
            Timer = Value[OVAL_FOOD_OPTIONAL_INITIAL_CONDITION];
        }
        else
        {
            Timer = Value[OVAL_FOOD_MAX_CONDITION];
        }
        break;

    case ITEM_DROID_CORPSE:
    case ITEM_CORPSE_NPC:
    case ITEM_CORPSE_PC:
    case ITEM_FOUNTAIN:
    case ITEM_SCRAPS:
    case ITEM_GRENADE:
    case ITEM_LANDMINE:
    case ITEM_FIRE:
    case ITEM_BOOK:
    case ITEM_SCROLL:
    case ITEM_ROPE:
    case ITEM_SWITCH:
    case ITEM_LEVER:
    case ITEM_BUTTON:
    case ITEM_DIAL:
    case ITEM_TRAP:
    case ITEM_MAP:
    case ITEM_PAPER:
    case ITEM_PEN:
    case ITEM_LOCKPICK:
    case ITEM_FUEL:
    case ITEM_MISSILE:
    case ITEM_SHOVEL:
        break;

    case ITEM_SALVE:
        Value[OVAL_SALVE_DELAY] = NumberFuzzy(Value[OVAL_SALVE_DELAY]);
        break;

    case ITEM_DEVICE:
        Value[OVAL_DEVICE_LEVEL] = NumberFuzzy(Value[OVAL_DEVICE_LEVEL]);
        Value[OVAL_DEVICE_MAX_CHARGES] = NumberFuzzy(Value[OVAL_DEVICE_MAX_CHARGES]);
        break;

    case ITEM_BATTERY:
        if (Value[OVAL_BATTERY_CHARGE] <= 0)
            Value[OVAL_BATTERY_CHARGE] = NumberFuzzy(95);

        break;


    case ITEM_BOLT:
        if (Value[OVAL_BOLT_CHARGE] <= 0)
            Value[OVAL_BOLT_CHARGE] = NumberFuzzy(95);

        break;

    case ITEM_AMMO:
        if (Value[OVAL_AMMO_CHARGE] <= 0)
            Value[OVAL_AMMO_CHARGE] = NumberFuzzy(495);

        break;

    case ITEM_WEAPON:
        if (Value[OVAL_WEAPON_NUM_DAM_DIE] && Value[OVAL_WEAPON_SIZE_DAM_DIE])
        {
            Value[OVAL_WEAPON_SIZE_DAM_DIE] *= Value[OVAL_WEAPON_NUM_DAM_DIE];
        }
        else
        {
            Value[OVAL_WEAPON_NUM_DAM_DIE] = NumberFuzzy(NumberFuzzy(1 + level / 20));
            Value[OVAL_WEAPON_SIZE_DAM_DIE] = NumberFuzzy(NumberFuzzy(10 + level / 10));
        }

        if (Value[OVAL_WEAPON_NUM_DAM_DIE] > Value[OVAL_WEAPON_SIZE_DAM_DIE])
        {
            Value[OVAL_WEAPON_NUM_DAM_DIE] = Value[OVAL_WEAPON_SIZE_DAM_DIE] / 3;
        }

        if (Value[OVAL_WEAPON_CONDITION] == 0)
        {
            Value[OVAL_WEAPON_CONDITION] = INIT_WEAPON_CONDITION;
        }

        switch (Value[OVAL_WEAPON_TYPE])
        {
        case WEAPON_BLASTER:
        case WEAPON_LIGHTSABER:
        case WEAPON_VIBRO_BLADE:
        case WEAPON_FORCE_PIKE:
        case WEAPON_BOWCASTER:
            if (Value[OVAL_WEAPON_MAX_CHARGE] <= 0)
            {
                Value[OVAL_WEAPON_MAX_CHARGE] = NumberFuzzy(1000);
            }
        }

        Value[OVAL_WEAPON_CHARGE] = Value[OVAL_WEAPON_MAX_CHARGE];
        break;

    case ITEM_ARMOR:
        if (Value[OVAL_ARMOR_CONDITION] == 0)
            Value[OVAL_ARMOR_CONDITION] = Value[OVAL_ARMOR_AC];

        Timer = Value[OVAL_ARMOR_3];
        break;

    case ITEM_POTION:
    case ITEM_PILL:
        Value[OVAL_PILL_LEVEL] = NumberFuzzy(NumberFuzzy(Value[OVAL_PILL_LEVEL]));
        break;

    case ITEM_MONEY:
        Value[OVAL_MONEY_AMOUNT] = Cost;
        break;
    }
}

Object::~Object()
{

}

void Object::Add(std::shared_ptr<ExtraDescription> extraDescription)
{
    pImpl->ExtraDescriptions.push_back(extraDescription);
}

void Object::Remove(std::shared_ptr<ExtraDescription> extraDescription)
{
    pImpl->ExtraDescriptions.remove(extraDescription);
}

const std::list<std::shared_ptr<ExtraDescription>> &Object::ExtraDescriptions() const
{
    return pImpl->ExtraDescriptions;
}

const std::list<std::shared_ptr<Affect>> &Object::Affects() const
{
    return pImpl->Affects;
}

void Object::Add(std::shared_ptr<Affect> affect)
{
    pImpl->Affects.push_back(affect);
}

void Object::Remove(std::shared_ptr<Affect> affect)
{
    pImpl->Affects.remove(affect);
}

void Object::Add(std::shared_ptr<Object> object)
{
    pImpl->Objects.push_back(object);
}

void Object::Remove(std::shared_ptr<Object> object)
{
    pImpl->Objects.remove(object);
}

const std::list<std::shared_ptr<Object>> &Object::Objects() const
{
    return pImpl->Objects;
}
