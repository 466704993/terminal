import QtQuick 2.0
import QtDataVisualization 1.2

  Item {
      anchors.fill: parent
//      width: parent.width
//      height: parent.height

      Scatter3D {
          id:scatter
          width: parent.width
          height: parent.height

          Scatter3DSeries {
              itemSize: 0.02
              ItemModelScatterDataProxy {
                  itemModel: dataModel
                  // Mapping model roles to scatter series item coordinates.
                  xPosRole: "xPos"
                  yPosRole: "yPos"
                  zPosRole: "zPos"
              }
          }
      }
      MouseArea {
           anchors.fill: parent
           onClicked:{
            dataModel.clear();
           }
      }
 /*     Timer{
         interval: 100;
         running: true;
         repeat: true
         property double xRot: 0.0
         property double yRot: 0.0
         property double zRot: 0.0
         onTriggered:
             {
                    xRot = gyro.x;
                    yRot = gyro.y;
                    zRot = gyro.z;
                   dataModel.append({"xPos": xRot.toString(), "yPos": yRot.toString(),"zPos": zRot.toString()});
             }
         }*/
      Connections
      {
          property double xRot: 0.0
          property double yRot: 0.0
          property double zRot: 0.0
          target:gyro
          onGetgyroread:
          {
              xRot = x;
              yRot = y;
              zRot = z;
             dataModel.append({"xPos": xRot.toString(), "yPos": yRot.toString(),"zPos": zRot.toString()});
           //   console.log("x:" + x + "y" + y + "z" +z);
          }

      }
      ListModel {
          id: dataModel
      }
  }
