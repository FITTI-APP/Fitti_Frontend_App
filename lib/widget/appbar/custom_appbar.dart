import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

PreferredSizeWidget customAppBar(
  String title,
  List<Icon> icons,
) {
  return AppBar(
      leadingWidth: 200.w,
      surfaceTintColor: Colors.white,
      leading: Row(children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.keyboard_arrow_left),
        ),
        Text(
          title,
          style: TextStyle(
            color: Colors.black.withOpacity(0.5),
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ]),
      centerTitle: true,
      actions: icons.map((icon) {
        return IconButton(
          color: Colors.black.withOpacity(0.5),
          padding: EdgeInsets.zero,
          iconSize: 24.sp,
          onPressed: () {},
          icon: icon,
        );
      }).toList());
}
