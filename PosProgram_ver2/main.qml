import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.5
import QtQuick.Controls.Fusion
import QtQuick.Layouts 1.3
import TableModel 0.1
import CategoryTable 0.2
import ProductTable 0.3
import SqlQueryModel 0.4
import ManageProductTable 0.5

Window {
    visible: true
    id:wwwindow
    width: 500
    height: 800
    title: qsTr("편의점 POS")

    SqlQueryModel{

    }

    signal qmlSignal(msg: string)

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

    Dialog {
            id: di
            x:(parent.width-width)/2
            y:(parent.height-height)/2
            implicitWidth: 300;
            implicitHeight: 300;
            title: "통계 그래프"
            modal: true;
            //standardButtons: Dialog.Ok | Dialog.Cancel
            standardButtons: Dialog.Cancel

            Button{
                x:40
                y:40
                width: 100
                height: 60
                Text{
                    text: "일별 통계"
                    font.pointSize: 11
                    anchors.centerIn: parent

                }
            }

            Button{
                x:160
                y:40
                width: 100
                height: 60
                Text{
                    text: "주별 통계"
                    font.pointSize: 11
                    anchors.centerIn: parent

                }
            }
            Button{
                x:40
                y:140
                width: 100
                height: 60
                Text{
                    text: "월별 통계"
                    font.pointSize: 11
                    anchors.centerIn: parent
                }
            }
            Button{
                x:160
                y:140
                width: 100
                height: 60
                Text{
                    text: "연도별 통계"
                    font.pointSize: 11
                    anchors.centerIn: parent
                }
            }

            //onAccepted: console.log("Ok clicked")
            onRejected: console.log("Cancel clicked")
        }

    Window {
        id:managewindow

        visible:false
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
                    width: 96
                    height: 47
                    color: "#0e8301"

                    Text {
                        id: text12345
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
                    id: rectangle56272
                    x: 130
                    y: 8
                    width: 96
                    height: 47
                    color: "#0e8301"

                    Text {
                        id: text223462
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
                    id: rectangle6345326
                    x: 254
                    y: 6
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

                ComboBox {
                    id: comboBox234
                    x: 74
                    y: 11
                    width: 161
                    height: 24

                    model: ListModel{
                        id:ll
                        ListElement{text:"라면"}
                        ListElement{text:"과자"}
                        ListElement{text:"음료"}
                        ListElement{text:"아이스크림"}
                        ListElement{text:"빵"}
                        ListElement{text:"커피"}
                        ListElement{text:"주류"}
                        ListElement{text:"초콜릿"}
                        ListElement{text:"껌"}
                        ListElement{text:"냉동식품"}
                        ListElement{text:"편의용품"}
                        ListElement{text:"세제"}
                        ListElement{text:"견과류"}
                        ListElement{text:"마른안주"}
                        ListElement{text:"삼각김밥"}
                    }

                    //comboBox234.currentText


                }

                Rectangle {
                    id: rectangle835473
                    x: 8
                    y: 46
                    width: 568
                    height: 338
                    color: "#ffffff"

                    TableView {
                        id: producttableview2
                        x: 5
                        y: 50
                        width: 558
                        height: 289
                        columnSpacing: 1
                        rowSpacing: 1
                        clip: true

                        property var columnWidths: [90, 281, 89, 88]
                        columnWidthProvider: function (column) { return columnWidths[column] }

                        property alias tableVerticalBar: tableVerticalBar23

                        ScrollBar.vertical: ScrollBar {
                            id: tableVerticalBar23
                            policy:ScrollBar.AlwaysOn
                        }

                        model: ManageProductTable {}

                        delegate: Rectangle{
                            border.color: "gray"
                            border.width: 0.5
                            Text {
                                text: mproductTabletabledata
                                font.pointSize: 17
                            }
                        }
                    }
                    Rectangle {
                        id: rectangle113333
                        x: 5
                        y: 4
                        width: 90
                        height: 45
                        color: "#ffffff"
                        border.width: 1

                        Text {
                            id: text73333
                            x: 8
                            y: 8
                            text: qsTr("상품코드")
                            font.pixelSize: 18
                            font.bold: true
                        }
                    }

                    Rectangle {
                        id: rectangle123333
                        x: 95
                        y: 4
                        width: 282
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
                        x: 377
                        y: 4
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
                        id: rectangle143333
                        x: 467
                        y: 4
                        width: 89
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
                    id: rectangle9354623
                    x: 368
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
                        text: qsTr("Text Edit")
                        font.pixelSize: 18
                        horizontalAlignment: Text.AlignRight
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

                    function ppp(){

                    }

                    TableView {
                        id: producttableview
                        x: 5
                        y: 5
                        width: 380
                        height: 435
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
                                    //wwwindow.close()
                                    qmlSignal(categorytabledata)
                                    //producttableview.reloadData()
                                    //loader.source=producttableview

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


    Column {
        id: column
        anchors.fill: parent
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

                TableView {
                    x: 2
                    y: 48
                    width: 496
                    height: 300
                    columnSpacing: 1
                    rowSpacing: 1
                    clip: true

                    property var columnWidths: [50, 313, 70, 60]
                    columnWidthProvider: function (column) { return columnWidths[column] }

                    property alias tableVerticalBar: tableVerticalBar

                    ScrollBar.vertical: ScrollBar {
                        id: tableVerticalBar
                        policy:ScrollBar.AlwaysOn
                    }

                    model: TableModel {}

                    delegate: Rectangle{
                        border.color: "gray"
                        border.width: 0.5
                        color: (heading==true)?"lightgreen" : "white"
                        Text {
                            text: basketabledata
                            font.pointSize: 17
                        }
                    }
                }

                Rectangle {
                    x: 2
                    y: 351
                    width: 245
                    height: 95
                    border.color: "#000000"
                    border.width: 1.2
                    Rectangle {
                        x: 0
                        y: 0
                        width: 70
                        height: 47
                        color: "#f3f3f3"
                        border.color: "#000000"
                        Text {
                            text: qsTr("합계")
                            anchors.centerIn: parent
                            font.pointSize: 20
                        }
                    }

                    Rectangle {
                        x: 0
                        y: 49
                        width: 70
                        height: 46
                        color: "#f3f3f3"
                        border.color: "#000000"
                        Text {
                            text: qsTr("수량")
                            anchors.centerIn: parent
                            font.pointSize: 20
                        }
                    }

                    Rectangle {
                        x: 71
                        y: 0
                        width: 174
                        height: 47
                        color: "#f3f3f3"
                        border.color: "#000000"
                        Text {
                            text: qsTr("0")
                            anchors.centerIn: parent
                            font.pointSize: 20
                        }
                    }

                    Rectangle {
                        x: 71
                        y: 49
                        width: 174
                        height: 46
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
                    x: 251
                    y: 351
                    width: 245
                    height: 95
                    border.color: "#000000"
                    border.width: 1.2
                    Rectangle {
                        x: 0
                        y: 0
                        width: 100
                        height: 31
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
                        y: 33
                        width: 100
                        height: 32
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
                        y: 66
                        width: 100
                        height: 29
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
                        width: 144
                        height: 31
                        border.color: "#000000"
                        Text {
                            text: qsTr("0")
                            anchors.centerIn: parent
                            font.pointSize: 15
                        }
                    }

                    Rectangle {
                        x: 101
                        y: 33
                        width: 144
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
                        y: 67
                        width: 144
                        height: 28
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

            }
        }

        Frame {
            id: frame1
            x: 0
            y: 350
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
                    id: button26
                    x: 118
                    y: 236
                    width: 56
                    height: 58
                    text: qsTr("2")
                    font.pointSize: 17
                    font.bold: true
                }

                Button {
                    id: button27
                    x: 175
                    y: 236
                    width: 56
                    height: 58
                    text: qsTr("3")
                    font.pointSize: 17
                    font.bold: true
                }

                Button {
                    id: button28
                    x: 61
                    y: 295
                    width: 112
                    height: 51
                    text: qsTr("0")
                    font.pointSize: 17
                    font.bold: true
                }

                Button {
                    id: button29
                    x: 175
                    y: 295
                    width: 56
                    height: 51
                    text: qsTr("00")
                    font.pointSize: 17
                    font.bold: true
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
                    id: button20
                    x: 175
                    y: 178
                    width: 56
                    height: 56
                    text: qsTr("6")
                    font.pointSize: 17
                    font.bold: true
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
                        di.open();
                    }
                }

                Button {
                    id: button39
                    x: 61
                    y: 178
                    width: 56
                    height: 56
                    text: qsTr("4")
                    font.pointSize: 17
                    font.bold: true
                }

                Button {
                    id: button40
                    x: 118
                    y: 178
                    width: 56
                    height: 56
                    text: qsTr("5")
                    font.pointSize: 17
                    font.bold: true
                }

                Button {
                    id: button
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
                }

                Button {
                    id: button19
                    x: 175
                    y: 120
                    width: 56
                    height: 56
                    text: qsTr("9")
                    font.pointSize: 17
                    font.bold: true
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
                    id: button17
                    x: 445
                    y: 120
                    width: 51
                    height: 56
                    text: qsTr("폐기")
                }

                Button {
                    id: button41
                    x: 61
                    y: 120
                    width: 56
                    height: 56
                    text: qsTr("7")
                    font.pointSize: 17
                    font.bold: true
                }

                Button {
                    id: button42
                    x: 118
                    y: 120
                    width: 56
                    height: 56
                    text: qsTr("8")
                    font.pointSize: 17
                    font.bold: true
                }

                Button {
                    id: button32
                    x: 61
                    y: 236
                    width: 56
                    height: 58
                    text: qsTr("1")
                    font.pointSize: 17
                    font.bold: true
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
    }


}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.9}
}
##^##*/
