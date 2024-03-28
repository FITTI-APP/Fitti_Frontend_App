import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

PreferredSizeWidget homePageAppBar() => AppBar(
      surfaceTintColor: Colors.white,
      title: Image.asset(
        'asset/appbar/fitti.png',
        width: 86.w,
        height: 50.h,
      ),
      centerTitle: true,
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.notifications_none),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.settings),
        ),
      ],
    );
