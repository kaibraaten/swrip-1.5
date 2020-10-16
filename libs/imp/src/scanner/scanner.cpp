#include <stack>
#include <deque>

#include "imp/scanner/scanner.hpp"
#include "imp/scanner/tokenkind.hpp"
#include "imp/except/scannerexception.hpp"

namespace Imp
{
    constexpr auto TABDIST = 4;
    constexpr auto INVALID_INDEX = -1;

    struct Scanner::Impl
    {
        Impl(const std::list<std::string> &sourceCode);
        void ScannerError(const std::string &message);
        int CurLineNum() const;
        int FindIndent(std::string s) const;
        std::string ExpandLeadingTabs(std::string s) const;
        bool IsLetterAZ(char c) const;
        bool IsDigit(char c) const;
        bool IsCompOpr();
        bool IsFactorPrefix();
        bool IsFactorOpr();
        bool IsTermOpr();
        bool AnyEqualToken();
        std::shared_ptr<Token> CurToken();
        void ReadNextLine();
        void ScanLine(std::string line);
        bool IsStartOfString(char currentChar);
        bool IsIllegalCharacter(char currentChar);
        int ExtractNameOrKeyword(std::string line, int cursor);
        bool MarksEndOfNameOrKeyword(std::string line, int cursor);
        bool IsReservedSpecialCharacter(char currentChar);
        int ExtractSpecialSymbol(std::string line, int cursor);
        int ExtractNumericValue(std::string line, int cursor);
        bool IsValidFloatLiteral(std::string numberAsString);
        bool ContainsOnlyOnePunctuation(std::string numberAsString);
        int ExtractStringValue(std::string line, int cursor);
        int IndexOfStringEnd(std::string line, int beginIndex);
        int IndexOfFirstNonWhitespace(std::string line, int beginIndex);
        void CalculateIndent(std::string line);
        bool LineIsComment(std::string line);
        bool LineIsBlank(std::string line);
        void ReadNextToken();

        std::deque<std::shared_ptr<Token>> CurLineTokens;
        std::list<std::string> SourceCode;
        std::stack<int> Indents;
        int lineNum = 0;
    };

    Scanner::Impl::Impl(const std::list<std::string> &sourceCode)
        : SourceCode(sourceCode)
    {
        Indents.push(0);
    }

    void Scanner::Impl::ScannerError(const std::string &message)
    {
        std::string m = "Imp scanner error";

        if(CurLineNum() > 0)
        {
            m += " on line " + CurLineNum();
        }

        m += ": " + message;

        throw ScannerException(message);
    }

    int Scanner::Impl::CurLineNum() const
    {
        //return !SourceCode.empty() ? SourceCode.front().first : 0;
        return lineNum;
    }

    int Scanner::Impl::FindIndent(std::string s) const
    {
        int indent = 0;

        while(indent < s.size() && s[indent] == ' ')
        {
            indent++;
        }

        return indent;
    }

    std::string Scanner::Impl::ExpandLeadingTabs(std::string s) const
    {
        std::string newS;

        for(int i = 0; i < s.size(); i++)
        {
            char c = s[i];

            if(c == '\t')
            {
                do
                {
                    newS += " ";
                } while(newS.size() % TABDIST > 0);
            }
            else if(c == ' ')
            {
                newS += " ";
            }
            else
            {
                newS += s.substr(i);
                break;
            }
        }

        return newS;
    }

    bool Scanner::Impl::IsLetterAZ(char c) const
    {
        return ('A' <= c && c <= 'Z') || ('a' <= c && c <= 'z') || (c == '_');
    }

    bool Scanner::Impl::IsDigit(char c) const
    {
        return '0' <= c && c <= '9';
    }

    bool Scanner::Impl::IsCompOpr()
    {
        TokenKind k = CurToken()->Kind();
        return k == TokenKind::LessToken
            || k == TokenKind::GreaterToken
            || k == TokenKind::DoubleEqualToken
            || k == TokenKind::GreaterEqualToken
            || k == TokenKind::LessEqualToken
            || k == TokenKind::NotEqualToken;
    }

