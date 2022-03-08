#ifndef _CERIS_ALGORITHMS_HPP_
#define _CERIS_ALGORITHMS_HPP_

#include <ranges>
#include <algorithm>
#include <iterator>
#include <vector>
#include <random>

template<typename ContainerT, typename PredicateT>
auto Filter(const ContainerT &container, PredicateT pred)
{
    ContainerT filteredElements { };
    std::ranges::copy_if(container,
                         std::back_inserter(filteredElements),
                         pred);
    return filteredElements;
}

template<typename ContainerT>
auto RandomizeOrder(const ContainerT &container)
{
    std::vector<typename ContainerT::value_type> vec { std::begin(container), std::end(container) };
    std::random_device rng;
    std::mt19937 urng(rng());
    std::shuffle(std::begin(vec), std::end(vec), urng);
    ContainerT randomized { std::begin(vec), std::end(vec) };
    return randomized;
}

auto Find(const auto &container, auto pred)
{
    auto i = std::ranges::find_if(container, pred);
    return i != std::end(container) ? *i : nullptr;
}

bool Contains(const auto &container, auto element)
{
    auto i = std::ranges::find(container, element);
    return i != std::end(container);
}

size_t Count(const auto &container, auto pred)
{
    return std::ranges::count_if(container, pred);
}

void ForEach(const auto &container, auto func)
{
    std::ranges::for_each(container, func);
}

auto MergeSequences(const auto &a, const auto &b)
{
    auto output = a;

    for(const auto &element : b)
    {
        output.push_back(element);
    }

    return output;
}

#endif
