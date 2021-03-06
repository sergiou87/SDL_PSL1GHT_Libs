./download.sh SDL2_mixer-2.0.4.tar.gz || { exit 1; }

tar xfvz archives/SDL2_mixer-2.0.4.tar.gz || { exit 1; }

cd SDL2_mixer-2.0.4 || { exit 1; }

cp ../archives/config.sub ../archives/config.guess build-scripts/ || { exit 1; }

#cat ../patches/SDL2_mixer-2.0.4.patch | patch -p1 || { exit 1; }

LIBMIKMOD_CONFIG="$PS3DEV/portlibs/ppu/bin/libmikmod-config"
export LIBMIKMOD_CONFIG
./configure --prefix="$PS3DEV/portlibs/ppu" --host=powerpc64-ps3-elf \
	--disable-sdltest \
	--with-sdl-exec-prefix="$PS3DEV/portlibs/ppu" \
	--disable-shared \
	--enable-music-mod-mikmod \
	--disable-music-cmd \
	--disable-music-ogg-shared \
	--disable-music-mp3 \
	--disable-music-flac \
    	|| { exit 1; }

make && make install || { exit 1; }
