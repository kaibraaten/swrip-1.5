#include <cstring>
#include <colorparser/colorparser.hpp>
#include "descriptor.hpp"
#include "mud.hpp"
#include "character.hpp"
#include "log.hpp"
#include "pcdata.hpp"
#include "systemdata.hpp"
#include "repos/descriptorrepository.hpp"
#include "act.hpp"

static const char go_ahead_str[] = { (const char)IAC, (const char)GA, '\0' };

struct Descriptor::Impl
{
    char InBuffer[MAX_INBUF_SIZE] = { '\0' };
    char InLast[MAX_INPUT_LENGTH] = { '\0' };
    int Repeat = 0;
};

Descriptor::Descriptor(socket_t desc)
    : pImpl(std::make_unique<Impl>())
{
    Socket = desc;
    ParseColors = ColorParser::Smaug2Ansi;
    ConnectionState = ConState::GetName;
    PreviousColor = 0x07;
}

Descriptor::~Descriptor() = default;

void Descriptor::WriteToBuffer(const std::string & txt, size_t length)
{
    if(OutBuffer.str().empty() && !fCommand)
    {
        OutBuffer << "\r\n";
    }

    OutBuffer << txt;
}

unsigned char CheckReconnect(std::shared_ptr<Descriptor> d, const std::string & name, bool fConn)
{
    for(auto ch = FirstCharacter; ch; ch = ch->Next)
    {
        if(!IsNpc(ch)
           && (!fConn || !ch->Desc)
           && !ch->Name.empty()
           && !StrCmp(name, ch->Name))
        {
            if(fConn && ch->Switched)
            {
                d->WriteToBuffer("Already playing.\r\nName: ", 0);
                d->ConnectionState = ConState::GetName;

                if(d->Char != nullptr)
                {
                    /* clear descriptor pointer to get rid of bug message in log */
                    d->Char->Desc = nullptr;
                    FreeCharacter(d->Char);
                    d->Char = nullptr;
                }

                return BERR;
            }

            if(!fConn)
            {
                d->Char->PCData->Password = ch->PCData->Password;
            }
            else
            {
                /* clear descriptor pointer to get rid of bug message in log */
                d->Char->Desc = nullptr;
                FreeCharacter(d->Char);
                d->Char = ch;
                ch->Desc = d;
                ch->IdleTimer = 0;
                ch->Echo("Reconnecting.\r\n");
                Act(AT_ACTION, "$n has reconnected.", ch, nullptr, nullptr, ActTarget::Room);
                auto logBuf = FormatString("%s@%s reconnected.",
                                           ch->Name.c_str(), d->Remote.Hostname.c_str());
                Log->LogStringPlus(logBuf, LOG_COMM, umax(SysData.LevelOfLogChannel, ch->TopLevel));
                d->ConnectionState = ConState::Playing;
            }

            return 1;
        }
    }

    return 0;
}

bool CheckMultiplaying(std::shared_ptr<Descriptor> d, const std::string & name)
{
    for(auto dold : Descriptors)
    {
        if(dold != d
           && (dold->Char || dold->Original)
           && StrCmp(name, dold->Original
                     ? dold->Original->Name : dold->Char->Name)
           && !StrCmp(dold->Remote.Hostname, d->Remote.Hostname))
        {
            if(d->Char->TopLevel >= LEVEL_CREATOR
               || (dold->Original ? dold->Original : dold->Char)->TopLevel >= LEVEL_CREATOR)
            {
                return false;
            }

            d->WriteToBuffer("Sorry multi-playing is not allowed... have your other character quit first.\r\n");
            auto logBuf = FormatString("%s attempting to multiplay with %s.",
                                       dold->Original
                                       ? dold->Original->Name.c_str()
                                       : dold->Char->Name.c_str(),
                                       d->Char->Name.c_str());
            Log->LogStringPlus(logBuf, LOG_COMM, SysData.LevelOfLogChannel);
            FreeCharacter(d->Char);
            d->Char = nullptr;
            return true;
        }
    }

    return false;
}

