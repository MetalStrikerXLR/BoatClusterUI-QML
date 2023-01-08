import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Shapes 1.4

Item {
    property int engineTempMin: 0
    property int engineTempMax: 120
    property real engineTempVal: 30
    property int oilTempMin: 0
    property int oilTempMax: 10
    property real oilTempVal: 30

    id: tempMonitorRight

    Image {
        id: backbround
        source: "qrc:/Assets/Widgets/TempCardR.png"
        anchors.fill: parent
    }

    Image {
        id: engineProgressBarBG
        source: "qrc:/Assets/Icons/progressBG.png"
        width: tempMonitorRight.width * 0.65
        height: tempMonitorRight.height * 0.28
        anchors {
            top: tempMonitorRight.top
            left: tempMonitorRight.left
            topMargin: tempMonitorRight.height * 0.138
            leftMargin: tempMonitorRight.width * 0.07
        }

        Rectangle {
            id: engineProgressBarVisual
            width: engineProgressBarBG.width * (engineTempVal/engineTempMax)
            height: engineProgressBarBG.height
            radius: width/2
            color: engineTempVal >= 100 ? "#9F0000" : "#A1A1A1"
            anchors {
                top: engineProgressBarBG.top
                left: engineProgressBarBG.left
            }
        }

        Label {
            id: engMinValTxt
            text: engineTempMin
            color: "white"
            font.pixelSize: 10 * respAvgFactor
            font.bold: true
            anchors {
                horizontalCenter: parent.left
                top: parent.bottom
            }
        }

        Label {
            id: engMidValTxt
            text: engineTempMax/2
            color: "white"
            font.pixelSize: 8 * respAvgFactor
            font.bold: true
            anchors {
                horizontalCenter: parent.horizontalCenter
                top: parent.bottom
            }
        }

        Label {
            id: engMaxValTxt
            text: engineTempMax
            color: "white"
            font.pixelSize: 10 * respAvgFactor
            font.bold: true
            anchors {
                horizontalCenter: parent.right
                top: parent.bottom
            }
        }
    }

    Image {
        id: oilProgressBarBG
        source: "qrc:/Assets/Icons/progressBG.png"
        width: tempMonitorRight.width * 0.65
        height: tempMonitorRight.height * 0.28
        anchors {
            top: tempMonitorRight.top
            left: tempMonitorRight.left
            topMargin: tempMonitorRight.height * 0.587
            leftMargin: tempMonitorRight.width * 0.07
        }

        Rectangle {
            id: oilProgressBarVisual
            width: oilProgressBarBG.width * (oilTempVal/oilTempMax)
            height: oilProgressBarBG.height
            radius: width/2
            color: oilTempVal <= 5 ? "#9F0000" : "#A1A1A1"
            anchors {
                top: oilProgressBarBG.top
                left: oilProgressBarBG.left
            }
        }

        Label {
            id: oilMinValTxt
            text: oilTempMin
            color: "white"
            font.pixelSize: 10 * respAvgFactor
            font.bold: true
            anchors {
                horizontalCenter: parent.left
                top: parent.bottom
            }
        }

        Label {
            id: oilMidValTxt
            text: oilTempMax/2
            color: "white"
            font.pixelSize: 8 * respAvgFactor
            font.bold: true
            anchors {
                horizontalCenter: parent.horizontalCenter
                top: parent.bottom
            }
        }

        Label {
            id: oilMaxValTxt
            text: oilTempMax
            color: "white"
            font.pixelSize: 10 * respAvgFactor
            font.bold: true
            anchors {
                horizontalCenter: parent.right
                top: parent.bottom
            }
        }
    }
}
