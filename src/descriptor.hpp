#ifndef _SWRIP_DESCRIPTOR_HPP_
#define _SWRIP_DESCRIPTOR_HPP_

#include <utility/os.hpp>
#include "types.hpp"
#include "constants.hpp"

class Descriptor
{
public:
  Descriptor(socket_t desc);
  virtual ~Descriptor();

  virtual void WriteToBuffer(const std::string &txt, size_t len = 0);
  virtual int MakeColorSequence(const std::string &col, char *buf);
  virtual bool CheckReconnect(const std::string &name, bool fConn );
  virtual unsigned char CheckPlaying(const std::string &name, bool kick );
  virtual bool CheckMultiplaying(const std::string &name );
  virtual void DisplayPrompt();
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
  char      InComm[MAX_INPUT_LENGTH];
  char     *OutBuffer  = nullptr;
  unsigned  long OutSize = 0;
  int       OutTop = 0;

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
  int MakeColorSequence(const std::string &col, char *buf) override;
  bool CheckReconnect(const std::string &name, bool fConn ) override;
  unsigned char CheckPlaying(const std::string &name, bool kick ) override;
  bool CheckMultiplaying(const std::string &name ) override;
  void DisplayPrompt() override;
  bool FlushBuffer(bool fPrompt) override;
  void ReadFromBuffer() override;
  bool Read() override;
};

#endif