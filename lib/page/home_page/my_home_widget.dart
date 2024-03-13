import 'package:fitti_frontend_app/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyHomeWidget extends StatelessWidget {
  const MyHomeWidget({
    super.key,
    required this.title,
    required this.nextPage,
    required this.body,
  });

  final String title;
  final Widget nextPage;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340.w,
      height: 170.h,
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
      child: SizedBox(
        child: Center(
            child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 14.h),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 29.w,
                      ),
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        width: 11.w,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 7.h),
                        child: Container(
                          width: 227.w,
                          decoration: const ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 0.25,
                                strokeAlign: BorderSide.strokeAlignCenter,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 10.h,
                  left: 267.w,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Get.to(() => nextPage);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.w, vertical: 3.h),
                        child: Row(
                          children: [
                            Text(
                              "자세히 보기",
                              style: TextStyle(
                                  fontSize: 9.sp,
                                  color: greyColor,
                                  fontWeight: FontWeight.w600),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 2),
                              child: Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 10.w,
                                color: greyColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            body,
          ],
        )),
      ),
    );
  }
}
