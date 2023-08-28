import 'one_exercise_record.dart';

class DayExerciseRecord {
  List<OneExerciseRecord> oneExerciseRecords = [];
  DayExerciseRecordState state = DayExerciseRecordState.before;
  DateTime startTime = DateTime.now();
  DateTime endTime = DateTime.now();
  Duration get exerciseDuration => endTime.difference(startTime);

  DayExerciseRecord();
  DayExerciseRecord.fromJson(Map<String, dynamic> json)
      : oneExerciseRecords = List<OneExerciseRecord>.from(
            json['oneExerciseRecords']
                .map((value) => OneExerciseRecord.fromJson(value))),
        state = !json.containsKey('state')
            ? DayExerciseRecordState.before
            : DayExerciseRecordState.fromString(json['state']),
        startTime = !json.containsKey('startTime')
            ? DateTime.now()
            : DateTime.parse(json['startTime']),
        endTime = !json.containsKey('endTime')
            ? DateTime.now()
            : DateTime.parse(json['endTime']);

  Map<String, dynamic> toJson() {
    return {
      'oneExerciseRecords': oneExerciseRecords,
      'state': state.toString(),
      'startTime': startTime.toString(),
      'endTime': endTime.toString(),
      'exerciseDuration': exerciseDuration.toString(),
    };
  }
}

enum DayExerciseRecordState {
  before,
  ongoing,
  end;

  // 문자열을 DayExerciseRecordState로 변환
  static DayExerciseRecordState fromString(String str) {
    switch (str) {
      case 'before':
        return DayExerciseRecordState.before;
      case 'ongoing':
        return DayExerciseRecordState.ongoing;
      case 'end':
        return DayExerciseRecordState.end;
    }
    return DayExerciseRecordState.before;
  }

  // 문자열 변환
  @override
  String toString() {
    switch (this) {
      case DayExerciseRecordState.before:
        return 'before';
      case DayExerciseRecordState.ongoing:
        return 'ongoing';
      case DayExerciseRecordState.end:
        return 'end';
    }
  }
}
