#ifndef _CERIS_DATADOM_HPP_
#define _CERIS_DATADOM_HPP_

#include <string>
#include <list>
#include <memory>
#include <lua.hpp>

namespace DataDOM
{
  static constexpr int INVALID_INDEX = -1;
  static constexpr size_t MAX_BIT = 32;

  class Data
  {
  public:
    virtual ~Data();
    virtual void Write() const = 0;
    virtual void Read() = 0;

  protected:
    Data(lua_State *L, const std::string &name);
    Data(lua_State *L, int idx);
    std::string Name() const;
    int Index() const;
    lua_State *LuaState() const;

  private:
    struct Impl;
    std::unique_ptr<Impl> _pImpl;
  };

  class PrimitiveField : public Data
  {
  public:
    virtual ~PrimitiveField();
    virtual void Write() const = 0;
    virtual void Read() override;

  protected:
    PrimitiveField(lua_State *L, const std::string &name);
    virtual void AssignFromLuaToField(int idx) = 0;

  private:
    struct Impl;
    std::unique_ptr<Impl> _pImpl;
  };

  class StringField : public PrimitiveField
  {
  public:
    StringField(lua_State *L, const std::string &name, std::string &targetField);
    ~StringField();

    virtual void Write() const override;

  protected:
    virtual void AssignFromLuaToField(int idx) override;

  private:
    struct Impl;
    std::unique_ptr<Impl> _pImpl;
  };

  class CStringField : public PrimitiveField
  {
  public:
    CStringField(lua_State *L, const std::string &name, char *&targetField);
    ~CStringField();

    virtual void Write() const override;

  protected:
    virtual void AssignFromLuaToField(int idx) override;

  private:
    struct Impl;
    std::unique_ptr<Impl> _pImpl;
  };

  class IntegerField : public PrimitiveField
  {
  public:
    IntegerField(lua_State *L, const std::string &name, int &targetField);
    ~IntegerField();

    virtual void Write() const override;

  protected:
    virtual void AssignFromLuaToField(int idx) override;

  private:
    struct Impl;
    std::unique_ptr<Impl> _pImpl;
  };

  class BooleanField : public PrimitiveField
  {
  public:
    BooleanField(lua_State *L, const std::string &name, bool &targetField);
    ~BooleanField();

    virtual void Write() const override;

  protected:
    virtual void AssignFromLuaToField(int idx) override;

  private:
    struct Impl;
    std::unique_ptr<Impl> _pImpl;
  };

  class DoubleField : public PrimitiveField
  {
  public:
    DoubleField(lua_State *L, const std::string &name, double &targetField);
    ~DoubleField();

    virtual void Write() const override;

  protected:
    virtual void AssignFromLuaToField(int idx) override;

  private:
    struct Impl;
    std::unique_ptr<Impl> _pImpl;
  };

  class Table;

  class Container : public Data
  {
  public:
    virtual ~Container();

    void AddString(const std::string &name, std::string &targetField);
    void AddCString(const std::string &name, char *&targetField);
    void AddInteger(const std::string &name, int &targetField);
    void AddBoolean(const std::string &name, bool &targetField);
    void AddDouble(const std::string &name, double &targetField);
    void AddFlags(const std::string &name,
                  unsigned long &flags,
                  const std::array<const char * const, MAX_BIT> &nameArray);
    void AddFlags(const std::string &name,
                  unsigned long &flags,
                  const char * const * nameArray);
    Table *AddTable(const std::string &name) const;
    Table *AddTable(int idx) const;

  protected:
    Container(lua_State *L, const std::string &name);
    Container(lua_State *L, int idx);
    const std::list<Data*> &Children() const;

  private:
    struct Impl;
    std::unique_ptr<Impl> _pImpl;
  };

  class Table : public Container
  {
  public:
    Table(lua_State *L, const std::string &name);
    Table(lua_State *L, int idx);
    virtual ~Table();
    virtual void Write() const override;
    virtual void Read() override;

  private:
    struct Impl;
    std::unique_ptr<Impl> _pImpl;
  };

  class Flags : public Data
  {
  public:
    Flags(lua_State *L, const std::string &name,
          unsigned long &flags,
          const std::array<const char * const, MAX_BIT> &nameArray);
    Flags(lua_State *L, const std::string &name,
          unsigned long &flags,
          const char * const * nameArray);
    virtual ~Flags();
    virtual void Write() const override;
    virtual void Read() override;

  private:
    struct Impl;
    std::unique_ptr<Impl> _pImpl;
  };

  class ReadWriteDocument : public Container
  {
  public:
    ReadWriteDocument(const std::string &luaName, const std::string &filename);
    ~ReadWriteDocument();
    virtual void Write() const override;
    virtual void Read() override;

  private:
    struct Impl;
    std::unique_ptr<Impl> _pImpl;
  };

  /////////////////////////////////////////////////////////////////////
  // WriteOnly
  
  class WriteOnlyData
  {
  public:
    virtual ~WriteOnlyData();
    virtual void Write() const = 0;

