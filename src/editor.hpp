#ifndef _SWRIP_EDITOR_HPP_
#define _SWRIP_EDITOR_HPP_

#include <functional>
#include <string>
#include "types.hpp"

void SetEditorDesc(std::shared_ptr<Character> ch, const char *desc_fmt, ...);
void StartEditing(std::shared_ptr<Character> ch, const std::string &old_text,
                  std::function<void(const std::string &)> onSave);
void StopEditing(std::shared_ptr<Character> ch);
void EditBuffer(std::shared_ptr<Character> ch, std::string argument);

#endif
