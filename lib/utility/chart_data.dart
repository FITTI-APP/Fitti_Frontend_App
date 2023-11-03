import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartData {
  BarChartGroupData makeGroupData(
    int x,
    double y, {
    Color? barColor,
    Color? backGroundColor,
    double barSpace = 2,
    double width = 10,
    List<int> showTooltips = const [],
  }) {
    barColor ??= barColor;
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: barColor,
          width: width,
          borderSide: const BorderSide(color: Colors.black, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 100,
            color: backGroundColor,
          ),
        ),
      ],
      barsSpace: barSpace,
      showingTooltipIndicators: showTooltips,
    );
  }

  BarChartData makeBarChartData(
    GetTitleWidgetFunction sideTitleWidget,
    double reservedSize,
    List<BarChartGroupData> barChartGroupDatas,
  ) {
    return BarChartData(
        titlesData: FlTitlesData(
          show: true,
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: sideTitleWidget,
              reservedSize: reservedSize,
            ),
          ),
          leftTitles: const AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
            ),
          ),
        ),
        borderData: FlBorderData(show: false),
        barGroups: barChartGroupDatas,
        gridData: const FlGridData(show: false));
  }

  RadarChartData makeRadarChartData(
    List<RadarDataSet> dataSets,
    GetTitleByIndexFunction? getTitleByIndexFunction,
  ) {
    return RadarChartData(
      dataSets: dataSets,
      radarBackgroundColor: Colors.white,
      borderData: FlBorderData(
        show: true,
        border: const Border(
          top: BorderSide(color: Colors.black, width: 2),
          right: BorderSide(color: Colors.black, width: 2),
          bottom: BorderSide(color: Colors.black, width: 2),
          left: BorderSide(color: Colors.black, width: 2),
        ),
      ),
      radarBorderData: const BorderSide(
        color: Colors.black,
        width: 1,
        style: BorderStyle.none,
      ),
      titlePositionPercentageOffset: 0.1,
      titleTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 11,
      ),
      getTitle: getTitleByIndexFunction,
      tickCount: 3,
      tickBorderData: const BorderSide(color: Colors.black, width: 1),
      ticksTextStyle: const TextStyle(
        color: Colors.transparent,
      ),
    );
  }
}
