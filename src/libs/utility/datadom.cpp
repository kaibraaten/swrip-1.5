#include <iostream>
#include <list>
#include <cassert>
#include "utility.hpp"
#include "datadom.hpp"

extern "C" void Bug( const char *str, ... );
#define SCRIPT_DIR      "./scripts/"

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

    Impl(lua_State *L, int idx)
      : _luaState(L),
        _index(idx)
    {

    }

    lua_State *_luaState;
    std::string _name;
    int _index = INVALID_INDEX;
  };

  Data::Data(lua_State *L, const std::string &name)
    : _pImpl(std::make_unique<Impl>(L, name))
  {

  }

  Data::Data(lua_State *L, int idx)
    : _pImpl(std::make_unique<Impl>(L, idx))
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

  int Data::Index() const
  {
    return _pImpl->_index;
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

  /////////////////////////////////////////////////////////////////
  // CStringField
  struct CStringField::Impl
  {
    Impl(const char *&targetField)
      : _targetField(targetField)
    {

    }

    const char *&_targetField;
  };

  CStringField::CStringField(lua_State *L,
                             const std::string &name,
                             const char *&targetField)
    : PrimitiveField(L, name),
      _pImpl(std::make_unique<Impl>(targetField))
  {

  }

  CStringField::~CStringField()
  {

  }

  void CStringField::Push() const
  {
    lua_pushstring(LuaState(), _pImpl->_targetField);
    lua_setfield(LuaState(), -2, Name().c_str());
  }

  void CStringField::AssignFromLuaToField(int idx)
  {
    _pImpl->_targetField = CopyString(lua_tostring(LuaState(), idx));
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

  };

  Table::Table(lua_State *L, const std::string &name)
    : Container(L, name),
      _pImpl(std::make_unique<Impl>())
  {

  }

  Table::Table(lua_State *L, int idx)
    : Container(L, idx),
      _pImpl(std::make_unique<Impl>())
  {

  }

  Table::~Table()
  {

  }

  void Table::Push() const
  {
    if(Index() != INVALID_INDEX)
      {
        lua_pushinteger(LuaState(), Index());
      }
    else
      {
        lua_pushstring(LuaState(), Name().c_str());
      }

    lua_newtable(LuaState());

    for(Data *data : Children())
      {
        data->Push();
      }

    lua_settable(LuaState(), -3);
  }

  void Table::Get()
  {

  }

  ////////////////////////////////////////////////////////
  // Flags
  struct Flags::Impl
  {
    Impl(unsigned long &flags, const char * const * nameArray)
      : Flags(flags),
        NameArray(nameArray)
    {

    }

    unsigned long &Flags;
    const char * const * NameArray;
  };


  Flags::Flags(lua_State *L, const std::string &name,
               unsigned long &flags,
               const std::array<const char * const, MAX_BIT> &nameArray)
    : Data(L, name),
      _pImpl(std::make_unique<Impl>(flags, nameArray.data()))
  {

  }

  Flags::Flags(lua_State *L, const std::string &name,
               unsigned long &flags,
               const char * const nameArray[])
    : Data(L, name),
      _pImpl(std::make_unique<Impl>(flags, nameArray))
  {

  }

  Flags::~Flags()
  {

  }

  void Flags::Push() const
  {
    lua_pushstring(LuaState(), Name().c_str());
    lua_newtable(LuaState());

    for(size_t bit = 0; bit < MAX_BIT; ++bit)
      {
        unsigned long mask = 1 << bit;

        if(IsBitSet(_pImpl->Flags, mask))
          {
            lua_pushinteger(LuaState(), bit);
            lua_pushstring(LuaState(), _pImpl->NameArray[bit]);
            lua_settable(LuaState(), -3);
          }
      }

    lua_settable(LuaState(), -3);
  }

  void Flags::Get()
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
  };

  LuaDocument::LuaDocument(lua_State *L, const std::string &luaName, const std::string &filename)
    : Container(L, luaName),
      _pImpl(std::make_unique<Impl>(L, luaName, filename))
  {

  }

  LuaDocument::~LuaDocument()
  {

  }

  void LuaDocument::Save() const
  {
    // Push data
    lua_pushinteger(_pImpl->LuaState, 1);
    lua_newtable(_pImpl->LuaState);

    for(Data *data : Children())
      {
        data->Push();
      }

    lua_setglobal(_pImpl->LuaState, _pImpl->LuaName.c_str());

    char saverScript[MAX_STRING_LENGTH];
    sprintf(saverScript, "%ssavers.lua", SCRIPT_DIR);
    int error = luaL_dofile(_pImpl->LuaState, saverScript);

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
    for(Data *data : Children())
      {
        data->Get();
      }
  }

  Table *LuaDocument::CreateTable(const std::string &name) const
  {
    return new Table(_pImpl->LuaState, name);
  }

  Table *LuaDocument::CreateTable(int idx) const
  {
    return new Table(_pImpl->LuaState, idx);
  }

  ////////////////////////////////////////////////////////////
  // Container
  struct Container::Impl
  {
    std::list<Data*> _children;
  };

  Container::Container(lua_State *L, const std::string &name)
    : Data(L, name),
      _pImpl(std::make_unique<Impl>())
  {

  }

  Container::Container(lua_State *L, int idx)
    : Data(L, idx),
      _pImpl(std::make_unique<Impl>())
  {

  }

  Container::~Container()
  {
    for(Data *data : _pImpl->_children)
      {
        delete data;
      }
  }

  void Container::Add(Data *data)
  {
    _pImpl->_children.push_back(data);
  }

  void Container::AddString(const std::string &name, std::string &targetField)
  {
    Add(new StringField(LuaState(), name, targetField));
  }

  void Container::AddCString(const std::string &name, const char *&targetField)
  {
    Add(new CStringField(LuaState(), name, targetField));
  }

  void Container::AddInteger(const std::string &name, int &targetField)
  {
    Add(new IntegerField(LuaState(), name, targetField));
  }

  void Container::AddBoolean(const std::string &name, bool &targetField)
  {
    Add(new BooleanField(LuaState(), name, targetField));
  }

  void Container::AddDouble(const std::string &name, double &targetField)
  {
    Add(new DoubleField(LuaState(), name, targetField));
  }

  void Container::AddFlags(const std::string &name,
                           unsigned long &flags,
                           const std::array<const char * const, MAX_BIT> &nameArray)
  {
    Add(new Flags(LuaState(), name, flags, nameArray));
  }

  void Container::AddFlags(const std::string &name,
                           unsigned long &flags,
                           const char * const * nameArray)
  {
    Add(new Flags(LuaState(), name, flags, nameArray));
  }

  const std::list<Data*> &Container::Children() const
  {
    return _pImpl->_children;
  }
} // namespace DataDOM
