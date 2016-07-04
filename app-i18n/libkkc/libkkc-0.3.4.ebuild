# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
PYTHON_COMPAT=( python2_7 )
inherit vala python-r1

DESCRIPTION="libkkc provides a converter from Japanese Kana-string to Kana-Kanji-mixed-string."
HOMEPAGE="https://bitbucket.org/libkkc/libkkc/"
SRC_URI="https://bitbucket.org/libkkc/libkkc/downloads/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-lang/vala"
RDEPEND="${DEPEND}
		 dev-libs/marisa[python]
		 dev-libs/libgee:0.8
		 "

src_compile() {
	python_setup 'python2*'
	emake
}
