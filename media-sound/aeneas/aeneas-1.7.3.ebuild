# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python2_7 )
inherit distutils-r1

DESCRIPTION="aeneas is a Python/C library and a set of tools to automagically synchronize audio and text (aka forced alignment)."
HOMEPAGE="https://www.readbeyond.it/aeneas/"
SRC_URI="https://github.com/readbeyond/aeneas/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=dev-pyhthon/numpy-1.9
		>=dev-python/beautifulsoup-4.5.1
		>=dev-pyhton/lxml-3.6.0
		app-accessibility/espeak"
RDEPEND="${DEPEND}
		 virtual/ffmpeg
		 app-accessibility/espeak"
