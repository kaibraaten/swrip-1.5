#ifndef _CERIS_ALGORITHMS_HPP_
#define _CERIS_ALGORITHMS_HPP_

#include <algorithm>
#include <iterator>

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

template<typename Container, typename UnaryPredicate>
auto Find(const Container &original, UnaryPredicate pred)
{
  auto i = find_if(std::begin(original), std::end(original), pred);
  return i != std::end(original) ? *i : nullptr;
}

template<typename Container, typename UnaryPredicate>
size_t Count(const Container &container, UnaryPredicate pred)
{
  return count_if(std::begin(container), std::end(container), pred);
}

#endif
