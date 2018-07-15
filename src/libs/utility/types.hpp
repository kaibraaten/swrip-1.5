#ifndef _CERIS_TYPES_HPP_
#define _CERIS_TYPES_HPP_

typedef bool Predicate(const void *element, const void *ud);
typedef int Comparator(const void *lhv, const void *rhv);
typedef void ForEachFunc(void *element, void *ud);

#endif
