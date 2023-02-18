import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Window 2.11
import "./Widgets"
import "./Components"

ApplicationWindow {
    width: 1280
    height: 720
    visible: true
    title: qsTr("Boat Cluster App")

    property int baseAssetWidth: 1920
    property int baseAssetHeight: 1080
    property real respWidthFactor: width / baseAssetWidth
    property real respHeightFactor: height / baseAssetHeight
    property real respAvgFactor: Math.sqrt(Math.pow(respWidthFactor, 2) + Math.pow(respHeightFactor, 2))

    Rectangle {
        id: background
        color: "#1F1F23"
        anchors.fill: parent
    }

    SystemMessage {
        id: sysMsg
        width: 290 * respWidthFactor
        height: 164 * respHeightFactor
        anchors {
            top: parent.top
            left: parent.left
            topMargin: 111 * respHeightFactor
            leftMargin: 815 * respWidthFactor
        }
    }

    VoltageIndicatorLeft {
        property real voltVal: 0.00

        id: voltIndLeft
        width: 184 * respWidthFactor
        height: 132 * respHeightFactor
        anchors {
            top: parent.top
            left: parent.left
            topMargin: 110 * respHeightFactor
            leftMargin: 162 * respWidthFactor
        }

        Label {
            id: voltageLeftTxt
            text: voltIndLeft.voltVal.toFixed(2) + "V"
            color: "#A1A1A1"
            font.family: "Kentledge"
            font.pixelSize: 23 * respAvgFactor
            horizontalAlignment: Qt.AlignCenter

            anchors {
                horizontalCenter: parent.horizontalCenter
                top: parent.top
                topMargin: 76 * respHeightFactor
            }
        }
    }

    VoltageIndicatorRight {
        property real voltVal: 0.00

        id: voltIndRight
        width: 184 * respWidthFactor
        height: 132 * respHeightFactor
        anchors {
            top: parent.top
            left: parent.left
            topMargin: 110 * respHeightFactor
            leftMargin: 1576 * respWidthFactor
        }

        Label {
            id: voltageRightTxt
            text: voltIndRight.voltVal.toFixed(2) + "V"
            color: "#A1A1A1"
            font.family: "Kentledge"
            font.pixelSize: 23 * respAvgFactor
            horizontalAlignment: Qt.AlignCenter

            anchors {
                horizontalCenter: parent.horizontalCenter
                top: parent.top
                topMargin: 76 * respHeightFactor
            }
        }
    }

    LeftDial {
        id: leftRpmDial
        width: 751 * respWidthFactor
        height: 751 * respHeightFactor
        value: 0
        anchors {
            top: parent.top
            left: parent.left
            topMargin: 212 * respHeightFactor
            leftMargin: 149 * respWidthFactor
        }
    }

    RightDial {
        id: rightRpmDial
        width: 751 * respWidthFactor
        height: 751 * respHeightFactor
        value: 0
        anchors {
            top: parent.top
            left: parent.left
            topMargin: 212 * respHeightFactor
            leftMargin: 1018 * respWidthFactor
        }
    }

    TempMonitorLeft {
        id: tempMonLeft
        width: 335 * respWidthFactor
        height: 167 * respHeightFactor
        anchors {
            top: parent.top
            left: parent.left
            topMargin: 686 * respHeightFactor
            leftMargin: 239 * respWidthFactor
        }

        oilTempVal: 0
        engineTempVal: 0
    }

    TempMonitorRight {
        id: tempMonRight
        width: 335 * respWidthFactor
        height: 167 * respHeightFactor
        anchors {
            top: parent.top
            left: parent.left
            topMargin: 686 * respHeightFactor
            leftMargin: 1345 * respWidthFactor
        }

        oilTempVal: 0
        engineTempVal: 0
    }

    Image {
        id: ps
        width: 1377 *respWidthFactor
        height: 101 * respHeightFactor
        source: "qrc:/Assets/Widgets/PS.png"
        anchors {
            top: parent.top
            left: parent.left
            topMargin: 869 * respHeightFactor
            leftMargin: 271 * respWidthFactor
        }
    }

    // For Testing
    Rectangle {
        visible: false
        color: "transparent"
        width: parent.width
        height: 110 * respHeightFactor
        anchors {
            bottom: parent.bottom
        }

        Row {
            spacing: 20 * respWidthFactor

            Slider {
                id: leftRPMSlider
                from: 0
                to: 6000
                onValueChanged: {
                    leftRpmDial.value = leftRPMSlider.value
                }
            }

            Slider {
                id: rightRPMSlider
                from: 0
                to: 6000
                onValueChanged: {
                    rightRpmDial.value = rightRPMSlider.value
                }
            }

            Slider {
                id: oilTemSlider
                from: 0
                to: 10
                onValueChanged: {
                    tempMonLeft.oilTempVal = oilTemSlider.value
                    tempMonRight.oilTempVal = oilTemSlider.value
                }
            }

            Slider {
                id: engineTemSlider
                from: 0
                to: 120
                onValueChanged: {
                    tempMonLeft.engineTempVal = engineTemSlider.value
                    tempMonRight.engineTempVal = engineTemSlider.value
                }
            }

            Slider {
                id: batLeftSlider
                from: 0
                to: 24
                onValueChanged: {
                    voltIndLeft.voltVal = batLeftSlider.value
                }
            }

            Slider {
                id: batRightSlider
                from: 0
                to: 24
                onValueChanged: {
                    voltIndRight.voltVal = batRightSlider.value
                }
            }
        }
    }
}
