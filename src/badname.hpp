#ifndef _SWRIP_BADNAME_HPP_
#define _SWRIP_BADNAME_HPP_

#include <string>

class BadName
{
public:
  std::string Name;
};

bool IsBadName( const std::string &name );
void AddBadName( const std::string &name );
void RemoveBadName( const std::string &name );

#endif