    bool Scanner::Impl::IsFactorPrefix()
    {
        TokenKind k = CurToken()->Kind();
        return k == TokenKind::PlusToken
            || k == TokenKind::MinusToken;
    }

    bool Scanner::Impl::IsFactorOpr()
    {
        TokenKind k = CurToken()->Kind();
        return k == TokenKind::AstToken
            || k == TokenKind::SlashToken
            || k == TokenKind::PercentToken
            || k == TokenKind::DoubleSlashToken;
    }

    bool Scanner::Impl::IsTermOpr()
    {
        TokenKind k = CurToken()->Kind();
        return k == TokenKind::PlusToken
            || k == TokenKind::MinusToken;
    }

    bool Scanner::Impl::AnyEqualToken()
    {
        for(auto t : CurLineTokens)
        {
            if(t->Kind() == TokenKind::EqualToken)
            {
                return true;
            }

            if(t->Kind() == TokenKind::SemicolonToken)
            {
                return false;
            }
        }

        return false;
    }

    std::shared_ptr<Token> Scanner::Impl::CurToken()
    {
        while(CurLineTokens.empty())
        {
            ReadNextLine();
        }

        return CurLineTokens.front();
    }

    void Scanner::Impl::ReadNextToken()
    {
        if(!CurLineTokens.empty())
        {
            CurLineTokens.pop_front();
        }
    }

    void Scanner::Impl::ReadNextLine()
    {
        CurLineTokens.clear();
        ++lineNum;

        if(!SourceCode.empty())
        {
            std::string line = SourceCode.front();
            SourceCode.remove(line);
            line = ExpandLeadingTabs(line);

            if(LineIsBlank(line)
               || LineIsComment(line))
            {
                return;
            }

            CalculateIndent(line);
            ScanLine(line);

            // Terminate line:
            CurLineTokens.push_back(std::make_shared<Token>(TokenKind::NewLineToken, CurLineNum()));
        }
        else
        {
            while(Indents.top() > 0)
            {
                Indents.pop();
                CurLineTokens.push_back(std::make_shared<Token>(TokenKind::DedentToken, CurLineNum()));
            }

            CurLineTokens.push_back(std::make_shared<Token>(TokenKind::EofToken, CurLineNum()));
        }

        //for(auto t : CurLineTokens)
        //{
            //Main.log.noteToken(t);
        //}
    }

    void Scanner::Impl::ScanLine(std::string line)
    {
        int cursor = 0;

        while(cursor < line.length() && cursor != INVALID_INDEX)
        {
            cursor = IndexOfFirstNonWhitespace(line, cursor);

            if(cursor == INVALID_INDEX)
            {
                break;
            }

            char currentChar = line[cursor];

            if(IsIllegalCharacter(currentChar) && !IsStartOfString(currentChar))
            {
                ScannerError("Illegal character '" + std::string(1, currentChar) + "'.");
            }
            else if(currentChar == '#')
            {
                break;
            }
            else
            {
                int idxAfterToken = INVALID_INDEX;

                if(IsStartOfString(currentChar))
                {
                    idxAfterToken = ExtractStringValue(line, cursor);
                }
                else if(IsDigit(currentChar))
                {
                    idxAfterToken = ExtractNumericValue(line, cursor);
                }
                else if(IsLetterAZ(currentChar))
                {
                    idxAfterToken = ExtractNameOrKeyword(line, cursor);
                }
                else
                {
                    // If it doesn't match any of the above, then it must be a special
                    // symbol such as an operator, parenthesis, etc.
                    idxAfterToken = ExtractSpecialSymbol(line, cursor);
                }

                cursor = idxAfterToken;
            }
        }
    }

    bool Scanner::Impl::IsStartOfString(char currentChar)
    {
        return currentChar == '"' || currentChar == '\'';
    }

    bool Scanner::Impl::IsIllegalCharacter(char currentChar)
    {
        return !IsLetterAZ(currentChar)
            && !IsDigit(currentChar)
            && !IsReservedSpecialCharacter(currentChar)
            && currentChar != '\''
            && currentChar != '"'
            && currentChar != '#';
    }

