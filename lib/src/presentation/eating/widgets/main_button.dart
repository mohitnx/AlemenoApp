import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:alemenotest/src/constants/constants.dart';
import '../screens/picture_screen.dart';

class MainButton extends StatelessWidget {
  static const String routeName = '/home-screen';
  final String text;
  final List<CameraDescription>? cameras;
  const MainButton({Key? key, required this.text, required this.cameras})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, PictureScreen.routeName,
            arguments: cameras);
      },
      child: Container(
        width: 229.h,
        height: 56.h,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              blurRadius: 7.r,
              offset: Offset(0.w, 4.h),
            )
          ],
          borderRadius: BorderRadius.circular(50.r),
          color: primaryColor,
        ),
        child: Center(
          child: Text(text,
              style: GoogleFonts.andika(fontSize: 25.sp, color: whiteColor)),
        ),
      ),
    );
  }
}
