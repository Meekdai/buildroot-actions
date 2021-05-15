###build.sh###
###解压修改的文件, 并刷新文件时间，编译###

touch output/build/linux-zero-4.13.y/.config
touch output/build/uboot-v3s-spi-experimental/.config
touch output/build/linux-zero-4.13.y/drivers/mtd/spi-nor/spi-nor.c 
touch output/build/linux-zero-4.13.y/drivers/mtd/devices/m25p80.c 
touch output/build/linux-zero-4.13.y/.config 
touch output/build/linux-zero-4.13.y/arch/arm/boot/dts/sun8i-v3s-licheepi-zero.dts 
touch output/build/uboot-v3s-spi-experimental/.config 
touch output/build/uboot-v3s-spi-experimental/include/configs/sun8i.h 
