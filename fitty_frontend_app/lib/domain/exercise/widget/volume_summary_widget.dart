import 'package:flutter/material.dart';

class VolumeSummaryWidget extends StatelessWidget {
  const VolumeSummaryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
      child: const Center(
        child: Column(children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('벤치프레스',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text('65kg x 4회',
                        style: TextStyle(
                          fontSize: 15,
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text('65kg x 4회',
                        style: TextStyle(
                          fontSize: 15,
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text('65kg x 4회',
                        style: TextStyle(
                          fontSize: 15,
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text('65kg x 4회',
                        style: TextStyle(
                          fontSize: 15,
                        )),
                  ),
                ],
              ),
              Column(
                children: [
                  Text("총 볼륨 : 1280kg",
                      style: TextStyle(
                        fontSize: 15,
                      )),
                  Text("최대 중량 : 65kg",
                      style: TextStyle(
                        fontSize: 15,
                      )),
                ],
              )
            ],
          ),
        ]),
      ),
    );
  }
}
