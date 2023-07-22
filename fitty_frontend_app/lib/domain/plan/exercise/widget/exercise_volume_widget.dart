import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

import 'one-set-info-widget.dart';

class ExerciseVolumeWidget extends StatefulWidget {
  const ExerciseVolumeWidget({
    super.key,
    required this.exerciseName,
    required this.deleteExerciseVolumeWidget,
  });
  final String exerciseName;
  final Function deleteExerciseVolumeWidget;
  @override
  State<ExerciseVolumeWidget> createState() => _ExerciseVolumeWidgetState();
}

class _ExerciseVolumeWidgetState extends State<ExerciseVolumeWidget> {
  List<Tuple2> kgAndRepsList = [];

  void deleteKgAndRepsTextBox(int index) {
    setState(() {
      kgAndRepsList.removeAt(index);
    });
  }

  void changeKgAndReps(int index, int kg, int reps) {
    setState(() {
      kgAndRepsList[index] = Tuple2(kg, reps);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: FittedBox(
          fit: BoxFit.fitHeight,
          child: Container(
              width: 400,
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 1),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(child: Container()),
                      Text(
                        widget.exerciseName,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () {
                                widget.deleteExerciseVolumeWidget(widget.key);
                              },
                              icon: const Icon(Icons.close),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: kgAndRepsList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return OneSetInfoWidget(
                        deleteKgAndRepsTextBox: deleteKgAndRepsTextBox,
                        changeKgAndReps: changeKgAndReps,
                        index: index,
                        kg: kgAndRepsList[index].item1,
                        reps: kgAndRepsList[index].item2,
                      );
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        kgAndRepsList.add(Tuple2(0, 0));
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      foregroundColor:
                          Colors.blue, // Set button background color
                    ),
                    child: const Text(
                      '추가',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
