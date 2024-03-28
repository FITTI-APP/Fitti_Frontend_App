import 'package:fitti_frontend_app/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenuRoutingBottomBar extends StatelessWidget {
  final int currentTab;
  final Function(int) onBarTap;
  const MenuRoutingBottomBar(
      {super.key, required this.currentTab, required this.onBarTap});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 0.5.sw - 35.w,
          child: Container(
            width: 70.w,
            height: 70.h,
            decoration: const ShapeDecoration(
              shape: CircleBorder(),
              color: Colors.white,
              shadows: [
                BoxShadow(
                  color: shadowColor,
                  spreadRadius: 0,
                  blurRadius: 4,
                  offset: Offset(0, -1),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 14.h),
          child: Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: shadowColor,
                  spreadRadius: 0,
                  blurRadius: 4,
                  offset: Offset(0, -1),
                ),
              ],
            ),
            child: NavigationBar(
              height: 60.h,
              backgroundColor: Colors.white,
              indicatorColor: Colors.transparent,
              onDestinationSelected: onBarTap,
              selectedIndex: currentTab,
              destinations: const <Widget>[
                NavigationDestination(
                  icon: Icon(
                    Icons.home,
                    color: greyColor,
                  ),
                  label: 'Home',
                ),
                NavigationDestination(
                  icon: Icon(
                    Icons.calendar_month,
                    color: greyColor,
                  ),
                  label: 'Calendar',
                ),
                NavigationDestination(
                  icon: Icon(null),
                  label: '',
                ),
                NavigationDestination(
                  icon: Icon(
                    Icons.area_chart_outlined,
                    color: greyColor,
                  ),
                  label: 'Changes',
                ),
                NavigationDestination(
                  icon: Icon(
                    Icons.menu,
                    color: greyColor,
                  ),
                  label: 'Menu',
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 0.5.sw - 35.w,
          child: Container(
            width: 70.w,
            height: 70.h,
            decoration: const ShapeDecoration(
              shape: CircleBorder(),
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          left: 0.5.sw - 31.w,
          top: 4.h,
          child: Container(
            width: 62.w,
            height: 62.h,
            decoration: ShapeDecoration(
              shape: CircleBorder(
                side: BorderSide(
                  color: skyBlueColor,
                  width: 3.w,
                ),
              ),
              color: Colors.white,
            ),
            child: FloatingActionButton(
              elevation: 0,
              backgroundColor: Colors.white,
              onPressed: () {
                onBarTap(2);
              },
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'FITTI\n',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: '(PT)',
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
