#ifndef _CERIS_ALGORITHMS_HPP_
#define _CERIS_ALGORITHMS_HPP_

#include <ranges>
#include <algorithm>
#include <iterator>
#include <vector>
#include <random>

template<typename Container, typename UnaryPredicate>
auto Filter(const Container &original, UnaryPredicate pred)
{
    Container filteredElements;
    std::ranges::copy_if(original,
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

auto Find(const auto &original, auto pred)
{
    auto i = std::ranges::find_if(original, pred);
    return i != std::end(original) ? *i : nullptr;
}

bool Contains(const auto &sequence, auto element)
{
    auto i = std::ranges::find(sequence, element);
    return i != std::end(sequence);
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
