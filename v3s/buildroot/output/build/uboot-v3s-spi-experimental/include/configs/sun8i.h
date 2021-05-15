/*
 * (C) Copyright 2014 Chen-Yu Tsai <wens@csie.org>
 *
 * Configuration settings for the Allwinner A23 (sun8i) CPU
 *
 * SPDX-License-Identifier:	GPL-2.0+
 */

#ifndef __CONFIG_H
#define __CONFIG_H

/*
 * A23 specific configuration
 */

#ifdef CONFIG_USB_EHCI
#define CONFIG_USB_EHCI_SUNXI
#endif

#ifdef CONFIG_MACH_SUN8I_H3
	#define CONFIG_SUNXI_USB_PHYS	4
#elif defined CONFIG_MACH_SUN8I_A83T
	#define CONFIG_SUNXI_USB_PHYS	3
#elif defined CONFIG_MACH_SUN8I_V3S
	#define CONFIG_SUNXI_USB_PHYS	1
#else
	#define CONFIG_SUNXI_USB_PHYS	2
#endif

#define CONFIG_BOOTCOMMAND   "sf probe 0; "                           \
                             "sf read 0x41800000 0x100000 0x10000; "  \
                             "sf read 0x41000000 0x110000 0x500000; " \
                             "bootz 0x41000000 - 0x41800000"

#define CONFIG_BOOTARGS      "console=ttyS0,115200 earlyprintk panic=5 rootwait " \
                             "mtdparts=spi32766.0:1M(uboot)ro,64k(dtb)ro,5M(kernel)ro,-(rootfs) root=31:03 rw rootfstype=jffs2"

#define CONFIG_VIDEO_LOGO
#define CONFIG_VIDEO_BMP_LOGO
#define CONFIG_HIDE_LOGO_VERSION

/*
 * Include common sunxi configuration where most the settings are
 */
#include <configs/sunxi-common.h>

#endif /* __CONFIG_H */
