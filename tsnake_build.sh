source vendor/tsnake/ver.sh

source ./.config

utils/downloader/downloader vendor/tsnake/down/$tsnake_ver || exit 1

sysroot="$PWD"/out/sysroot
tools_prefix="$PWD"/out/tools
downloads_prefix="$PWD"/out/download

mkdir -p out/build/tsnake &&
cd out/build/tsnake &&

mkdir -p destdir &&

tar xvf "$downloads_prefix"/tsnake-${tsnake_ver}.tar.gz &&

cd Tsnake-${tsnake_ver} &&
MAKEFLAGS=$PAR_MAKEFLAGS make CXX=$tools_prefix/bin/$AOSC_EC_TRIPLET-g++ HOSTCXX=g++ CXXFLAGS="$TARGET_CXXFLAGS -DNO_INTL" LIBS="-lncurses -static-libgcc -static-libstdc++" &&
mkdir -p $PKGDIR/bin &&
cp tsnake $PKGDIR/bin
