import 'package:fitty_frontend_app/data/all_exercise_record.dart';
import 'package:fitty_frontend_app/data/class/one_exercise_record.dart';

class ExerciseDataProcesser {
  static Map<String, OneExerciseRecord>
      getOneExerciseRecordsOfAllDateFromAllExerciseRecord(
          MyExerciseRecord allExerciseRecord, String exerciseName) {
    Map<String, OneExerciseRecord> oneExerciseRecordsOfAllDate = {};
    var recordEntries = allExerciseRecord.recordExistingEntries;
    for (var recordEntry in recordEntries) {
      var dayExerciseRecord = recordEntry.value;
      for (var oneExerciseRecord in dayExerciseRecord.oneExerciseRecords) {
        if (oneExerciseRecord.exerciseName == exerciseName) {
          oneExerciseRecordsOfAllDate[recordEntry.key] = oneExerciseRecord;
        }
      }
    }
    return oneExerciseRecordsOfAllDate;
  }
}
