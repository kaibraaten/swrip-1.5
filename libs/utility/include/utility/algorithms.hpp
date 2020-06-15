#ifndef _CERIS_ALGORITHMS_HPP_
#define _CERIS_ALGORITHMS_HPP_

#include <algorithm>
#include <iterator>
#include <vector>
#include <random>

template<typename Container, typename UnaryPredicate>
auto Filter(const Container &original, UnaryPredicate pred)
{
    Container filteredElements;
    copy_if(std::begin(original),
            std::end(original),
            std::back_inserter(filteredElements),
            pred);
    return filteredElements;
}

template<typename Container>
auto Reverse(const Container &original)
{
    Container reversed(std::rbegin(original), std::rend(original));
    return reversed;
}

template<typename Container>
auto RandomizeOrder(const Container &original)
{
    std::vector<typename Container::value_type> vec(std::begin(original), std::end(original));
    std::random_device rng;
    std::mt19937 urng(rng());
    std::shuffle(std::begin(vec), std::end(vec), urng);
    Container randomized(std::begin(vec), std::end(vec));
    return randomized;
}

template<typename Container, typename UnaryPredicate>
auto Find(const Container &original, UnaryPredicate pred)
{
    auto i = find_if(std::begin(original), std::end(original), pred);
    return i != std::end(original) ? *i : nullptr;
}

template<typename Container, typename T>
bool Contains(const Container &container, T element)
{
    auto i = find(std::begin(container), std::end(container), element);
    return i != std::end(container);
}

template<typename Container, typename UnaryPredicate>
size_t Count(const Container &container, UnaryPredicate pred)
{
    return count_if(std::begin(container), std::end(container), pred);
}

template<typename Container, typename UnaryFunction>
void ForEach(const Container &container, UnaryFunction func)
{
    for_each(std::begin(container), std::end(container), func);
}

#endif
