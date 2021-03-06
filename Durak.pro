QT += quick

CONFIG += c++17

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        src/stepcontrol.cpp \
        src/playingfield.cpp \
        src/table.cpp \
        src/settings.cpp \
        src/ai.cpp \
        src/gamecontrol.cpp \
        src/player.cpp \
        src/playerhandler.cpp \
        src/stack.cpp \
        main.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH = src/qml

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

INCLUDEPATH += $$PWD/include

HEADERS += \
    include/ai.h \
    include/base.h \
    include/gamecontrol.h \
    include/player.h \
    include/playerhandler.h \
    include/playingfield.h \
    include/settings.h \
    include/stack.h \
    include/stepcontrol.h \
    include/table.h
