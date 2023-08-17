import 'package:fitty_frontend_app/domain/exercise/all_exercise_record.dart';
import 'package:flutter/material.dart';

class VolumeSummaryWidget extends StatelessWidget {
  const VolumeSummaryWidget({
    super.key,
    required this.exerciseRecord,
  });

  final VolumeRecord exerciseRecord;

  @override
  Widget build(BuildContext context) {
    var oneSetRecords = exerciseRecord.oneSetRecords;
    int totalVolume = 0;
    for (var element in oneSetRecords) {
      totalVolume += element.kg * element.reps;
    }
    int maxWeight = 0;
    for (var element in oneSetRecords) {
      if (element.kg > maxWeight) {
        maxWeight = element.kg;
      }
    }
    return Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(8.0),
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
      child: Center(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(exerciseRecord.exerciseName,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 150,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: oneSetRecords.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        '${index + 1}세트 : ${oneSetRecords[index].kg}kg x ${oneSetRecords[index].reps}',
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                width: 150,
                child: Column(
                  children: [
                    Text("총 볼륨 : ${totalVolume}kg",
                        style: const TextStyle(
                          fontSize: 15,
                        )),
                    Text("최대 중량 : ${maxWeight}kg",
                        style: const TextStyle(
                          fontSize: 15,
                        )),
                  ],
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
