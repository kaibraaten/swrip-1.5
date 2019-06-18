#include <cstring>
#include "descriptor.hpp"
#include "mud.hpp"
#include "character.hpp"
#include "log.hpp"
#include "pcdata.hpp"
#include "systemdata.hpp"
#include "repos/descriptorrepository.hpp"

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
    ConnectionState = CON_GET_NAME;
    PreviousColor = 0x07;
}

Descriptor::~Descriptor() = default;

void Descriptor::WriteToBuffer(const std::string &txt, size_t length)
{
    if (OutBuffer.str().empty() && !fCommand)
    {
        OutBuffer << "\r\n";
    }

    OutBuffer << txt;
}

unsigned char CheckReconnect(std::shared_ptr<Descriptor> d, const std::string &name, bool fConn)
{
    for (class Character *ch = FirstCharacter; ch; ch = ch->Next)
    {
        if (!IsNpc(ch)
            && (!fConn || !ch->Desc)
            && !ch->Name.empty()
            && !StrCmp(name, ch->Name))
        {
            if (fConn && ch->Switched)
            {
                d->WriteToBuffer("Already playing.\r\nName: ", 0);
                d->ConnectionState = CON_GET_NAME;

                if (d->Character != nullptr)
                {
                    /* clear descriptor pointer to get rid of bug message in log */
                    d->Character->Desc = nullptr;
                    FreeCharacter(d->Character);
                    d->Character = nullptr;
                }

                return BERR;
            }

            if (!fConn)
            {
                d->Character->PCData->Password = ch->PCData->Password;
            }
            else
            {
                /* clear descriptor pointer to get rid of bug message in log */
                d->Character->Desc = nullptr;
                FreeCharacter(d->Character);
                d->Character = ch;
                ch->Desc = d;
                ch->IdleTimer = 0;
                ch->Echo("Reconnecting.\r\n");
                Act(AT_ACTION, "$n has reconnected.", ch, nullptr, nullptr, TO_ROOM);
                sprintf(log_buf, "%s@%s reconnected.",
                    ch->Name.c_str(), d->Remote.Hostname.c_str());
                Log->LogStringPlus(log_buf, LOG_COMM, umax(SysData.LevelOfLogChannel, ch->TopLevel));
                d->ConnectionState = CON_PLAYING;
            }

            return 1;
        }
    }

    return 0;
}

bool CheckMultiplaying(std::shared_ptr<Descriptor> d, const std::string &name)
{
    for (auto dold : Descriptors)
    {
        if (dold != d
            && (dold->Character || dold->Original)
            && StrCmp(name, dold->Original
                ? dold->Original->Name : dold->Character->Name)
            && !StrCmp(dold->Remote.Hostname, d->Remote.Hostname))
        {
            if (d->Character->TopLevel >= LEVEL_CREATOR
                || (dold->Original ? dold->Original : dold->Character)->TopLevel >= LEVEL_CREATOR)
            {
                return false;
            }

            d->WriteToBuffer("Sorry multi-playing is not allowed... have your other character quit first.\r\n");
            sprintf(log_buf, "%s attempting to multiplay with %s.",
                dold->Original ? dold->Original->Name.c_str() : dold->Character->Name.c_str(),
                d->Character->Name.c_str());
            Log->LogStringPlus(log_buf, LOG_COMM, SysData.LevelOfLogChannel);
            FreeCharacter(d->Character);
            d->Character = nullptr;
            return true;
        }
    }

    return false;
}

unsigned char CheckPlaying(std::shared_ptr<Descriptor> d, const std::string &name, bool kick)
{
    for (auto dold : Descriptors)
    {
        if (dold != d
            && (dold->Character || dold->Original)
            && !StrCmp(name, dold->Original
                ? dold->Original->Name : dold->Character->Name))
        {
            const int cstate = dold->ConnectionState;
            class Character *ch = dold->Original ? dold->Original : dold->Character;

            if (ch->Name.empty()
                || (cstate != CON_PLAYING && cstate != CON_EDITING))
            {
                d->WriteToBuffer("Already connected - try again.\r\n", 0);
                sprintf(log_buf, "%s already connected.", ch->Name.c_str());
                Log->LogStringPlus(log_buf, LOG_COMM, SysData.LevelOfLogChannel);
                return BERR;
            }

            if (!kick)
            {
                return true;
            }

            d->WriteToBuffer("Already playing... Kicking off old connection.\r\n", 0);
            dold->WriteToBuffer("Kicking off old connection... bye!\r\n", 0);
            CloseDescriptor(dold, false);
            /* clear descriptor pointer to get rid of bug message in log */
            d->Character->Desc = nullptr;
            FreeCharacter(d->Character);
            d->Character = ch;
            ch->Desc = d;
            ch->IdleTimer = 0;

            if (ch->Switched)
            {
                do_return(ch->Switched, "");
            }

            ch->Switched = nullptr;
            ch->Echo("Reconnecting.\r\n");
            Act(AT_ACTION, "$n has reconnected, kicking off old link.",
                ch, nullptr, nullptr, TO_ROOM);
            sprintf(log_buf, "%s@%s reconnected, kicking off old link.",
                ch->Name.c_str(), d->Remote.Hostname.c_str());
            Log->LogStringPlus(log_buf, LOG_COMM, umax(SysData.LevelOfLogChannel, ch->TopLevel));

            d->ConnectionState = cstate;
            return true;
        }
    }

    return false;
}

