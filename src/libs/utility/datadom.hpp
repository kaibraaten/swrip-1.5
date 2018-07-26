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
    virtual void Push() const = 0;
    virtual void Get() = 0;

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
    virtual void Push() const = 0;
    virtual void Get() override;

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

    virtual void Push() const override;

  protected:
    virtual void AssignFromLuaToField(int idx) override;

  private:
    struct Impl;
    std::unique_ptr<Impl> _pImpl;
  };

  class CStringField : public PrimitiveField
  {
  public:
    CStringField(lua_State *L, const std::string &name, const char * const &targetField);
    ~CStringField();

    virtual void Push() const override;

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

    virtual void Push() const override;

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

    virtual void Push() const override;

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

    virtual void Push() const override;

  protected:
    virtual void AssignFromLuaToField(int idx) override;

  private:
    struct Impl;
    std::unique_ptr<Impl> _pImpl;
  };

  class Container : public Data
  {
  public:
    virtual ~Container();

    void Add(Data *data);
    void AddString(const std::string &name, std::string &targetField);
    void AddCString(const std::string &name, const char *const &targetField);
    void AddInteger(const std::string &name, int &targetField);
    void AddBoolean(const std::string &name, bool &targetField);
    void AddDouble(const std::string &name, double &targetField);
    void AddFlags(const std::string &name,
                  unsigned long &flags,
                  const std::array<const char * const, MAX_BIT> &nameArray);
    void AddFlags(const std::string &name,
                  unsigned long &flags,
                  const char * const * nameArray);

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
    virtual void Push() const override;
    virtual void Get() override;

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
    virtual void Push() const override;
    virtual void Get() override;

  private:
    struct Impl;
    std::unique_ptr<Impl> _pImpl;
  };

  class LuaDocument : public Container
  {
  public:
    LuaDocument(lua_State *L, const std::string &luaName, const std::string &filename);
    ~LuaDocument();
    void Save() const;
    void Load();
    Table *CreateTable(const std::string &name) const;
    Table *CreateTable(int idx) const;

  private:
    void Push() const {}
    void Get() {}

    struct Impl;
    std::unique_ptr<Impl> _pImpl;
  };
}

#endif
