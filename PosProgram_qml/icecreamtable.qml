import QtQuick 2.0
import QtQuick.Window 2.15
import QtQuick.Controls 2.5
import QtQuick.Controls.Fusion
import IceCream 0.9

Item{
        TableView {
        id: icecreamtableview
        x: 5
        y: 5
        width: 380
        height: 435
        columnSpacing: 10
        rowSpacing: 3
        clip: true

        property var columnWidths: [87.5, 87.5, 87.5, 87.5]
        columnWidthProvider: function (column) { return columnWidths[column] }


        property alias tableVerticalBar: icecreamVerticalBar

            ScrollBar.vertical: ScrollBar {
            id: icecreamVerticalBar
            policy:ScrollBar.AlwaysOn
        }

        model: IceCream {}

            delegate: Rectangle{
            height: 100

                Button {
                width: 88
                height: 40

                    Text {
                    text: icecreamtabledata
                    font.pointSize: 9
                    anchors.bottom: parent.bottom
                }
                    onClicked: {
                        myModel.productnameSlot(icecreamtabledata)
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
