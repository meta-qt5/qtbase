CONFIG += testcase
TARGET = tst_qtextodfwriter
QT += core-private gui-private testlib
SOURCES += tst_qtextodfwriter.cpp

DEFINES += SRCDIR=\\\"$$PWD\\\"
DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0
