ODIR = obj
_OBJ = bet.o buffer.o file_io.o hashstr.o misc.o os_unix.o sha256.o string_handling.o time_fun.o vector3.o
OBJ  = $(patsubst %,$(ODIR)/%,$(_OBJ))

#Comment out the next line if your system doesn't have dlsym functionality.
#USE_DLSYM = -DSWRIP_USE_DLSYM

WFLAGS = -Wall -Wshadow -Wformat-security -Winline -Wpointer-arith -Wcast-align -Wredundant-decls -Werror -Wwrite-strings -Wextra -Wno-char-subscripts
CFLAGS = -g3 -MMD -pedantic $(GCC_MARCH) $(WFLAGS) -I. $(USE_DLSYM) -ansi

#If not Cygwin environment
ifneq ($(shell echo $$OSTYPE),cygwin)
CFLAGS += -fPIC

#Comment out next line to link as static library
LINK_SHARED_LIBRARY = 1
endif

ifdef LINK_SHARED_LIBRARY
LIB_EXT = so
else
LIB_EXT = a
endif

LIBNAME = libswr_support.$(LIB_EXT)

all:		$(LIBNAME)

$(ODIR)/%.o:	%.c
		$(CC) -c -o $@ $< $(CFLAGS)

$(LIBNAME):	$(OBJ)
ifdef LINK_SHARED_LIBRARY
		$(CC) -shared -Wl,-soname,$(LIBNAME) -o $(LIBNAME) $^
else
		ar cru $@ $^
		ranlib $@
endif

clean:
		rm -f *.so *.a *~ core* $(ODIR)/*.o $(ODIR)/*.d

-include $(ODIR)/*.d

mos:
		$(MAKE) -f Makefile.MOS

