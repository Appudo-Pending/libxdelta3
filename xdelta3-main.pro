###########################################################################################
#    xdelta3-main.pro is part of xdelta3-main
#
#    Copyright (C) 2014
#       543699f52901235482e5b2c38ffc606366c05ce2c371043aecdbeff00215914a source@appudo.com
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
#
###########################################################################################

TEMPLATE = app
CONFIG += console
CONFIG -= app_bundle
CONFIG -= qt

QMAKE_PRE_LINK =
QMAKE_POST_LINK =
QMAKE_RPATHDIR =
QMAKE_RPATH =

INCLUDEPATH += /usr/include \
               src/

QMAKE_CFLAGS += -c -fmessage-length=0 -fvisibility-inlines-hidden -fvisibility=hidden
QMAKE_CFLAGS_RELEASE += -fPIC

QMAKE_LFLAGS += -shared -Wl,-soname=libxdelta3.appudo.so
QMAKE_LFLAGS -= -ccc-gcc-name g++
QMAKE_LFLAGS += -Wl,-z,noexecstack

QMAKE_CFLAGS += -DHAVE_CONFIG_H -DXD3_POSIX -DXD3_USE_LARGEFILE64 -DXD3_MAIN -DSECONDARY_DJW -DSECONDARY_FGK
QMAKE_CFLAGS += -UGENERIC_ENCODE_TABLES -UREGRESSION_TEST -UXD3_DEBUG

QMAKE_CXXFLAGS_DEBUG -= -g -g0 -g1 -g2 -O -O1 -O2 -O3
QMAKE_CXXFLAGS_RELEASE -= -g -g0 -g1 -g2 -O -O1 -O2 -O3
QMAKE_CFLAGS_DEBUG -= -g -g0 -g1 -g2 -O -O1 -O2 -O3
QMAKE_CFLAGS_RELEASE -= -g -g0 -g1 -g2 -O -O1 -O2 -O3

QMAKE_CXXFLAGS_DEBUG *= -g3 -O0
QMAKE_CFLAGS_DEBUG *= -g3 -O0

QMAKE_CXXFLAGS_RELEASE *= -g3 -O3 -DNDEBUG
QMAKE_CFLAGS_RELEASE *= -g0 -O3 -DNDEBUG

MACHINE = $$system(uname -m)
CONFIG(release, debug|release) : DESTDIR = $$_PRO_FILE_PWD_/Release.$$MACHINE
CONFIG(debug, debug|release)   : DESTDIR = $$_PRO_FILE_PWD_/Debug.$$MACHINE
CONFIG(force_debug_info)       : DESTDIR = $$_PRO_FILE_PWD_/Profile.$$MACHINE

QMAKE_MAKEFILE = $$DESTDIR/Makefile
OBJECTS_DIR = $$DESTDIR/.obj
MOC_DIR = $$DESTDIR/.moc
RCC_DIR = $$DESTDIR/.qrc
UI_DIR = $$DESTDIR/.ui

HEADERS += src/xdelta3.h \
    src/xdelta3-second.h \
    src/xdelta3-merge.h \
    src/xdelta3-main.h \
    src/xdelta3-lzma.h \
    src/xdelta3-list.h \
    src/xdelta3-internal.h \
    src/xdelta3-hash.h \
    src/xdelta3-fgk.h \
    src/xdelta3-djw.h \
    src/xdelta3-decode.h \
    src/xdelta3-cfgs.h \
    src/xdelta3-blkcache.h \
    src/config.h

SOURCES += \
           src/xdelta3.c \
    src/main.c

DISTFILES += \
    xdelta-release3_0_apl.zip \
    LICENSE
