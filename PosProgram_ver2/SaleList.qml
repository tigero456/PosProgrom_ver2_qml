import QtQuick 2.0
import QtQuick.Window 2.15
import QtQuick.Controls 2.5
import QtQuick.Controls.Fusion
import TableModel 0.1

Window {
    width: 600
    height: 500

    Rectangle {
        id: rectangle
        color: "#ffffff"
        anchors.fill: parent

        Rectangle {
            id: rectangle3
            x: 0
            y: 0
            width: 600
            height: 76
            color: "#12ca00"
            radius: 10
        }

        Rectangle {
            id: rectangle1
            x: 0
            y: 0
            width: 600
            height: 47
            color: "#12ca00"
            radius: 0
        }


        Rectangle {
            id: rectangle2
            x: 0
            y: 13
            width: 600
            height: 63
            color: "#0c8900"
            radius: 10
            border.color: "#c6ffcb"
            gradient: Gradient {
                GradientStop {
                    position: 0.63927
                    color: "#0e8301"
                }

                GradientStop {
                    position: 1
                    color: "#17d916"
                }

                orientation: Gradient.Horizontal
            }

            Rectangle {
                id: rectangle4
                x: 8
                y: 8
                width: 96
                height: 47
                color: "#0e8301"

                Text {
                    id: text1
                    width: 49
                    height: 30
                    color: "#ffffff"
                    text: qsTr("발주")
                    font.pixelSize: 25
                    font.bold: true
                    anchors.centerIn: parent
                }
            }

            Rectangle {
                id: rectangle5
                x: 130
                y: 8
                width: 96
                height: 47
                color: "#0e8301"

                Text {
                    id: text2
                    width: 49
                    height: 30
                    color: "#ffffff"
                    text: qsTr("재고")
                    font.pixelSize: 25
                    font.bold: true
                    anchors.centerIn: parent
                }
            }

            Rectangle {
                id: rectangle6
                x: 252
                y: 8
                width: 104
                height: 47
                color: "#0e8301"

                Text {
                    id: text3
                    width: 49
                    height: 30
                    color: "#ffffff"
                    text: qsTr("재고")
                    font.pixelSize: 25
                    font.bold: true
                    anchors.centerIn: parent
                }
            }

            Rectangle {
                id: rectangle10
                x: 254
                y: 6
                width: 96
                height: 47
                color: "#0e8301"
                Text {
                    id: text6
                    width: 97
                    height: 30
                    color: "#ffffff"
                    text: qsTr("판매화면")
                    font.pixelSize: 25
                    anchors.centerIn: parent
                    font.bold: true
                }
                MouseArea{
                    x:0
                    y:0
                    width: 96
                    height: 47
                    onClicked: {
                        managewindow.close()
                        wwwindow.show()
                    }
                }
            }
        }

        Rectangle {
            id: rectangle7
            x: 8
            y: 100
            width: 584
            height: 392
            color: "#10b800"
            radius: 15
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: "#70ca1d"
                }

                GradientStop {
                    position: 0.21461
                    color: "#ffffff"
                }

                orientation: Gradient.Vertical
                GradientStop {
                    position: 0
                    color: "#70ca1d"
                }
            }

            Text {
                id: text5
                x: 8
                y: 8
                width: 52
                height: 27
                color: "#002a00"
                text: qsTr("분류")
                font.pixelSize: 20
            }

            ComboBox {
                id: comboBox
                x: 74
                y: 11
                width: 161
                height: 24

                model: catego
            }

            Rectangle {
                id: rectangle8
                x: 8
                y: 46
                width: 568
                height: 338
                color: "#ffffff"
                TableView {
                    id: producttableview
                    x: 5
                    y: 54
                    width: 558
                    height: 284
                    columnSpacing: 10
                    rowSpacing: 80
                    clip: true

                    property var columnWidths: [87.5, 87.5, 87.5, 87.5]
                    columnWidthProvider: function (column) { return columnWidths[column] }


                    property alias tableVerticalBar: productVerticalBar

                    ScrollBar.vertical: ScrollBar {
                        id: productVerticalBar
                        policy:ScrollBar.AlwaysOn
                    }

                    model: ProductTable {}

                    delegate: Rectangle{
                        height: 100

                        Button {
                            width: 88
                            height: 115

                            Text {
                                text: producttabledata
                                font.pointSize: 9
                                anchors.bottom: parent.bottom
                            }
                            onClicked: {
                                //saletext2.text = categorytabledata
                            }
                        }
                    }
                }

                Rectangle {
                    id: rectangle11
                    x: 5
                    y: 8
                    width: 90
                    height: 40
                    color: "#ffffff"
                    border.width: 1

                    Text {
                        id: text7
                        x: 8
                        y: 8
                        text: qsTr("상품코드")
                        font.pixelSize: 18
                        font.bold: true
                    }
                }

                Rectangle {
                    id: rectangle12
                    x: 95
                    y: 8
                    width: 282
                    height: 40
                    color: "#ffffff"
                    border.width: 1

                    Text {
                        id: text8
                        x: 8
                        y: 8
                        text: qsTr("상품명")
                        font.pixelSize: 18
                        font.bold: true
                    }
                }

                Rectangle {
                    id: rectangle13
                    x: 377
                    y: 8
                    width: 90
                    height: 40
                    color: "#ffffff"
                    border.width: 1

                    Text {
                        id: text9
                        x: 8
                        y: 8
                        text: qsTr("상품가격")
                        font.pixelSize: 18
                        font.bold: true
                    }
                }

                Rectangle {
                    id: rectangle14
                    x: 467
                    y: 8
                    width: 89
                    height: 40
                    color: "#ffffff"
                    border.width: 1

                    Text {
                        id: text10
                        x: 8
                        y: 8
                        text: qsTr("수량")
                        font.pixelSize: 18
                        font.bold: true
                    }
                }
            }

            Rectangle {
                id: rectangle9
                x: 368
                y: 11
                width: 150
                height: 24
                color: "#ffffff"

                TextEdit {
                    id: textEdit
                    x: 0
                    y: 0
                    width: 150
                    height: 24
                    text: qsTr("Text Edit")
                    font.pixelSize: 18
                    horizontalAlignment: Text.AlignRight
                }
            }

            Button {
                id: button
                x: 524
                y: 8
                width: 46
                height: 32
                text: qsTr("검색")
                font.pointSize: 14
                font.bold: true
            }
        }

        Text {
            id: text4
            x: 13
            y: 74
            width: 72
            height: 26
            color: "#ff7a35"
            text: qsTr("재고")
            font.pixelSize: 20
        }


    }

}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.9}
}
##^##*/
