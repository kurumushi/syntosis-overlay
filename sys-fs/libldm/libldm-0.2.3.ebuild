# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools

DESCRIPTION="A tool library managing Microsoft Windows (> Vista) dynamic disks"
HOMEPAGE="https://github.com/mdbooth/libldm"
SRC_URI="https://github.com/mdbooth/libldm/archive/libldm-0.2.3.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3 LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
PATCHES=( ${FILESDIR}/${P}-sysmacros.patch ${FILESDIR}/${P}-glib.patch )
DEPEND="dev-util/gtk-doc
		>=sys-devel/automake-1.6"

RDEPEND=">=dev-libs/glib-2.26.0
		 >=dev-libs/json-glib-0.14.0
		 >=sys-libs/zlib-1.2.5
		 >=sys-apps/util-linux-2.21.0
		 sys-fs/lvm2"


src_unpack() {
	unpack "${A}"
	mv "libldm-libldm-${PV}" "${P}"
}

src_prepare() {
	default_src_prepare
	eautoreconf
}

src_install() {
	doinitd ${FILESDIR}/libldm
	default_src_install
}
