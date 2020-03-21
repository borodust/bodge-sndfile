NAME = libsndfile
EXTENSION =

ifeq ($(BODGE_DISABLE_OPTIMIZATIONS),true)
BODGE_OPUS_OPTIMIZATIONS = --disable-intrinsics
endif

WORK_DIR = "$(abspath $(dir $(lastword $(MAKEFILE_LIST))))"

ifeq ($(OS),Windows_NT)
	EXTENSION := dll
	CURRENT_OS = windows
else
	UNAME_S := $(shell uname -s)
	ifeq ($(UNAME_S),Darwin)
		EXTENSION := dylib
		CURRENT_OS := darwin
	else
		EXTENSION := so
		CURRENT_OS := linux
	endif
endif

SNDFILE_BIN := $(NAME).$(EXTENSION)
OGG_BIN := libogg.$(EXTENSION).0
VORBIS_BIN := libvorbis.$(EXTENSION).0
VORBISENC_BIN := libvorbisenc.$(EXTENSION).2
FLAC_BIN := libFLAC.$(EXTENSION).8
OPUS_BIN := libopus.$(EXTENSION).0

BINS := $(SNDFILE_BIN) $(OGG_BIN) $(VORBIS_BIN) $(VORBISENC_BIN) $(FLAC_BIN) $(OPUS_BIN)
BIN_ARCHIVE := sndfile.tar.gz

BUILD_HOOKS :=

ifeq ($CURRENT_OS,windows)
BUILD_HOOKS += build-windows
endif

ifeq ($CURRENT_OS,linux)
BUILD_HOOKS += build-linux
endif

ifeq ($CURRENT_OS,darwin)
BUILD_HOOKS += build-darwin
endif


build: $(BINS) $(BUILD_HOOKS)


build-windows:


build-linux: $(SNDFILE_BIN)
	patchelf --set-rpath '$ORIGIN/' $(SNDFILE_BIN)


build-darwin:


$(OGG_BIN):
	cd ogg/ \
	&& ./autogen.sh \
	&& ./configure --disable-static --enable-shared --with-pic --build=$(HOST) \
			--prefix=$(PREFIX) \
	&& make \
	&& cp -fL src/.libs/$(OGG_BIN) $(WORK_DIR)/$(OGG_BIN) \
	&& strip -s $(WORK_DIR)/$(OGG_BIN)


$(VORBIS_BIN) $(VORBISENC_BIN):
	cd vorbis/ \
	&& ./autogen.sh --disable-static --enable-shared --disable-docs \
			--disable-examples \
			--with-pic --disable-oggtest --build=$(HOST) --prefix=$(PREFIX) \
			--with-ogg-libraries=$(WORK_DIR)/ogg/src/.libs/ \
			--with-ogg-includes=$(WORK_DIR)/ogg/include \
	&& make \
	&& cp -fL lib/.libs/$(VORBIS_BIN) lib/.libs/$(VORBISENC_BIN) $(WORK_DIR) \
	&& strip -s $(WORK_DIR)/$(VORBIS_BIN) $(WORK_DIR)/$(VORBISENC_BIN)


$(FLAC_BIN):
	cd flac/ \
	&& ./autogen.sh \
	&& ./configure --disable-static --enable-shared --disable-thorough-tests \
		    --disable-doxygen-docs --disable-examples --disable-cpplibs \
		    --with-pic --disable-oggtest --build=$(HOST) --prefix=$(PREFIX) \
		    --with-ogg-libraries=$(WORK_DIR)/ogg/src/.libs/ \
		    --with-ogg-includes=$(WORK_DIR)/ogg/include \
	&& make \
	&& cp -fL src/libFLAC/.libs/$(FLAC_BIN) $(WORK_DIR)/$(FLAC_BIN) \
	&& strip -s $(WORK_DIR)/$(FLAC_BIN)


$(OPUS_BIN):
	cd opus/ \
	&& ./autogen.sh \
	&& ./configure X86_SSE4_1_CFLAGS="" X86_AVX_CFLAGS="" \
		$(BODGE_OPUS_OPTIMIZATIONS) \
		--disable-static --enable-shared --disable-extra-programs \
		--disable-doc --with-pic --build=$(HOST) --prefix=$(PREFIX) \
	&& make \
	&& mkdir -p include-opus/opus/ && cp -fR include/* include-opus/opus/  \
	&& cp -fL .libs/$(OPUS_BIN) $(WORK_DIR)/$(OPUS_BIN) \
	&& strip -s $(WORK_DIR)/$(OPUS_BIN)


$(SNDFILE_BIN): $(OGG_BIN) $(VORBIS_BIN) $(VORBISENC_BIN)	\
		 $(FLAC_BIN) $(OPUS_BIN)
	cd sndfile/ \
	&& mkdir -p build && cd build \
	&& cmake -G"Unix Makefiles" \
		-DENABLE_EXTERNAL_LIBS=ON -DBUILD_SHARED_LIBS=ON \
		-DOGG_INCLUDE_DIR=$(WORK_DIR)/ogg/include/ \
		-DVORBIS_INCLUDE_DIR=$(WORK_DIR)/vorbis/include/ \
		-DVORBISENC_INCLUDE_DIR=$(WORK_DIR)/vorbis/include/ \
		-DFLAC_INCLUDE_DIR=$(WORK_DIR)/flac/include/ \
		-DOPUS_INCLUDE_DIR=$(WORK_DIR)/opus/include-opus/ \
		-DBUILD_EXAMPLES=OFF -DBUILD_PROGRAMS=OFF -DBUILD_TESTING=OFF \
		-DBUILD_REGTEST=OFF \
		-DCMAKE_LIBRARY_PATH=$(WORK_DIR) \
		-DCMAKE_POSITION_INDEPENDENT_CODE=ON .. \
	&& cmake --build . \
	&& cp -fL libsndfile.$(EXTENSION) $(WORK_DIR)/$(SNDFILE_BIN) \
	&& strip -s $(WORK_DIR)/$(SNDFILE_BIN)


$(BIN_ARCHIVE): build
	tar -czf $(BIN_ARCHIVE) $(BINS)


archive: $(BIN_ARCHIVE)


clean:
	git submodule foreach git clean -ffdx
	rm -f $(BINS) $(BIN_ARCHIVE)
