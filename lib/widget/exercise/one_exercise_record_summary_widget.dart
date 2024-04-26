import 'dart:math';
import 'package:fitti_frontend_app/class/exercise/one_exercise_record.dart';
import 'package:fitti_frontend_app/class/exercise/one_set_record.dart';
import 'package:fitti_frontend_app/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OneExerciseRecordSummaryWidget extends StatefulWidget {
  const OneExerciseRecordSummaryWidget({
    super.key,
    required this.exerciseRecord,
  });

  final OneExerciseRecord exerciseRecord;

  @override
  State<OneExerciseRecordSummaryWidget> createState() =>
      _OneExerciseRecordSummaryWidgetState();
}

class _OneExerciseRecordSummaryWidgetState
    extends State<OneExerciseRecordSummaryWidget> {
  bool isExpanded = false;

  void toggleExpanded() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    var oneSetRecords = widget.exerciseRecord.oneSetRecords;
    int totalVolume = 0;
    for (var element in oneSetRecords) {
      totalVolume += element.weight * element.reps;
    }
    int maxWeight = 0;
    for (var element in oneSetRecords) {
      if (element.weight > maxWeight) {
        maxWeight = element.weight;
      }
    }
    double expected1RM = 0;
    for (var element in oneSetRecords) {
      expected1RM = max(expected1RM, element.weight * (1 + element.reps / 30));
    }

    if (!isExpanded) {
      return FoldedExerciseSummaryWidget(
        exerciseName: widget.exerciseRecord.exerciseName,
        onClickExpandButton: toggleExpanded,
        onClickInfoButton: () {},
      );
    } else {
      return ExpandedExerciseSummaryWidget(
          widget: widget,
          oneSetRecords: oneSetRecords,
          totalVolume: totalVolume,
          maxWeight: maxWeight,
          expected1RM: expected1RM,
          onClickToggleButton: toggleExpanded);
    }
  }
}

class FoldedExerciseSummaryWidget extends StatelessWidget {
  const FoldedExerciseSummaryWidget({
    super.key,
    required this.exerciseName,
    required this.onClickExpandButton,
    required this.onClickInfoButton,
  });

  final String exerciseName;
  final Function() onClickExpandButton;
  final Function() onClickInfoButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        shadows: const [
          BoxShadow(
            color: shadowColor,
            blurRadius: 4,
          )
        ],
      ),
      child: Center(
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: onClickExpandButton,
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: greyColor,
                ),
              ),
              Text(
                exerciseName,
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.info_outline,
                  color: greyColor,
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}

class ExpandedExerciseSummaryWidget extends StatefulWidget {
  const ExpandedExerciseSummaryWidget({
    super.key,
    required this.widget,
    required this.oneSetRecords,
    required this.totalVolume,
    required this.maxWeight,
    required this.expected1RM,
    required this.onClickToggleButton,
  });

  final OneExerciseRecordSummaryWidget widget;
  final List<OneSetRecord> oneSetRecords;
  final int totalVolume;
  final int maxWeight;
  final double expected1RM;
  final Function() onClickToggleButton;

  @override
  State<ExpandedExerciseSummaryWidget> createState() =>
      _ExpandedExerciseSummaryWidgetState();
}

class _ExpandedExerciseSummaryWidgetState
    extends State<ExpandedExerciseSummaryWidget> {
  final buttonKey = GlobalKey();
  double buttonWidth = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        buttonWidth = buttonKey.currentContext?.size?.width ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(top: 4.h, bottom: 20.h),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            shadows: const [
              BoxShadow(
                color: shadowColor,
                blurRadius: 4,
              )
            ],
          ),
          child: Column(
            children: [
              SizedBox(height: 6.28.h),
              Text(
                widget.widget.exerciseRecord.exerciseName,
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 1.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150.w,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: widget.oneSetRecords.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.only(top: (5.h)),
                          child: Text(
                            '${index + 1}세트 : ${widget.oneSetRecords[index].weight} kg x ${widget.oneSetRecords[index].reps}',
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: 150.w,
                    child: Padding(
                      padding: EdgeInsets.only(left: 40.w),
                      child: Text.rich(
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '총 볼륨 : ${widget.totalVolume} kg\n',
                            ),
                            TextSpan(
                              text: '최대 중량 : ${widget.maxWeight} kg\n',
                            ),
                            TextSpan(
                              text:
                                  '예상 1RM : ${widget.expected1RM.toStringAsFixed(1)} kg\n',
                            ),
                            const TextSpan(
                              text: '시작 시간 : \n',
                            ),
                            const TextSpan(
                              text: '종료 시간 : \n',
                            ),
                            const TextSpan(
                              text: '운동 시간 : ',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          //부모 위젯 중앙 하단
          bottom: 0,
          left: MediaQuery.of(context).size.width / 2 - 8.w - buttonWidth / 2,
          child: IconButton(
            key: buttonKey,
            onPressed: widget.onClickToggleButton,
            icon: const Icon(
              Icons.arrow_drop_up,
              color: greyColor,
            ),
          ),
        ),
      ],
    );
  }
}
