# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
PYTHON_COMPAT=( python2_7 )
inherit python-r1

DESCRIPTION="Data files for libkkc"
HOMEPAGE="https://github.com/ueno/libkkc/"
SRC_URI="https://github.com/ueno/libkkc/releases/download/v0.3.5/${P}.tar.xz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-libs/marisa[python]
		app-i18n/libkkc"
RDEPEND="${DEPEND}"

src_compile() {
	python_setup 'python2*'
	emake
}
