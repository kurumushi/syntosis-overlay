# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
inherit git-r3

DESCRIPTION="A modern and lightweight status bar for X window managers."
HOMEPAGE="https://github.com/geommer/yabar"
#SRC_URI="https://github.com/geommer/yabar/archive/${PV}.tar.gz -> ${P}.tar.gz"
EGIT_REPO_URI="https://github.com/geommer/yabar.git"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
		 >=dev-libs/libconfig-1.5
		 x11-libs/cairo[xcb]
		 x11-libs/pango
		 x11-libs/xcb-util-wm
		 x11-libs/gdk-pixbuf"

