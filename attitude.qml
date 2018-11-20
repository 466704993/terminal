import QtQuick 2.4
import QtCanvas3D 1.1
import QtQuick.Window 2.2
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.1

import "glcode.js" as GLCode

Rectangle {
 //   title: qsTr("3D")
 //   width: 640
  //  height: 360
  //  visible: true
    anchors.fill: parent

    property int previousY: 0
    property int previousX: 0
    property int previousZ: 0

    Rectangle {
        id: valuePanel
        width: 150
        height: 100
        anchors.left: parent.left
        anchors.top: parent.top
        opacity: 0.3
        border.color: "black"
        border.width: 2
        radius: 5
        z: 1
    }

    ColumnLayout {
        width: valuePanel.width
        height: valuePanel.height
        x: 10
        z: 2
        Label {
            font.pixelSize: 20
            text: "x angle: " + angle
            readonly property int angle: canvas3d.xRot
        }
        Label {
            font.pixelSize: 20
            text: "y angle: " + angle
            readonly property int angle: canvas3d.yRot
        }
        Label {
            font.pixelSize: 20
            text: "z angle: " + angle
            readonly property int angle: canvas3d.zRot
        }
    }
 /*   Timer{
       interval: 100;
       running: true;
       repeat: true
       onTriggered:
           {
               canvas3d.xRot = gyro.x
               canvas3d.yRot = gyro.y
               canvas3d.zRot = gyro.z
           }
       }*/
    Connections
    {
        target:gyro
        onGetgyroread:
        {
            canvas3d.xRot = x
            canvas3d.yRot = y
            canvas3d.zRot = z
        }

    }
    Canvas3D {
        id: canvas3d
        anchors.fill: parent
        focus: true

        property double xRot: 0.0
        property double yRot: 0.0
        property double zRot: 0.0

        onInitializeGL: {
            GLCode.initializeGL(canvas3d);
        }

        onPaintGL: {
            GLCode.paintGL(canvas3d);
        }

        onResizeGL: {
            GLCode.resizeGL(canvas3d);
        }
   /*     MouseArea {
            anchors.fill: parent
            //! [0]
            //! [2]
            onMouseXChanged: {
                // Do not rotate if we don't have previous value
                if (previousY !== 0)
                    canvas3d.yRot += mouseY - previousY
                previousY = mouseY
                // Limit the rotation to -90...90 degrees
                if (canvas3d.yRot > 90)
                    canvas3d.yRot = 90
                if (canvas3d.yRot < -90)
                    canvas3d.yRot = -90
            }
            onMouseYChanged: {
                // Do not rotate if we don't have previous value
                if (previousX !== 0)
                    canvas3d.xRot += mouseX - previousX
                previousX = mouseX
                // Wrap the rotation around
                if (canvas3d.xRot > 180)
                    canvas3d.xRot -= 360
                if (canvas3d.xRot < -180)
                    canvas3d.xRot += 360
            }
            onReleased: {
                // Reset previous mouse positions to avoid rotation jumping
                previousX = 0
                previousY = 0
            }
            //! [2]
            //! [4]
            onWheel: {
                canvas3d.zRot -= wheel.angleDelta.y / 100.0
                if (canvas3d.zRot <= 0)
                    canvas3d.zRot = 0
                if (canvas3d.zRot > 360)
                    canvas3d.zRot = 360
            }
            //! [4]
        }*/
    }
 }
