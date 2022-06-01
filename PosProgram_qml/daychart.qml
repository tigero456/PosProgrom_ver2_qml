import QtQuick 2.0
import QtQuick.Window 2.3
import QtQuick.Controls 2.5
import QtQuick.Controls.Fusion
import QtCharts 2.3

Item {
    Rectangle{
        x: -5
        y: -40
        width: 470
        height: 550
        border.width: 1

        ChartView {
            id: line
            width: 470
            height: 500

            LineSeries {
                name: "LineSeries"
                XYPoint {
                    x: 0
                    y: 2
                }

                XYPoint {
                    x: 1
                    y: 1.2
                }

                XYPoint {
                    x: 2
                    y: 3.3
                }

                XYPoint {
                    x: 5
                    y: 2.1
                }
            }
        }

        Button{
            x:400
            y:500
            width: 60
            height: 35
            text: "닫기"

            onClicked: {
                //stackView53.pop();
                stackView53.push(Qt.resolvedUrl("qrc:/main.qml"))
            }
        }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
