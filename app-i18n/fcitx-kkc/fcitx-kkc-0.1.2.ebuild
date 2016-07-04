# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit cmake-utils

DESCRIPTION=""
HOMEPAGE="http://www.fcitx-im.org"
SRC_URI="http://download.fcitx-im.org/${PN}/${P}.tar.xz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="qt"

DEPEND=""
RDEPEND="${DEPEND}
		 >=app-i18n/libkkc-0.2.3
		 qt? ( >=app-i18n/fcitx-qt-4.2.8 )
		 app-i18n/libkkc-data
		 app-i18n/fcitx"
