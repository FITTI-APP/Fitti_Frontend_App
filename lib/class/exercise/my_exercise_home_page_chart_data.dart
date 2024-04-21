import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../utility/chart_data.dart';

class MyExerciseHomePageChartData {
  final ChartData _chartData = ChartData();

  List<RadarDataSet> rawDataSetList = [];

  final bodyKo = [
    "가슴",
    "등",
    "복근",
    "어깨",
    "팔",
    "하체",
  ];

  final body = [
    "chest",
    "back",
    "abs",
    "shoulders",
    "biceps",
    "thighs",
  ];

  RadarChart getRadarChart() {
    return RadarChart(
      makeRadarChart(),
    );
  }

  RadarChartData makeRadarChart() {
    return _chartData.makeRadarChartData(
        getRadarDataSetList(), getTitleByIndexFunction);
  }

  RadarChartTitle getTitleByIndexFunction(
    int index,
    double angle,
  ) {
    return RadarChartTitle(
      text: bodyKo[index],
      angle: angle,
    );
  }

  List<RadarDataSet> getRadarDataSetList() {
    return [
      RadarDataSet(
        fillColor: const Color.fromARGB(100, 48, 144, 222),
        borderColor: Colors.blue,
        entryRadius: 0,
        dataEntries: [
          const RadarEntry(value: 1),
          const RadarEntry(value: 2),
          const RadarEntry(value: 3),
          const RadarEntry(value: 4),
          const RadarEntry(value: 5),
          const RadarEntry(value: 6),
        ],
        borderWidth: 1,
      )
    ];
  }
}
