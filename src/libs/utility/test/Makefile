BINARY = test
WFLAGS = -Wall -Werror -Wformat-security -Wpointer-arith -Wcast-align -Wredundant-decls -Wshadow -Wno-unused-parameter -Wno-char-subscripts -Wno-write-strings -Wno-long-long -Wextra -Wno-implicit-fallthrough -Wno-unused-result

CXXFLAGS = -std=c++14 -g3 -MMD -I. -I../..  $(WFLAGS)
LDFLAGS = -L.. -Wl,-rpath,.. -lm -lz -lgtest -lgmock -lutility -ldl

ODIR = obj
_OBJ = main.o bet_tests.o event_tests.o misc_tests.o string_handling_tests.o

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
