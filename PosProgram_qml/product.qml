import QtQuick 2.0
import QtQuick.Window 2.15
import QtQuick.Controls 2.5
import QtQuick.Controls.Fusion

Item{
    TableView {
        id: producttableview2
        x: 5
        y: 50
        width: 558
        height: 289
        columnSpacing: 1
        rowSpacing: 1
        clip: true

        property var columnWidths: [80, 277, 100, 100]
        columnWidthProvider: function (column) { return columnWidths[column] }

        property alias tableVerticalBar: tableVerticalBar23

        ScrollBar.vertical: ScrollBar {
            id: tableVerticalBar23
            policy:ScrollBar.AlwaysOn
        }

        model: myModel5

        delegate: Rectangle{
            id:tetet2
            border.color: "gray"
            border.width: 0.5

            MouseArea{
                x:0
                y:0
                width: 558
                height: 30

                Text {
                    text: mproductdata
                    font.pointSize: 17
                }

                onClicked: {
                    myModel5.productSlot()
                    tetet2.color= "lightblue"
                }
            }
        }
    }
}
/*##^##
Designer {
    D{i:0;formeditorZoom:0.9}
}
##^##*/
