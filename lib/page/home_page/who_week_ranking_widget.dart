import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WhoWeekRankingWidget extends StatefulWidget {
  const WhoWeekRankingWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<WhoWeekRankingWidget> createState() => _WhoWeekRankingWidgetState();
}

class _WhoWeekRankingWidgetState extends State<WhoWeekRankingWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
      height: 96,
      child: Stack(
        children: [
          Positioned(
            left: 23,
            top: 58,
            child: Container(
              width: 116,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    strokeAlign: BorderSide.strokeAlignCenter,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 21,
            top: 38,
            child: Text(
              '금주의 3대 1위는?',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
          ),
          Positioned(
            left: 214,
            top: 0,
            child: Container(
              width: 96,
              height: 96,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('asset/homepage/ranking.png'),
                ),
              ),
            ),
          ),
          Positioned(
            left: 237,
            top: 33,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '로니콜만',
                    style: TextStyle(
                      color: Color(0xFF0AA00D),
                      fontSize: 11,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                  TextSpan(
                    text: '님\n',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 11,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                  TextSpan(
                    text: '(3대: 680kg)',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 9,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
