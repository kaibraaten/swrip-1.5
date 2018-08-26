#ifndef _SWRIP_DESCRIPTOR_HPP_
#define _SWRIP_DESCRIPTOR_HPP_

#include <utility/os.hpp>
#include "types.hpp"
#include "constants.hpp"

class Descriptor
{
public:
  Descriptor();
  virtual ~Descriptor();

  virtual void WriteToBuffer(const std::string &txt, size_t len = 0);
  virtual int MakeColorSequence(const std::string &col, char *buf);
  virtual bool CheckReconnect(const std::string &name, bool fConn );
  virtual unsigned char CheckPlaying(const std::string &name, bool kick );
  virtual bool CheckMultiplaying(const std::string &name );
  virtual void Initialize(socket_t desc);
  virtual void DisplayPrompt();
  virtual bool FlushBuffer(bool fPrompt);
  virtual void ReadFromBuffer();
  virtual bool Read();
  
  Descriptor *Next = nullptr;
  Descriptor *Previous = nullptr;
  Descriptor *SnoopBy = nullptr;
  class Character *Character = nullptr;
  class Character *Original = nullptr;

  struct
  {
    char *Hostname = nullptr;
    char *HostIP = nullptr;
    short Port = 0;
  } Remote;

  socket_t  Socket = INVALID_SOCKET;
  short     ConnectionState = 0;
  short     Idle = 0;
  bool      fCommand = false;
  char      InBuffer[MAX_INBUF_SIZE];
  char      InComm[MAX_INPUT_LENGTH];
  char      InLast[MAX_INPUT_LENGTH];
  int       Repeat = 0;
  char     *OutBuffer  = nullptr;
  unsigned  long OutSize = 0;
  int       OutTop = 0;

  int           NewState = 0;
  unsigned char PreviousColor = 0;

private:
  struct Impl;
  Impl *pImpl = nullptr;
};

class NullDescriptor : public Descriptor
{
public:
  void WriteToBuffer(const std::string &txt, size_t len = 0) override;
  int MakeColorSequence(const std::string &col, char *buf) override;
  bool CheckReconnect(const std::string &name, bool fConn ) override;
  unsigned char CheckPlaying(const std::string &name, bool kick ) override;
  bool CheckMultiplaying(const std::string &name ) override;
  void Initialize(socket_t desc) override;
  void DisplayPrompt() override;
  bool FlushBuffer(bool fPrompt) override;
  void ReadFromBuffer() override;
  bool Read() override;
};

#endif
