#ifndef _SWRIP_MPROG_HPP_
#define _SWRIP_MPROG_HPP_

#include <list>
#include "types.hpp"

class MProg
{
public:
  MProg();
  ~MProg();
  const std::list<MPROG_ACT_LIST*> &ActLists() const;
  void Add(MPROG_ACT_LIST *mal);
  void Remove(MPROG_ACT_LIST *mal);

  const std::list<MPROG_DATA*> &MudProgs() const;
  void Add(MPROG_DATA *prog);
  void InsertBefore(size_t position, MPROG_DATA *prog);
  void Remove(MPROG_DATA *prog);

  int             mpactnum = 0;
  short           mpscriptpos = 0;
  int             progtypes = 0;

private:
  struct Impl;
  Impl *pImpl;
};

#endif
