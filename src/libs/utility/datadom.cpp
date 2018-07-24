#include <list>
#include <cassert>
#include "datadom.hpp"

extern "C" void Bug( const char *str, ... );

namespace DataDOM
{

  //////////////////////////////////////////////////////////
  // Data
  struct Data::Impl
  {
    Impl(lua_State *L, const std::string &name)
      : _luaState(L),
        _name(name)
    {

    }

    lua_State *_luaState;
    std::string _name;
  };

  Data::Data(lua_State *L, const std::string &name)
    : _pImpl(std::make_unique<Impl>(L, name))
  {

  }

  Data::~Data()
  {

  }

  lua_State *Data::LuaState() const
  {
    return _pImpl->_luaState;
  }

  std::string Data::Name() const
  {
    return _pImpl->_name;
  }

  ////////////////////////////////////////////////////////////////
  // Field

  struct PrimitiveField::Impl
  {

  };

  PrimitiveField::PrimitiveField(lua_State *L, const std::string &name)
    : Data(L, name),
      _pImpl(std::make_unique<Impl>())
  {
    assert(L != nullptr);
  }

  PrimitiveField::~PrimitiveField()
  {

  }

  void PrimitiveField::Get()
  {
    int idx = lua_gettop(LuaState());
    const int topAtStart = idx;
    lua_getfield(LuaState(), idx, Name().c_str());

    int elementsToPop = lua_gettop(LuaState()) - topAtStart;

    if(!lua_isnil(LuaState(), ++idx))
      {
        AssignFromLuaToField(idx);
      }

    lua_pop(LuaState(), elementsToPop);
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

  StringField::StringField(lua_State *L,
                           const std::string &name,
                           std::string &targetField)
    : PrimitiveField(L, name),
      _pImpl(std::make_unique<Impl>(targetField))
  {

  }

  StringField::~StringField()
  {

  }

  void StringField::Push() const
  {
    lua_pushstring(LuaState(), _pImpl->_targetField.c_str());
    lua_setfield(LuaState(), -2, Name().c_str());
  }

  void StringField::AssignFromLuaToField(int idx)
  {
    _pImpl->_targetField = lua_tostring(LuaState(), idx);
  }

  ///////////////////////////////////////////////////
  // IntegerField
  struct IntegerField::Impl
  {
    Impl(int &targetField)
      : _targetField(targetField)
    {

    }

    int &_targetField;
  };

  IntegerField::IntegerField(lua_State *L,
                             const std::string &name,
                             int &targetField)
    : PrimitiveField(L, name),
      _pImpl(std::make_unique<Impl>(targetField))
  {

  }

  IntegerField::~IntegerField()
  {

  }

  void IntegerField::Push() const
  {
    lua_pushinteger(LuaState(), _pImpl->_targetField);
    lua_setfield(LuaState(), -2, Name().c_str());
  }

  void IntegerField::AssignFromLuaToField(int idx)
  {
    _pImpl->_targetField = lua_tointeger(LuaState(), idx);
  }

  ///////////////////////////////////////////////////
  // BooleanField
  struct BooleanField::Impl
  {
    Impl(bool &targetField)
      : _targetField(targetField)
    {

    }

    bool &_targetField;
  };

  BooleanField::BooleanField(lua_State *L,
                             const std::string &name,
                             bool &targetField)
    : PrimitiveField(L, name),
      _pImpl(std::make_unique<Impl>(targetField))
  {

  }

  BooleanField::~BooleanField()
  {

  }

  void BooleanField::Push() const
  {
    lua_pushboolean(LuaState(), _pImpl->_targetField);
    lua_setfield(LuaState(), -2, Name().c_str());
  }

  void BooleanField::AssignFromLuaToField(int idx)
  {
    _pImpl->_targetField = lua_toboolean(LuaState(), idx);
  }

  ///////////////////////////////////////////////////
  // DoubleField
  struct DoubleField::Impl
  {
    Impl(double &targetField)
      : _targetField(targetField)
    {

    }

    double &_targetField;
  };

  DoubleField::DoubleField(lua_State *L,
                           const std::string &name,
                           double &targetField)
    : PrimitiveField(L, name),
      _pImpl(std::make_unique<Impl>(targetField))
  {

  }

  DoubleField::~DoubleField()
  {

  }

  void DoubleField::Push() const
  {
    lua_pushnumber(LuaState(), _pImpl->_targetField);
    lua_setfield(LuaState(), -2, Name().c_str());
  }

  void DoubleField::AssignFromLuaToField(int idx)
  {
    _pImpl->_targetField = lua_tonumber(LuaState(), idx);
  }

  ////////////////////////////////////////////////////////
  // Table
  struct Table::Impl
  {
    std::list<Data*> Children;
  };

  Table::Table(lua_State *L, const std::string &name)
    : Data(L, name),
      _pImpl(std::make_unique<Impl>())
  {

  }

  Table::~Table()
  {
    for(Data *data : _pImpl->Children)
      {
        delete data;
      }
  }

  void Table::Add(Data *data)
  {
    _pImpl->Children.push_back(data);
  }

  void Table::Push() const
  {
    lua_pushstring(LuaState(), Name().c_str());
    lua_newtable(LuaState());

    for(Data *data : _pImpl->Children)
      {
        data->Push();
      }

    lua_settable(LuaState(), -3);
  }

  void Table::Get()
  {

  }

  ////////////////////////////////////////////////////////
  // LuaDocument
  struct LuaDocument::Impl
  {
    Impl(lua_State *L, const std::string &luaName, const std::string &filename)
      : LuaState(L),
        LuaName(luaName),
        Filename(filename)
    {

    }

    lua_State *LuaState = nullptr;
    std::string LuaName;
    std::string Filename;
    std::list<Data*> Children;
  };

  LuaDocument::LuaDocument(lua_State *L, const std::string &luaName, const std::string &filename)
    : _pImpl(std::make_unique<Impl>(L, luaName, filename))
  {

  }

  LuaDocument::~LuaDocument()
  {
    for(Data *data : _pImpl->Children)
      {
        delete data;
      }
  }

  void LuaDocument::Add(Data *data)
  {
    _pImpl->Children.push_back(data);
  }

  void LuaDocument::Save() const
  {
    // Push data
    lua_pushinteger(_pImpl->LuaState, 1);
    lua_newtable(_pImpl->LuaState);

    for(Data *data : _pImpl->Children)
      {
        data->Push();
      }

    lua_setglobal(_pImpl->LuaState, _pImpl->LuaName.c_str());

    //
    //char buffer[MAX_STRING_LENGTH];
    //sprintf( buffer, "%ssavers.lua", SCRIPT_DIR );
    int error = luaL_dofile(_pImpl->LuaState, "savers.lua");

    if(error != 0)
      {
        Bug("%s:%s():%d: Cannot run file: %s\n",
            __FILE__, __FUNCTION__, __LINE__, lua_tostring(_pImpl->LuaState, -1));
      }
    else
      {
        char buffer[256];
        sprintf(buffer, "save%s", _pImpl->LuaName.c_str());
        lua_getfield(_pImpl->LuaState, -1, buffer);
        lua_getglobal(_pImpl->LuaState, _pImpl->LuaName.c_str());
        lua_pushstring(_pImpl->LuaState, _pImpl->Filename.c_str());

        error = lua_pcall(_pImpl->LuaState, 2, 0, 0);

        if(error != 0)
          {
            Bug("%s:%s():%d: Cannot run file: %s\n",
                __FILE__, __FUNCTION__, __LINE__, lua_tostring(_pImpl->LuaState, -1));
          }
      }

    lua_close(_pImpl->LuaState);
  }

  void LuaDocument::Load()
  {
    for(Data *data : _pImpl->Children)
      {
        data->Get();
      }
  }
} // namespace DataDOM
