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

#ifndef _CERIS_REPOSITORY_HPP_
#define _CERIS_REPOSITORY_HPP_

#include <list>
#include <set>
#include <algorithm>

namespace Ceris
{
  template<typename T, typename Compare = std::less<T>>
  class Repository
  {
  public:
    virtual ~Repository();
    const std::list<T> Entities() const;
    void Add(T &entity);
    void Remove(T &entity);
    size_t Count() const;

    template<typename UnaryPredicate>
    T Find(UnaryPredicate pred) const
    {
      auto iter = find_if(_Entities.begin(), _Entities.end(), pred);

      if(iter != _Entities.end())
        {
          return *iter;
        }
      else
        {
          return T();
        }
    }

    virtual void Save(const T &entity) const;
    virtual void Save() const;
    virtual void Load();

  protected:
    Repository();
    virtual void OnAdded(T &entity);
    virtual void OnRemoved(T &entity);

  private:
    Repository(const Repository&);
    Repository &operator=(const Repository&);

    std::set<T, Compare> _Entities;
  };

  template<typename T, typename Compare>
  Repository<T, Compare>::Repository()
  {

  }

  template<typename T, typename Compare>
  Repository<T, Compare>::~Repository()
  {

  }

  template<typename T, typename Compare>
  const std::list<T> Repository<T, Compare>::Entities() const
  {
    return std::list<T>(_Entities.begin(), _Entities.end());
  }

  template<typename T, typename Compare>
  size_t Repository<T, Compare>::Count() const
  {
    return _Entities.size();
  }

  template<typename T, typename Compare>
  void Repository<T, Compare>::Load()
  {
    // Default implementation no-op
  }

  template<typename T, typename Compare>
  void Repository<T, Compare>::Save() const
  {
    // Default implementation no-op
  }

  template<typename T, typename Compare>
  void Repository<T, Compare>::Save(const T &entity) const
  {
    // Default implementation no-op
  }

  template<typename T, typename Compare>
  void Repository<T, Compare>::Add(T &entity)
  {
    _Entities.insert(entity);
    OnAdded(entity);
  }

  template<typename T, typename Compare>
  void Repository<T, Compare>::Remove(T &entity)
  {
    _Entities.erase(entity);
    OnRemoved(entity);
  }

  template<typename T, typename Compare>
  void Repository<T, Compare>::OnAdded(T &entity)
  {
    // Default implementation no-op
  }

  template<typename T, typename Compare>
  void Repository<T, Compare>::OnRemoved(T &entity)
  {
    // Default implementation no-op
  }
}

#endif
