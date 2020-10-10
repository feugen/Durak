
#include "gamecontrol.h"
#include "settings.h"
#include "stepcontrol.h"

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

    GameControl gameControl;
    StepControl stepControl;
    Settings settings;

    engine.rootContext()->setContextProperty("GameControl", &gameControl);
    engine.rootContext()->setContextProperty("Stepcontrol", &stepControl);
    engine.rootContext()->setContextProperty("Settings", &settings);


    engine.load(url);

    return app.exec();
}
