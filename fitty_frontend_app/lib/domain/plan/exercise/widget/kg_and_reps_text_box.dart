import 'package:flutter/material.dart';

class KgAndRepsTextBox extends StatefulWidget {
  final Function deleteKgAndRepsTextBox;
  final Function changeKgAndReps;
  final int index;
  int kg = 0;
  int reps = 0;

  KgAndRepsTextBox(
      {super.key,
      required this.deleteKgAndRepsTextBox,
      required this.changeKgAndReps,
      required this.index,
      required this.kg,
      required this.reps});

  @override
  State<KgAndRepsTextBox> createState() => _KgAndRepsTextBoxState();
}

class _KgAndRepsTextBoxState extends State<KgAndRepsTextBox> {
  TextEditingController kgController = TextEditingController();
  TextEditingController repsController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    kgController.text = widget.kg.toString();
    repsController.text = widget.reps.toString();
    kgController.selection = TextSelection.fromPosition(
        TextPosition(offset: kgController.text.length));
    repsController.selection = TextSelection.fromPosition(
        TextPosition(offset: repsController.text.length));
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: 55,
          height: 25,
          child: TextField(
            controller: kgController,
            onChanged: (value) => widget.changeKgAndReps(
                widget.index, int.tryParse(value) ?? 0, widget.reps),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Text('kg'),
        SizedBox(
          width: 55,
          height: 25,
          child: TextField(
            controller: repsController,
            onChanged: (value) => widget.changeKgAndReps(
                widget.index, widget.kg, int.tryParse(value) ?? 0),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Text('reps'),
        IconButton(
          onPressed: () {
            widget.deleteKgAndRepsTextBox(widget.index);
          },
          icon: const Icon(Icons.delete),
        ),
      ],
    );
  }
}
