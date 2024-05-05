import 'dart:convert';

import 'package:fitti_frontend_app/class/exercise/exercise_.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExerciseListProvider extends ChangeNotifier {
  List<Exercise_> _exerciseList = [];
  final List<String> _exerciseType = [
    "가슴",
    "어깨",
    "등",
    "하체",
    "팔",
    "복근",
  ];

  List<String> get exerciseType => _exerciseType;
  List<Exercise_> get exerciseList => _exerciseList;

  Future<void> initExerciseList() async {
    var prefs = await SharedPreferences.getInstance();
    var encodedData = prefs.getString('exerciseList');
    if (encodedData == null) {
      _exerciseList = [
        Exercise_("벤치프레스", false),
        Exercise_("스쿼트", false),
        Exercise_("데드리프트", false),
        Exercise_("오버헤드 프레스", false),
        Exercise_("바벨 로우", false),
        Exercise_("풀업", false),
        Exercise_("펜들레이 로우", false),
        Exercise_("라잉 트라이셉스 익스텐션", false),
        Exercise_("바벨 컬", false),
        Exercise_("인클라인 덤벨 벤치프레스", false),
        Exercise_("인클라인 벤치프레스", false),
        Exercise_("덤벨 벤치프레스", false),
        Exercise_("덤벨 플라이", false),
        Exercise_("덤벨 숄더 프레스", false),
        Exercise_("시티드 케이블 로우", false),
        Exercise_("해머 컬", false),
        Exercise_("프론트 레이즈", false),
      ];
      prefs.setString('exerciseList', jsonEncode(_exerciseList));
    } else {
      _exerciseList = jsonDecode(encodedData)
          .map<Exercise_>((exercise) => Exercise_.fromJson(exercise))
          .toList();
    }
  }

  bool _isExist(String exerciseName) {
    if (_exerciseList.indexWhere((element) => element.name == exerciseName) !=
        -1) {
      return true;
    }
    return false;
  }

  Future<bool> addExercise(Exercise_ exercise) async {
    if (_isExist(exercise.name)) return false;

    _exerciseList.add(exercise);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('exerciseList', jsonEncode(_exerciseList));
    notifyListeners();
    return true;
  }

  void deleteExercise(String exerciseName) async {
    int index =
        _exerciseList.indexWhere((element) => element.name == exerciseName);
    if (!exerciseList[index].isCreated) {
      throw Exception("Cannot remove default exercise");
    }
    _exerciseList.removeAt(index);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('exerciseList', jsonEncode(_exerciseList));
    notifyListeners();
  }
}
