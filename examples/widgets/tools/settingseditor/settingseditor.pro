QT += widgets

HEADERS       = locationdialog.h \
                mainwindow.h \
                settingstree.h \
                variantdelegate.h
SOURCES       = locationdialog.cpp \
                main.cpp \
                mainwindow.cpp \
                settingstree.cpp \
                variantdelegate.cpp

EXAMPLE_FILES = inifiles

# install
target.path = $$[QT_INSTALL_EXAMPLES]/tools/settingseditor
INSTALLS += target

simulator: warning(This example might not fully work on Simulator platform)
