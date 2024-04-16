class ExerciseSetRecordInput {
  int? exerciseSetRecordId;
  String memo;
  int order;
  double weight;
  int reps;
  double distance;
  Duration totalTime;

  ExerciseSetRecordInput(
      {this.exerciseSetRecordId,
      required this.memo,
      required this.order,
      required this.weight,
      required this.reps,
      required this.distance,
      required this.totalTime});
  ExerciseSetRecordInput.fromJson(Map<String, dynamic> json)
      : exerciseSetRecordId = json['exerciseSetRecordId'],
        memo = json['memo'],
        order = json['order'],
        weight = json['weight'],
        reps = json['reps'],
        distance = json['distance'],
        totalTime = json['totalTime'];
  Map<String, dynamic> toJson() => {
        'exerciseSetRecordId': exerciseSetRecordId,
        'memo': memo,
        'order': order,
        'weight': weight,
        'reps': reps,
        'distance': distance,
        'totalTime': totalTime,
      };
}
