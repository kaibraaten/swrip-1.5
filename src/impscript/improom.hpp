#ifndef _SWRIP_IMPSCRIPT_ROOM_HPP_
#define _SWRIP_IMPSCRIPT_ROOM_HPP_

#include <imp/runtime/runtimevalue.hpp>

class Room;

class ImpRoom : public Imp::RuntimeValue
{
public:
    ImpRoom(std::shared_ptr<Room> room);
    ~ImpRoom();
    std::string TypeName() override;
    std::string ShowInfo() override;
    std::shared_ptr<Imp::RuntimeValue> EvalEqual(std::shared_ptr<Imp::RuntimeValue> v,
                                                 const Imp::ImpSyntax *where) override;
    std::shared_ptr<Imp::RuntimeValue> EvalNotEqual(std::shared_ptr<Imp::RuntimeValue> v,
                                                    const Imp::ImpSyntax *where) override;
    std::shared_ptr<Imp::RuntimeValue> EvalStr(const Imp::ImpSyntax *where) override;
    std::shared_ptr<Room> Entity(const Imp::ImpSyntax *where) const;
    
private:
    struct Impl;
    std::unique_ptr<Impl> pImpl;
};

#endif
