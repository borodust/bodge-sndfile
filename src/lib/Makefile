NAME = libsndfile

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

STRIP := strip -s

BUILD_PREFIX=$(WORK_DIR)/build
BUILD_LIBRARY_PATH := $(BUILD_PREFIX)/lib

#
# WINDOWS
#
ifeq ($(CURRENT_OS),windows)

BUILD_HOOKS += build-windows

SNDFILE_BIN := $(NAME).$(EXTENSION)
OGG_BIN := libogg-0.$(EXTENSION)
VORBIS_BIN := libvorbis-0.$(EXTENSION)
VORBISENC_BIN := libvorbisenc-2.$(EXTENSION)
FLAC_BIN := libFLAC-8.$(EXTENSION)
OPUS_BIN := libopus-0.$(EXTENSION)

BUILD_LIBRARY_PATH := $(BUILD_PREFIX)/bin

FLAC_LIBS := -lssp
OPUS_LIBS := -lssp

endif

#
# LINUX
#
ifeq ($(CURRENT_OS),linux)

BUILD_HOOKS += build-linux

SNDFILE_BIN := $(NAME).$(EXTENSION)
OGG_BIN := libogg.$(EXTENSION).0
VORBIS_BIN := libvorbis.$(EXTENSION).0
VORBISENC_BIN := libvorbisenc.$(EXTENSION).2
FLAC_BIN := libFLAC.$(EXTENSION).8
OPUS_BIN := libopus.$(EXTENSION).0

endif

#
# DARWIN
#
ifeq ($(CURRENT_OS),darwin)

BUILD_HOOKS += build-darwin

SNDFILE_BIN := $(NAME).0.$(EXTENSION)
OGG_BIN := libogg.0.$(EXTENSION)
VORBIS_BIN := libvorbis.0.$(EXTENSION)
VORBISENC_BIN := libvorbisenc.2.$(EXTENSION)
FLAC_BIN := libFLAC.8.$(EXTENSION)
OPUS_BIN := libopus.0.$(EXTENSION)

STRIP := strip -ST

endif

#
# COMMON
#
BINS := $(SNDFILE_BIN) $(OGG_BIN) $(VORBIS_BIN) $(VORBISENC_BIN) $(FLAC_BIN) $(OPUS_BIN)
BIN_ARCHIVE := sndfile.tar.gz


###
### TARGETS
###
build: $(BINS) $(BUILD_HOOKS)


build-windows:


build-linux: $(BINS)
	for BIN in $(BINS); do \
		patchelf --set-rpath '$$ORIGIN/' $$BIN; \
	done
	patchelf --set-soname '$(SNDFILE_BIN).bodged' $(SNDFILE_BIN)

build-darwin:
	install_name_tool -id "@rpath/$(SNDFILE_BIN)" $(SNDFILE_BIN)
	install_name_tool -change $(BUILD_LIBRARY_PATH)/$(VORBISENC_BIN) "@loader_path/$(VORBISENC_BIN)" $(SNDFILE_BIN)
	install_name_tool -change $(BUILD_LIBRARY_PATH)/$(VORBIS_BIN) "@loader_path/$(VORBIS_BIN)" $(SNDFILE_BIN)
	install_name_tool -change $(BUILD_LIBRARY_PATH)/$(FLAC_BIN) "@loader_path/$(FLAC_BIN)" $(SNDFILE_BIN)
	install_name_tool -change $(BUILD_LIBRARY_PATH)/$(OPUS_BIN) "@loader_path/$(OPUS_BIN)" $(SNDFILE_BIN)
	install_name_tool -change $(BUILD_LIBRARY_PATH)/$(OGG_BIN) "@loader_path/$(OGG_BIN)" $(SNDFILE_BIN)

	install_name_tool -id "@rpath/$(OGG_BIN)" $(OGG_BIN)

	install_name_tool -id "@rpath/$(FLAC_BIN)" $(FLAC_BIN)
	install_name_tool -change $(BUILD_LIBRARY_PATH)/$(OGG_BIN) "@loader_path/$(OGG_BIN)" $(FLAC_BIN)

	install_name_tool -id "@rpath/$(VORBIS_BIN)" $(VORBIS_BIN)
	install_name_tool -change $(BUILD_LIBRARY_PATH)/$(OGG_BIN) "@loader_path/$(OGG_BIN)" $(VORBIS_BIN)

	install_name_tool -id "@rpath/$(VORBISENC_BIN)" $(VORBISENC_BIN)
	install_name_tool -change $(BUILD_LIBRARY_PATH)/$(OGG_BIN) "@loader_path/$(OGG_BIN)" $(VORBISENC_BIN)
	install_name_tool -change $(BUILD_LIBRARY_PATH)/$(VORBIS_BIN) "@loader_path/$(VORBIS_BIN)" $(VORBISENC_BIN)

	install_name_tool -id "@rpath/$(OPUS_BIN)" $(OPUS_BIN)


