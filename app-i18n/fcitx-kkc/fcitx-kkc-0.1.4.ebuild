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
IUSE=""

DEPEND=" >=app-i18n/libkkc-0.2.3
		 >=app-i18n/libkkc-data-0.2.7
		 >=app-i18n/fcitx-4.2.8
		 app-i18n/skk-jisyo"
RDEPEND="${DEPEND}"
