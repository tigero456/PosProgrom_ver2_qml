import QtQuick 2.0
import QtQuick.Window 2.15
import QtQuick.Controls 2.5
import QtQuick.Controls.Fusion
import TableModel 0.1

Window {
//    visible:false

    id:salelistwindow
    x:205
    y:120
    width: 400
    height: 700
    title: qsTr("판매목록")

    Column {
        id: salecolumn
        anchors.fill: parent

        Text {
            id: saletext1
            text: qsTr("상품목록")
            font.pixelSize: 30
        }

        Rectangle {
            id: salerectangle
            x: 5
            width: 390
            height: 500
            border.width: 1

            Text {
                id: saletext2
                x: 10
                y: 10
                text: qsTr("카테고리 선택해주세요")
                font.pixelSize: 30
            }

            Rectangle {
                id: salerectangle3
                x: 0
                y: 60
                width: 390
                height: 440
                color: "#ffffff"
                border.width: 1
            }
        }

        Rectangle {
            id: salerectangle1
            y: 540
            width: 400
            height: 10
            color: "#ffffff"
        }

        Rectangle {
            id: salerectangle2
            x: 5
            width: 390
            height: 150
            color: "#ffffff"
            border.width: 1

            Rectangle {
                id: salerectangle4
                x: 0
                y: 45
                width: 390
                height: 105
                color: "#ffffff"
                border.width: 1

                TableView {
                    x: 5
                    y: 5
                    width: 380
                    height: 100
                    columnSpacing: 10
                    rowSpacing: 10
                    clip: true

                    property var columnWidths: [80, 80, 80, 80, 80]
                    columnWidthProvider: function (column) { return columnWidths[column] }

                    property alias tableVerticalBar: categoryVerticalBar

                    ScrollBar.vertical: ScrollBar {
                        id: categoryVerticalBar
                        policy:ScrollBar.AlwaysOn
                    }

                    model: CategoryTable {}

                    delegate: Rectangle{
                        border.color: "gray"
                        border.width: 0.5

                        Button {
                            width: 85
                            height: 50
                            text: categorytabledata
                            font.pointSize: 11
                            onClicked: {
                                saletext2.text = categorytabledata
                            }
                        }
                    }
                }
            }

            Text {
                id: saletext3
                x: 10
                y: 10
                text: qsTr("분류")
                font.pixelSize: 22
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.9;height:480;width:640}
}
##^##*/
