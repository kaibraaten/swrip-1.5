#ifndef _CERIS_DATADOM_HPP_
#define _CERIS_DATADOM_HPP_

#include <string>
#include <list>
#include <memory>
#include <lua.hpp>

namespace DataDOM
{
  class Field
  {
  public:
    virtual ~Field();
    virtual void Push(lua_State *L) const = 0;
    virtual void Get(lua_State *L, int idx) = 0;

  protected:
    Field(const std::string &name);
    std::string Name() const;

  private:
    struct Impl;
    std::unique_ptr<Impl> _pImpl;
  };

  class StringField : public Field
  {
  public:
    StringField(const std::string &name, std::string &targetField);
    ~StringField();

    virtual void Push(lua_State *L) const override;
    virtual void Get(lua_State *L, int idx) override;

  private:
    struct Impl;
    std::unique_ptr<Impl> _pImpl;
  };
}

#endif
