rm build/*.h
rm build/*.a
rm build/*.exe
meson setup build
#meson setup build --reconfigure
meson compile -C build
meson install -C build
rm *.a
rm *.exe.a
./virgil.exe --test-build
