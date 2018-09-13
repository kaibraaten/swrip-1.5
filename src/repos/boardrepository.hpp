#ifndef _SWRIP_BOARDREPOSITORY_HPP_
#define _SWRIP_BOARDREPOSITORY_HPP_

#include <string>
#include <utility/repository.hpp>
#include "types.hpp"

class BoardRepository : public Ceris::Repository<Board*>
{
public:
  virtual void Load() = 0;
  virtual void Save() const = 0;
  virtual void Save(const Board *board) const = 0;
};

BoardRepository *NewBoardRepository();
std::string GetBoardFilename( const Board *board );
extern BoardRepository *Boards;

#endif
