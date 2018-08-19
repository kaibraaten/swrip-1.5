#ifndef _SWRIP_BOARD_HPP_
#define _SWRIP_BOARD_HPP_

#include <utility/repository.hpp>
#include <list>
#include "types.hpp"
#include "constants.hpp"

class Note
{
public:
  char *Sender = nullptr;
  char *Date = nullptr;
  char *ToList = nullptr;
  char *Subject = nullptr;
  bool Voting = false;
  char *YesVotes = nullptr;
  char *NoVotes = nullptr;
  char *Abstentions = nullptr;
  char *Text = nullptr;
};

class Board
{
public:
  char *Name = nullptr;             /* Filename to save notes to       */
  char *ReadGroup = nullptr;            /* Can restrict a board to a       */
  char *PostGroup = nullptr;            /* council, clan, guild etc        */
  char *ExtraReaders = nullptr;         /* Can give read rights to players */
  char *ExtraRemovers = nullptr;        /* Can give remove rights to players */
  vnum_t BoardObject = INVALID_VNUM;             /* Vnum of board object            */
  short MinReadLevel = 0;        /* Minimum level to read a note    */
  short MinPostLevel = 0;        /* Minimum level to post a note    */
  short MinRemoveLevel = 0;      /* Minimum level to remove a note  */
  short MaxPosts = 0;             /* Maximum amount of notes allowed */
  int Type = BOARD_NOTE;                  /* Normal board or mail board? */
  std::list<Note*> Notes;
};

Board *AllocateBoard(const std::string &name);
void FreeBoard(Board *board);
Board *GetBoardFromObject( const Object *obj );
Board *FindBoardHere( const Character *ch );
Board *GetBoard( const std::string &name );
void FreeNote( Note *pnote, void *ud );
void OperateOnNote( Character *ch, const std::string &arg_passed, bool IS_MAIL );
void AttachNote(Character *ch);
void CountMailMessages(const Character *ch);
const char *GetBoardFilename( const Board *board );
void AddNote(Board *board, Note *note);

class BoardRepository : public Ceris::Repository<Board*>
{
public:
  virtual void Load() = 0;
  virtual void Save() const = 0;
  virtual void Save(const Board *board) const = 0;
};

BoardRepository *NewBoardRepository();
extern BoardRepository *Boards;

#endif