    // Extract a 'name' or reserved keyword token.
    // Return the index of the first character after the symbol.
    int Scanner::Impl::ExtractNameOrKeyword(std::string line, int cursor)
    {
        for(int idxAfterToken = cursor; idxAfterToken <= line.length(); ++idxAfterToken)
        {
            if(idxAfterToken < line.length() && line[idxAfterToken] == '#')
            {
                // If the rest of the line is a comment, shrink the line to discard it.
                line.erase(idxAfterToken);
            }

            if(idxAfterToken == line.length() || MarksEndOfNameOrKeyword(line, idxAfterToken))
            {
                std::string tokenName = line.substr(cursor, idxAfterToken - cursor);
                auto token = std::make_shared<Token>(TokenKind::NameToken, CurLineNum());
                token->Name(tokenName);
                token->CheckResWords();
                CurLineTokens.push_back(token);

                return idxAfterToken;
            }
        }

        ScannerError("Unknown error in extractNameOrKeyword().");
        return INVALID_INDEX;
    }

    bool Scanner::Impl::MarksEndOfNameOrKeyword(std::string line, int cursor)
    {
        return line[cursor] == ' '
            || IsReservedSpecialCharacter(line[cursor]);
    }

    bool Scanner::Impl::IsReservedSpecialCharacter(char currentChar)
    {
        return currentChar == '!'
            || currentChar == '='
            || currentChar == '|'
            || currentChar == '&'
            || currentChar == '+'
            || currentChar == '-'
            || currentChar == ')'
            || currentChar == '('
            || currentChar == '<'
            || currentChar == '>'
            || currentChar == '*'
            || currentChar == '/'
            || currentChar == '^'
            || currentChar == '%'
            || currentChar == ':'
            || currentChar == ';'
            || currentChar == ','
            || currentChar == '['
            || currentChar == ']'
            || currentChar == '{'
            || currentChar == '}';
    }

    // Extract special symbol token, including operators.
    // Return the index of the first character after the symbol.
    int Scanner::Impl::ExtractSpecialSymbol(std::string line, int cursor)
    {
        int idxAfterToken = cursor + 1;
        char c = line[cursor];

        if(c == '*'
           || c == '+'
           || c == '-'
           || c == '<'
           || c == '>'
           || c == '='
           || c == '!')
        {
            if(line[cursor + 1] == '=')
            {
                ++idxAfterToken;
            }
        }
        else if(c == '/'
                && (line[cursor + 1] == '/' || line[cursor + 1] == '='))
        {
            ++idxAfterToken;
        }

        std::string specialAsString = line.substr(cursor, idxAfterToken - cursor);

        for(TokenKind kind = TokenKind::AstToken; kind <= TokenKind::SemicolonToken; ++kind)
        {
            if(specialAsString == TokenName(kind))
            {
                CurLineTokens.push_back(std::make_shared<Token>(kind, CurLineNum()));
                break;
            }
        }

        return idxAfterToken;
    }

    // Extract an integer or floating point literal.
    // Return the index of the first character after the symbol.
    int Scanner::Impl::ExtractNumericValue(std::string line, int cursor)
    {
        int lastChar;

        for(lastChar = cursor + 1; lastChar < line.length(); ++lastChar)
        {
            char c = line[lastChar];

            if(!IsDigit(c) && c != '.')
            {
                break;
            }
        }

        std::string numberAsString = line.substr(cursor, lastChar - cursor);
        std::shared_ptr<Token> token;

        try
        {
            if(numberAsString.size() > 1 && numberAsString[0] == '0' && numberAsString[1] != '.')
            {
                ScannerError("Integer literals cannot begin with zero.");
            }

            long value = std::stol(numberAsString);
            token = std::make_shared<Token>(TokenKind::IntegerToken, CurLineNum());
            token->IntegerLit(value);
        }
        catch(const std::invalid_argument &ex)
        {
            if(!IsValidFloatLiteral(numberAsString))
            {
                ScannerError("Invalid floating point literal.");
            }

            double value = std::stod(numberAsString);
            token = std::make_shared<Token>(TokenKind::FloatToken, CurLineNum());
            token->FloatLit(value);
        }

        CurLineTokens.push_back(token);
        return lastChar;
    }

