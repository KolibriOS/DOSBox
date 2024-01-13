#!/bin/bash
set -e

if [[ -z "$KOS_SDK_DIR" ]]; then
    echo "Please set KOS_SDK_DIR. Typically this is <kolibrios-svn>/contrib/sdk"
    exit 1
fi

CFLAGS="-O2 -fno-ident -fomit-frame-pointer -fno-stack-check -fno-stack-protector \
        -mno-stack-arg-probe -fno-asynchronous-unwind-tables -ffast-math \
        -mno-ms-bitfields -march=pentium-mmx \
        -U__WIN32__ -U_Win32 -U_WIN32 -U__MINGW32__ -UWIN32 -DKOLIBRI=1 \
        -I $KOS_SDK_DIR/sources/newlib/libc/include \
        -I $KOS_SDK_DIR/sources/SDL-1.2.2_newlib/include \
        -I $KOS_SDK_DIR/sources/libstdc++-v3/include/"

LDFLAGS="-static -nostdlib -T $KOS_SDK_DIR/sources/newlib/app-dynamic.lds \
         -Wl,--image-base=0,--subsystem=native,--file-alignment=16,--section-alignment=16 \
         -L $KOS_SDK_DIR/lib \
         -L /home/autobuild/tools/win32/mingw32/lib"

./configure \
    --host=i686-kolibri \
    --enable-core-inline \
    --disable-opengl \
    --with-sdl-prefix="$KOS_SDK_DIR/sources/SDL-1.2.2_newlib" \
    CC=kos32-gcc \
    CXX=kos32-g++ \
    CPP="kos32-gcc -E $CFLAGS" \
    CFLAGS="$CFLAGS" \
    CXXFLAGS="$CFLAGS" \
    LDFLAGS="$LDFLAGS" \
    LIBS="-lSDLn -lsound -lstdc++ -lsupc++ -lgcc -lc.dll" \
    ac_cv_header_pwd_h=no

make -j 8
kos32-strip -s src/dosbox.exe
kos32-objcopy -Obinary src/dosbox.exe dosbox

if command -v kpack > /dev/null; then
    kpack dosbox
fi