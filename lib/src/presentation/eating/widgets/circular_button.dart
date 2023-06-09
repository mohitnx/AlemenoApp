import 'package:alemenotest/src/constants/constants.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget circularButton(
    {required int radius, required String iconPath, required function}) {
  return SizedBox(
    width: radius.w,
    height: radius.h,
    child: FittedBox(
      child: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: primaryColor,
        onPressed: function,
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: SvgPicture.asset(iconPath),
        ),
      ),
    ),
  );
}
