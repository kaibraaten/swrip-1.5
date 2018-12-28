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
    for(auto &direnty : fs::directory_iterator("."))
    {
        ++counter;
    }

    // Assert
    EXPECT_NE(0, counter);
}
