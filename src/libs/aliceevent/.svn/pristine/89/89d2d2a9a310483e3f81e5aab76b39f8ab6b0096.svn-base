CPP_TEST = cpptest
C_TEST = ctest
WFLAGS = -Werror -Wall -Wformat-security -Wpointer-arith -Wcast-align -Wwrite-strings -Wshadow -Wextra -Wno-unused-parameter -Wredundant-decls

CXXFLAGS += -g3 -MMD $(WFLAGS) -I$(shell echo $$HOME/include) -Ialice
CFLAGS += -g3 -MMD $(WFLAGS) -I$(shell echo $$HOME/include) -Ialice
LDFLAGS += 

ODIR = obj

_CPP_TEST_OBJ = cpptest.o
CPP_TEST_OBJ = $(patsubst %,$(ODIR)/%,$(_CPP_TEST_OBJ))

_LIB_OBJ = clib.o
LIB_OBJ = $(patsubst %,$(ODIR)/%,$(_LIB_OBJ))

_C_TEST_OBJ = ctest.o
C_TEST_OBJ = $(patsubst %,$(ODIR)/%,$(_C_TEST_OBJ))

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

LIBNAME = libaliceevent.$(LIB_EXT)

all:		$(CPP_TEST) $(LIBNAME) $(C_TEST)

$(CPP_TEST):	$(CPP_TEST_OBJ)
		$(CXX) -o $@ $^ $(LDFLAGS)

$(C_TEST):	$(C_TEST_OBJ)
		$(CC) -o $@ $^ -L. -laliceevent -Wl,-rpath,.

$(LIBNAME):	$(LIB_OBJ)
ifdef LINK_SHARED_LIBRARY
		$(CXX) -shared -Wl,-soname,$(LIBNAME) -o $(LIBNAME) $^
else
		ar cru $@ $(LIB_OBJ)
		ranlib $@
endif

$(ODIR)/%.o:	%.cpp
		$(CXX) $(CXXFLAGS) -c $< -o $@

$(ODIR)/%.o:	%.c
		$(CC) $(CFLAGS) -c $< -o $@

-include $(ODIR)/*.d

clean:
		-$(RM) -f $(CPP_TEST) $(C_TEST) $(LIBNAME) *~ $(ODIR)/*.o core* $(ODIR)/*.d

.PHONY:		all clean
