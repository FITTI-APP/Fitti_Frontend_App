import 'package:fitti_frontend_app/utility/chart_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HomePageChartData {
  final ChartData _chartData = ChartData();

  BarChart getMyExerciseBarChart() {
    return BarChart(
      getMyExerciseChart(),
    );
  }

  BarChartData getMyExerciseChart() {
    const barColor = Colors.green;
    const backGroundColor = Colors.grey;
    const reservedSize = 30.0;

    return _chartData.makeBarChartData(
        getDaysTitles, reservedSize, showingGroups(barColor, backGroundColor));
  }

  List<BarChartGroupData> showingGroups(
    Color barColor,
    Color backGroundColor,
  ) =>
      List.generate(7, (i) {
        switch (i) {
          case 0: // sample data들임.
            return _chartData.makeGroupData(0, 50,
                barColor: barColor, backGroundColor: backGroundColor);
          case 1:
            return _chartData.makeGroupData(1, 20,
                barColor: barColor, backGroundColor: backGroundColor);
          case 2:
            return _chartData.makeGroupData(2, 75,
                barColor: barColor, backGroundColor: backGroundColor);
          case 3:
            return _chartData.makeGroupData(3, 100,
                barColor: barColor, backGroundColor: backGroundColor);
          case 4:
            return _chartData.makeGroupData(4, 55,
                barColor: barColor, backGroundColor: backGroundColor);
          case 5:
            return _chartData.makeGroupData(5, 0,
                barColor: barColor, backGroundColor: backGroundColor);
          case 6:
            return _chartData.makeGroupData(6, 0,
                barColor: barColor, backGroundColor: backGroundColor);
          default:
            return throw Error();
        }
      });

  Widget getDaysTitles(
    double value,
    TitleMeta meta,
  ) {
    const style = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 10,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('월', style: style);
        break;
      case 1:
        text = const Text('화', style: style);
        break;
      case 2:
        text = const Text('수', style: style);
        break;
      case 3:
        text = const Text('목', style: style);
        break;
      case 4:
        text = const Text('금', style: style);
        break;
      case 5:
        text = const Text('토', style: style);
        break;
      case 6:
        text = const Text('일', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 5,
      child: text,
    );
  }
}