$(OGG_BIN):
	cd ogg/ \
	&& ./autogen.sh \
	&& ./configure --disable-static --enable-shared --with-pic --build=$(HOST) \
			--prefix=$(BUILD_PREFIX) \
	&& make && make install
	cp -fL $(BUILD_LIBRARY_PATH)/$(OGG_BIN) $(WORK_DIR)/$(OGG_BIN)
	$(STRIP) $(OGG_BIN)


$(VORBIS_BIN) $(VORBISENC_BIN): $(OGG_BIN)
	cd vorbis/ \
	&& ./autogen.sh \
	&& ./configure PKG_CONFIG="" \
			--disable-static --enable-shared --disable-docs \
			--disable-examples \
			--with-pic --disable-oggtest --build=$(HOST) \
			--with-ogg=$(BUILD_PREFIX) \
			--prefix=$(BUILD_PREFIX) \
	&& make && make install
	cp -fL $(BUILD_LIBRARY_PATH)/$(VORBIS_BIN) $(BUILD_LIBRARY_PATH)/$(VORBISENC_BIN) $(WORK_DIR)
	$(STRIP) $(VORBIS_BIN) $(VORBISENC_BIN)


$(FLAC_BIN): $(OGG_BIN)
	cd flac/ \
	&& ./autogen.sh \
	&& ./configure LIBS="$(FLAC_LIBS)" \
			--disable-static --enable-shared --disable-thorough-tests \
		    	--disable-doxygen-docs --disable-examples --disable-cpplibs \
		    	--with-pic --disable-oggtest --build=$(HOST) \
			--with-ogg=$(BUILD_PREFIX) \
			--prefix=$(BUILD_PREFIX) \
	&& make && make install
	cp -fL $(BUILD_LIBRARY_PATH)/$(FLAC_BIN) $(WORK_DIR)/$(FLAC_BIN)
	$(STRIP) $(FLAC_BIN)


$(OPUS_BIN):
	cd opus/ \
	&& ./autogen.sh \
	&& ./configure LIBS="$(OPUS_LIBS)" X86_SSE4_1_CFLAGS="" X86_AVX_CFLAGS="" \
		$(BODGE_OPUS_OPTIMIZATIONS) \
		--disable-static --enable-shared --disable-extra-programs \
		--disable-doc --with-pic --build=$(HOST) \
		--prefix=$(BUILD_PREFIX) \
	&& make && make install
	cp -fL $(BUILD_LIBRARY_PATH)/$(OPUS_BIN) $(WORK_DIR)/$(OPUS_BIN)
	$(STRIP) $(OPUS_BIN)


$(SNDFILE_BIN): $(OGG_BIN) $(VORBIS_BIN) $(VORBISENC_BIN)	\
		 $(FLAC_BIN) $(OPUS_BIN)
	cd sndfile/ \
	&& mkdir -p build && cd build \
	&& cmake -G"Unix Makefiles" \
		-DCMAKE_BUILD_TYPE=Release  \
		-DENABLE_EXTERNAL_LIBS=ON -DBUILD_SHARED_LIBS=ON \
		-DBUILD_EXAMPLES=OFF -DBUILD_PROGRAMS=OFF -DBUILD_TESTING=OFF \
		-DENABLE_EXPERIMENTAL=OFF -DENABLE_CPACK=OFF -DENABLE_PACKAGE_CONFIG=OFF \
		-DBUILD_REGTEST=OFF \
		-DCMAKE_PREFIX_PATH=$(BUILD_PREFIX) \
		-DCMAKE_POSITION_INDEPENDENT_CODE=ON .. \
	&& cmake --build . \
	&& cp -fL libsndfile.$(EXTENSION) $(WORK_DIR)/$(SNDFILE_BIN)
	$(STRIP) $(SNDFILE_BIN)


$(BIN_ARCHIVE): build
	tar -czf $(BIN_ARCHIVE) $(BINS)


archive: $(BIN_ARCHIVE)


clean:
	git submodule foreach git clean -ffdx
	rm -rf $(BUILD_PREFIX)
	rm -f $(BINS) $(BIN_ARCHIVE) lib*.$(EXTENSION)
