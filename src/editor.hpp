#ifndef _SWRIP_EDITOR_HPP_
#define _SWRIP_EDITOR_HPP_

#include <string>
#include "types.hpp"

void SetEditorDesc( Character *ch, const std::string &new_desc );
void EditorDescPrintf( Character *ch, const char *desc_fmt, ... );
void StartEditingNoLimit( Character *ch, const std::string &old_text,
                          int max_total, void *userdata, CmdFun *caller );
#define StartEditing(ch, data, ud, fun)    StartEditingNoLimit( (ch), (data), (MAX_STRING_LENGTH * 4), (ud), (fun) )
std::string CopyEditBuffer( const Character *ch );
void *EditorUserData( Character *ch );
void StopEditing( Character *ch );
void EditBuffer( Character *ch, std::string argument );

#endif
