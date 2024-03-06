import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../utility/chart_data.dart';

class MyExerciseHomePageChartData {
  final ChartData _chartData = ChartData();

  List<RadarDataSet> rawDataSetList = [];
  final upperBodyKo = [
    "가슴",
    "등",
    "어깨",
    "삼두",
    "이두",
    "전완",
    "복근",
  ];

  final upperBody = [
    "chest",
    "back",
    "shoulders",
    "triceps",
    "biceps",
    "forearms",
    "abs",
  ];

  final lowerBodyKo = [
    "허벅지",
    "종아리",
    "엉덩이",
  ];

  final lowerBody = [
    "thighs",
    "calves",
    "glutes",
  ];

  RadarChart getRadarChart(
    bool isUpperBody,
  ) {
    return RadarChart(
      makeRadarChart(isUpperBody),
    );
  }

  RadarChartData makeRadarChart(
    bool isUpperBody,
  ) {
    return _chartData.makeRadarChartData(
        getRadarDataSetList(isUpperBody), getTitleByIndexFunction);
  }

  RadarChartTitle getTitleByIndexFunction(
    int index,
    double angle,
  ) {
    if (index >= 0 && index < upperBodyKo.length) {
      return RadarChartTitle(
        text: upperBodyKo[index],
        angle: angle,
      );
    } else {
      if (index >= 0 && index < lowerBodyKo.length) {
        return RadarChartTitle(
          text: lowerBodyKo[index],
          angle: angle,
        );
      }
    }
    return const RadarChartTitle(text: "", angle: 0);
  }

  List<RadarDataSet> getRadarDataSetList(
    bool isUpperBody,
  ) {
    if (isUpperBody) {
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
            const RadarEntry(value: 7),
          ],
          borderWidth: 1,
        )
      ];
    } else {
      return [
        RadarDataSet(
          fillColor: const Color.fromARGB(100, 48, 144, 222),
          borderColor: Colors.blue,
          entryRadius: 0,
          dataEntries: [
            const RadarEntry(value: 1),
            const RadarEntry(value: 2),
            const RadarEntry(value: 3),
          ],
          borderWidth: 1,
        )
      ];
    }
  }
}
