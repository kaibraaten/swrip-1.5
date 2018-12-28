#!/bin/env python
import time
from globals import *
from update import *

def main():
    while not mud_down:
        AcceptNewSocket()
        HandleSocketInput()
        UpdateHandler()
        ImcLoop()
        HandleSocketOutput()
        Sleep()

def AcceptNewSocket():
    pass

def HandleSocketInput():
    for d in descriptors.entities:
        pass

def HandleSocketOutput():
    for d in descriptors.entities:
        pass
    
def ImcLoop():
    pass

def Sleep():
    time.sleep(0.250)
    
if __name__ == '__main__':
    main()
