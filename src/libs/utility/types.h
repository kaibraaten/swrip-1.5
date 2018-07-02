#ifndef _CERIS_TYPES_H_
#define _CERIS_TYPES_H_

#ifndef __cplusplus
#if __STDC_VERSION__ < 199901L
typedef unsigned char bool;
#define true 1
#define false 0
#endif
#endif /* !__cplusplus */

typedef bool Predicate(const void *element, const void *ud);
typedef int Comparator(const void *lhv, const void *rhv);
typedef void ForEachFunc(void *element, void *ud);

#endif
