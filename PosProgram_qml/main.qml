import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.5
import QtQuick.Controls.Fusion
import QtQuick.Layouts 1.3
import QtCharts 2.3
import TableModel 0.1
import CategoryTable 0.2
import ProductTable 0.3
import SqlQueryModel 0.4
import ManegeProductTable 0.5
import CategoryCombobox 0.13
//import BasketTable 0.13
import Qt.labs.settings 1.0
import Qt.labs.platform 1.0 as Platform

Window {
    visible: true
    id:wwwindow
    width: 500
    height: 800
    title: qsTr("편의점 POS")

    SqlQueryModel{ }

    function cppSlot(string){
        hap.text=string
    }

    property date curentTime: new Date()
    property int hour: curentTime.getHours()
    property int minutes: curentTime.getMinutes()
    property int seconds: curentTime.getSeconds()
    property date curentDate: new Date()
    property int year: curentDate.getFullYear()
    property int month: curentDate.getMonth()
    property int day: curentDate.getDate()

    Loader{ id:loader }

    Dialog{
        id:infowindow
        x:20
        y:150
        //width: 400
        //height: 600
        title: "상품정보 조회"
        implicitWidth: 450;
        implicitHeight: 520;
        modal: true;

        Rectangle {
            id: rectangle111
            color: "#ffffff"
            anchors.fill: parent
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0

            BorderImage {
                id: borderImage
                x: 8
                y: 51
                width: 113
                height: 180
                source: "qrc:/qtquickplugin/images/template_image.png"
            }

            Rectangle {
                id: rectangle112
                x: 133
                y: 43
                width: 291
                height: 189
                color: "#ffffff"

                border.color: "black"
                border.width: 1.5

                Text {
                    id: text222
                    x: 8
                    y: 13
                    width: 92
                    height: 29
                    text: "상품코드"
                    font.pixelSize: 20
                }

                Text {
                    id: text333
                    x: 8
                    y: 54
                    width: 92
                    height: 29
                    text: "상품명"
                    font.pixelSize: 20
                }

                Text {
                    id: text444
                    x: 8
                    y: 95
                    width: 92
                    height: 29
                    text: "상품분류"
                    font.pixelSize: 20
                }

                Rectangle {
                    id: rectangle222
                    x: 102
                    y: 13
                    width: 176
                    height: 29
                    color: "#ffffff"
                    border.color: "black"
                    border.width: 1
                }

                Rectangle {
                    id: rectangle333
                    x: 102
                    y: 54
                    width: 176
                    height: 29
                    color: "#ffffff"
                    border.color: "black"
                    border.width: 1
                }

                Rectangle {
                    id: rectangle444
                    x: 102
                    y: 95
                    width: 176
                    height: 29
                    color: "#ffffff"
                    border.color: "#000000"
                    border.width: 1
                }

                Text {
                    id: text555
                    x: 8
                    y: 137
                    width: 67
                    height: 29
                    text: "판매가"
                    font.pixelSize: 20
                }

                Rectangle {
                    id: rectangle555
                    x: 102
                    y: 137
                    width: 176
                    height: 29
                    color: "#ffffff"
                    border.color: "#000000"
                    border.width: 1
                }
            }

            Text {
                id: text111
                x: 133
                y: 8
                width: 92
                height: 29
                text: "상품정보"
                font.pixelSize: 20
            }

            Rectangle {
                id: rectangle666
                x: 8
                y: 278
                width: 416
                height: 153
                color: "#ffffff"
                border.color: "black"
                border.width: 1.5
                Text {
                    id: text666
                    x: 11
                    y: 8
                    width: 136
                    height: 29
                    text: "현 재고 수량"
                    font.pixelSize: 20
                }

                Text {
                    id: text777
                    x: 9
                    y: 43
                    width: 141
                    height: 29
                    text: "입고 예정 수량"
                    font.pixelSize: 20
                }

                Text {
                    id: text888
                    x: 10
                    y: 79
                    width: 139
                    height: 29
                    text: "금일 폐기 수량"
                    font.pixelSize: 20
                }

                Rectangle {
                    id: rectangle777
                    x: 161
                    y: 8
                    width: 135
                    height: 29
                    color: "#ffffff"
                    border.color: "#000000"
                    border.width: 1
                }

                Rectangle {
                    id: rectangle888
                    x: 161
                    y: 43
                    width: 135
                    height: 29
                    color: "#ffffff"
                    border.color: "#000000"
                    border.width: 1
                }

                Rectangle {
                    id: rectangle999
                    x: 161
                    y: 79
                    width: 135
                    height: 29
                    color: "#ffffff"
                    border.color: "#000000"
                    border.width: 1
                }

                Rectangle {
                    id: rectangle109
                    x: 161
                    y: 114
                    width: 135
                    height: 29
                    color: "#ffffff"
                    border.color: "#000000"
                    border.width: 1
                }

                Text {
                    id: text119
                    x: 11
                    y: 114
                    width: 156
                    height: 29
                    text: "당일 판매 수량"
                    font.pixelSize: 20
                }
            }

            Text {
                id: text106
                x: 8
                y: 243
                width: 92
                height: 29
                text: "재고정보"
                font.pixelSize: 20
            }

            Button {
                id: button66
                x: 247
                y: 440
                width: 82
                height: 32
                text: "확인"
                font.pixelSize: 20
            }

            Button {
                id: button197
                x: 335
                y: 440
                width: 82
                height: 32
                text: "취소"
                font.pixelSize: 20
            }
        }
    }

    Window{
        visible:false

        id:salelistwindow
        x:310
        y:150
        width: 400
        height: 700
        title: qsTr("판매목록")

        Column {
            id: salecolumn
            anchors.fill: parent

            Rectangle{
                anchors.fill: parent
                color: "#06a900"

                Rectangle{
                    x:0
                    y:40
                    width: 400
                    height: 660
                    color: "lightgray"
                }

            }


            Text {
                id: saletext1
                text: qsTr("상품목록")
                color: "#ffffff"
                font.pixelSize: 30
            }

            Rectangle {
                id: salerectangle
                x: 5
                width: 390
                height: 500
                border.width: 1
                color: "lightgreen"

                Text {
                    id: saletext2
                    x: 10
                    y: 10
                    text: qsTr("")
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

                    StackView{
                        id:stackview2
                        anchors.fill: parent

                        initialItem: Item{
                            TableView {
                                id: producttableview13
                                x: 5
                                y: 5
                                width: 380
                                height: 435
                                columnSpacing: 10
                                rowSpacing: 3
                                clip: true

                                property var columnWidths: [87.5, 87.5, 87.5, 87.5]
                                columnWidthProvider: function (column) { return columnWidths[column] }


                                property alias tableVerticalBar: productVerticalBar13

                                ScrollBar.vertical: ScrollBar {
                                    id: productVerticalBar13
                                    policy:ScrollBar.AlwaysOn
                                }

                                model: ProductTable {}

                                delegate: Rectangle{
                                    height: 100

                                    Button {
                                        width: 88
                                        height: 40

                                        Text {
                                            id:tt
                                            text: producttabledata
                                            font.pointSize: 9
                                            anchors.bottom: parent.bottom
                                        }
                                        onClicked: {
                                            myModel.productnameSlot(producttabledata)
                                        }
                                    }
                                }
                            }
                        }
                    }
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

                        property var columnWidths: [65, 65, 65, 65, 65]
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
                                id:category_btn
                                width: 70
                                height: 50
                                text: categorytabledata
                                font.pointSize: 9

                                onClicked: {
                                    saletext2.text = categorytabledata
                                    qmlSignal(categorytabledata)

                                    if(saletext2.text=="라면"){
                                        stackview2.push(Qt.resolvedUrl("qrc:/ramentable.qml"))
                                    }
                                    else if(saletext2.text=="과자"){
                                        stackview2.push(Qt.resolvedUrl("qrc:/snacktable.qml"))
                                    }
                                    else if(saletext2.text=="음료"){
                                        stackview2.push(Qt.resolvedUrl("qrc:/watertable.qml"))
                                    }
                                    else if(saletext2.text=="아이스크림"){
                                        stackview2.push(Qt.resolvedUrl("qrc:/icecreamtable.qml"))
                                    }
                                    else if(saletext2.text=="빵"){
                                        stackview2.push(Qt.resolvedUrl("qrc:/breadtable.qml"))
                                    }
                                    else if(saletext2.text=="커피"){
                                        stackview2.push(Qt.resolvedUrl("qrc:/coffeetable.qml"))
                                    }
                                    //else if(saletext2.text=="주류"){
                                        //stackview2.push(Qt.resolvedUrl("qrc:/alcoholtable.qml"))
                                    //}
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


    Frame {
        id: frame1
        x: 0
        y: 450
        width: 500
        height: 350
        font.bold: false

        Rectangle {
            id: rectangle12
            x: -8
            y: -9
            width: 500
            height: 350
            color: "#e8f9e8"
            border.color: "#9c9c9c"
            border.width: 2.5

            Button {
                id: button24
                x: 4
                y: 235
                width: 55
                height: 111
                text: qsTr("C\nL\nE\nA\nR")
            }

            Button {
                id: buttonNum2
                x: 118
                y: 236
                width: 56
                height: 58
                text: qsTr("2")
                font.pointSize: 17
                font.bold: true
                onClicked:  myModel.basketnumSlot(2)
            }

            Button {
                id: buttonNum3
                x: 175
                y: 236
                width: 56
                height: 58
                text: qsTr("3")
                font.pointSize: 17
                font.bold: true
                onClicked:  myModel.basketnumSlot(3)
            }

            Button {
                id: buttonNum0
                x: 61
                y: 295
                width: 112
                height: 51
                text: qsTr("0")
                font.pointSize: 17
                font.bold: true
                onClicked:  myModel.basketnumSlot(0)
            }

            Button {
                id: buttonNum00
                x: 175
                y: 295
                width: 56
                height: 51
                text: qsTr("00")
                font.pointSize: 17
                font.bold: true
                onClicked:  myModel.basketnumSlot(00)
            }

            Button {
                id: button33
                x: 232
                y: 236
                width: 108
                height: 58
                text: "남 13\n객  층"
                onClicked: {
                    rectangle1.visible = !rectangle1.visible
                    text16.text = "남13세이하"
                    text16.color="red"
                }
            }

            Button {
                id: button34
                x: 341
                y: 236
                width: 102
                height: 58
                text: qsTr("여 13\n객  층")
                onClicked: {
                    rectangle1.visible = !rectangle1.visible
                    text16.text = "여13세이하"
                    text16.color="red"
                }
            }

            Button {
                id: button35
                x: 231
                y: 295
                width: 108
                height: 51
                text: qsTr("ENTER")
            }

            Button {
                id: button36
                x: 340
                y: 295
                width: 102
                height: 51
                text: qsTr("현금(합계)")

                onClicked: {
                    myModel.sum()
                    myModel.tableclear()
                }
            }

            Button {
                id: button37
                x: 445
                y: 236
                width: 51
                height: 58
                text: qsTr("상품\n조회")
                onClicked: {
                    infowindow.open();
                }

            }

            Button {
                id: button38
                x: 443
                y: 295
                width: 53
                height: 51
                opacity: 1
                visible: true
                text: qsTr("저널\n조회")
            }

            Button {
                id: button18
                x: 4
                y: 178
                width: 55
                height: 56
                text: "지정\n취소"
            }

            Button {
                id: buttonNum6
                x: 175
                y: 178
                width: 56
                height: 56
                text: qsTr("6")
                font.pointSize: 17
                font.bold: true
                onClicked:  myModel.basketnumSlot(6)
            }

            Button {
                id: button21
                x: 232
                y: 178
                width: 108
                height: 56
                text: "남\n14~19"
                onClicked: {
                    rectangle1.visible = !rectangle1.visible
                    text16.text = "남14~19"
                    text16.color="red"
                }
            }

            Button {
                id: button22
                x: 341
                y: 178
                width: 102
                height: 56
                text: qsTr("여\n14~19")
                onClicked: {
                    rectangle1.visible = !rectangle1.visible
                    text16.text = "여14~19"
                    text16.color="red"
                }
            }

            Button {
                id: button23
                x: 445
                y: 178
                width: 51
                height: 56
                text: qsTr("통계")
                onClicked: {
                    di.visible=true
                }
            }

            Button {
                id: buttonNum4
                x: 61
                y: 178
                width: 56
                height: 56
                text: qsTr("4")
                font.pointSize: 17
                font.bold: true
                onClicked:  {
                    myModel.basketnumSlot(4)
                }
            }

            Button {
                id: buttonNum5
                x: 118
                y: 178
                width: 56
                height: 56
                text: qsTr("5")
                font.pointSize: 17
                font.bold: true
                onClicked:  myModel.basketnumSlot(5)
            }

            Button {
                id: button2121212
                x: 4
                y: 4
                width: 56
                height: 56
                text: qsTr("중지\n(ESC)")
                onClicked: {
                    salelistwindow.close()
                    wwwindow.close()
                    loader.source="main.qml"

                }
            }
            Button {
                id: button1
                x: 61
                y: 4
                width: 112
                height: 56
                text: qsTr("FF-MENU")
            }

            Button {
                id: button2
                x: 174
                y: 4
                width: 56
                height: 56
                text: qsTr("정산")
            }

            Button {
                id: button3
                x: 231
                y: 4
                width: 110
                height: 56
                text: qsTr("남\n50대")
                onClicked: {
                    rectangle1.visible = !rectangle1.visible
                    text16.text = "남50세이상"
                    text16.color="d9eeff"
                }
            }

            Button {
                id: button4
                x: 342
                y: 4
                width: 102
                height: 56
                text: qsTr("여\n50대")
                onClicked: {
                    rectangle1.visible = !rectangle1.visible
                    text16.text = "여50세이상"
                    text16.color="ffdefc"
                }
            }

            Button {
                id: button5
                x: 445
                y: 4
                width: 51
                height: 56
                text: qsTr("관리자\n모드")
                onClicked: {
                    salelistwindow.close()
                    wwwindow.close()
                    managewindow.show()
                }
            }

            Button {
                id: button7
                x: 61
                y: 62
                width: 112
                height: 56
                text: qsTr("수량")
                onClicked: {
                    myModel.changeNum()
                }
            }

            Button {
                id: button8
                x: 174
                y: 62
                width: 56
                height: 56
                text: qsTr("보류")
            }

            Button {
                id: button9
                x: 231
                y: 62
                width: 110
                height: 56
                text: "남\n30~49"
                onClicked: {
                    rectangle1.visible = !rectangle1.visible
                    text16.text = "남30~49"
                    text16.color="d9eeff"
                }
            }

            Button {
                id: button10
                x: 342
                y: 62
                width: 102
                height: 56
                text: qsTr("여\n30~49")
                onClicked: {
                    rectangle1.visible = !rectangle1.visible
                    text16.text = "여30~49"
                    text16.color="ffdefc"
                }
            }

            Button {
                id: button11
                x: 445
                y: 62
                width: 51
                height: 56
                text: qsTr("출근\n퇴근")
            }

            Button {
                id: button12
                x: 4
                y: 120
                width: 55
                height: 56
                text: qsTr("일괄\n취소")

                onClicked: myModel.tableclear()
            }

            Button {
                id: buttonNum9
                x: 175
                y: 120
                width: 56
                height: 56
                text: qsTr("9")
                font.pointSize: 17
                font.bold: true
                onClicked:  myModel.basketnumSlot(9)
            }

            Button {
                id: button15
                x: 232
                y: 120
                width: 108
                height: 56
                text: "남\n20대"
                onClicked: {
                    rectangle1.visible = !rectangle1.visible
                    text16.text = "남20~29"
                    text16.color="d9eeff"
                }
            }

            Button {
                id: button16
                x: 341
                y: 120
                width: 102
                height: 56
                text: qsTr("여\n20대")
                onClicked: {
                    rectangle1.visible = !rectangle1.visible
                    text16.text = "여20~29"
                    text16.color="ffdefc"
                }
            }

            Button {
                id: buttonNum7
                x: 61
                y: 120
                width: 56
                height: 56
                text: qsTr("7")
                font.pointSize: 17
                font.bold: true
                onClicked:  myModel.basketnumSlot(7)
            }

            Button {
                id: buttonNum8
                x: 118
                y: 120
                width: 56
                height: 56
                text: qsTr("8")
                font.pointSize: 17
                font.bold: true
                onClicked:  myModel.basketnumSlot(8)
            }

            Button {
                id: buttonNum1
                x: 61
                y: 236
                width: 56
                height: 58
                text: qsTr("1")
                font.pointSize: 17
                font.bold: true
                onClicked:  myModel.basketnumSlot(1)
            }

            Button {
                id: button14
                x: 4
                y: 62
                width: 55
                height: 56
                text: qsTr("")
                clip: false
            }
        }
    }


    Frame {
        id: frame
        width: 500
        height: 450

        Rectangle {
            id: rectangle
            x: -9
            y: -9
            width: 500
            height: 45
            color: "#06a900"

            Button {
                id: button13
                x: 2
                y: 2
                width: 75
                height: 41
                text: "판매등록"
                font.pointSize: 12
                font.bold: true

                onClicked: {
                    salelistwindow.show()
                }
            }

            Text {
                id: text1
                x: 84
                y: 3
                width: 148
                height: 22
                color: "#ffffff"
                font.pixelSize: 18

                Timer{
                    id:timer1
                    repeat:true
                    interval:1000
                    running:true
                    onTriggered: {
                        curentDate=new Date()
                        text1.text=curentDate.getFullYear() + "-" + (curentDate.getMonth()+1) + "-" + curentDate.getDate()
                    }
                }
            }

            Text {
                id: text2
                x: 197
                y: 3
                width: 60
                height: 22
                color: "#ffffff"
                font.pixelSize: 18
                Timer{
                    id:timer
                    repeat:true
                    interval:1000
                    running:true
                    onTriggered: {
                        curentTime=new Date()
                        text2.text=curentTime.getHours()+ ":"+ curentTime.getMinutes()+ ":"+ curentTime.getSeconds()
                    }
                }
            }

            Text {
                id: text3
                x: 102
                y: 23
                width: 60
                height: 22
                color: "#ffffff"
                text: qsTr("POS 01")
                font.pixelSize: 18
            }

            Text {
                id: text4
                x: 197
                y: 23
                width: 60
                height: 22
                color: "#ffffff"
                text: "김창희"
                font.pixelSize: 18
            }

            Text {
                id: text5
                x: 322
                y: 15
                width: 60
                height: 22
                color: "#ffffff"
                text: "객층"
                font.pixelSize: 18
            }

            Text {
                id: text16
                x: 366
                y: 15
                width: 104
                height: 22
                color: "#ffffff"
                font.pixelSize: 18
            }

            StackView{
                id: stackview4
                x: 3
                y: 92
                width: 496
                height: 256

                initialItem: Item{
                    TableView {
                        id: baskettableview
                        width: 496
                        height: 256
                        columnSpacing: 0
                        rowSpacing: 0
                        clip: true

                        property var columnWidths: [53, 299, 79, 63]
                        columnWidthProvider: function (column) { return columnWidths[column] }

                        property alias tableVerticalBar: tableVerticalBar

                        ScrollBar.vertical: ScrollBar {
                            id: tableVerticalBar
                            policy:ScrollBar.AlwaysOn
                        }

                        //model: TableModel {}
                        model: myModel

                        delegate: Rectangle{
                            id:tetet
                            border.color: "gray"
                            border.width: 1
                            //color: (heading==true)?"lightgreen" : "white"
                            MouseArea{
                                x:0
                                y:0
                                width: 496
                                height: 30
                                Text {
                                    //text: tabledata
                                    text: baskettabledata
                                    font.pointSize: 17
                                }
                                onClicked: {
                                    myModel.basketnameSlot(baskettabledata)
                                    tetet.color= "lightblue"
                                }
                            }
                        }
                    }
                }
            }

            Rectangle {
                id: rectangle13
                x: 3
                y: 46
                width: 495
                height: 45
                color: "#ffffff"
                border.width: 1

                Rectangle {
                    id: rectangle14
                    x: 0
                    y: 0
                    width: 53
                    height: 45
                    color: "lightgreen"
                    border.color: "gray"
                    border.width: 1

                    Text {
                        id: text17
                        x: 8
                        y: 4
                        text: qsTr("NO")
                        font.pixelSize: 22
                    }
                }
                Rectangle {
                    id: rectangle15
                    x: 53
                    y: 0
                    width: 300
                    height: 45
                    color: "lightgreen"
                    border.color: "#808080"
                    border.width: 1
                    Text {
                        id: text18
                        x: 8
                        y: 4
                        text: qsTr("상품명")
                        font.pixelSize: 22
                    }
                }
                Rectangle {
                    id: rectangle142342
                    x: 352
                    y: 0
                    width: 79
                    height: 45
                    color: "lightgreen"
                    border.color: "gray"
                    border.width: 1

                    Text {
                        id: text172342
                        x: 8
                        y: 4
                        text: qsTr("단가")
                        font.pixelSize: 22
                    }
                }
                Rectangle {
                    id: rectangle14342
                    x: 431
                    y: 0
                    width: 63
                    height: 45
                    color: "lightgreen"
                    border.color: "gray"
                    border.width: 1

                    Text {
                        id: text172352
                        x: 8
                        y: 4
                        text: qsTr("수량")
                        font.pixelSize: 22
                    }
                }
            }

            Rectangle {
                x: 2
                y: 351
                width: 247
                height: 95
                border.color: "#000000"
                border.width: 1.2
                Rectangle {
                    x: 0
                    y: 0
                    width: 70
                    height: 48
                    color: "#f3f3f3"
                    border.color: "#000000"
                    Text {
                        id:hap
                        text: qsTr("합계")
                        anchors.centerIn: parent
                        font.pointSize: 20
                    }
                }

                Rectangle {
                    x: 0
                    y: 48
                    width: 70
                    height: 47
                    color: "#f3f3f3"
                    border.color: "#000000"
                    Text {
                        text: qsTr("수량")
                        anchors.centerIn: parent
                        font.pointSize: 20
                    }
                }

                Rectangle {
                    x: 70
                    y: 0
                    width: 176
                    height: 48
                    color: "#f3f3f3"
                    border.color: "#000000"
                    Text {
                        text: qsTr("0")
                        anchors.centerIn: parent
                        font.pointSize: 20
                    }
                }

                Rectangle {
                    x: 70
                    y: 48
                    width: 176
                    height: 47
                    color: "#f3f3f3"
                    border.color: "#000000"
                    Text {
                        text: qsTr("0")
                        anchors.centerIn: parent
                        font.pointSize: 20
                    }
                }
            }

            Rectangle {
                id: payrec
                x: 249
                y: 351
                width: 250
                height: 95
                border.color: "#000000"
                border.width: 1.2
                Rectangle {
                    x: 0
                    y: 0
                    width: 102
                    height: 32
                    color: "#ccf1ff"
                    border.color: "#000000"
                    Text {
                        text: qsTr("받을금액")
                        anchors.centerIn: parent
                        font.pointSize: 15
                    }
                }

                Rectangle {
                    x: 0
                    y: 32
                    width: 102
                    height: 33
                    color: "#ccf1ff"
                    border.color: "#000000"
                    Text {
                        text: qsTr("받은금액")
                        anchors.centerIn: parent
                        font.pointSize: 15
                    }
                }

                Rectangle {
                    x: 0
                    y: 65
                    width: 102
                    height: 30
                    color: "#ccf1ff"
                    border.color: "#000000"
                    Text {
                        text: qsTr("거스름")
                        anchors.centerIn: parent
                        font.pointSize: 15
                    }
                }

                Rectangle {
                    x: 101
                    y: 0
                    width: 148
                    height: 32
                    border.color: "#000000"
                    Text {
                        text: qsTr("0")
                        anchors.centerIn: parent
                        font.pointSize: 15
                    }
                }

                Rectangle {
                    x: 101
                    y: 32
                    width: 148
                    height: 33
                    border.color: "#000000"
                    Text {
                        text: qsTr("0")
                        anchors.centerIn: parent
                        font.pointSize: 15
                    }
                }

                Rectangle {
                    x: 101
                    y: 65
                    width: 148
                    height: 29
                    border.color: "#000000"
                    Text {
                        text: qsTr("0")
                        anchors.centerIn: parent
                        font.pointSize: 15
                    }
                }
            }

            Rectangle {
                id: rectangle1
                x: 20
                y: 100
                width: 450
                height: 200
                visible:true
                color: "#ffffff"
                border.color: "black"
                border.width: 1

                Rectangle {
                    id: rectangle2
                    x: 0
                    y: 0
                    width: 90
                    height: 100
                    color: "#d9eeff"
                    border.color: "black"
                    border.width: 1

                    Text {
                        id: text6
                        color: "#ff0000"
                        text: qsTr("남13세이하")
                        font.pixelSize: 16
                        anchors.centerIn: parent
                    }

                    MouseArea{
                        x: 0
                        y: 0
                        width: 90
                        height: 100

                        onClicked: {
                            rectangle1.visible = !rectangle1.visible
                            text16.text = "남13세이하"
                            text16.color="red"
                        }
                    }
                }

                Rectangle {
                    id: rectangle3
                    x: 90
                    y: 0
                    width: 90
                    height: 100
                    color: "#d9eeff"
                    border.color: "#000000"
                    border.width: 1
                    Text {
                        id: text8
                        color: "#ff0000"
                        text: qsTr("남14~19")
                        font.pixelSize: 16
                        anchors.centerIn: parent
                    }
                    MouseArea{
                        x: 0
                        y: 0
                        width: 90
                        height: 100

                        onClicked: {
                            rectangle1.visible = !rectangle1.visible
                            text16.text = "남14~19"
                            text16.color="red"
                        }
                    }
                }

                Rectangle {
                    id: rectangle4
                    x: 180
                    y: 0
                    width: 90
                    height: 100
                    color: "#d9eeff"
                    border.color: "#000000"
                    border.width: 1
                    Text {
                        id: text10
                        color: "#000000"
                        text: qsTr("남20~29")
                        font.pixelSize: 16
                        anchors.centerIn: parent
                    }

                    MouseArea{
                        x: 0
                        y: 0
                        width: 90
                        height: 100

                        onClicked: {
                            rectangle1.visible = !rectangle1.visible
                            text16.text = "남20~29"
                            text16.color="d9eeff"
                        }
                    }
                }

                Rectangle {
                    id: rectangle5
                    x: 270
                    y: 0
                    width: 90
                    height: 100
                    color: "#d9eeff"
                    border.color: "#000000"
                    border.width: 1
                    Text {
                        id: text11
                        color: "#000000"
                        text: qsTr("남30~49")
                        font.pixelSize:16
                        anchors.centerIn: parent
                    }

                    MouseArea{
                        x: 0
                        y: 0
                        width: 90
                        height: 100

                        onClicked: {
                            rectangle1.visible = !rectangle1.visible
                            text16.text = "남30~49"
                            text16.color="d9eeff"
                        }
                    }
                }

                Rectangle {
                    id: rectangle6
                    x: 360
                    y: 0
                    width: 90
                    height: 100
                    color: "#d9eeff"
                    border.color: "#000000"
                    border.width: 1
                    Text {
                        id: text12
                        color: "#000000"
                        text: qsTr("남50세이상")
                        font.pixelSize: 16
                        anchors.centerIn: parent
                    }

                    MouseArea{
                        x: 0
                        y: 0
                        width: 90
                        height: 100

                        onClicked: {
                            rectangle1.visible = !rectangle1.visible
                            text16.text = "남50세이상"
                            text16.color="d9eeff"
                        }
                    }
                }

                Rectangle {
                    id: rectangle7
                    x: 0
                    y: 100
                    width: 90
                    height: 100
                    color: "#ffdefc"
                    border.color: "#000000"
                    border.width: 1
                    Text {
                        id: text7
                        color: "#ff0000"
                        text: qsTr("여13세이하")
                        font.pixelSize: 16
                        anchors.centerIn: parent
                    }

                    MouseArea{
                        x: 0
                        y: 0
                        width: 90
                        height: 100

                        onClicked: {
                            rectangle1.visible = !rectangle1.visible
                            text16.text = "여13세이하"
                            text16.color="red"
                        }
                    }
                }

                Rectangle {
                    id: rectangle8
                    x: 90
                    y: 100
                    width: 90
                    height: 100
                    color: "#ffdefc"
                    border.color: "#000000"
                    border.width: 1
                    Text {
                        id: text9
                        color: "#ff0000"
                        text: qsTr("여14~19")
                        font.pixelSize: 16
                        anchors.centerIn: parent
                    }

                    MouseArea{
                        x: 0
                        y: 0
                        width: 90
                        height: 100

                        onClicked: {
                            rectangle1.visible = !rectangle1.visible
                            text16.text = "여14~19"
                            text16.color="red"
                        }
                    }
                }

                Rectangle {
                    id: rectangle9
                    x: 180
                    y: 100
                    width: 90
                    height: 100
                    color: "#ffdefc"
                    border.color: "#000000"
                    border.width: 1
                    Text {
                        id: text13
                        color: "#000000"
                        text: qsTr("여20~29")
                        font.pixelSize: 16
                        anchors.centerIn: parent
                    }

                    MouseArea{
                        x: 0
                        y: 0
                        width: 90
                        height: 100

                        onClicked: {
                            rectangle1.visible = !rectangle1.visible
                            text16.text = "여20~29"
                            text16.color="ffdefc"
                        }
                    }
                }

                Rectangle {
                    id: rectangle10
                    x: 270
                    y: 100
                    width: 90
                    height: 100
                    color: "#ffdefc"
                    border.color: "#000000"
                    border.width: 1
                    Text {
                        id: text14
                        color: "#000000"
                        text: qsTr("여30~49")
                        font.pixelSize: 16
                        anchors.centerIn: parent
                    }

                    MouseArea{
                        x: 0
                        y: 0
                        width: 90
                        height: 100

                        onClicked: {
                            rectangle1.visible = !rectangle1.visible
                            text16.text = "여30~49"
                            text16.color="ffdefc"
                        }
                    }
                }

                Rectangle {
                    id: rectangle11
                    x: 360
                    y: 100
                    width: 90
                    height: 100
                    color: "#ffdefc"
                    border.color: "#000000"
                    border.width: 1
                    Text {
                        id: text15
                        color: "#000000"
                        text: qsTr("여50세이상")
                        font.pixelSize: 16
                        anchors.centerIn: parent
                    }

                    MouseArea{
                        x: 0
                        y: 0
                        width: 90
                        height: 100

                        onClicked: {
                            rectangle1.visible = !rectangle1.visible
                            text16.text = "여50세이상"
                            text16.color="ffdefc"
                        }
                    }
                }
            }

            Button {
                id: button17
                x: 446
                y: 570
                width: 51
                height: 56
                text: qsTr("폐기")

                onClicked: {
                    stackview4.push(Qt.resolvedUrl("qrc:/trash.qml"))
                }
            }


        }
    }


    Frame{
        id: di
        visible: false
        x:0
        y:0
        opacity: 1
        implicitWidth: 300;
        implicitHeight: 300;
        anchors.fill: parent

        Rectangle{
            visible: true
            x:-9
            y:-9
            opacity: 0.495
            anchors.fill: parent
            anchors.bottomMargin: -9
            anchors.rightMargin: -9
            anchors.topMargin: -9
            anchors.leftMargin: -9
        }
        StackView {
            id: stackView53
            x: 10
            y: 159
            width: 469
            height: 470

            initialItem: Item{
                Rectangle{
                    x:(parent.width-width)/2
                    y:(parent.height-height)/2
                    border.width: 2
                    implicitWidth: 300;
                    implicitHeight: 350;

                    Button{
                        x:54
                        y:40
                        width: 193
                        height: 41
                        Text{
                            text: "일별 통계"
                            font.pointSize: 11
                            anchors.centerIn: parent
                        }
                        onClicked: {
                            stackView53.push(Qt.resolvedUrl("qrc:/daychart.qml"))
                        }
                    }
                    Button{
                        x:54
                        y:106
                        width: 193
                        height: 39
                        Text{
                            text: "주별 통계"
                            font.pointSize: 11
                            anchors.centerIn: parent
                        }
                        onClicked: {
                            stackView53.push(Qt.resolvedUrl("qrc:/weekchart.qml"))
                        }
                    }
                    Button{
                        x:53
                        y:167
                        width: 194
                        height: 39
                        Text{
                            text: "월별 통계"
                            font.pointSize: 11
                            anchors.centerIn: parent
                        }
                        onClicked: {
                            stackView53.push(Qt.resolvedUrl("qrc:/monthchart.qml"))
                        }
                    }
                    Button{
                        x:53
                        y:222
                        width: 194
                        height: 39
                        Text{
                            text: "연도별 통계"
                            font.pointSize: 11
                            anchors.centerIn: parent
                        }
                        onClicked: {
                            stackView53.push(Qt.resolvedUrl("qrc:/yearchart.qml"))
                        }
                    }
                    Button{
                        x:222
                        y:301
                        width: 60
                        height: 31
                        Text{
                            text: "닫기"
                            font.pointSize: 11
                            anchors.centerIn: parent
                        }
                        onClicked: {
                            di.visible=false
                        }
                    }
                }
            }
        }
    }

    Window {
        id:managewindow

        //visible:false
        width: 600
        height: 500
        title: qsTr("관리자 모드")

        Rectangle {
            id: rectangle542254
            color: "#ffffff"
            anchors.fill: parent

            Rectangle {
                id: rectangle323462
                x: 0
                y: 0
                width: 600
                height: 76
                color: "#12ca00"
                radius: 10
            }

            Rectangle {
                id: rectangle12436
                x: 0
                y: 0
                width: 600
                height: 47
                color: "#12ca00"
                radius: 0
            }


            Rectangle {
                id: rectangle224366
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
                    id: rectangle43452
                    x: 8
                    y: 8
                    width: 80
                    height: 47
                    color: "#0e8301"

                    MouseArea{
                        x:0
                        y:0
                        width: 80
                        height: 47

                        onClicked: {
                            dibal.visible=true
                        }
                    }

                    Text {
                        id: text12345
                        width: 49
                        height: 30
                        color: "#ffffff"
                        text: qsTr("발주")
                        font.pixelSize: 25
                        anchors.verticalCenterOffset: 0
                        anchors.horizontalCenterOffset: 1
                        font.bold: true
                        anchors.centerIn: parent
                    }
                }

                Rectangle {
                    id: rectangle56272
                    x: 174
                    y: 8
                    width: 80
                    height: 47
                    color: "#0e8301"

                    Text {
                        id: text223462
                        width: 49
                        height: 30
                        color: "#ffffff"
                        text: qsTr("상품")
                        font.pixelSize: 25
                        font.bold: true
                        anchors.centerIn: parent
                    }

                    MouseArea {
                        x: 0
                        y: 0
                        width: 80
                        height: 47

                        onClicked: {
                            rectangle141.visible=false
                            rectangle142.visible=true
                            button62476358.visible=true
                            button62476357.visible=false
                            myModel5.productSlot()
                            stackview3.push(Qt.resolvedUrl("qrc:/product.qml"))
                        }
                    }
                }

                Rectangle {
                    id: rectangle6345326
                    x: 267
                    y: 8
                    width: 96
                    height: 47
                    color: "#0e8301"
                    Text {
                        id: text6584384
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

                Rectangle {
                    id: rectangle56273
                    x: 91
                    y: 8
                    width: 80
                    height: 47
                    color: "#0e8301"
                    Text {
                        id: text223463
                        width: 49
                        height: 30
                        color: "#ffffff"
                        text: qsTr("재고")
                        font.pixelSize: 25
                        anchors.centerIn: parent
                        font.bold: true
                    }

                    MouseArea {
                        x: 0
                        y: 0
                        width: 80
                        height: 47

                        onClicked: {
                            rectangle141.visible=true
                            rectangle142.visible=false
                            button62476358.visible=false
                            button62476357.visible=true
                            myModel2.ivSlot()
                            stackview3.push(Qt.resolvedUrl("qrc:/mproducttable.qml"))
                        }
                    }
                }
            }

            Rectangle {
                id: rectangle75678
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
                    id: text546543
                    x: 8
                    y: 8
                    width: 52
                    height: 27
                    color: "#002a00"
                    text: qsTr("분류")
                    font.pixelSize: 20
                }

                Rectangle {
                    id: rectangle835473
                    x: 8
                    y: 46
                    width: 568
                    height: 338
                    color: "#ffffff"

                    StackView{
                        id: stackview3
                        anchors.fill: parent

                        initialItem: Item{
                            TableView {
                                id: producttableview2
                                x: 5
                                y: 50
                                width: 558
                                height: 289
                                columnSpacing: 1
                                rowSpacing: 1
                                clip: true

                                property var columnWidths: [70, 200, 90, 140, 50]
                                columnWidthProvider: function (column) { return columnWidths[column] }

                                property alias tableVerticalBar: tableVerticalBar23

                                ScrollBar.vertical: ScrollBar {
                                    id: tableVerticalBar23
                                    policy:ScrollBar.AlwaysOn
                                }

                                model: ManegeProductTable {}

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
                                            text: mproductTabletabledata
                                            font.pointSize: 17
                                        }

                                        onClicked: {
                                            myModel2.mproductnameSlot(mproductTabletabledata)
                                            tetet2.color= "lightblue"
                                        }
                                    }
                                }
                            }
                        }
                    }

                }

                Rectangle {
                    id: rectangle9354623
                    x: 370
                    y: 11
                    width: 150
                    height: 24
                    color: "#ffffff"

                    TextEdit {
                        id: textEdit24352
                        x: 0
                        y: 0
                        width: 150
                        height: 24
                        text: qsTr("검색")
                        color: "gray"
                        font.pixelSize: 18
                        horizontalAlignment: Text.AlignRight


                        MouseArea{
                            id:texteditmouse
                            x:0
                            y:0
                            width: 150
                            height: 24

                            onClicked: {
                                textEdit24352.text=""
                                textEdit24352.color="black"
                                texteditmouse.visible=false
                            }
                        }
                    }
                }

                Button {
                    id: button23456
                    x: 524
                    y: 8
                    width: 46
                    height: 32
                    text: qsTr("검색")
                    font.pointSize: 14
                    font.bold: true

                    onClicked: {
                        myModel2.mproductsearchSlot(textEdit24352.text)
                        stackview3.push(Qt.resolvedUrl("qrc:/mproducttable.qml"))
                        textEdit24352.text="검색"
                        textEdit24352.color="gray"
                        texteditmouse.visible=true
                    }
                }

                Button {
                    id: button62476357
                    x: 74
                    y: 11
                    width: 163
                    height: 24
                    text: qsTr("")

                    onClicked: {
                        wwq.visible=true
                    }
                }
                Button {
                    id: button62476358
                    visible: false
                    x: 74
                    y: 11
                    width: 163
                    height: 24
                    text: qsTr("")

                    onClicked: {
                        wwq2.visible=true
                    }
                }

                Rectangle {
                    id: rectangle141
                    x: 13
                    y: 50
                    width: 554
                    height: 45
                    color: "#ffffff"

                    Rectangle {
                        id: rectangle113333
                        x: 0
                        y: 0
                        width: 70
                        height: 45
                        color: "#ffffff"
                        border.width: 1
                        Text {
                            id: text73333
                            x: 0
                            y: 8
                            text: qsTr("상품코드")
                            font.pixelSize: 18
                            font.bold: true
                        }
                    }

                    Rectangle {
                        id: rectangle123333
                        x: 71
                        y: 0
                        width: 200
                        height: 45
                        color: "#ffffff"
                        border.width: 1
                        Text {
                            id: text8887
                            x: 8
                            y: 8
                            text: qsTr("상품명")
                            font.pixelSize: 18
                            font.bold: true
                        }
                    }

                    Rectangle {
                        id: rectangle133333
                        x: 272
                        y: 0
                        width: 90
                        height: 45
                        color: "#ffffff"
                        border.width: 1
                        Text {
                            id: text93333
                            x: 8
                            y: 8
                            text: qsTr("상품가격")
                            font.pixelSize: 18
                            font.bold: true
                        }
                    }

                    Rectangle {
                        id: rectangle1433333
                        x: 363
                        y: 0
                        width: 140
                        height: 45
                        color: "#ffffff"
                        border.width: 1
                        Text {
                            id: text1033332
                            x: 8
                            y: 8
                            text: qsTr("유통기한")
                            font.pixelSize: 18
                            font.bold: true
                        }
                    }

                    Rectangle {
                        id: rectangle143333
                        x: 504
                        y: 0
                        width: 50
                        height: 45
                        color: "#ffffff"
                        border.width: 1
                        Text {
                            id: text103333
                            x: 8
                            y: 8
                            text: qsTr("수량")
                            font.pixelSize: 18
                            font.bold: true
                        }
                    }
                }

                Rectangle {
                    id: rectangle142
                    visible: false
                    x: 13
                    y: 50
                    width: 554
                    height: 45
                    color: "#ffffff"
                    Rectangle {
                        id: rectangle113334
                        x: 0
                        y: 0
                        width: 80
                        height: 45
                        color: "#ffffff"
                        border.width: 1
                        Text {
                            id: text73334
                            x: 0
                            y: 8
                            text: qsTr("상품코드")
                            font.pixelSize: 18
                            font.bold: true
                        }
                    }

                    Rectangle {
                        id: rectangle123334
                        x: 81
                        y: 0
                        width: 277
                        height: 45
                        color: "#ffffff"
                        border.width: 1
                        Text {
                            id: text8888
                            x: 8
                            y: 8
                            text: qsTr("상품명")
                            font.pixelSize: 18
                            font.bold: true
                        }
                    }

                    Rectangle {
                        id: rectangle133334
                        x: 359
                        y: 0
                        width: 100
                        height: 45
                        color: "#ffffff"
                        border.width: 1
                        Text {
                            id: text93334
                            x: 8
                            y: 8
                            text: qsTr("상품가격")
                            font.pixelSize: 18
                            font.bold: true
                        }
                    }

                    Rectangle {
                        id: rectangle1433334
                        x: 460
                        y: 0
                        width: 95
                        height: 45
                        color: "#ffffff"
                        border.width: 1
                        Text {
                            id: text1033333
                            x: 8
                            y: 8
                            text: qsTr("카테고리")
                            font.pixelSize: 18
                            font.bold: true
                        }
                    }
                }
            }

            Text {
                id: text434753
                x: 13
                y: 74
                width: 72
                height: 26
                color: "#ff7a35"
                text: qsTr("재고")
                font.pixelSize: 20
            }

            Rectangle{
                id:wwq
                visible: false
                x:82.5
                y:135
                width: 162
                height: 290

                Button{
                    y:0
                    width:162
                    height: 29
                    text: qsTr("라면")
                    onClicked: {
                        button62476357.text="라면"
                        wwq.visible=false
                        myModel2.mproductcomboSlot(button62476357.text)
                        stackview3.push(Qt.resolvedUrl("qrc:/mproducttable.qml"))
                    }
                }
                Button{
                    x: 0
                    y:29
                    width:162
                    height: 29
                    text: qsTr("과자")
                    onClicked: {
                        button62476357.text="과자"
                        wwq.visible=false
                        myModel2.mproductcomboSlot(button62476357.text)
                        stackview3.push(Qt.resolvedUrl("qrc:/mproducttable.qml"))
                    }
                }
                Button{
                    y:58
                    width:162
                    height: 29
                    text: qsTr("음료")
                    onClicked: {
                        button62476357.text="음료"
                        wwq.visible=false
                        myModel2.mproductcomboSlot(button62476357.text)
                        stackview3.push(Qt.resolvedUrl("qrc:/mproducttable.qml"))
                    }
                }
                Button{
                    y:87
                    width:162
                    height: 29
                    text: qsTr("아이스크림")
                    onClicked: {
                        button62476357.text="아이스크림"
                        wwq.visible=false
                        myModel2.mproductcomboSlot(button62476357.text)
                        stackview3.push(Qt.resolvedUrl("qrc:/mproducttable.qml"))
                    }
                }
                Button{
                    y:116
                    width:162
                    height: 29
                    text: qsTr("빵")
                    onClicked: {
                        button62476357.text="빵"
                        wwq.visible=false
                        myModel2.mproductcomboSlot(button62476357.text)
                        stackview3.push(Qt.resolvedUrl("qrc:/mproducttable.qml"))
                    }
                }
                Button{
                    y:145
                    width:162
                    height: 29
                    text: qsTr("커피")
                    onClicked: {
                        button62476357.text="커피"
                        wwq.visible=false
                        myModel2.mproductcomboSlot(button62476357.text)
                        stackview3.push(Qt.resolvedUrl("qrc:/mproducttable.qml"))
                    }
                }
                Button{
                    y:174
                    width:162
                    height: 29
                    text: qsTr("주류")
                    onClicked: {
                        button62476357.text="주류"
                        wwq.visible=false
                        myModel2.mproductcomboSlot(button62476357.text)
                        stackview3.push(Qt.resolvedUrl("qrc:/mproducttable.qml"))
                    }
                }
                Button{
                    y:203
                    width:162
                    height: 29
                    text: qsTr("초콜릿")
                    onClicked: {
                        button62476357.text="초콜릿"
                        wwq.visible=false
                        myModel2.mproductcomboSlot(button62476357.text)
                        stackview3.push(Qt.resolvedUrl("qrc:/mproducttable.qml"))
                    }
                }
                Button{
                    y:232
                    width:162
                    height: 29
                    text: qsTr("껌")
                    onClicked: {
                        button62476357.text="껌"
                        wwq.visible=false
                        myModel2.mproductcomboSlot(button62476357.text)
                        stackview3.push(Qt.resolvedUrl("qrc:/mproducttable.qml"))
                    }
                }
                Button{
                    y:261
                    width:162
                    height: 29
                    text: qsTr("냉동식품")
                    onClicked: {
                        button62476357.text="냉동식품"
                        wwq.visible=false
                        myModel2.mproductcomboSlot(button62476357.text)
                        stackview3.push(Qt.resolvedUrl("qrc:/mproducttable.qml"))
                    }
                }
            }

            Rectangle{
                id:wwq2
                visible: false
                x:82.5
                y:135
                width: 162
                height: 290

                Button{
                    y:0
                    width:162
                    height: 29
                    text: qsTr("라면")
                    onClicked: {
                        button62476358.text="라면"
                        wwq2.visible=false
                        myModel5.productSlot()
                        stackview3.push(Qt.resolvedUrl("qrc:/product.qml"))
                    }
                }
                Button{
                    x: 0
                    y:29
                    width:162
                    height: 29
                    text: qsTr("과자")
                    onClicked: {
                        button62476358.text="과자"
                        wwq2.visible=false
                        myModel5.productSlot()
                        stackview3.push(Qt.resolvedUrl("qrc:/product.qml"))
                    }
                }
                Button{
                    y:58
                    width:162
                    height: 29
                    text: qsTr("음료")
                    onClicked: {
                        button62476358.text="음료"
                        wwq2.visible=false
                        myModel5.productSlot()
                        stackview3.push(Qt.resolvedUrl("qrc:/product.qml"))
                    }
                }
                Button{
                    y:87
                    width:162
                    height: 29
                    text: qsTr("아이스크림")
                    onClicked: {
                        button62476358.text="아이스크림"
                        wwq2.visible=false
                        myModel5.productSlot()
                        stackview3.push(Qt.resolvedUrl("qrc:/product.qml"))
                    }
                }
                Button{
                    y:116
                    width:162
                    height: 29
                    text: qsTr("빵")
                    onClicked: {
                        button62476358.text="빵"
                        wwq2.visible=false
                        myModel5.productSlot()
                        stackview3.push(Qt.resolvedUrl("qrc:/product.qml"))
                    }
                }
                Button{
                    y:145
                    width:162
                    height: 29
                    text: qsTr("커피")
                    onClicked: {
                        button62476358.text="커피"
                        wwq2.visible=false
                        myModel5.productSlot()
                        stackview3.push(Qt.resolvedUrl("qrc:/product.qml"))
                    }
                }
                Button{
                    y:174
                    width:162
                    height: 29
                    text: qsTr("주류")
                    onClicked: {
                        button62476358.text="주류"
                        wwq2.visible=false
                        myModel5.productSlot()
                        stackview3.push(Qt.resolvedUrl("qrc:/product.qml"))
                    }
                }
                Button{
                    y:203
                    width:162
                    height: 29
                    text: qsTr("초콜릿")
                    onClicked: {
                        button62476358.text="초콜릿"
                        wwq2.visible=false
                        myModel5.productSlot()
                        stackview3.push(Qt.resolvedUrl("qrc:/product.qml"))
                    }
                }
                Button{
                    y:232
                    width:162
                    height: 29
                    text: qsTr("껌")
                    onClicked: {
                        button62476358.text="껌"
                        wwq2.visible=false
                        myModel5.productSlot()
                        stackview3.push(Qt.resolvedUrl("qrc:/product.qml"))
                    }
                }
                Button{
                    y:261
                    width:162
                    height: 29
                    text: qsTr("냉동식품")
                    onClicked: {
                        button62476358.text="냉동식품"
                        wwq2.visible=false
                        myModel5.productSlot()
                        stackview3.push(Qt.resolvedUrl("qrc:/product.qml"))
                    }
                }
            }
        }

        Frame{
            id: dibal
            visible: false
            x:0
            y:0
            opacity: 1
            implicitWidth: 300;
            implicitHeight: 300;
            anchors.fill: parent

            Rectangle{
                visible: true
                x:-9
                y:-9
                opacity: 0.495
                anchors.fill: parent
                anchors.bottomMargin: -9
                anchors.rightMargin: -9
                anchors.topMargin: -9
                anchors.leftMargin: -9
            }

            Rectangle{
                x:(parent.width-width)/2
                y:(parent.height-height)/2
                border.width: 2
                implicitWidth: 300;
                implicitHeight: 350;

                Button{
                    x:156
                    y:301
                    width: 60
                    height: 31
                    Text{
                        text: "발주"
                        font.pointSize: 11
                        anchors.centerIn: parent
                    }
                    onClicked: {
                        myModel4.addiv(comboboxtext.text, combobox1text.text, mnum.text)
                        myModel2.mproductcomboSlot(comboboxtext.text)
                        stackview3.push(Qt.resolvedUrl("qrc:/mproducttable.qml"))
                        dibal.visible=false
                    }
                }

                Button{
                    x:222
                    y:301
                    width: 60
                    height: 31
                    Text{
                        text: "닫기"
                        font.pointSize: 11
                        anchors.centerIn: parent
                    }
                    onClicked: {
                        dibal.visible=false
                    }
                }

                Label {
                    x: 25
                    y: 72
                    width: 78
                    height: 31
                    text: qsTr("카테고리")
                    font.pointSize: 15
                }

                ComboBox {
                    id: comboBox
                    x: 126
                    y: 76
                    width: 148
                    height: 27

                    model: CategoryCombobox {}

                    delegate: ItemDelegate{
                        width:200
                        text: categorycomboboxdata

                        onClicked: {
                            comboboxtext.text=categorycomboboxdata
                            myModel3.mcategorynameSLOT(categorycomboboxdata)
                        }
                    }
                }
                Text{
                    id:comboboxtext
                    x: 126
                    y: 76
                    width: 148
                    height: 27
                    text: qsTr("")
                    font.pointSize: 13
                }

                Label {
                    x: 25
                    y: 116
                    width: 78
                    height: 31
                    text: qsTr("상품명")
                    font.pointSize: 15
                }

                ComboBox {
                    id: comboBox1
                    x: 126
                    y: 120
                    width: 148
                    height: 27

                    model: myModel3

                    delegate: ItemDelegate{
                        width:200
                        text: mproductcomboboxdata

                        onClicked: {
                            combobox1text.text=mproductcomboboxdata
                        }
                    }
                }
                Text{
                    id:combobox1text
                    x: 126
                    y: 120
                    width: 148
                    height: 27
                    text: qsTr("")
                    font.pointSize: 13
                }

                Label {
                    x: 25
                    y: 160
                    width: 78
                    height: 31
                    text: qsTr("수량")
                    font.pointSize: 15
                }

                Rectangle{
                    x:126
                    y:164
                    width: 148
                    height: 27
                    border.width: 1

                    TextEdit{
                        id:mnum
                        x:0
                        y:0
                        width: 148
                        height: 27
                        font.pointSize: 13
                    }
                }
            }
        }
    }

}



/*##^##
Designer {
    D{i:0;formeditorZoom:0.66}
}
##^##*/
