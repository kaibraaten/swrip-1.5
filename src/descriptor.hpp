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
    virtual unsigned char CheckReconnect(const std::string &name, bool fConn);
    virtual unsigned char CheckPlaying(const std::string &name, bool kick);
    virtual bool CheckMultiplaying(const std::string &name);
    virtual bool FlushBuffer(bool fPrompt);
    virtual void ReadFromBuffer();
    virtual bool Read();
    virtual bool HasInput() const;

    class Character *Character = nullptr;
    class Character *Original = nullptr;
    Descriptor *SnoopBy = nullptr;

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

private:
    struct Impl;
    std::unique_ptr<Impl> pImpl;
};

class NullDescriptor : public Descriptor
{
public:
    NullDescriptor();

    void WriteToBuffer(const std::string &txt, size_t len = 0) override;
    unsigned char CheckReconnect(const std::string &name, bool fConn) override;
    unsigned char CheckPlaying(const std::string &name, bool kick) override;
    bool CheckMultiplaying(const std::string &name) override;
    bool FlushBuffer(bool fPrompt) override;
    void ReadFromBuffer() override;
    bool Read() override;
    bool HasInput() const override;
};

#endif
