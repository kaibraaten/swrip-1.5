#ifndef _SWRIP_ACT_HPP_
#define _SWRIP_ACT_HPP_

#include <string>
#include "types.hpp"

/*
 * TO types for act.
 */

enum class ActTarget
{
    Room,
    NotVict,
    Vict,
    Char
};

struct ActArg
{
    ActArg(std::nullptr_t) { }
    ActArg(const std::string &str) : Str(str) { }
    ActArg(std::shared_ptr<Object> obj) : Obj(obj) { }
    ActArg(std::shared_ptr<Character> ch) : Ch(ch) { }
    bool IsNull() const
    {
        return Str.empty() && Obj == nullptr && Ch == nullptr;
    }
    std::string Str;
    std::shared_ptr<Object> Obj;
    std::shared_ptr<Character> Ch;
};

/*
  void Act(short AType, const std::string &format, std::shared_ptr<Character> ch,
  const ActArg &arg1, const ActArg &arg2, ActTarget type)

  short AType;

  This is a color code defined in 'mud.h'.  Colors are only sent
  to players who have ANSI color enabled.

  const std::string &format;

  This is a format string, with formatting specifications introduced
  by '$' (just as 'printf' introduces its formatting sequences with '%').
  Typically this is a complete sentence with a subject and an object.

  std::shared_ptr<Character> ch;

  This is the subject of the sentence.

  const ActArg &arg1;

  This is the object of the sentence.  This may be either an object or
  possibly a text string.

  const ActArg &arg2;

  This is the target of the sentence, as well as possibly the object of
  the sentence.  This may be either a victim, an object, or possibly a
  text string.

  ActTarget type;

  This is the 'to' type of the sentence.  Values are:

  ActTarget::Char      Send only to 'ch'.
  ActTarget::Vict      Send only to 'arg2' (and then only if arg2 != ch).
  ActTarget::Room      Send to all chars in room except 'ch'.
  ActTarget::NotVict   Send to all chars in room except 'ch' and 'vict'.

  In every case, only characters in the same room as 'ch' are considered.

  Each awake character in the same room as 'ch' is considered for output.  (Thus
  'ch' must always be a legitimate character whose location is not NOWHERE).  If
  the target character meets the 'type' requirements, then the formatting string
  'format' is used to construct an output string, with '$' sequences substituted
  using values from 'ch', 'arg1', and 'arg2'.

  In the substitution of '$' sequences, attention is paid to visibility by
  calling 'CanSee()' and 'CanSeeObject()' as needed.

  The first character of the output string is always capitalized.


  === The '$' sequences

  Here are all the '$' sequences supported by 'act':

  $t
  Result is the 'arg1' argument interpreted as a string.

  $T
  Result is the 'arg2' argument interpreted as a string.

  $n
  Result is the name of 'ch'.  If 'ch' is not visible to the target
  character, result is the string 'someone'.

  $N
  Result is the name of 'arg2' (considered as a victim).  If 'arg2' is
  not visible to the target character, result is the string 'someone'.

  $e
  Result is 'he', 'she', or 'it', depending on the sex of 'ch'.

  $E
  Result is 'he', 'she', or 'it', depending on the sex of 'arg2'
  (considered as a victim).

  $m
  Result is 'him', 'her', or 'it', depending on the sex of 'ch'.

  $M
  Result is 'him', 'her', or 'it', depending on the sex of 'arg2'
  (considered as a victim).

  $s
  Result is 'his', 'her', or 'its', depending on the sex of 'ch'.

  $S
  Result is 'his', 'her', or 'its', depending on the sex of 'arg2'
  (considered as a victim).

  $p
  Result is the short description of 'arg1' (considered as an object).
  If 'arg1' is invisible to the target character, result is the string
  'something'.

  $P
  Result is the short description of 'arg2' (considered as an object).
  If 'arg2' is invisible to the target character, result is the string
  'something'.

  $d
  Result is the first word in 'arg2', considered as a string.  If 'arg2'
  is nullptr, result is the string 'door'.  This is meant for extracting the
  name from a door's keyword list, but may be used in general for other
  keyword lists.
*/

void Act(short AType, const std::string &format, std::shared_ptr<Character> ch,
         const ActArg &arg1, const ActArg &arg2, ActTarget type);

#endif
