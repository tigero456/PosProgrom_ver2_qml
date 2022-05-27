import QtQuick 2.0
import QtQuick.Window 2.15
import QtQuick.Controls 2.5
import QtQuick.Controls.Fusion
import Snack 0.7

Item{
        TableView {
        id: snacktableview
        x: 5
        y: 5
        width: 380
        height: 435
        columnSpacing: 10
        rowSpacing: 80
        clip: true

        property var columnWidths: [87.5, 87.5, 87.5, 87.5]
        columnWidthProvider: function (column) { return columnWidths[column] }


        property alias tableVerticalBar: snackVerticalBar

            ScrollBar.vertical: ScrollBar {
            id: snackVerticalBar
            policy:ScrollBar.AlwaysOn
        }

        model: Snack {}

            delegate: Rectangle{
            height: 100

                Button {
                width: 88
                height: 115

                    Text {
                    text: snacktabledata
                    font.pointSize: 9
                    anchors.bottom: parent.bottom
                }
                    onClicked: {

                    //saletext2.text = categorytabledata
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
