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
                name: "라면"
                axisX: BarCategoryAxis { categories: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12" ] }

                XYPoint {
                }

                XYPoint {
                }

                XYPoint {
                }

                XYPoint {
                    x: 4
                    y: 40000
                }
                XYPoint {
                    x: 5
                    y: 110000
                }
                XYPoint {
                }
                XYPoint {
                }
            }
            LineSeries {
                name: "과자"
                XYPoint {
                }

                XYPoint {
                }

                XYPoint {
                }

                XYPoint {
                    x: 4
                    y: 20000
                }
                XYPoint {
                    x: 5
                    y: 90000
                }
                XYPoint {
                }
                XYPoint {
                }
            }
            LineSeries {
                name: "음료"
                XYPoint {
                }

                XYPoint {
                }

                XYPoint {
                }

                XYPoint {
                    x: 4
                    y: 240000
                }
                XYPoint {
                    x: 5
                    y: 400000
                }
                XYPoint {
                }
                XYPoint {
                }
            }

            LineSeries {
                name: "아이스크림"
                XYPoint {
                }

                XYPoint {
                }

                XYPoint {
                }

                XYPoint {
                    x: 4
                    y: 260000
                }
                XYPoint {
                    x: 5
                    y: 400000
                }
                XYPoint {
                }
                XYPoint {
                }
            }

            LineSeries {
                name: "빵"
                XYPoint {
                }

                XYPoint {
                }

                XYPoint {
                }

                XYPoint {
                    x: 4
                    y: 10000
                }
                XYPoint {
                    x: 5
                    y: 240000
                }
                XYPoint {
                }
                XYPoint {
                }
            }

            LineSeries {
                name: "커피"
                XYPoint {
                }

                XYPoint {
                }

                XYPoint {
                }

                XYPoint {
                    x: 4
                    y: 30000
                }
                XYPoint {
                    x: 5
                    y: 540000
                }
                XYPoint {
                }
                XYPoint {
                }
            }

            LineSeries {
                name: "주류"
                XYPoint {
                }

                XYPoint {
                }

                XYPoint {
                }

                XYPoint {
                    x: 4
                    y: 6000
                }
                XYPoint {
                    x: 5
                    y: 84000
                }
                XYPoint {
                }
                XYPoint {
                }
            }

            LineSeries {
                name: "초콜릿"
                XYPoint {
                }

                XYPoint {
                }

                XYPoint {
                }

                XYPoint {
                    x: 4
                    y: 20000
                }
                XYPoint {
                    x: 5
                    y: 90000
                }
                XYPoint {
                }
                XYPoint {
                }
            }

            LineSeries {
                name: "껌"
                XYPoint {
                }

                XYPoint {
                }

                XYPoint {
                }

                XYPoint {
                    x: 4
                    y: 1000
                }
                XYPoint {
                    x: 5
                    y: 9000
                }
                XYPoint {
                }
                XYPoint {
                }
            }

            LineSeries {
                name: "냉동식품"
                XYPoint {
                }

                XYPoint {
                }

                XYPoint {
                }

                XYPoint {
                    x: 4
                    y: 21000
                }
                XYPoint {
                    x: 5
                    y: 10000
                }
                XYPoint {
                }
                XYPoint {
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
                stackView53.pop();
            }
        }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
