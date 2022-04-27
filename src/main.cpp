#include <QGuiApplication>
#include <QQmlApplicationEngine>

// test
#include "core/json_unit.h"

int main(int argc, char *argv[])
{
    AniJson::JsonUnit t;
    t.readJsonFile("/home/th000/Desktop/QtProjects/AnimeRecorder/test.json");
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
