#ifndef _SWRIP_BOARD_HPP_
#define _SWRIP_BOARD_HPP_

#include <utility/oldrepository.hpp>
#include "types.hpp"

struct Note
{
  char *Sender;
  char *Date;
  char *ToList;
  char *Subject;
  bool Voting;
  char *YesVotes;
  char *NoVotes;
  char *Abstentions;
  char *Text;
};

struct Board
{
  char *Name;             /* Filename to save notes to       */
  char *ReadGroup;            /* Can restrict a board to a       */
  char *PostGroup;            /* council, clan, guild etc        */
  char *ExtraReaders;         /* Can give read rights to players */
  char *ExtraRemovers;        /* Can give remove rights to players */
  vnum_t BoardObject;             /* Vnum of board object            */
  short MinReadLevel;        /* Minimum level to read a note    */
  short MinPostLevel;        /* Minimum level to post a note    */
  short MinRemoveLevel;      /* Minimum level to remove a note  */
  short MaxPosts;             /* Maximum amount of notes allowed */
  int Type;                  /* Normal board or mail board? */
  List *Notes;
};

extern OldRepository *BoardRepository;

Board *AllocateBoard(const char *name);
void FreeBoard(Board *board);
void LoadBoards( void );
Board *GetBoardFromObject( const Object *obj );
Board *FindBoardHere( const Character *ch );
Board *GetBoard( const char *name );
void FreeNote( Note *pnote, void *ud );
void SaveBoards( void );
void SaveBoard(void *board, void *ud);
void OperateOnNote( Character *ch, char *arg_passed, bool IS_MAIL );
void AttachNote(Character *ch);
void CountMailMessages(const Character *ch);
const char *GetBoardFilename( const Board *board );
OldRepository *NewBoardRepository(void);
void AddBoard(Board *board);
void RemoveBoard(Board *board);
void AddNote(Board *board, Note *note);

#endif
