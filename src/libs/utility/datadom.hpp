#ifndef _CERIS_DATADOM_HPP_
#define _CERIS_DATADOM_HPP_

#include <string>
#include <list>
#include <memory>
#include <lua.hpp>

namespace DataDOM
{
  class Data
  {
  public:
    virtual ~Data();
    virtual void Push() const = 0;
    virtual void Get() = 0;

  protected:
    Data(lua_State *L, const std::string &name);
    std::string Name() const;
    lua_State *LuaState() const;

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

  class Table : public Data
  {
  public:
    Table(lua_State *L, const std::string &name);
    ~Table();
    void Add(Data *data);
    virtual void Push() const override;
    virtual void Get() override;

  private:
    struct Impl;
    std::unique_ptr<Impl> _pImpl;
  };

  class LuaDocument
  {
  public:
    LuaDocument(lua_State *L, const std::string &luaName, const std::string &filename);
    ~LuaDocument();
    void Save() const;
    void Load();
    void Add(Data *data);

  private:
    struct Impl;
    std::unique_ptr<Impl> _pImpl;
  };
}

#endif
