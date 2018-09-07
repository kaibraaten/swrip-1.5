#ifndef _SWRIP_EXIT_HPP_
#define _SWRIP_EXIT_HPP_

#include <string>
#include "types.hpp"
#include "constants.hpp"

class Exit
{
public:
  Exit *ReverseExit = nullptr;         /* Reverse exit pointer         */
  Room *ToRoom = nullptr;              /* Pointer to destination room  */
  std::string Keyword;                 /* Keywords for exit or door    */
  std::string Description;             /* Description of exit          */
  vnum_t Vnum = INVALID_VNUM;          /* Vnum of room exit leads to   */
  vnum_t ReverseVnum = INVALID_VNUM;   /* Vnum of room in opposite dir */
  int Flags = 0;                       /* door states & other flags    */
  vnum_t Key = INVALID_VNUM;           /* Key vnum                     */
  DirectionType Direction = 0;         /* Physical "direction"         */
  short Distance = 0;                  /* how far to the next room     */
};

#endif 
