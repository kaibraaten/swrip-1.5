#include "mud.hpp"
#include "badname.hpp"
#include "repos/badnamerepository.hpp"

static BadName *GetBadName(const std::string &name)
{
  return BadNames->Find([&name](auto entity) { return StrCmp(entity->Name, name) == 0; });
}

bool IsBadName( const std::string &name )
{
  return GetBadName(name) != nullptr;
}

void AddBadName(const std::string &name)
{
  if( IsBadName( name ) )
    {
      return;
    }

  BadName *badName = new BadName { name };
  BadNames->Add(badName);
}

void RemoveBadName( const std::string &name )
{
  BadName *badname = GetBadName(name);

  if(badname != nullptr)
    {
      BadNames->Remove(badname);
      delete badname;
    }
}
