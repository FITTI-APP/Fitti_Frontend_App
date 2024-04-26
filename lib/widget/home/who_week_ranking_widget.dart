import 'package:fitti_frontend_app/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      width: 340.w,
      height: 96.h,
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
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 61.h, left: 21.w),
            child: Container(
              width: 125.w,
              height: 2.h,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 38.h, left: 21.w),
            child: Text(
              '금주의 3대 1위는?',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 214.w),
            child: Container(
              width: 96.w,
              height: 96.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('asset/homepage/ranking.png'),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 237.w, top: 33.h),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: processText('로니콜만'),
                    style: TextStyle(
                      color: greenColor,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                  TextSpan(
                    text: '님\n',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                  TextSpan(
                    text: '(3대: 680kg)',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 8.sp,
                      fontWeight: FontWeight.w600,
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

String processText(String originalText, {int limit = 4}) {
  if (originalText.length > limit) {
    return '${originalText.substring(0, limit)}..';
  }
  return originalText;
}
