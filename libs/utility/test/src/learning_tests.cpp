#include <string>
#include <filesystem>
#include <gtest/gtest.h>
#include <gmock/gmock.h>

namespace fs = std::filesystem;

TEST(LearningTests, LoopFiles)
{
    // Arrange
    size_t counter = 0;

    // Act
    for(const auto &entry : fs::directory_iterator("."))
    {
        auto path = entry.path();
        ++counter;
    }

    // Assert
    EXPECT_NE(0, counter);
}
