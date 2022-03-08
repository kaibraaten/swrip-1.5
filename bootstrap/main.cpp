#include <iostream>
#include <unistd.h>
#include <climits>

int SwripMain(int argc, char *argv[]);

int main(int argc, char *argv[])
{
    char buf[PATH_MAX] = {'\0'};
    std::cout << "Running in directory: " << getcwd(buf, sizeof(buf)) << std::endl;
    return SwripMain(argc, argv);
}

