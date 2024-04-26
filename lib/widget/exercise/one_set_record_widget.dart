import 'package:fitti_frontend_app/class/exercise/one_set_record.dart';
import 'package:fitti_frontend_app/class/service/my_exercise_record_service.dart';
import 'package:fitti_frontend_app/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class OneSetRecordWidget extends StatelessWidget {
  OneSetRecordWidget({
    required this.oneSetInfo,
    required this.index,
    super.key,
  });

  final OneSetRecord oneSetInfo;
  final int index;

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
        CustomTextField(
          controller: kgController,
          suffixText: 'kg',
          onChanged: (value) {
            oneSetInfo.weight = int.parse(value);
            var myExerciseRecord = context.read<MyExerciseRecordService>();
            myExerciseRecord.updateExerciseRecords();
          },
          inputFormatter:
              FilteringTextInputFormatter.allow(RegExp(r'[1-9]\d{0,3}')),
        ),
        CustomTextField(
          controller: repsController,
          suffixText: 'reps',
          onChanged: (value) {
            oneSetInfo.reps = int.parse(value);
            var myExerciseRecord = context.read<MyExerciseRecordService>();
            myExerciseRecord.updateExerciseRecords();
          },
          inputFormatter:
              FilteringTextInputFormatter.allow(RegExp(r'[1-9]\d{0,3}')),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.done),
        ),
      ],
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String suffixText;
  final Function(String) onChanged;
  final TextInputFormatter inputFormatter;
  final int maxLength;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.suffixText,
    required this.onChanged,
    required this.inputFormatter,
    this.maxLength = 4,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 65.w, // 이 부분은 당신의 환경에 맞게 조절해야 할 수 있습니다.
          height: 30.h, // 이 부분은 당신의 환경에 맞게 조절해야 할 수 있습니다.
          child: TextField(
            onTap: () => controller.selection = TextSelection(
                baseOffset: 0, extentOffset: controller.text.length),
            controller: controller,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            inputFormatters: [inputFormatter],
            maxLength: maxLength,
            onChanged: onChanged,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13.sp,
            ),
            decoration: const InputDecoration(
              counterText: '',
              contentPadding: EdgeInsets.zero,
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 10.w,
          ),
          child: Text(
            suffixText,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12.sp,
            ),
          ),
        ),
      ],
    );
  }
}
