#include <gtest/gtest.h>
#include <gmock/gmock.h>
#include <iostream>

int main(int argc, char *argv[])
{
  ::testing::InitGoogleTest(&argc, argv);
  RUN_ALL_TESTS();
}
