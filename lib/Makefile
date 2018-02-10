BIN = libsndfile

SUDO ?= sudo
INSTALL_XIPH_LIBS ?= false
CCFLAGS := $(CFLAGS) -std=c99 -pedantic -O2 -fPIC -I../ -Isndfile/src/ -Lsndfile/src/.libs/ -Logg/src/.libs/ -Lflac/src/libFLAC/.libs/ -Lvorbis/lib/.libs/

SRC =
OBJ = $(SRC:.c=.o)
LIBS = -lm
STATIC_LIBS = -logg -lvorbisenc -lvorbis -lFLAC -lsndfile
WORK_DIR = "$(abspath $(dir $(lastword $(MAKEFILE_LIST))))"

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


$(BIN): build_sndfile
	$(CC) -shared $(SRC) $(CCFLAGS) -o $(BIN) $(LFLAGS)

build_xiph:
	cd ogg/ &&										\
	./autogen.sh &&										\
	./configure --enable-static --disable-shared --with-pic --build=$(HOST)			\
		    --prefix=$(PREFIX) &&							\
	make && ($(INSTALL_XIPH_LIBS) && $(SUDO) make install || true)

	cd vorbis/ &&										\
	./autogen.sh --enable-static --disable-shared --disable-docs --disable-examples		\
		     --with-pic --disable-oggtest --build=$(HOST) --prefix=$(PREFIX)		\
		     --with-ogg-libraries=$(WORK_DIR)/ogg/src/.libs/ 				\
		     --with-ogg-includes=$(WORK_DIR)/ogg/include &&				\
	make && ($(INSTALL_XIPH_LIBS) && $(SUDO) make install || true)

	cd flac/ &&										\
	./autogen.sh &&										\
	./configure --enable-static --disable-shared --disable-thorough-tests			\
		    --disable-doxygen-docs --disable-examples --disable-cpplibs			\
		    --with-pic --disable-oggtest --build=$(HOST) --prefix=$(PREFIX)		\
		    --with-ogg-libraries=$(WORK_DIR)/ogg/src/.libs/ 				\
		    --with-ogg-includes=$(WORK_DIR)/ogg/include &&				\
	make && ($(INSTALL_XIPH_LIBS) && $(SUDO) make install || true)

build_sndfile: build_xiph
	cd sndfile/ && 										\
	./autogen.sh &&										\
	./configure --disable-sqlite3 --disable-shared --disable-full-suite --disable-alsa	\
		    --with-pic --host=$(HOST) &&						\
	make

clean:
	git submodule foreach git clean -fdx
	rm -f $(BIN) $(OBJS)
