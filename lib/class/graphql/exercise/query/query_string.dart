class QueryString {
  static String exercisesByExerciseKindId = r"""
query($exerciseKindId: Long!) {
  exercisesByExerciseKindId(exerciseKindId: $exerciseKindId) {
    id
    name
  }
}
""";
}
