BINARY = test
WFLAGS = -Wall -Werror -Wformat-security -Wpointer-arith -Wcast-align -Wredundant-decls -Wshadow -Wno-unused-parameter -Wno-char-subscripts -Wno-write-strings -Wno-long-long -Wextra -Wno-implicit-fallthrough

CXXFLAGS = -std=c++14 -g3 -MMD -I. -I../src -I../src/libs  $(WFLAGS) -DLUA_C89_NUMBERS
LDFLAGS = -L../src -L../src/libs/utility -Wl,-rpath,../src -Wl,-rpath,../src/libs/utility -lm -lz -lgtest -lutility -lswrip -llua -ldl

ODIR = obj
_OBJ = main.o datadomtests.o

OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))

all:		$(BINARY) runtests

runtests:	$(BINARY)
		./$(BINARY)

$(BINARY):	$(OBJ)
		$(CXX) -o $@ $^ $(LDFLAGS)

$(ODIR)/%.o:	%.cpp
		$(CXX) -c -o $@ $< $(CXXFLAGS)

-include $(ODIR)/*.d

clean:
		-rm -f $(BINARY) *~  $(ODIR)/*.o $(ODIR)/*.d
