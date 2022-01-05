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

#include <vector>
#include <set>
#include <memory>

namespace Ceris
{
    /**
     * Interface used to access stored data.
     *
     * While described as an interface, it's really a fully armed and
     * operational class.
     * The concrete storage method
     * is abstracted away. Be adviced that neither Add() nor
     * Remove() will call Save() automatically. If you want that
     * kind of behavior, where anything added or removed is automatically and
     * immediately persisted, you can
     * override OnAdded()/OnRemoved() and call Save() from there.
     */
    template<typename T, typename Compare = std::less<T>>
    class Repository
    {
    public:
        /**
         * Destructor.
         */
        virtual ~Repository();

        /**
         * Get a list of all the objects stored in the repository.
         * Note that any iterators to the list may become invalid
         * if a non-const method is called, so don't store iterators.
         *
         * \return All the objects in the repository.
         */
        const std::vector<T> &Entities() const noexcept;

        /**
         * Add a new object to the repository. This will NOT automatically
         * call Save()!
         *
         * \param entity The object to add.
         */
        void Add(const T &entity);

        /**
         * Remove an object from the repository. This will NOT automatically
         * call Save()!
         *
         * \param entity The object to remove.
         */
        void Remove(const T &entity);

        /**
         * Get the number of objects stored in the repository.
         *
         * \return The number of objects stored in the repository.
         */
        size_t Count() const noexcept;

        /**
         * Find a specific element in the repository based on a
         * predicate expression.
         *
         * \param pred The predicate representing the criteria used during search.
         *             The predicate may be a functor, a function pointer or
         *             a lambda. Either way, it must have the following form:
         *             bool operator()(const T &elementToInspect) and return true
         *             if the currently inspected element matches.
         * \return The matching object. If not found, the return value is
         *         a default constructed object.
         */
        template<typename UnaryPredicate>
        T Find(UnaryPredicate pred) const
        {
            auto iter = std::find_if(std::begin(_entities), std::end(_entities), pred);

            if(iter != _entities.end())
            {
                return *iter;
            }
            else
            {
                return T();
            }
        }

        /**
         * Persist an object.
         *
         * \param entity The object to persist.
         */
        virtual void Save(const T &entity) const;

        /**
         * Persist ALL objects in the repository.
         */
        virtual void Save() const;

        /**
         * Fill the repository from some data source.
         */
        virtual void Load();

        Repository(const Repository &) = delete;
        Repository &operator=(const Repository &) = delete;

    protected:
        /**
         * Default constructor.
         */
        Repository();

        /**
         * Called by Add() after the object is added.
         *
         * \param entity The object that was added, which in turn is the
         *               same one that was passed to Add().
         */
        virtual void OnAdded(const T &entity);

        /**
         * Called by Remove() after the object is removed.
         *
         * \param entity The object that was removed, which in turn is the
         *               same one that was passed to Remove().
         */
        virtual void OnRemoved(const T &entity);

    private:
        std::set<T, Compare> _entities;
        mutable std::vector<T> _cachedEntities;
        mutable bool _containerChanged = false;
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
    const std::vector<T> &Repository<T, Compare>::Entities() const noexcept
    {
        if(_containerChanged)
        {
            _cachedEntities = { _entities.begin(), _entities.end() };
            _containerChanged = false;
        }

        return _cachedEntities;
    }

    template<typename T, typename Compare>
    size_t Repository<T, Compare>::Count() const noexcept
    {
        return _entities.size();
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
    void Repository<T, Compare>::Add(const T &entity)
    {
        _entities.insert(entity);
        _containerChanged = true;
        OnAdded(entity);
    }

    template<typename T, typename Compare>
    void Repository<T, Compare>::Remove(const T &entity)
    {
        _entities.erase(entity);
        _containerChanged = true;
        OnRemoved(entity);
    }

    template<typename T, typename Compare>
    void Repository<T, Compare>::OnAdded(const T &entity)
    {
        // Default implementation no-op
    }

    template<typename T, typename Compare>
    void Repository<T, Compare>::OnRemoved(const T &entity)
    {
        // Default implementation no-op
    }
}

template<typename T, typename Cmp>
auto begin(const Ceris::Repository<T, Cmp> *repo)
{
    return repo->Entities().begin();
}

template<typename T, typename Cmp>
auto end(const Ceris::Repository<T, Cmp> *repo)
{
    return repo->Entities().end();
}

template<typename T, typename Cmp>
auto begin(const Ceris::Repository<T, Cmp> &repo)
{
    return repo.Entities().begin();
}

template<typename T, typename Cmp>
auto end(const Ceris::Repository<T, Cmp> &repo)
{
    return repo.Entities().end();
}

template<typename T>
auto begin(std::shared_ptr<T> repo)
{
    return repo->Entities().begin();
}

template<typename T>
auto end(std::shared_ptr<T> repo)
{
    return repo->Entities().end();
}

template<typename T, typename Cmp>
auto cbegin(const Ceris::Repository<T, Cmp> *repo)
{
    return repo->Entities().cbegin();
}

template<typename T, typename Cmp>
auto cend(const Ceris::Repository<T, Cmp> *repo)
{
    return repo->Entities().cend();
}

template<typename T, typename Cmp>
auto cbegin(const Ceris::Repository<T, Cmp> &repo)
{
    return repo.Entities().cbegin();
}

template<typename T, typename Cmp>
auto cend(const Ceris::Repository<T, Cmp> &repo)
{
    return repo.Entities().cend();
}

template<typename T>
auto cbegin(std::shared_ptr<T> repo)
{
    return repo->Entities().cbegin();
}

template<typename T>
auto cend(std::shared_ptr<T> repo)
{
    return repo->Entities().cend();
}

#endif
