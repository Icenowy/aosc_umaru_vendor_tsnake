source vendor/tsnake/ver.sh

source ./.config

source lib/ec_strip.sh

fprint="$(mktemp)"

echo $AOSC_EC_ARCH $AOSC_EC_TRIPLET > $fprint

echo $TARGET_CXXFLAGS >> $fprint

cat out/fprint_comps/ncurses >> $fprint

rm -rf $PWD/out/build/tsnake
mkdir -p $PWD/out/build/tsnake

utils/build_cache/cache_build tsnake-$tsnake_ver-$AOSC_EC_TRIPLET $fprint "$PWD"/out/build/tsnake/destdir vendor/tsnake/tsnake_build.sh

rm $fprint

cp -r "$PWD"/out/build/tsnake/destdir/* "$PWD"/out/sysroot/

mkdir -p "$PWD"/out/target/bin

cp "$PWD"/out/sysroot/bin/tsnake "$PWD"/out/target/bin/

ec_strip "$PWD"/out/target/bin/tsnake
