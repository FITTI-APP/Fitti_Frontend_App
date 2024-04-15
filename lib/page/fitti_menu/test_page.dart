import 'package:fitti_frontend_app/class/graphql/exercise/mutation/input/exercise_exercise_record_input.dart';
import 'package:fitti_frontend_app/class/graphql/exercise/mutation/input/exercise_session_record_input.dart';
import 'package:fitti_frontend_app/class/graphql/exercise/mutation/input/exercise_set_record_input.dart';
import 'package:fitti_frontend_app/class/graphql/exercise/mutation/mutation_string.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Mutation(
      options: MutationOptions(
        document: gql(MutationString.putExerciseSessionRecord),
        update: (cache, result) => result,
        onCompleted: (resultData) => print(resultData),
        onError: (error) => print(error),
      ),
      builder: (runMutation, result) => Column(
        children: [
          const Text('Test Page'),
          ElevatedButton(
            onPressed: () async {
              var exerciseSetRecordInput1 = ExerciseSetRecordInput(
                  memo: "hi",
                  order: 1,
                  weight: 60,
                  reps: 5,
                  distance: 0,
                  totalTime: const Duration(seconds: 60));
              var exerciseExerciseRecordInput1 = ExerciseExerciseRecordInput(
                  exerciseId: 1,
                  order: 1,
                  memo: "hihi",
                  exerciseSetRecordInputs: [exerciseSetRecordInput1]);
              var exerciseSessionRecordInput = ExerciseSessionRecordInput(
                  memo: "hihihi",
                  startTime: DateTime.parse('2024-04-16 17:00:00'),
                  endTime: DateTime.parse('2024-04-16 18:00:00'),
                  exerciseSaveTypeId: 1,
                  exerciseExerciseRecordInputs: [exerciseExerciseRecordInput1]);

              runMutation({
                'exerciseSessionRecordInput': {
                  "exerciseSessionRecordId": null,
                  "memo": "hihihi",
                  "startTime": "2024-04-16T17:00:00.000",
                  "endTime": "2024-04-16T18:00:00.000",
                  "exerciseSaveTypeId": 1,
                  "exerciseExerciseRecordInputs": [
                    {
                      "exerciseExerciseRecordId": null,
                      "exerciseId": 1,
                      "order": 1,
                      "memo": "hihi",
                      "exerciseSetRecordInputs": [
                        {
                          "exerciseSetRecordId": null,
                          "memo": "hi",
                          "order": 1,
                          "weight": 60.0,
                          "reps": 5,
                          "distance": 0.0,
                          "totalTime": "0:01:00.000000"
                        }
                      ]
                    }
                  ]
                }
              });
            },
            child: const Text(
              '운동 세션 저장 테스트',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
