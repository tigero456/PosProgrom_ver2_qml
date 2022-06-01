import QtQuick 2.0
import QtQuick.Window 2.15
import QtQuick.Controls 2.5
import QtQuick.Controls.Fusion

Item{
    TableView {
        id: producttableview2
        width: 496
        height: 256
        columnSpacing: 1
        rowSpacing: 1
        clip: true

        property var columnWidths: [200, 90, 140, 50, 70]
        columnWidthProvider: function (column) { return columnWidths[column] }

        property alias tableVerticalBar: tableVerticalBar23

        ScrollBar.vertical: ScrollBar {
            id: tableVerticalBar23
            policy:ScrollBar.AlwaysOn
        }

        model: myModel6

        delegate: Rectangle{
            id:tetet2
            color: "lightyellow"
            border.color: "gray"
            border.width: 0.5

            MouseArea{
                x:0
                y:0
                width: 496
                height: 40

                Text {
                    text: trashnowdata
                    font.pointSize: 17
                }

                onClicked: {
                    myModel6.trashsendSlot(trashnowdata)
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
