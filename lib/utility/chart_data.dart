import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

// chart data을 가져오는 클래스입니다. 냥냥!
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
          borderSide: const BorderSide(color: Colors.white, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 20,
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

  // RadarChartData makeRadarChartData() {}
}
