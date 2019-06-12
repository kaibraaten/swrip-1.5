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
  std::list<Object*> Objects;
};

Object::Object()
  : pImpl(std::make_unique<Impl>())
{
  Value.fill(0);
}

Object::Object(ProtoObject *pObjIndex, int level)
    : pImpl(std::make_unique<Impl>())
{
  Value.fill(0);

  Object *obj = this;

  obj->Prototype       = pObjIndex;
  obj->Level            = level;
  cur_obj_serial = umax((cur_obj_serial + 1 ) & (BV30-1), 1);
  obj->Serial = obj->Prototype->Serial = cur_obj_serial;

  obj->Name             = pObjIndex->Name;
  obj->ShortDescr      = pObjIndex->ShortDescr;
  obj->Description      = pObjIndex->Description;
  obj->ActionDescription = pObjIndex->ActionDescription;
  obj->ItemType        = pObjIndex->ItemType;
  obj->Flags      = pObjIndex->Flags;
  obj->WearFlags       = pObjIndex->WearFlags;

  for( int oval = 0; oval < MAX_OVAL; ++oval )
    {
      obj->Value[oval] = pObjIndex->Value[oval];
    }

  obj->Weight           = pObjIndex->Weight;
  obj->Cost             = pObjIndex->Cost;

  /*
   * Mess with object properties.
   */
  switch ( obj->ItemType )
    {
    default:
      Log->Bug( "%s: vnum %ld bad type.", __FUNCTION__, pObjIndex->Vnum );
      Log->Bug( "------------------------>  %d", obj->ItemType );
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
      if ( obj->Value[OVAL_FOOD_OPTIONAL_INITIAL_CONDITION] )
        {
          obj->Timer = obj->Value[OVAL_FOOD_OPTIONAL_INITIAL_CONDITION];
        }
      else
        {
          obj->Timer = obj->Value[OVAL_FOOD_MAX_CONDITION];
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
      obj->Value[OVAL_SALVE_DELAY] = NumberFuzzy( obj->Value[OVAL_SALVE_DELAY] );
      break;

    case ITEM_DEVICE:
      obj->Value[OVAL_DEVICE_LEVEL] = NumberFuzzy( obj->Value[OVAL_DEVICE_LEVEL] );
      obj->Value[OVAL_DEVICE_MAX_CHARGES] = NumberFuzzy( obj->Value[OVAL_DEVICE_MAX_CHARGES] );
      break;

    case ITEM_BATTERY:
      if ( obj->Value[OVAL_BATTERY_CHARGE] <= 0 )
        obj->Value[OVAL_BATTERY_CHARGE] = NumberFuzzy(95);

      break;


    case ITEM_BOLT:
      if ( obj->Value[OVAL_BOLT_CHARGE] <= 0 )
        obj->Value[OVAL_BOLT_CHARGE] = NumberFuzzy(95);

      break;

    case ITEM_AMMO:
      if ( obj->Value[OVAL_AMMO_CHARGE] <=0 )
        obj->Value[OVAL_AMMO_CHARGE] = NumberFuzzy(495);

      break;

    case ITEM_WEAPON:
      if ( obj->Value[OVAL_WEAPON_NUM_DAM_DIE] && obj->Value[OVAL_WEAPON_SIZE_DAM_DIE] )
        {
          obj->Value[OVAL_WEAPON_SIZE_DAM_DIE] *= obj->Value[OVAL_WEAPON_NUM_DAM_DIE];
        }
      else
        {
          obj->Value[OVAL_WEAPON_NUM_DAM_DIE] = NumberFuzzy( NumberFuzzy( 1 + level/20 ) );
          obj->Value[OVAL_WEAPON_SIZE_DAM_DIE] = NumberFuzzy( NumberFuzzy( 10 + level/10 ) );
        }

      if ( obj->Value[OVAL_WEAPON_NUM_DAM_DIE] > obj->Value[OVAL_WEAPON_SIZE_DAM_DIE] )
        {
          obj->Value[OVAL_WEAPON_NUM_DAM_DIE] = obj->Value[OVAL_WEAPON_SIZE_DAM_DIE] / 3;
        }

      if (obj->Value[OVAL_WEAPON_CONDITION] == 0)
        {
           obj->Value[OVAL_WEAPON_CONDITION] = INIT_WEAPON_CONDITION;
        }

      switch (obj->Value[OVAL_WEAPON_TYPE])
        {
        case WEAPON_BLASTER:
        case WEAPON_LIGHTSABER:
        case WEAPON_VIBRO_BLADE:
        case WEAPON_FORCE_PIKE:
        case WEAPON_BOWCASTER:
          if ( obj->Value[OVAL_WEAPON_MAX_CHARGE] <=0 )
            {
              obj->Value[OVAL_WEAPON_MAX_CHARGE] = NumberFuzzy(1000);
            }
        }

      obj->Value[OVAL_WEAPON_CHARGE] = obj->Value[OVAL_WEAPON_MAX_CHARGE];
      break;

    case ITEM_ARMOR:
      if (obj->Value[OVAL_ARMOR_CONDITION] == 0)
        obj->Value[OVAL_ARMOR_CONDITION] = obj->Value[OVAL_ARMOR_AC];

      obj->Timer = obj->Value[OVAL_ARMOR_3];
      break;

    case ITEM_POTION:
      case ITEM_PILL:
      obj->Value[OVAL_PILL_LEVEL] = NumberFuzzy( NumberFuzzy( obj->Value[OVAL_PILL_LEVEL] ) );
      break;

    case ITEM_MONEY:
      obj->Value[OVAL_MONEY_AMOUNT] = obj->Cost;
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

void Object::Add(Object *object)
{
  pImpl->Objects.push_back(object);
}

void Object::Remove(Object *object)
{
  pImpl->Objects.remove(object);
}

const std::list<Object*> &Object::Objects() const
{
  return pImpl->Objects;
}