unsigned char CheckPlaying(std::shared_ptr<Descriptor> d, const std::string & name, bool kick)
{
    for(auto dold : Descriptors)
    {
        if(dold != d
           && (dold->Char || dold->Original)
           && !StrCmp(name, dold->Original
                      ? dold->Original->Name : dold->Char->Name))
        {
            const ConState cstate = dold->ConnectionState;
            auto ch = dold->Original ? dold->Original : dold->Char;

            if(ch->Name.empty()
               || (cstate != ConState::Playing && cstate != ConState::Editing))
            {
                d->WriteToBuffer("Already connected - try again.\r\n", 0);
                auto logBuf = FormatString("%s already connected.", ch->Name.c_str());
                Log->LogStringPlus(logBuf, LOG_COMM, SysData.LevelOfLogChannel);
                return BERR;
            }

            if(!kick)
            {
                return true;
            }

            d->WriteToBuffer("Already playing... Kicking off old connection.\r\n", 0);
            dold->WriteToBuffer("Kicking off old connection... bye!\r\n", 0);
            CloseDescriptor(dold, false);
            /* clear descriptor pointer to get rid of bug message in log */
            d->Char->Desc = nullptr;
            FreeCharacter(d->Char);
            d->Char = ch;
            ch->Desc = d;
            ch->IdleTimer = 0;

            if(ch->Switched)
            {
                do_return(ch->Switched, "");
            }

            ch->Switched = nullptr;
            ch->Echo("Reconnecting.\r\n");
            Act(AT_ACTION, "$n has reconnected, kicking off old link.",
                ch, nullptr, nullptr, ActTarget::Room);
            auto logBuf = FormatString("%s@%s reconnected, kicking off old link.",
                                       ch->Name.c_str(), d->Remote.Hostname.c_str());
            Log->LogStringPlus(logBuf, LOG_COMM, umax(SysData.LevelOfLogChannel, ch->TopLevel));

            d->ConnectionState = cstate;
            return true;
        }
    }

    return false;
}

bool Descriptor::FlushBuffer(bool fPrompt)
{
    char buf[MAX_INPUT_LENGTH] = { '\0' };
    auto ch = Original ? Original : Char;

    if(ch != nullptr && IsFighting(ch))
        ShowCharacterCondition(ch, WhoFighting(ch));

    /*
     * Bust a prompt.
     */
    if(fPrompt && !mud_down && ConnectionState == ConState::Playing)
    {
        ch = Original ? Original : Char;

        if(ch->Flags.test(Flag::Plr::Blank))
        {
            WriteToBuffer("\r\n", 2);
        }

        if(ch->Flags.test(Flag::Plr::Prompt))
        {
            DisplayPrompt(this);
        }

        if(ch->Flags.test(Flag::Plr::TelnetGA))
        {
            WriteToBuffer(go_ahead_str, 0);
        }
    }

    /*
     * Short-circuit if nothing to write.
     */
    if(OutBuffer.str().empty())
    {
        return true;
    }

    /*
     * Snoop-o-rama.
     */
    if(SnoopBy)
    {
        /* without check, 'force mortal quit' while snooped caused crash, -h */
        if(Char && !Char->Name.empty())
        {
            /* Show original snooped names. -- Altrag */
            if(Original && !Original->Name.empty())
                sprintf(buf, "%s (%s)", Char->Name.c_str(), Original->Name.c_str());
            else
                sprintf(buf, "%s", Char->Name.c_str());

            SnoopBy->WriteToBuffer(buf);
        }

        SnoopBy->WriteToBuffer("% ", 2);
        SnoopBy->WriteToBuffer(OutBuffer.str());
    }

    /*
     * OS-dependent output.
     */
    bool success = WriteToDescriptor(this, OutBuffer.str());

    OutBuffer.str("");
    return success;
}