  protected:
    WriteOnlyData(lua_State *L, const std::string &name);
    WriteOnlyData(lua_State *L, int idx);
    std::string Name() const;
    int Index() const;
    lua_State *LuaState() const;

  private:
    struct Impl;
    std::unique_ptr<Impl> _pImpl;
  };

  class WriteOnlyPrimitiveField : public WriteOnlyData
  {
  public:
    virtual ~WriteOnlyPrimitiveField();
    virtual void Write() const = 0;

  protected:
    WriteOnlyPrimitiveField(lua_State *L, const std::string &name);

  private:
    struct Impl;
    std::unique_ptr<Impl> _pImpl;
  };

  class WriteOnlyStringField : public WriteOnlyPrimitiveField
  {
  public:
    WriteOnlyStringField(lua_State *L, const std::string &name,
                         const std::string &targetField);
    ~WriteOnlyStringField();
    virtual void Write() const override;

  private:
    struct Impl;
    std::unique_ptr<Impl> _pImpl;
  };

  class WriteOnlyCStringField : public WriteOnlyPrimitiveField
  {
  public:
    WriteOnlyCStringField(lua_State *L, const std::string &name, const char *targetField);
    ~WriteOnlyCStringField();
    virtual void Write() const override;

  private:
    struct Impl;
    std::unique_ptr<Impl> _pImpl;
  };

  class WriteOnlyIntegerField : public WriteOnlyPrimitiveField
  {
  public:
    WriteOnlyIntegerField(lua_State *L, const std::string &name, int targetField);
    ~WriteOnlyIntegerField();
    virtual void Write() const override;

  private:
    struct Impl;
    std::unique_ptr<Impl> _pImpl;
  };

  class WriteOnlyBooleanField : public WriteOnlyPrimitiveField
  {
  public:
    WriteOnlyBooleanField(lua_State *L, const std::string &name,
                          bool targetField);
    ~WriteOnlyBooleanField();
    virtual void Write() const override;

  private:
    struct Impl;
    std::unique_ptr<Impl> _pImpl;
  };

  class WriteOnlyDoubleField : public WriteOnlyPrimitiveField
  {
  public:
    WriteOnlyDoubleField(lua_State *L, const std::string &name, double targetField);
    ~WriteOnlyDoubleField();
    virtual void Write() const override;

  private:
    struct Impl;
    std::unique_ptr<Impl> _pImpl;
  };

  class WriteOnlyTable;

  class WriteOnlyContainer : public WriteOnlyData
  {
  public:
    virtual ~WriteOnlyContainer();

    void AddString(const std::string &name, const std::string &targetField);
    void AddCString(const std::string &name, const char *targetField);
    void AddInteger(const std::string &name, int targetField);
    void AddBoolean(const std::string &name, bool targetField);
    void AddDouble(const std::string &name, double targetField);
    void AddFlags(const std::string &name,
                  unsigned long flags,
                  const std::array<const char * const, MAX_BIT> &nameArray);
    void AddFlags(const std::string &name,
                  unsigned long flags,
                  const char * const * nameArray);
    WriteOnlyTable *AddTable(const std::string &name) const;
    WriteOnlyTable *AddTable(int idx) const;

  protected:
    WriteOnlyContainer(lua_State *L, const std::string &name);
    WriteOnlyContainer(lua_State *L, int idx);
    const std::list<WriteOnlyData*> &Children() const;

  private:
    struct Impl;
    std::unique_ptr<Impl> _pImpl;
  };

  class WriteOnlyTable : public WriteOnlyContainer
  {
  public:
    WriteOnlyTable(lua_State *L, const std::string &name);
    WriteOnlyTable(lua_State *L, int idx);
    virtual ~WriteOnlyTable();
    virtual void Write() const override;

  private:
    struct Impl;
    std::unique_ptr<Impl> _pImpl;
  };

  class WriteOnlyFlags : public WriteOnlyData
  {
  public:
    WriteOnlyFlags(lua_State *L, const std::string &name,
                   unsigned long flags,
                   const std::array<const char * const, MAX_BIT> &nameArray);
    WriteOnlyFlags(lua_State *L, const std::string &name,
                   unsigned long flags,
                   const char * const * nameArray);
    virtual ~WriteOnlyFlags();
    virtual void Write() const override;

  private:
    struct Impl;
    std::unique_ptr<Impl> _pImpl;
  };

  class WriteOnlyDocument : public WriteOnlyContainer
  {
  public:
    WriteOnlyDocument(const std::string &luaName, const std::string &filename);
    ~WriteOnlyDocument();
    virtual void Write() const override;

  private:
    struct Impl;
    std::unique_ptr<Impl> _pImpl;
  };

  void AddCurrentAndMax(WriteOnlyContainer *container, const char *key,
                        long current, long max);

  template<typename T>
  void AddCurrentAndMax(WriteOnlyContainer *container, const char *key,
                        const T &structure)
  {
    AddCurrentAndMax(container, key, structure.Current, structure.Max);
  }
}

#endif
