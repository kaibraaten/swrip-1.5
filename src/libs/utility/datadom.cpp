#include <cassert>
#include "datadom.hpp"

namespace DataDOM
{

////////////////////////////////////////////////////////////////
// Field

  struct Field::Impl
  {
    Impl(const std::string &name)
      : _name(name)
    {

    }

    std::string _name;
  };

  Field::Field(const std::string &name)
    : _pImpl(std::make_unique<Impl>(name))
  {

  }

  Field::~Field()
  {

  }

  std::string Field::Name() const
  {
    return _pImpl->_name;
  }

/////////////////////////////////////////////////////////////////
// StringField

  struct StringField::Impl
  {
    Impl(std::string &targetField)
      : _targetField(targetField)
    {

    }

    std::string &_targetField;
  };

  StringField::StringField(const std::string &name, std::string &targetField)
    : Field(name),
      _pImpl(std::make_unique<Impl>(targetField))
  {

  }

  StringField::~StringField()
  {

  }

  void StringField::Push(lua_State *L) const
  {
    lua_pushstring( L, _pImpl->_targetField.c_str() );
    lua_setfield( L, -2, Name().c_str() );
  }

  void StringField::Get(lua_State *L, int idx)
  {
    assert(L != nullptr);
    _pImpl->_targetField = lua_tostring(L, idx);
  }
} // namespace DataDOM
