#ifndef _SWRIP_EDITOR_HPP_
#define _SWRIP_EDITOR_HPP_

#include <functional>
#include <string>
#include "types.hpp"

void SetEditorDesc(Character *ch, const char *desc_fmt, ...);
void StartEditing(Character *ch, const std::string &old_text,
                  std::function<void(const std::string&)> onSave);
void StopEditing( Character *ch );
void EditBuffer( Character *ch, std::string argument );

#endif
