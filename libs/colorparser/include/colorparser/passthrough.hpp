#ifndef _CERIS_CP_PASSTHROUGH_HPP_
#define _CERIS_CP_PASSTHROUGH_HPP_

#include <string>

namespace ColorParser {

class Passthrough
{
public:
  static Passthrough *Instance();
  std::string Parse( const std::string& );
};

}

#endif // include guard
