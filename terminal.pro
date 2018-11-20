QT += widgets serialport quick core
requires(qtConfig(combobox))
CONFIG += c++11

TARGET = terminal
TEMPLATE = app

DEFINES += QT_DEPRECATED_WARNINGS

SOURCES += \
    main.cpp \
    mainwindow.cpp \
    settingsdialog.cpp \
    console.cpp \
    gyro.cpp

HEADERS += \
    mainwindow.h \
    settingsdialog.h \
    console.h \
    gyro.h

FORMS += \
    mainwindow.ui \
    settingsdialog.ui

RESOURCES += \
    terminal.qrc

#target.path = $$[QT_INSTALL_EXAMPLES]/serialport/terminal
INSTALLS += target

DISTFILES += \
    attitude.qml \
    glcode.js \
    three.js \
    scatter3d.qml
