#ifndef CLUSTERDATAMONITOR_H
#define CLUSTERDATAMONITOR_H

#include <QObject>

class ClusterDataMonitor : public QObject
{
    Q_OBJECT
public:
    explicit ClusterDataMonitor(QObject *parent = nullptr);
    ~ClusterDataMonitor();

signals:

private:

};

#endif // CLUSTERDATAMONITOR_H
