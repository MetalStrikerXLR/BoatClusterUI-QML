import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Window 2.11

Window {
    width: 1920
    height: 1080
    visible: true
    title: qsTr("Boat Cluster App")

    property int baseAssetWidth: 1920
    property int baseAssetHeight: 1080
    property real respWidthFactor: width / baseAssetWidth
    property real respHeightFactor: height / baseAssetHeight
    property real respAvgFactor: Math.sqrt(Math.pow(respWidthFactor, 2) + Math.pow(respHeightFactor, 2))
}
