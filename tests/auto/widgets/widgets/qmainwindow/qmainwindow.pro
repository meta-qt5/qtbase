CONFIG += testcase
CONFIG += parallel_test
TARGET = tst_qmainwindow
QT += widgets widgets-private testlib
SOURCES += tst_qmainwindow.cpp
DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0
