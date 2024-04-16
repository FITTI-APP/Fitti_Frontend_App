class MutationString {
  static String putExerciseSessionRecord = r"""
mutation($exerciseSessionRecordInput: ExerciseSessionRecordInput!) {
  putExerciseSessionRecord(exerciseSessionRecordInput: $exerciseSessionRecordInput) {
    id
    exerciseExerciseRecords {
      id
      exercise {
        id
        name
      }
    }
  }
}
""";
}
