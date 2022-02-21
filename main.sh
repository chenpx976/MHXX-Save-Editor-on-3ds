./3dstool -cvtf romfs romfs.bin --romfs-dir source
rm "MHXX Save Editor.cia"
./makerom -f cia -o "MHXX Save Editor.cia" -elf lpp-3ds.elf -rsf cia_workaround.rsf -icon icon.bin -banner banner.bin -exefslogo -target t -romfs romfs.bin
rm romfs.bin
echo "built complete"