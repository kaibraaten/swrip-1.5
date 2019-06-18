#ifndef _SWRIP_PLAYERREPOSITORY_HPP_
#define _SWRIP_PLAYERREPOSITORY_HPP_

#include <memory>
#include <string>
#include <utility/repository.hpp>
#include "types.hpp"

class PlayerRepository : public Ceris::Repository<Character*>
{
public:
    virtual void Load() = 0;
    virtual bool Load(std::shared_ptr<Descriptor> d, const std::string &name, bool preload) = 0;
    virtual void Save() const = 0;
    virtual void Save(const Character *pc) const = 0;

protected:
    virtual void OnAdded(Character* &entity) = 0;
    virtual void OnRemoved(Character* &entity) = 0;
};

extern PlayerRepository *PlayerCharacters;
PlayerRepository *NewPlayerRepository();

std::string GetPlayerFilename(const Character *pc);

#endif
