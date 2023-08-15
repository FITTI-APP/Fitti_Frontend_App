import 'package:fitty_frontend_app/domain/plan/exercise/all_exercise_record.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SetRecordWidget extends StatelessWidget {
  SetRecordWidget({
    required this.oneSetInfo,
    required this.index,
    required this.deleteThis,
    required this.updateExerciseRecords,
    super.key,
  });

  final SetRecord oneSetInfo;
  final int index;
  final Function deleteThis;
  final Function updateExerciseRecords;

  final TextEditingController kgController = TextEditingController();
  final TextEditingController repsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    kgController.text = oneSetInfo.kg.toString();
    repsController.text = oneSetInfo.reps.toString();
    kgController.selection = TextSelection.fromPosition(
        TextPosition(offset: kgController.text.length));
    repsController.selection = TextSelection.fromPosition(
        TextPosition(offset: repsController.text.length));
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: 65,
          height: 25,
          child: TextField(
            controller: kgController,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[1-9]\d{0,3}'))
            ],
            maxLength: 4,
            onChanged: (value) => {
              oneSetInfo.kg = int.parse(value),
              updateExerciseRecords(),
            },
            decoration: const InputDecoration(
              counterText: '',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        const Text('kg'),
        SizedBox(
          width: 65,
          height: 25,
          child: TextField(
            controller: repsController,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[1-9]\d{0,3}'))
            ],
            maxLength: 4,
            onChanged: (value) => {
              oneSetInfo.reps = int.parse(value),
              updateExerciseRecords(),
            },
            decoration: const InputDecoration(
              counterText: '',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        const Text('reps'),
        IconButton(
          onPressed: () {
            deleteThis(index);
          },
          icon: const Icon(Icons.delete),
        ),
      ],
    );
  }
}
