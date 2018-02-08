BIN = libsndfile

INSTALL_XIPH_LIBS ?= false
CCFLAGS := $(CFLAGS) -std=c99 -pedantic -O2 -fPIC -I../ -Isndfile/src/ -Lsndfile/src/.libs/ -Logg/src/.libs/ -Lflac/src/libFLAC/.libs/ -Lvorbis/lib/.libs/


SRC =
OBJ = $(SRC:.c=.o)
LIBS = -lm
STATIC_LIBS = -logg -lvorbisenc -lvorbis -lFLAC -lsndfile

ifeq ($(OS),Windows_NT)
	BIN := $(BIN).dll.bodged
	CCFLAGS := $(CCFLAGS) -Wl,-soname,$(BIN)
	LFLAGS := -Wl,--whole-archive -Wl,-Bstatic $(STATIC_LIBS) -Wl,--no-whole-archive -Wl,-Bdynamic $(LIBS)
else
	UNAME_S := $(shell uname -s)
	ifeq ($(UNAME_S),Darwin)
		BIN := $(BIN).dylib.bodged
		CCFLAGS := $(CCFLAGS) -Wl,-install_name,$(BIN)
		LFLAGS := $(LIBS) -all_load $(STATIC_LIBS)
	else
		BIN := $(BIN).so.bodged
		CCFLAGS := $(CCFLAGS) -Wl,-soname,$(BIN)
		LFLAGS := -Wl,--whole-archive -Wl,-Bstatic $(STATIC_LIBS) -Wl,--no-whole-archive -Wl,-Bdynamic $(LIBS)
	endif
endif

build: $(BIN)


$(BIN):
	cd ogg/ &&										\
	./autogen.sh &&										\
	./configure --enable-static --disable-shared --with-pic &&				\
	make && ($(INSTALL_XIPH_LIBS) && sudo make install || true)

	cd vorbis/ &&										\
	./autogen.sh &&										\
	./configure --enable-static --disable-shared --disable-docs --disable-examples		\
		    --with-pic &&								\
	make && ($(INSTALL_XIPH_LIBS) && sudo make install || true)

	cd flac/ &&										\
	./autogen.sh &&										\
	./configure --enable-static --disable-shared --disable-thorough-tests			\
		    --disable-doxygen-docs --disable-examples --disable-cpplibs --with-pic &&	\
	make && ($(INSTALL_XIPH_LIBS) && sudo make install || true)

	cd sndfile/ && 										\
	./autogen.sh &&										\
	./configure --disable-sqlite3 --disable-shared --disable-full-suite --disable-alsa	\
		    --with-pic &&								\
	make

	$(CC) -shared $(SRC) $(CCFLAGS) -o $(BIN) $(LFLAGS)

clean:
	git submodule foreach git clean -fdx
	rm -f $(BIN) $(OBJS)
