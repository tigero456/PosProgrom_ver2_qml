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
                axisX: BarCategoryAxis { categories: ["5-26", "5-27", "5-28", "5-29", "5-30", "5-31", "6-1" ] }

                XYPoint {
                    x: 1
                    y: 200000
                }

                XYPoint {
                    x: 2
                    y: 300000
                }

                XYPoint {
                    x: 3
                    y: 130000
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
                    x: 6
                    y: 30000
                }
                XYPoint {
                    x: 6
                    y: 10000
                }
            }
            LineSeries {
                name: "과자"
                XYPoint {
                    x: 1
                    y: 100000
                }

                XYPoint {
                    x: 2
                    y: 200000
                }

                XYPoint {
                    x: 3
                    y: 100000
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
                    x: 6
                    y: 200000
                }
                XYPoint {
                    x: 7
                    y: 480000
                }
            }
            LineSeries {
                name: "음료"
                XYPoint {
                    x: 1
                    y: 400000
                }

                XYPoint {
                    x: 2
                    y: 40000
                }

                XYPoint {
                    x: 3
                    y: 30000
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
                    x: 6
                    y: 5000000
                }
                XYPoint {
                    x: 7
                    y: 220000
                }
            }

            LineSeries {
                name: "아이스크림"
                XYPoint {
                    x: 1
                    y: 300000
                }

                XYPoint {
                    x: 2
                    y: 100000
                }

                XYPoint {
                    x: 3
                    y: 60000
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
                    x: 6
                    y: 560000
                }
                XYPoint {
                    x: 7
                    y: 120000
                }
            }

            LineSeries {
                name: "빵"
                XYPoint {
                    x: 1
                    y: 50000
                }

                XYPoint {
                    x: 2
                    y: 300000
                }

                XYPoint {
                    x: 3
                    y: 30000
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
                    x: 6
                    y: 120000
                }
                XYPoint {
                    x: 7
                    y: 280000
                }
            }

            LineSeries {
                name: "커피"
                XYPoint {
                    x: 1
                    y: 3000
                }

                XYPoint {
                    x: 2
                    y: 500000
                }

                XYPoint {
                    x: 3
                    y: 50000
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
                    x: 6
                    y: 30000
                }
                XYPoint {
                    x: 7
                    y: 40000
                }
            }

            LineSeries {
                name: "주류"
                XYPoint {
                    x: 1
                    y: 10000
                }

                XYPoint {
                    x: 2
                    y: 600000
                }

                XYPoint {
                    x: 3
                    y: 120000
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
                    x: 6
                    y: 1900000
                }
                XYPoint {
                    x: 7
                    y: 110000
                }
            }

            LineSeries {
                name: "초콜릿"
                XYPoint {
                    x: 1
                    y: 100000
                }

                XYPoint {
                    x: 2
                    y: 200000
                }

                XYPoint {
                    x: 3
                    y: 100000
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
                    x: 6
                    y: 200000
                }
                XYPoint {
                    x: 7
                    y: 480000
                }
            }

            LineSeries {
                name: "껌"
                XYPoint {
                    x: 1
                    y: 1500
                }

                XYPoint {
                    x: 2
                    y: 6000
                }

                XYPoint {
                    x: 3
                    y: 5000
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
                    x: 6
                    y: 6000
                }
                XYPoint {
                    x: 7
                    y: 3000
                }
            }

            LineSeries {
                name: "냉동식품"
                XYPoint {
                    x: 1
                    y: 1000000
                }

                XYPoint {
                    x: 2
                    y: 210000
                }

                XYPoint {
                    x: 3
                    y: 10000
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
                    x: 6
                    y: 100000
                }
                XYPoint {
                    x: 7
                    y: 610000
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
