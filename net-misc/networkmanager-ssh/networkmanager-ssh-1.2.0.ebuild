# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
inherit autotools

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="https://github.com/danfruehauf/NetworkManager-ssh/archive/1.2.0.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="gtk"

DEPEND=">=sys-devel/autoconf-2.5.2"
RDEPEND=">=net-misc/networkmanager-1.1.0
         gtk? ( apt-crypt/libsecret
                >=x11-libs/gtk+-3.4:3
                >=gnome-extra/nm-applet-1.1.0 )
        "
S="${WORKDIR}/NetworkManager-ssh-${PV}"

src_prepare() {
    eautoreconf
    default_src_prepare
}
