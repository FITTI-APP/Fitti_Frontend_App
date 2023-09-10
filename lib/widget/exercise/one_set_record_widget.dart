import 'package:fitti_frontend_app/class/exercise/one_set_record.dart';
import 'package:fitti_frontend_app/class/provider/my_exercise_record.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class OneSetRecordWidget extends StatelessWidget {
  OneSetRecordWidget({
    required this.oneSetInfo,
    required this.index,
    required this.deleteThis,
    super.key,
  });

  final OneSetRecord oneSetInfo;
  final int index;
  final Function deleteThis;

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
          height: 30,
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
            onChanged: (value) {
              oneSetInfo.reps = int.parse(value);
              var myExerciseRecord = context.read<MyExerciseRecord>();
              myExerciseRecord.updateExerciseRecords();
            },
            decoration: const InputDecoration(
              counterText: '',
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.all(0),
            ),
          ),
        ),
        const Text('kg'),
        SizedBox(
          width: 65,
          height: 30,
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
            onChanged: (value) {
              oneSetInfo.reps = int.parse(value);
              var myExerciseRecord = context.read<MyExerciseRecord>();
              myExerciseRecord.updateExerciseRecords();
            },
            decoration: const InputDecoration(
              counterText: '',
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.all(0),
            ),
          ),
        ),
        const Text('reps'),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.done),
        ),
      ],
    );
  }
}
