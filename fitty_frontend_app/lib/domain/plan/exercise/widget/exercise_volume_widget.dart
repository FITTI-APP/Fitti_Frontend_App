import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

import 'one-set-info-widget.dart';

class ExerciseVolumeWidget extends StatefulWidget {
  const ExerciseVolumeWidget({
    super.key,
    required String exerciseName,
    required Function deleteExerciseVolumeWidget,
  })  : _deleteExerciseVolumeWidget = deleteExerciseVolumeWidget,
        _exerciseName = exerciseName;
  final String _exerciseName;
  final Function _deleteExerciseVolumeWidget;
  @override
  State<ExerciseVolumeWidget> createState() => _ExerciseVolumeWidgetState();
}

class _ExerciseVolumeWidgetState extends State<ExerciseVolumeWidget> {
  List<Tuple2> _kgAndRepsList = [];

  void deleteKgAndRepsTextBox(int index) {
    setState(() {
      _kgAndRepsList.removeAt(index);
    });
  }

  void changeKgAndReps(int index, int kg, int reps) {
    setState(() {
      _kgAndRepsList[index] = Tuple2(kg, reps);
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
                        widget._exerciseName,
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
                                widget._deleteExerciseVolumeWidget(widget.key);
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
                    itemCount: _kgAndRepsList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return OneSetInfoWidget(
                        deleteKgAndRepsTextBox: deleteKgAndRepsTextBox,
                        changeKgAndReps: changeKgAndReps,
                        index: index,
                        kg: _kgAndRepsList[index].item1,
                        reps: _kgAndRepsList[index].item2,
                      );
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _kgAndRepsList.add(Tuple2(0, 0));
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
