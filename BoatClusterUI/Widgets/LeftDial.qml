import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Shapes 1.4
import Qt5Compat.GraphicalEffects
import "../Components"

Item {
    property real minValue: 0
    property real maxValue: 6000
    property int value: 0

    id: leftDial

    CircularBar {
        width: parent.width - (30 * respWidthFactor)
        height: parent.height - (30 * respHeightFactor)
        minValue: parent.minValue
        maxValue: parent.maxValue
        value: parent.value
        startAngle: 47.5
        spanAngle: -148.5
        dialWidth: parent.width - dialCenter.width
        progressColor: "#9F0000"
        penStyle: Qt.FlatCap
        dialType: CircularBar.NoDial

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }

    Image {
        id: dialCenter
        width: 470 * respWidthFactor
        height: 470 * respHeightFactor
        source: "qrc:/Assets/Widgets/DialCenter.png"
        anchors {
            horizontalCenter: parent.horizontalCenter
            verticalCenter: parent.verticalCenter
        }

        Label {
            id: dialValue
            text: value
            color: "#EEEEEE"
            font.family: "Kentledge"
            font.pixelSize: 70 * respAvgFactor
            font.bold: true
            anchors {
                horizontalCenter: parent.horizontalCenter
                top: parent.top
                topMargin: 162 * respHeightFactor
            }
        }

        Label {
            id: dialUnit
            text: "RPM"
            color: "#EEEEEE"
            font.family: "Kentledge"
            font.pixelSize: 35 * respAvgFactor
            anchors {
                horizontalCenter: dialValue.horizontalCenter
                top: dialValue.bottom
                topMargin: -15 * respHeightFactor
            }
        }
    }

    Image {
        id: dialBg
        width: 708 * respWidthFactor
        height: 744 * respHeightFactor
        source: "qrc:/Assets/Widgets/DialDisplayLeft.png"
        anchors {
            top: parent.top
            right: parent.right
        }
    }
}
