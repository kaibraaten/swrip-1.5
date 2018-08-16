/*
  Copyright (c) 2018 Kai Braaten

  Permission is hereby granted, free of charge, to any person
  obtaining a copy of this software and associated documentation
  files (the "Software"), to deal in the Software without
  restriction, including without limitation the rights to use,
  copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the
  Software is furnished to do so, subject to the following
  conditions:

  The above copyright notice and this permission notice shall be
  included in all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
  OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
  HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
  OTHER DEALINGS IN THE SOFTWARE.
*/
#ifndef _CERIS_OLDREPOSITORY_HPP_
#define _CERIS_OLDREPOSITORY_HPP_

#include <utility/types.hpp>
#include <utility/linkedlist.hpp>

typedef struct OldRepository OldRepository;
typedef void (*EntityLoader)(OldRepository *self);
typedef void (*EntitySaver)(const OldRepository *self);

OldRepository *NewRepository(EntityLoader loadFunc, EntitySaver saveFunc);
void AddEntity(OldRepository *repo, void *entity);
void RemoveEntity(OldRepository *repo, void *entity);
const struct List *GetEntities(const OldRepository *repo);
void SaveEntities(const OldRepository *repo);
void LoadEntities(OldRepository *repo);

#endif