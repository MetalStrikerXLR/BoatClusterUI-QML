import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Shapes 1.4
import Qt5Compat.GraphicalEffects

Item {
    id: control

    implicitWidth: 200
    implicitHeight: 200

    enum DialType {
        FullDial,
        MinToMax,
        NoDial
    }

    property real startAngle: 0
    property real spanAngle: 360
    property real minValue: 0
    property real maxValue: 100
    property real value: 0
    property int dialWidth: 15

    property color progressColor: "#FFA51BAB"

    property int penStyle: Qt.RoundCap
    property int dialType: CircularBar.DialType.FullDial

    QtObject {
        id: internals

        property bool isFullDial: control.dialType === CircularBar.DialType.FullDial
        property bool isNoDial: control.dialType === CircularBar.DialType.NoDial

        property real baseRadius: Math.min(control.width / 2, control.height / 2)
        property real baseRadiusX: control.width/2
        property real baseRadiusY: control.height/2
        property real radiusOffset: internals.isFullDial ? control.dialWidth / 2
                                                         : control.dialWidth / 2
        property real actualSpanAngle: internals.isFullDial ? 360 : control.spanAngle

        property color transparentColor: "transparent"
    }

    LinearGradient {
        id: borderGradient

        anchors.fill: parent
        start: Qt.point(0,0)
        end: Qt.point(0, control.height)
        smooth: true
        visible: false

        gradient: Gradient {
            GradientStop { position: 0; color: "#9F0000" }
            GradientStop { position: 1; color: "#232323" }
        }
    }

    Shape {
        id: shape
        anchors.fill: parent
        layer.enabled: true
        layer.samples: 8

        ShapePath {
            id: pathProgress
            strokeColor: control.progressColor
            fillColor: internals.transparentColor
            strokeWidth: control.dialWidth
            capStyle: control.penStyle

            PathAngleArc {
                radiusX: internals.baseRadiusX - internals.radiusOffset
                radiusY: internals.baseRadiusY - internals.radiusOffset
                centerX: control.width / 2
                centerY: control.height / 2
                startAngle: control.startAngle
                sweepAngle: (control.value / control.maxValue) * internals.actualSpanAngle
            }
        }
    }

    OpacityMask {
        anchors.fill: borderGradient
        source: borderGradient
        maskSource: shape
    }
}
