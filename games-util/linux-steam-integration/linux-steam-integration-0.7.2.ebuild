# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
MULTILIB_COMPAT=( abi_x86_{32,64} )
inherit meson xdg-utils multilib-minimal

DESCRIPTION="Helper for enabling better Steam integration on Linux"
HOMEPAGE="https://github.com/solus-project/linux-steam-integration"
SRC_URI="https://github.com/solus-project/linux-steam-integration/releases/download/v${PV}/${P}.tar.xz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""
DEPEND="dev-util/meson
		x11-libs/gtk+:3" # GTK is only needed in the native abi, so no MULTILIB_USEDEP is necessary
		
RDEPEND="games-util/steam-launcher
		 x11-libs/gtk+:3"

multilib_src_configure() {
	local emesonargs
	if multilib_is_native_abi ; then
		emesonargs=(
			-Dwith-shim=co-exist
			-Dwith-frontend=true
			-Dwith-steam-binary=/usr/bin/steam
			-Dwith-new-libcxx-abi=true
		)
	else
		emesonargs=(
			-Dwith-shim=none
			-Dwith-frontend=false
			-Dwith-steam-binary=/usr/bin/steam
			-Dwith-new-libcxx-abi=true
		)
	fi
	meson_src_configure
}

multilib_src_compile() {
	meson_src_compile
}

multilib_src_install() {
	meson_src_install
}

pkg_postinst() {
	xdg_desktop_database_update
}

pkg_postrm() {
	xdg_desktop_database_update
}
