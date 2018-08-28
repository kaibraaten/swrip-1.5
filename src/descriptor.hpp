#ifndef _SWRIP_DESCRIPTOR_HPP_
#define _SWRIP_DESCRIPTOR_HPP_

#include <utility/os.hpp>
#include <utility/repository.hpp>
#include "types.hpp"
#include "constants.hpp"

class Descriptor
{
public:
  Descriptor(socket_t desc);
  virtual ~Descriptor();

  virtual void WriteToBuffer(const std::string &txt, size_t len = 0);
  virtual bool CheckReconnect(const std::string &name, bool fConn );
  virtual unsigned char CheckPlaying(const std::string &name, bool kick );
  virtual bool CheckMultiplaying(const std::string &name );
  virtual bool FlushBuffer(bool fPrompt);
  virtual void ReadFromBuffer();
  virtual bool Read();

  Descriptor *Next = nullptr;
  Descriptor *Previous = nullptr;
  class Character *Character = nullptr;
  class Character *Original = nullptr;
  Descriptor *SnoopBy = nullptr;

  struct
  {
    char *Hostname = nullptr;
    char *HostIP = nullptr;
    short Port = 0;
  } Remote;
  
  socket_t  Socket = INVALID_SOCKET;
  short ConnectionState = 0;
  short     Idle = 0;
  bool      fCommand = false;
  char      InComm[MAX_INPUT_LENGTH] = {'\0'};
  char     *OutBuffer  = nullptr;
  unsigned  long OutSize = 0;
  int       OutTop = 0;
  unsigned char PreviousColor = 0;
  int           NewState = 0;
  
private:
  struct Impl;
  Impl *pImpl = nullptr;
};

class NullDescriptor : public Descriptor
{
public:
  NullDescriptor();
  
  void WriteToBuffer(const std::string &txt, size_t len = 0) override;
  bool CheckReconnect(const std::string &name, bool fConn ) override;
  unsigned char CheckPlaying(const std::string &name, bool kick ) override;
  bool CheckMultiplaying(const std::string &name ) override;
  bool FlushBuffer(bool fPrompt) override;
  void ReadFromBuffer() override;
  bool Read() override;
};

class DescriptorRepository : public Ceris::Repository<Descriptor*>
{
public:

protected:
  DescriptorRepository() { }
};

extern DescriptorRepository *Descriptors;

DescriptorRepository *NewDescriptorRepository();

#endif
