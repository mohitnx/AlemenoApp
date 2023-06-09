import 'package:alemenotest/src/presentation/eating/screens/meals_history.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/constants.dart';
import '../widgets/main_button.dart';

class HomeScreen extends StatelessWidget {
  final List<CameraDescription>? cameras;
  const HomeScreen({super.key, this.cameras});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 670.h,
              ),
              MainButton(
                text: 'Share your meal',
                cameras: cameras,
              ),
              SizedBox(
                height: 14.h,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, MealsHistory.routeName);
                },
                child: Text(
                  'See Meals History',
                  style: GoogleFonts.andika(
                    fontSize: 16.5.sp,
                    color: primaryColor.withOpacity(0.7),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
