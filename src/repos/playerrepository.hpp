#ifndef _SWRIP_PLAYERREPOSITORY_HPP_
#define _SWRIP_PLAYERREPOSITORY_HPP_

#include <memory>
#include <string>
#include <ctime>
#include <utility/repository.hpp>
#include "types.hpp"

class PlayerRepository : public Ceris::Repository<Character*>
{
public:
    virtual void Load() = 0;
    virtual bool Load(std::shared_ptr<Descriptor> d, const std::string &name, bool preload) = 0;
    virtual void Save() const = 0;
    virtual void Save(const Character *pc) const = 0;
    virtual std::string MakeWizlist() const = 0;
    virtual bool Exists(const std::string &name) const = 0;
    virtual void MakeClone(const Character *pc) = 0;
    virtual void RestoreClone(const Character *pc) = 0;
    virtual void Delete(const std::string &name) = 0;
    virtual time_t LastOnline(const std::string &name) const = 0;
    
protected:
    virtual void OnAdded(Character* &entity) = 0;
    virtual void OnRemoved(Character* &entity) = 0;
};

extern std::shared_ptr<PlayerRepository> PlayerCharacters;
std::shared_ptr<PlayerRepository> NewPlayerRepository();

std::string GetPlayerFilename(const Character *pc);

#endif
