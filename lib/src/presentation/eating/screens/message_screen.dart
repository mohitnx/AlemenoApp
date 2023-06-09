import 'package:alemenotest/src/constants/constants.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MessageScreen extends StatelessWidget {
  static const routeName = '/message-screen';
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //return back to the first screen after one animal has been completey fed
    //to begin again
    return WillPopScope(
      onWillPop: () async {
        Navigator.popUntil(context, (route) => route.isFirst);
        return false;
      },
      child: Scaffold(
        body: Center(
          child: Text('GOOD JOB',
              style: GoogleFonts.lilitaOne(
                fontSize: 48.sp,
                color: primaryColor,
                letterSpacing: 4.w,
              )),
        ),
      ),
    );
  }
}