    bool Scanner::Impl::IsValidFloatLiteral(std::string numberAsString)
    {
        auto idxOfPunct = numberAsString.find('.');
        return idxOfPunct < numberAsString.size() - 1
            && IsDigit(numberAsString[idxOfPunct + 1])
            && ContainsOnlyOnePunctuation(numberAsString);
    }

    bool Scanner::Impl::ContainsOnlyOnePunctuation(std::string numberAsString)
    {
        return numberAsString.find('.') == numberAsString.rfind('.');
    }

    // Extract a String literal, but ditch the surrounding single/double quotes.
    // Return the index of the first character after the symbol.
    int Scanner::Impl::ExtractStringValue(std::string line, int cursor)
    {
        int idxAfterToken = IndexOfStringEnd(line, cursor);

        if(idxAfterToken == INVALID_INDEX)
        {
            ScannerError("Unterminated string literal.");
        }

        auto token = std::make_shared<Token>(TokenKind::StringToken, CurLineNum());
        token->StringLit(line.substr(cursor + 1, idxAfterToken - cursor - 1));
        CurLineTokens.push_back(token);
        return idxAfterToken + 1; // +1 to skip past last single/double quote.
    }

    int Scanner::Impl::IndexOfStringEnd(std::string line, int beginIndex)
    {
        const char endMarker = line[beginIndex];
        int endIndex = beginIndex + 1;

        while(line[endIndex] != endMarker)
        {
            ++endIndex;

            if(endIndex == line.size())
            {
                return INVALID_INDEX;
            }
        }

        return endIndex;
    }

    int Scanner::Impl::IndexOfFirstNonWhitespace(std::string line, int beginIndex)
    {
        while(line[beginIndex] == ' ' || line[beginIndex] == '\t')
        {
            ++beginIndex;

            if(beginIndex == line.size())
            {
                return INVALID_INDEX;
            }
        }

        return beginIndex;
    }

    void Scanner::Impl::CalculateIndent(std::string line)
    {
        int leadingSpaces = FindIndent(line);

        if(leadingSpaces > Indents.top())
        {
            Indents.push(leadingSpaces);
            CurLineTokens.push_back(std::make_shared<Token>(TokenKind::IndentToken, CurLineNum()));
        }
        else
        {
            while(leadingSpaces < Indents.top())
            {
                Indents.pop();
                CurLineTokens.push_back(std::make_shared<Token>(TokenKind::DedentToken, CurLineNum()));
            }
        }

        if(leadingSpaces != Indents.top())
        {
            ScannerError("Indentation error.");
        }
    }

    bool Scanner::Impl::LineIsComment(std::string line)
    {
        int firstNonWhitespace = IndexOfFirstNonWhitespace(line, 0);
        return line[firstNonWhitespace] == '#';
    }

    bool Scanner::Impl::LineIsBlank(std::string line)
    {
        for(char c : line)
        {
            if(c != ' ' && c != '\t' && c != '\n')
            {
                return false;
            }
        }

        return true;
    }

    // Scanner class
    Scanner::Scanner(const std::list<std::string> &sourceCode)
        : pImpl(std::make_unique<Impl>(sourceCode))
    {

    }

    Scanner::~Scanner()
    {

    }

    std::shared_ptr<Token> Scanner::CurToken() const
    {
        return pImpl->CurToken();
    }

    void Scanner::ReadNextToken()
    {
        pImpl->ReadNextToken();
    }

    int Scanner::CurLineNum() const
    {
        return pImpl->CurLineNum();
    }

    bool Scanner::IsCompOpr() const
    {
        return pImpl->IsCompOpr();
    }

    bool Scanner::IsFactorPrefix() const
    {
        return pImpl->IsFactorPrefix();
    }

    bool Scanner::IsFactorOpr() const
    {
        return pImpl->IsFactorOpr();
    }

    bool Scanner::IsTermOpr() const
    {
        return pImpl->IsTermOpr();
    }

    bool Scanner::AnyEqualToken() const
    {
        return pImpl->AnyEqualToken();
    }
}