bool Descriptor::FlushBuffer(bool fPrompt)
{
    char buf[MAX_INPUT_LENGTH] = { '\0' };
    class Character *ch = Original ? Original : Character;

    if (ch && ch->Fighting && ch->Fighting->Who)
        ShowCharacterCondition(ch, ch->Fighting->Who);

    /*
     * Bust a prompt.
     */
    if (fPrompt && !mud_down && ConnectionState == CON_PLAYING)
    {
        ch = Original ? Original : Character;

        if (IsBitSet(ch->Flags, PLR_BLANK))
            WriteToBuffer("\r\n", 2);

        if (IsBitSet(ch->Flags, PLR_PROMPT))
            DisplayPrompt(this);

        if (IsBitSet(ch->Flags, PLR_TELNET_GA))
            WriteToBuffer(go_ahead_str, 0);
    }

    /*
     * Short-circuit if nothing to write.
     */
    if (OutBuffer.str().empty())
    {
        return true;
    }

    /*
     * Snoop-o-rama.
     */
    if (SnoopBy)
    {
        /* without check, 'force mortal quit' while snooped caused crash, -h */
        if (Character && !Character->Name.empty())
        {
            /* Show original snooped names. -- Altrag */
            if (Original && !Original->Name.empty())
                sprintf(buf, "%s (%s)", Character->Name.c_str(), Original->Name.c_str());
            else
                sprintf(buf, "%s", Character->Name.c_str());

            SnoopBy->WriteToBuffer(buf);
        }

        SnoopBy->WriteToBuffer("% ", 2);
        SnoopBy->WriteToBuffer(OutBuffer.str());
    }

    /*
     * OS-dependent output.
     */
    bool success = WriteToDescriptor(Socket, OutBuffer.str());

    OutBuffer.str("");
    return success;
}

bool Descriptor::Read()
{
    size_t iStart = 0;

    if (!IsNullOrEmpty(InComm))
        return true;

    iStart = strlen(pImpl->InBuffer);

    if (iStart >= sizeof(pImpl->InBuffer) - 10)
    {
        Log->Info("%s input overflow!", Remote.Hostname.c_str());
        WriteToDescriptor(Socket,
            "\r\n*** PUT A LID ON IT!!! ***\r\n");
        return false;
    }

    for (; ; )
    {
        ssize_t nRead = recv(Socket, pImpl->InBuffer + iStart,
            sizeof(pImpl->InBuffer) - 10 - iStart, 0);

        if (nRead == 0)
        {
            Log->LogStringPlus("EOF encountered on read.", LOG_COMM, SysData.LevelOfLogChannel);
            return false;
        }

        if (nRead == SOCKET_ERROR)
        {
            if (GETERROR == EWOULDBLOCK || GETERROR == EAGAIN)
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

        if (pImpl->InBuffer[iStart - 1] == '\n' || pImpl->InBuffer[iStart - 1] == '\r')
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
    if (!IsNullOrEmpty(InComm))
        return;

    /*
     * Look for at least one new line.
  */
    for (int i = 0; pImpl->InBuffer[i] != '\n' && pImpl->InBuffer[i] != '\r' && i < MAX_INBUF_SIZE;
        i++)
    {
        if (pImpl->InBuffer[i] == '\0')
            return;
    }

    /*
     * Canonical input processing.
     */
    int i = 0;
    int k = 0;

    for (i = 0, k = 0; pImpl->InBuffer[i] != '\n' && pImpl->InBuffer[i] != '\r'; i++)
    {
        if (k >= 254)
        {
            WriteToDescriptor(Socket, "Line too long.\r\n");

            pImpl->InBuffer[i] = '\n';
            pImpl->InBuffer[i + 1] = '\0';
            break;
        }

        if (pImpl->InBuffer[i] == '\b' && k > 0)
            --k;
        else if (isascii(pImpl->InBuffer[i]) && isprint(pImpl->InBuffer[i]))
            InComm[k++] = pImpl->InBuffer[i];
    }

    /*
     * Finish off the line.
     */
    if (k == 0)
        InComm[k++] = ' ';

    InComm[k] = '\0';

    /*
     * Deal with bozos with #repeat 1000 ...
     */
    if (k > 1 || InComm[0] == '!')
    {
        if (InComm[0] != '!' && StrCmp(InComm, pImpl->InLast))
        {
            pImpl->Repeat = 0;
        }
        else
        {
            if (++pImpl->Repeat >= 100)
            {
                WriteToDescriptor(Socket,
                    "\r\n*** PUT A LID ON IT!!! ***\r\n");
            }
        }
    }

    /*
     * Do '!' substitution.
     */
    if (InComm[0] == '!')
        strcpy(InComm, pImpl->InLast);
    else
        strcpy(pImpl->InLast, InComm);

    /*
     * Shift the input buffer.
     */
    while (pImpl->InBuffer[i] == '\n' || pImpl->InBuffer[i] == '\r')
        i++;

    for (int j = 0; (pImpl->InBuffer[j] = pImpl->InBuffer[i + j]) != '\0'; j++)
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

void NullDescriptor::WriteToBuffer(const std::string &txt, size_t len)
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
