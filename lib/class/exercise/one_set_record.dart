class OneSetRecord {
  int weight = 0;
  int reps = 0;
  OneSetRecord();
  OneSetRecord.fromJson(Map<String, dynamic> json)
      : weight = json['weight'],
        reps = json['reps'];
  Map<String, dynamic> toJson() => {
        'weight': weight,
        'reps': reps,
      };
}
