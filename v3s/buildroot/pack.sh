###pack.sh###
###编译qt demo 程序 --- 模拟时钟, 并拷贝到文件系统###
cd /opt/buildroot/output/build/qt5base-5.11.1/examples/gui/analogclock
/opt/buildroot/output/host/bin/qmake analogclock.pro
make
cp analogclock /opt/buildroot/output/target/usr/bin/ -rf

###删除旧系统###
cd /opt/buildroot/
rm jffs2.bin -rf
rm flash_32m.bin -rf

###复制一个去除登陆提示的inittab###
cp output/images/inittab   output/target/etc/inittab

###添加一个启动脚本 (模拟时钟)###
# echo "/usr/bin/analogclock -platform linuxfb" > output/target/etc/profile.d/startup.sh

###wifi初始脚本###
cp output/images/wpa_supplicant.conf output/target/etc/ -rf

###复制rtl8723的固件###
mkdir output/target/lib/firmware/rtlwifi/ -p
cp output/images/rtl8723bs_nic.bin output/target/lib/firmware/rtlwifi/ -rf

cp output/images/mdev.conf output/target/etc/ -rf
cp output/images/automount.sh output/target/sbin/ -rf
chmod +x output/target/sbin/

###生成jffs2文件系统
mkfs.jffs2 -s 0x1000 -e 0x10000 --pad=0x19F0000 -d output/target/ -o jffs2.bin

###初始化flash烧录文件, 大小32M
dd if=/dev/zero bs=1M count=32 | tr "\000" "\377" > flash_32m.bin

###拷贝u-boot, dtb,kernel, filesystem###
dd if=notrunc if=output/build/uboot-v3s-spi-experimental/u-boot-sunxi-with-spl.bin of=flash_32m.bin seek=0
# dd if=notrunc if=output/images/env.bin of=flash_32m.bin bs=$((0xF8000)) seek=1
dd if=notrunc if=output/images/sun8i-v3s-licheepi-zero-dock.dtb of=flash_32m.bin bs=$((0x100000)) seek=1
dd if=notrunc if=output/images/zImage of=flash_32m.bin bs=$((0x110000)) seek=1
dd if=notrunc if=jffs2.bin of=flash_32m.bin bs=$((0x610000)) seek=1

#tar czvf files.tgz jffs2.bin output/build/uboot-v3s-spi-experimental/u-boot-sunxi-with-spl.bin output/images/env.bin output/images/sun8i-v3s-licheepi-zero-dock.dtb output/images/zImage
###压缩###
# tar czvf flash.tgz flash_32m.bin

