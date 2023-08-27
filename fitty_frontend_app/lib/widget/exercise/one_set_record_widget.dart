import 'package:fitty_frontend_app/data/my_exercise_record.dart';
import 'package:fitty_frontend_app/data/class/one_set_record.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OneSetRecordWidget extends StatelessWidget {
  OneSetRecordWidget({
    required this.oneSetInfo,
    required this.index,
    required this.deleteThis,
    required this.updateExerciseRecords,
    super.key,
  });

  final OneSetRecord oneSetInfo;
  final int index;
  final Function deleteThis;
  final Function updateExerciseRecords;

  final TextEditingController kgController = TextEditingController();
  final TextEditingController repsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    kgController.text = oneSetInfo.weight.toString();
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
            onTap: () => kgController.selection = TextSelection(
                baseOffset: 0, extentOffset: kgController.text.length),
            controller: kgController,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[1-9]\d{0,3}'))
            ],
            maxLength: 4,
            onChanged: (value) => {
              oneSetInfo.weight = int.parse(value),
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
            onTap: () => repsController.selection = TextSelection(
                baseOffset: 0, extentOffset: repsController.text.length),
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
