TARGET = qcocoa

PLUGIN_TYPE = platforms
PLUGIN_CLASS_NAME = QCocoaIntegrationPlugin
load(qt_plugin)

OBJECTIVE_SOURCES += main.mm \
    qcocoaintegration.mm \
    qcocoatheme.mm \
    qcocoabackingstore.mm \
    qcocoawindow.mm \
    qnsview.mm \
    qnsviewaccessibility.mm \
    qcocoaautoreleasepool.mm \
    qnswindowdelegate.mm \
    qcocoaglcontext.mm \
    qcocoanativeinterface.mm \
    qcocoaeventdispatcher.mm \
    qcocoaapplicationdelegate.mm \
    qcocoaapplication.mm \
    qcocoamenu.mm \
    qcocoamenuitem.mm \
    qcocoamenubar.mm \
    qcocoamenuloader.mm \
    qcocoahelpers.mm \
    qmultitouch_mac.mm \
    qcocoaaccessibilityelement.mm \
    qcocoaaccessibility.mm \
    qcocoacolordialoghelper.mm \
    qcocoafiledialoghelper.mm \
    qcocoafontdialoghelper.mm \
    qcocoacursor.mm \
    qcocoaclipboard.mm \
    qcocoadrag.mm \
    qmacclipboard.mm \
    qmacmime.mm \
    qcocoasystemsettings.mm \
    qcocoainputcontext.mm \
    qcocoaservices.mm \
    qcocoasystemtrayicon.mm \
    qcocoaintrospection.mm \
    qcocoakeymapper.mm \

HEADERS += qcocoaintegration.h \
    qcocoatheme.h \
    qcocoabackingstore.h \
    qcocoawindow.h \
    qnsview.h \
    qcocoaautoreleasepool.h \
    qnswindowdelegate.h \
    qcocoaglcontext.h \
    qcocoanativeinterface.h \
    qcocoaeventdispatcher.h \
    qcocoaapplicationdelegate.h \
    qcocoaapplication.h \
    qcocoamenu.h \
    qcocoamenuitem.h \
    qcocoamenubar.h \
    qcocoamenuloader.h \
    qcocoahelpers.h \
    qmultitouch_mac_p.h \
    qcocoaaccessibilityelement.h \
    qcocoaaccessibility.h \
    qcocoacolordialoghelper.h \
    qcocoafiledialoghelper.h \
    qcocoafontdialoghelper.h \
    qcocoacursor.h \
    qcocoaclipboard.h \
    qcocoadrag.h \
    qmacclipboard.h \
    qmacmime.h \
    qcocoasystemsettings.h \
    qcocoainputcontext.h \
    qcocoaservices.h \
    qcocoasystemtrayicon.h \
    qcocoaintrospection.h \
    qcocoakeymapper.h \

RESOURCES += qcocoaresources.qrc

LIBS += -framework Cocoa -framework IOKit

QT += core-private gui-private platformsupport-private

qtHaveModule(widgets) {
    OBJECTIVE_SOURCES += \
        qpaintengine_mac.mm \
        qprintengine_mac.mm \
        qcocoaprintersupport.mm \

    HEADERS += \
        qpaintengine_mac_p.h \
        qprintengine_mac_p.h \
        qcocoaprintersupport.h \

    QT += widgets-private printsupport-private
}

OTHER_FILES += cocoa.json

# Acccessibility debug support
# DEFINES += QT_COCOA_ENABLE_ACCESSIBILITY_INSPECTOR
# include ($$PWD/../../../../util/accessibilityinspector/accessibilityinspector.pri)

# Accessibility is currently unstable and disabled.
DEFINES += QT_NO_COCOA_ACCESSIBILITY

# Window debug support
#DEFINES += QT_COCOA_ENABLE_WINDOW_DEBUG
