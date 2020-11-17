#ifndef _CERIS_ALGORITHMS_HPP_
#define _CERIS_ALGORITHMS_HPP_

#include <ranges>
#include <algorithm>
#include <iterator>
#include <vector>
#include <random>

template<typename Container, typename UnaryPredicate>
auto Filter(const Container &container, UnaryPredicate pred)
{
    Container filteredElements;
    std::ranges::copy_if(container,
                         std::back_inserter(filteredElements),
                         pred);
    return filteredElements;
}

template<typename Container>
auto Reverse(const Container &container)
{
    Container reversed(std::rbegin(container), std::rend(container));
    return reversed;
}

template<typename Container>
auto RandomizeOrder(const Container &container)
{
    std::vector<typename Container::value_type> vec(std::begin(container), std::end(container));
    std::random_device rng;
    std::mt19937 urng(rng());
    std::shuffle(std::begin(vec), std::end(vec), urng);
    Container randomized(std::begin(vec), std::end(vec));
    return randomized;
}

template<typename Container, typename UnaryPredicate>
auto Find(const Container &container, UnaryPredicate pred)
{
    auto i = std::ranges::find_if(container, pred);
    return i != std::end(container) ? *i : nullptr;
}

template<typename Container, typename T>
bool Contains(const Container &container, T element)
{
    auto i = std::ranges::find(container, element);
    return i != std::end(container);
}

template<typename Container, typename UnaryPredicate>
size_t Count(const Container &container, UnaryPredicate pred)
{
    return std::ranges::count_if(container, pred);
}

template<typename Container, typename UnaryFunction>
void ForEach(const Container &container, UnaryFunction func)
{
    std::ranges::for_each(container, func);
}

template<typename T>
auto MergeSequences(const T &a, const T &b)
{
    auto output = a;

    for(const auto &element : b)
    {
        output.push_back(element);
    }

    return output;
}

#endif
