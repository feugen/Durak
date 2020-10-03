#include "ai.h"
#include "stack.h"
#include "gamecontrol.h"
#include "player.h"
#include "playerhandler.h"
#include "settings.h"
#include "table.h"
#include "playingfield.h"

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    Ai ai;
    Stack cards;
    GameControl gameControl;
    Settings settings;
    Table table;
    PlayingField plyingField;

    qmlRegisterType<Player>("com.example", 1, 0, "Player");
    qmlRegisterType<PlayerHandler>("com.example", 1, 0, "PlayerHandler");

    engine.rootContext()->setContextProperty("Ai", &ai);
    engine.rootContext()->setContextProperty("Cards", &cards);
    engine.rootContext()->setContextProperty("GameControl", &gameControl);
    engine.rootContext()->setContextProperty("Settings", &settings);
    engine.rootContext()->setContextProperty("Table", &table);
    engine.rootContext()->setContextProperty("PlayingField", &plyingField);

    engine.load(url);

    return app.exec();
}
