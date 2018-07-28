#include <iostream>
#include <list>
#include <cassert>
#include "utility.hpp"
#include "datadom.hpp"

extern "C" void Bug( const char *str, ... );
#define SCRIPT_DIR      "./scripts/"

namespace DataDOM
{
  static void SetLuaPath( lua_State *L )
  {
    char path[MAX_STRING_LENGTH];
    sprintf( path, "%s?.lua;;", SCRIPT_DIR );
    lua_getglobal( L, "package" );
    lua_pushstring( L, path );
    lua_setfield( L, -2, "path" );
    lua_pop( L, 1 );
  }

  static lua_State *CreateLuaState( void )
  {
    lua_State *L = luaL_newstate();
    luaL_openlibs( L );
    SetLuaPath( L );

    return L;
  }

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

  void PrimitiveField::Read()
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

  void StringField::Write() const
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
    Impl(char *&targetField)
      : _targetField(targetField)
    {

    }

    char *&_targetField;
  };

  CStringField::CStringField(lua_State *L,
                             const std::string &name,
                             char *&targetField)
    : PrimitiveField(L, name),
      _pImpl(std::make_unique<Impl>(targetField))
  {

  }

  CStringField::~CStringField()
  {

  }

  void CStringField::Write() const
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

  void IntegerField::Write() const
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

  void BooleanField::Write() const
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

  void DoubleField::Write() const
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

  void Table::Write() const
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
        data->Write();
      }

    lua_settable(LuaState(), -3);
  }

  void Table::Read()
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

  void Flags::Write() const
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

  void Flags::Read()
  {

  }

  ////////////////////////////////////////////////////////
  // ReadWriteDocument
  struct ReadWriteDocument::Impl
  {
    Impl(lua_State *L, const std::string &luaName, const std::string &filename)
      : LuaState(L),
        LuaName(luaName),
        Filename(filename)
    {

    }

    ~Impl()
    {
      lua_close(LuaState);
    }

    lua_State *LuaState = nullptr;
    std::string LuaName;
    std::string Filename;
  };

  ReadWriteDocument::ReadWriteDocument(const std::string &luaName, const std::string &filename)
    : Container(CreateLuaState(), luaName),
      _pImpl(std::make_unique<Impl>(LuaState(), luaName, filename))
  {

  }

  ReadWriteDocument::~ReadWriteDocument()
  {

  }

  void ReadWriteDocument::Write() const
  {
    // Write/push data
    lua_pushinteger(_pImpl->LuaState, 1);
    lua_newtable(_pImpl->LuaState);

    for(Data *data : Children())
      {
        data->Write();
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
  }

  void ReadWriteDocument::Read()
  {
    for(Data *data : Children())
      {
        data->Read();
      }
  }

  ////////////////////////////////////////////////////////////
  // Container
  struct Container::Impl
  {
    void Add(Data *data)
    {
      _children.push_back(data);
    }

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

  Table *Container::AddTable(const std::string &name) const
  {
    Table *table = new Table(LuaState(), name);
    _pImpl->Add(table);
    return table;
  }

  Table *Container::AddTable(int idx) const
  {
    Table *table = new Table(LuaState(), idx);
    _pImpl->Add(table);
    return table;
  }

  void Container::AddString(const std::string &name, std::string &targetField)
  {
    _pImpl->Add(new StringField(LuaState(), name, targetField));
  }

  void Container::AddCString(const std::string &name, char *&targetField)
  {
    _pImpl->Add(new CStringField(LuaState(), name, targetField));
  }

  void Container::AddInteger(const std::string &name, int &targetField)
  {
    _pImpl->Add(new IntegerField(LuaState(), name, targetField));
  }

  void Container::AddBoolean(const std::string &name, bool &targetField)
  {
    _pImpl->Add(new BooleanField(LuaState(), name, targetField));
  }

  void Container::AddDouble(const std::string &name, double &targetField)
  {
    _pImpl->Add(new DoubleField(LuaState(), name, targetField));
  }

  void Container::AddFlags(const std::string &name,
                           unsigned long &flags,
                           const std::array<const char * const, MAX_BIT> &nameArray)
  {
    _pImpl->Add(new Flags(LuaState(), name, flags, nameArray));
  }

  void Container::AddFlags(const std::string &name,
                           unsigned long &flags,
                           const char * const * nameArray)
  {
    _pImpl->Add(new Flags(LuaState(), name, flags, nameArray));
  }

  const std::list<Data*> &Container::Children() const
  {
    return _pImpl->_children;
  }

  //////////////////////////////////////////////////////////
  // WriteOnlyData
  struct WriteOnlyData::Impl
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

  WriteOnlyData::WriteOnlyData(lua_State *L, const std::string &name)
    : _pImpl(std::make_unique<Impl>(L, name))
  {

  }

  WriteOnlyData::WriteOnlyData(lua_State *L, int idx)
    : _pImpl(std::make_unique<Impl>(L, idx))
  {

  }

  WriteOnlyData::~WriteOnlyData()
  {

  }

  lua_State *WriteOnlyData::LuaState() const
  {
    return _pImpl->_luaState;
  }

  std::string WriteOnlyData::Name() const
  {
    return _pImpl->_name;
  }

  int WriteOnlyData::Index() const
  {
    return _pImpl->_index;
  }
  
  ////////////////////////////////////////////////////////////////
  // WriteOnlyPrimitiveField
  struct WriteOnlyPrimitiveField::Impl
  {

  };

  WriteOnlyPrimitiveField::WriteOnlyPrimitiveField(lua_State *L, const std::string &name)
    : WriteOnlyData(L, name),
      _pImpl(std::make_unique<Impl>())
  {
    assert(L != nullptr);
  }

  WriteOnlyPrimitiveField::~WriteOnlyPrimitiveField()
  {

  }

  /////////////////////////////////////////////////////////////////
  // WriteOnlyStringField
  struct WriteOnlyStringField::Impl
  {
    Impl(const std::string &targetField)
      : _targetField(targetField)
    {

    }

    std::string _targetField;
  };

  WriteOnlyStringField::WriteOnlyStringField(lua_State *L,
                                             const std::string &name,
                                             const std::string &targetField)
    : WriteOnlyPrimitiveField(L, name),
      _pImpl(std::make_unique<Impl>(targetField))
  {

  }

  WriteOnlyStringField::~WriteOnlyStringField()
  {

  }

  void WriteOnlyStringField::Write() const
  {
    lua_pushstring(LuaState(), _pImpl->_targetField.c_str());
    lua_setfield(LuaState(), -2, Name().c_str());
  }

  /////////////////////////////////////////////////////////////////
  // WriteOnlyCStringField
  struct WriteOnlyCStringField::Impl
  {
    Impl(const char *targetField)
      : _targetField(targetField)
    {

    }

    const char *_targetField;
  };

  WriteOnlyCStringField::WriteOnlyCStringField(lua_State *L,
                                               const std::string &name,
                                               const char *targetField)
    : WriteOnlyPrimitiveField(L, name),
      _pImpl(std::make_unique<Impl>(targetField))
  {

  }

  WriteOnlyCStringField::~WriteOnlyCStringField()
  {

  }

  void WriteOnlyCStringField::Write() const
  {
    lua_pushstring(LuaState(), _pImpl->_targetField);
    lua_setfield(LuaState(), -2, Name().c_str());
  }

  ///////////////////////////////////////////////////
  // IntegerField
  struct WriteOnlyIntegerField::Impl
  {
    Impl(int targetField)
      : _targetField(targetField)
    {

    }

    int _targetField;
  };

  WriteOnlyIntegerField::WriteOnlyIntegerField(lua_State *L,
                                               const std::string &name,
                                               int targetField)
    : WriteOnlyPrimitiveField(L, name),
      _pImpl(std::make_unique<Impl>(targetField))
  {

  }

  WriteOnlyIntegerField::~WriteOnlyIntegerField()
  {

  }

  void WriteOnlyIntegerField::Write() const
  {
    lua_pushinteger(LuaState(), _pImpl->_targetField);
    lua_setfield(LuaState(), -2, Name().c_str());
  }

  ///////////////////////////////////////////////////
  // WriteOnlyBooleanField
  struct WriteOnlyBooleanField::Impl
  {
    Impl(bool targetField)
      : _targetField(targetField)
    {

    }

    bool _targetField;
  };

  WriteOnlyBooleanField::WriteOnlyBooleanField(lua_State *L,
                                               const std::string &name,
                                               bool targetField)
    : WriteOnlyPrimitiveField(L, name),
      _pImpl(std::make_unique<Impl>(targetField))
  {

  }

  WriteOnlyBooleanField::~WriteOnlyBooleanField()
  {

  }

  void WriteOnlyBooleanField::Write() const
  {
    lua_pushboolean(LuaState(), _pImpl->_targetField);
    lua_setfield(LuaState(), -2, Name().c_str());
  }

  ///////////////////////////////////////////////////
  // WriteOnlyDoubleField
  struct WriteOnlyDoubleField::Impl
  {
    Impl(double targetField)
      : _targetField(targetField)
    {

    }

    double _targetField;
  };

  WriteOnlyDoubleField::WriteOnlyDoubleField(lua_State *L,
                                             const std::string &name,
                                             double targetField)
    : WriteOnlyPrimitiveField(L, name),
      _pImpl(std::make_unique<Impl>(targetField))
  {

  }

  WriteOnlyDoubleField::~WriteOnlyDoubleField()
  {

  }

  void WriteOnlyDoubleField::Write() const
  {
    lua_pushnumber(LuaState(), _pImpl->_targetField);
    lua_setfield(LuaState(), -2, Name().c_str());
  }

  ////////////////////////////////////////////////////////
  // WriteOnlyTable
  struct WriteOnlyTable::Impl
  {

  };

  WriteOnlyTable::WriteOnlyTable(lua_State *L, const std::string &name)
    : WriteOnlyContainer(L, name),
      _pImpl(std::make_unique<Impl>())
  {

  }

  WriteOnlyTable::WriteOnlyTable(lua_State *L, int idx)
    : WriteOnlyContainer(L, idx),
      _pImpl(std::make_unique<Impl>())
  {

  }

  WriteOnlyTable::~WriteOnlyTable()
  {

  }

  void WriteOnlyTable::Write() const
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

    for(WriteOnlyData *data : Children())
      {
        data->Write();
      }

    lua_settable(LuaState(), -3);
  }

  ////////////////////////////////////////////////////////
  // WriteOnlyFlags
  struct WriteOnlyFlags::Impl
  {
    Impl(unsigned long flags, const char * const * nameArray)
      : Flags(flags),
        NameArray(nameArray)
    {

    }

    unsigned long Flags;
    const char * const * NameArray;
  };


  WriteOnlyFlags::WriteOnlyFlags(lua_State *L, const std::string &name,
                                 unsigned long flags,
                                 const std::array<const char * const, MAX_BIT> &nameArray)
    : WriteOnlyData(L, name),
      _pImpl(std::make_unique<Impl>(flags, nameArray.data()))
  {

  }

  WriteOnlyFlags::WriteOnlyFlags(lua_State *L, const std::string &name,
                                 unsigned long flags,
                                 const char * const nameArray[])
    : WriteOnlyData(L, name),
      _pImpl(std::make_unique<Impl>(flags, nameArray))
  {

  }

  WriteOnlyFlags::~WriteOnlyFlags()
  {

  }

  void WriteOnlyFlags::Write() const
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

  ////////////////////////////////////////////////////////
  // WriteOnlyDocument
  struct WriteOnlyDocument::Impl
  {
    Impl(lua_State *L, const std::string &luaName, const std::string &filename)
      : LuaState(L),
        LuaName(luaName),
        Filename(filename)
    {

    }

    ~Impl()
    {
      lua_close(LuaState);
    }

    lua_State *LuaState = nullptr;
    std::string LuaName;
    std::string Filename;
  };

  WriteOnlyDocument::WriteOnlyDocument(const std::string &luaName, const std::string &filename)
    : WriteOnlyContainer(CreateLuaState(), luaName),
      _pImpl(std::make_unique<Impl>(LuaState(), luaName, filename))
  {

  }

  WriteOnlyDocument::~WriteOnlyDocument()
  {

  }

  void WriteOnlyDocument::Write() const
  {
    // Write/push data
    lua_pushinteger(_pImpl->LuaState, 1);
    lua_newtable(_pImpl->LuaState);

    for(WriteOnlyData *data : Children())
      {
        data->Write();
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
  }

  ////////////////////////////////////////////////////////////
  // WriteOnlyContainer
  struct WriteOnlyContainer::Impl
  {
    void Add(WriteOnlyData *data)
    {
      _children.push_back(data);
    }

    std::list<WriteOnlyData*> _children;
  };

  WriteOnlyContainer::WriteOnlyContainer(lua_State *L, const std::string &name)
    : WriteOnlyData(L, name),
      _pImpl(std::make_unique<Impl>())
  {

  }

  WriteOnlyContainer::WriteOnlyContainer(lua_State *L, int idx)
    : WriteOnlyData(L, idx),
      _pImpl(std::make_unique<Impl>())
  {

  }

  WriteOnlyContainer::~WriteOnlyContainer()
  {
    for(WriteOnlyData *data : _pImpl->_children)
      {
        delete data;
      }
  }

  WriteOnlyTable *WriteOnlyContainer::AddTable(const std::string &name) const
  {
    WriteOnlyTable *table = new WriteOnlyTable(LuaState(), name);
    _pImpl->Add(table);
    return table;
  }

  WriteOnlyTable *WriteOnlyContainer::AddTable(int idx) const
  {
    WriteOnlyTable *table = new WriteOnlyTable(LuaState(), idx);
    _pImpl->Add(table);
    return table;
  }

  void WriteOnlyContainer::AddString(const std::string &name, const std::string &targetField)
  {
    _pImpl->Add(new WriteOnlyStringField(LuaState(), name, targetField));
  }

  void WriteOnlyContainer::AddCString(const std::string &name, const char *targetField)
  {
    _pImpl->Add(new WriteOnlyCStringField(LuaState(), name, targetField));
  }

  void WriteOnlyContainer::AddInteger(const std::string &name, int targetField)
  {
    _pImpl->Add(new WriteOnlyIntegerField(LuaState(), name, targetField));
  }

  void WriteOnlyContainer::AddBoolean(const std::string &name, bool targetField)
  {
    _pImpl->Add(new WriteOnlyBooleanField(LuaState(), name, targetField));
  }

  void WriteOnlyContainer::AddDouble(const std::string &name, double targetField)
  {
    _pImpl->Add(new WriteOnlyDoubleField(LuaState(), name, targetField));
  }

  void WriteOnlyContainer::AddFlags(const std::string &name,
                                    unsigned long flags,
                                    const std::array<const char * const, MAX_BIT> &nameArray)
  {
    _pImpl->Add(new WriteOnlyFlags(LuaState(), name, flags, nameArray));
  }

  void WriteOnlyContainer::AddFlags(const std::string &name,
                                    unsigned long flags,
                                    const char * const * nameArray)
  {
    _pImpl->Add(new WriteOnlyFlags(LuaState(), name, flags, nameArray));
  }

  const std::list<WriteOnlyData*> &WriteOnlyContainer::Children() const
  {
    return _pImpl->_children;
  }

  /////////////////////////////////////////////////////////

  void AddCurrentAndMax(DataDOM::WriteOnlyContainer *container, const char *key,
                        long current, long max)
  {
    auto table = container->AddTable(key);
    table->AddInteger("Current", current);
    table->AddInteger("Max", max);
  }

} // namespace DataDOM
