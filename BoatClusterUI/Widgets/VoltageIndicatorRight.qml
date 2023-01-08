import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Shapes 1.4
import Qt5Compat.GraphicalEffects
import "../Components"

Item {
    id: voltageIndicatorRight

    Image {
        id: background
        source: "qrc:/Assets/Widgets/VoltCardR.png"
        anchors.fill: parent
    }
}
