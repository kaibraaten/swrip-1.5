#ifndef _SWRIP_DESCRIPTOR_HPP_
#define _SWRIP_DESCRIPTOR_HPP_

#include <memory>
#include <sstream>
#include <utility/os.hpp>
#include "constants.hpp"

class Descriptor
{
public:
    Descriptor(socket_t desc);
    virtual ~Descriptor();

    virtual void WriteToBuffer(const std::string &txt, size_t len = 0);
    
    virtual bool FlushBuffer(bool fPrompt);
    virtual void ReadFromBuffer();
    virtual bool Read();
    virtual bool HasInput() const;

    std::shared_ptr<Character> Original;
    std::shared_ptr<class Character> Character;
    
    std::shared_ptr<Descriptor> SnoopBy;

    struct
    {
        std::string Hostname;
        std::string HostIP;
        short Port = 0;
    } Remote;

    socket_t Socket = INVALID_SOCKET;
    short ConnectionState = 0;
    short Idle = 0;
    bool fCommand = false;
    char InComm[MAX_INPUT_LENGTH] = { '\0' };
    std::ostringstream OutBuffer;
    unsigned char PreviousColor = 0;
    std::string (*ParseColors)(const std::string&);
    
private:
    struct Impl;
    std::unique_ptr<Impl> pImpl;
};

class NullDescriptor : public Descriptor
{
public:
    NullDescriptor();

    void WriteToBuffer(const std::string &txt, size_t len = 0) override;
    bool FlushBuffer(bool fPrompt) override;
    void ReadFromBuffer() override;
    bool Read() override;
    bool HasInput() const override;
};

unsigned char CheckReconnect(std::shared_ptr<Descriptor> d, const std::string &name, bool fConn);
unsigned char CheckPlaying(std::shared_ptr<Descriptor> d, const std::string &name, bool kick);
bool CheckMultiplaying(std::shared_ptr<Descriptor> d, const std::string &name);
void MapCharacterAndDescriptor(std::shared_ptr<Character> ch, std::shared_ptr<Descriptor> d);

#endif
