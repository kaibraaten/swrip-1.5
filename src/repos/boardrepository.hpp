#ifndef _SWRIP_BOARDREPOSITORY_HPP_
#define _SWRIP_BOARDREPOSITORY_HPP_

#include <memory>
#include <string>
#include <utility/repository.hpp>
#include "types.hpp"

class BoardRepository : public Ceris::Repository<std::shared_ptr<Board>>
{
public:
    virtual void Load() = 0;
    virtual void Save() const = 0;
    virtual void Save(const std::shared_ptr<Board> &board) const = 0;
};

std::shared_ptr<BoardRepository> NewBoardRepository();
std::string GetBoardFilename(const std::shared_ptr<Board> &board);
inline std::shared_ptr<BoardRepository> Boards;

#endif
