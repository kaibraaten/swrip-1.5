#ifndef _CERIS_TYPES_HPP_
#define _CERIS_TYPES_HPP_

#include <functional>

using Predicate = std::function<bool(void *element, const void *ud)>;
using Comparator = std::function<int(const void*, const void*)>;
using ForEachFunc = std::function<void(void *element, void *ud)>;

#endif
