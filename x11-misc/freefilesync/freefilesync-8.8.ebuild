# Copyright 2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

WX_GTK_VER="3.0"
inherit wxwidgets

DESCRIPTION="FreeFileSync is a folder comparison and synchronization tool"
HOMEPAGE="https://www.freefilesync.org/ http://sourceforge.net/projects/freefilesync/"
SRC_URI="https://dl.dropboxusercontent.com/u/74545385/FreeFileSync_8.8_Source.zip"
#SRC_URI="http://www.freefilesync.org/archive/FreeFileSync_${PV}_Source.zip"
LICENSE="GPL-3"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="app-arch/unzip
	x11-libs/wxGTK:3.0[X]
	>=dev-libs/zenxml-2.3"

RDEPEND="x11-libs/wxGTK:3.0[X]
	dev-libs/boost"

S=${WORKDIR}

src_prepare(){
    sed -i 's/m_listBoxHistory->GetTopItem()/0/g' FreeFileSync/Source/ui/main_dlg.cpp
    sed -i 's!static_assert!//static_assert!' zen/scope_guard.h
    sed -i 's!-O3 -DN!-D"warn_static(arg)= " -O3 -DN!' FreeFileSync/Source/Makefile
    sed -i 's!-O3 -DN!-D"warn_static(arg)= " -O3 -DN!' FreeFileSync/Source/RealTimeSync/Makefile
    sed -i 's/time_t getVersionCheckInactiveId()/inline time_t getVersionCheckInactiveId()/' FreeFileSync/Source/ui/version_check_impl.h
    sed -i 's/bool shouldRunPeriodicUpdateCheck(time_t lastUpdateCheck)/inline bool shouldRunPeriodicUpdateCheck(time_t lastUpdateCheck)/' FreeFileSync/Source/ui/version_check_impl.h
}

src_compile(){
    cd FreeFileSync/Source
    emake launchpad
    cd RealTimeSync
    emake launchpad
}

src_install(){
    cd FreeFileSync/Source
    emake DESTDIR="${D}" install || die "Install failed for FreeFileSync"
    cd RealTimeSync
    emake DESTDIR="${D}" install || die "Install failed for RealTimeSync"

    unzip ../../Build/Resources.zip FreeFileSync.png RealTimeSync.png

    newicon FreeFileSync.png FreeFileSync.png
    make_desktop_entry "FreeFileSync" "Synchronize files and folders" "FreeFileSync" "System;Utility"

    newicon RealTimeSync.png RealTimeSync.png
    make_desktop_entry "RealTimeSync" "Synchronize files and folders in realtime" "RealTimeSync" "System;Utility" 
}
