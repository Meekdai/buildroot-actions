###backup.sh###
###打包修改的文件###
mkdir -p /var/www/html/

tar czvf /var/www/html/backup_20190220A.tgz \
output/build/linux-zero-4.13.y/drivers/mtd/spi-nor/spi-nor.c \
output/build/linux-zero-4.13.y/drivers/mtd/devices/m25p80.c \
output/build/linux-zero-4.13.y/.config \
output/build/linux-zero-4.13.y/arch/arm/boot/dts/sun8i-v3s-licheepi-zero.dts \
output/build/uboot-v3s-spi-experimental/.config \
output/build/uboot-v3s-spi-experimental/include/configs/sun8i.h \
output/images/inittab \
output/images/mdev.conf \
output/images/automount.sh \
output/images/wpa_supplicant.conf \
output/images/rtl8723bs_nic.bin \
.config \
pre_build.sh \
pack.sh \
backup.sh
