# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
PYTHON_COMPAT=( python2_7 )
inherit python-r1

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="https://bitbucket.org/libkkc/${PN}/downloads/${P}.tar.xz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-libs/marisa[python]"
RDEPEND="${DEPEND}
         app-i18n/skk-jisyo"

src_compile() {
	python_setup 'python2*'
	emake
}
