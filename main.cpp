#include "ai.h"
#include "cards.h"
#include "gamecontrol.h"
#include "player.h"
#include "playerhandler.h"
#include "settings.h"

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
    Cards cards;
    GameControl gameControl;
    Player player;
    PlayerHandler playerHandler;
    Settings settings;

    engine.rootContext()->setContextProperty("Ai", &ai);
    engine.rootContext()->setContextProperty("Cards", &cards);
    engine.rootContext()->setContextProperty("GameControl", &gameControl);
    engine.rootContext()->setContextProperty("Player", &player);
    engine.rootContext()->setContextProperty("PlayerHandler", &playerHandler);
    engine.rootContext()->setContextProperty("Settings", &settings);

    engine.load(url);

    return app.exec();
}
