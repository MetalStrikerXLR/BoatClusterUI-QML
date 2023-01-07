#include <QGuiApplication>
#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "Modules/clusterdatamonitor.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    //****************************************************************/
    // Initialize GUI Application and QML Engine
    //****************************************************************/
    QApplication app(argc, argv);
    QQmlApplicationEngine engine;

    //****************************************************************/
    // Initialize and expose backend modules here
    //****************************************************************/

    ClusterDataMonitor *cluster_data = new ClusterDataMonitor();
    engine.rootContext()->setContextProperty("clusterdata", cluster_data);

    //****************************************************************/
    // Load QML main page
    //****************************************************************/
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
