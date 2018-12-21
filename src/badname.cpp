#include "mud.hpp"
#include "badname.hpp"
#include "repos/badnamerepository.hpp"

static std::shared_ptr<BadName> GetBadName(const std::string &name)
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

  std::shared_ptr<BadName> badName = std::shared_ptr<BadName>(new BadName { name });
  BadNames->Add(badName);
}

void RemoveBadName( const std::string &name )
{
  std::shared_ptr<BadName> badname = GetBadName(name);

  if(badname != nullptr)
    {
      BadNames->Remove(badname);
    }
}
