#!/usr/bin/env python

# This script serves as a platform independent 'rm' command.

import os, sys

if __name__ == '__main__':
    try:
        if len(sys.argv) > 1:
            os.remove(sys.argv[1])
    except FileNotFoundError:
        pass