bool Descriptor::Read()
{
    if(!IsNullOrEmpty(InComm))
        return true;

    size_t iStart = strlen(pImpl->InBuffer);

    if(iStart >= sizeof(pImpl->InBuffer) - 10)
    {
        Log->Info("%s input overflow!", Remote.Hostname.c_str());
        WriteToDescriptor(this,
                          "\r\n*** PUT A LID ON IT!!! ***\r\n");
        return false;
    }

    for(; ; )
    {
        ssize_t nRead = recv(Socket, pImpl->InBuffer + iStart,
                             sizeof(pImpl->InBuffer) - 10 - iStart, 0);

        if(nRead == 0)
        {
            Log->LogStringPlus("EOF encountered on read.", LOG_COMM, SysData.LevelOfLogChannel);
            return false;
        }

        if(nRead == SOCKET_ERROR)
        {
            if(GETERROR == EWOULDBLOCK || GETERROR == EAGAIN)
            {
                break;
            }
            else
            {
                Log->LogStringPlus(strerror(GETERROR), LOG_COMM, SysData.LevelOfLogChannel);
                return false;
            }
        }

        iStart += nRead;

        if(pImpl->InBuffer[iStart - 1] == '\n' || pImpl->InBuffer[iStart - 1] == '\r')
        {
            break;
        }
    }

    pImpl->InBuffer[iStart] = '\0';
    return true;
}

void Descriptor::ReadFromBuffer()
{
    /*
     * Hold horses if pending command already.
     */
    if(!IsNullOrEmpty(InComm))
        return;

    /*
     * Look for at least one new line.
  */
    for(int i = 0;
        pImpl->InBuffer[i] != '\n' && pImpl->InBuffer[i] != '\r' && i < MAX_INBUF_SIZE;
        i++)
    {
        if(pImpl->InBuffer[i] == '\0')
            return;
    }

    /*
     * Canonical input processing.
     */
    int i = 0;
    int k = 0;

    for(i = 0, k = 0; pImpl->InBuffer[i] != '\n' && pImpl->InBuffer[i] != '\r'; i++)
    {
        if(k >= 254)
        {
            WriteToDescriptor(this, "Line too long.\r\n");

            pImpl->InBuffer[i] = '\n';
            pImpl->InBuffer[i + 1] = '\0';
            break;
        }

        if(pImpl->InBuffer[i] == '\b' && k > 0)
            --k;
        else if(isascii(pImpl->InBuffer[i]) && isprint(pImpl->InBuffer[i]))
            InComm[k++] = pImpl->InBuffer[i];
    }

    /*
     * Finish off the line.
     */
    if(k == 0)
        InComm[k++] = ' ';

    InComm[k] = '\0';

    /*
     * Deal with bozos with #repeat 1000 ...
     */
    if(k > 1 || InComm[0] == '!')
    {
        if(InComm[0] != '!' && StrCmp(InComm, pImpl->InLast))
        {
            pImpl->Repeat = 0;
        }
        else
        {
            if(++pImpl->Repeat >= 100)
            {
                WriteToDescriptor(this,
                                  "\r\n*** PUT A LID ON IT!!! ***\r\n");
            }
        }
    }

    /*
     * Do '!' substitution.
     */
    if(InComm[0] == '!')
        strcpy(InComm, pImpl->InLast);
    else
        strcpy(pImpl->InLast, InComm);

    /*
     * Shift the input buffer.
     */
    while(pImpl->InBuffer[i] == '\n' || pImpl->InBuffer[i] == '\r')
        i++;

    for(int j = 0; (pImpl->InBuffer[j] = pImpl->InBuffer[i + j]) != '\0'; j++)
        ;
}

bool Descriptor::HasInput() const
{
    return !IsNullOrEmpty(InComm);
}

///////////////////////////////////////////////////
// NullDescriptor
NullDescriptor::NullDescriptor()
    : Descriptor(INVALID_SOCKET)
{

}

void NullDescriptor::WriteToBuffer(const std::string & txt, size_t len)
{

}

bool NullDescriptor::FlushBuffer(bool fPrompt)
{
    return true;
}

void NullDescriptor::ReadFromBuffer()
{

}

bool NullDescriptor::Read()
{
    return true;
}

bool NullDescriptor::HasInput() const
{
    return false;
}

void MapCharacterAndDescriptor(std::shared_ptr<Character> ch, std::shared_ptr<Descriptor> d)
{
    ch->Desc = d;
    d->Char = ch;
}
