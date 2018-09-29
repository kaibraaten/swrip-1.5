TESTDIR = test
ODIR = obj
_OBJ = bet.o file_io.o linkedlist.o misc.o os_posix.o \
	oldrepository.o random.o repositorybase.o sha256.o string_handling.o \
	time_fun.o vector3.o
OBJ  = $(patsubst %,$(ODIR)/%,$(_OBJ))

#Comment out the next line if your system doesn't have dlsym functionality.
#USE_DLSYM = -DSWRIP_USE_DLSYM

WFLAGS = -Wall -Wshadow -Wformat-security -Winline -Wpointer-arith -Wcast-align -Wredundant-decls -Werror -Wwrite-strings -Wextra -Wno-char-subscripts
CXXFLAGS = -g3 -MMD $(GCC_MARCH) $(WFLAGS) -I. -I.. $(USE_DLSYM) -std=c++14

#If not Cygwin environment
ifneq ($(shell echo $$OSTYPE),cygwin)
CXXFLAGS += -fPIC

#Comment out next line to link as static library
LINK_SHARED_LIBRARY = 1
endif

ifdef LINK_SHARED_LIBRARY
LIB_EXT = so
else
LIB_EXT = a
endif

LIBNAME = libutility.$(LIB_EXT)

all:		$(LIBNAME) tests

$(ODIR)/%.o:	%.cpp
		$(CXX) $(CXXFLAGS) -c -o $@ $<

$(LIBNAME):	$(OBJ)
ifdef LINK_SHARED_LIBRARY
		$(CXX) -shared -Wl,-soname,$(LIBNAME) -o $(LIBNAME) $^
else
		ar cru $@ $^
		ranlib $@
endif

tests:		$(LIBNAME)
		$(MAKE) -C $(TESTDIR)

clean:
		rm -f *.so *.a *~ core* $(ODIR)/*.o $(ODIR)/*.d

-include $(ODIR)/*.d
