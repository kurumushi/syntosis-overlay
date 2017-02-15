# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
PYTHON_COMPAT=( python3_5 )
inherit distutils-r1
DESCRIPTION="A modern, hackable, featureful, OpenGL based terminal emulator"
HOMEPAGE="https://github.com/kovidgoyal/kitty"
SRC_URI="https://github.com/kovidgoyal/kitty/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND=">=media-libs/glew-2.0.0"

python_compile() {
	esetup.py build
}

python_install() {
	esetup.py linux-package
	cp -r ${WORKDIR}/${P}/linux-package/bin ${D}
	cp -r ${WORKDIR}/${P}/linux-package/lib ${D}
	cp -r ${WORKDIR}/${P}/linux-package/share ${D}

}
