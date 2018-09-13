#ifndef _SWRIP_BOARD_HPP_
#define _SWRIP_BOARD_HPP_

#include <list>
#include "types.hpp"
#include "constants.hpp"

class Note
{
public:
  std::string Sender;
  std::string Date;
  std::string ToList;
  std::string Subject;
  bool Voting = false;
  std::string YesVotes;
  std::string NoVotes;
  std::string Abstentions;
  std::string Text;
};

class Board
{
public:
  Board();
  virtual ~Board();

  const std::list<Note*> &Notes() const;
  void Add(Note *note);
  void Remove(Note *note);
  
  std::string Name;             /* Filename to save notes to       */
  std::string ReadGroup;            /* Can restrict a board to a       */
  std::string PostGroup;            /* council, clan, guild etc        */
  std::string ExtraReaders;         /* Can give read rights to players */
  std::string ExtraRemovers;        /* Can give remove rights to players */
  vnum_t BoardObject = INVALID_VNUM;             /* Vnum of board object            */
  short MinReadLevel = 0;        /* Minimum level to read a note    */
  short MinPostLevel = 0;        /* Minimum level to post a note    */
  short MinRemoveLevel = 0;      /* Minimum level to remove a note  */
  short MaxPosts = 0;             /* Maximum amount of notes allowed */
  int Type = BOARD_NOTE;                  /* Normal board or mail board? */

private:
  struct Impl;
  Impl *pImpl = nullptr;
};

Board *AllocateBoard(const std::string &name);
void FreeBoard(Board *board);
Board *GetBoardFromObject( const Object *obj );
Board *FindBoardHere( const Character *ch );
Board *GetBoard( const std::string &name );
void FreeNote( Note *pnote );
void OperateOnNote( Character *ch, std::string arg_passed, bool IS_MAIL );
void AttachNote(Character *ch);
void CountMailMessages(const Character *ch);

#endif
