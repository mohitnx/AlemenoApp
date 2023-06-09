import 'dart:io';

import 'package:alemenotest/src/data/eating/repository/firebase_service.dart';
import 'package:alemenotest/src/presentation/eating/screens/message_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../states/animal_provider.dart';
import '../widgets/circular_button_function.dart';
import '../../../constants/constants.dart';
import '../widgets/circular_button.dart';

class ConfirmPicture extends StatefulWidget {
  static const String routeName = '/confirm-screen';
  final String imagePath;
  const ConfirmPicture({super.key, required this.imagePath});

  @override
  State<ConfirmPicture> createState() => _ConfirmPictureState();
}

class _ConfirmPictureState extends State<ConfirmPicture> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          title: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: circularButton(
              radius: 45,
              iconPath: 'assets/images/back_arrow.svg',
              function: () => buttonFunction(context),
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: Provider.of<AnimalProvider>(context).width,
                height: Provider.of<AnimalProvider>(context).height,
                child: Image.asset(
                  'assets/images/animal.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: bottomContainerColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40.r),
                    topLeft: Radius.circular(40.r),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 110.r,
                      child: ClipOval(
                        child: Image.file(
                          File(widget.imagePath),
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Text('Will you eat this?',
                        style: GoogleFonts.andika(
                            fontSize: 24.sp, color: darkTextColor)),
                    SizedBox(
                      height: 25.h,
                    ),
                    circularButton(
                        radius: 72,
                        iconPath: 'assets/images/tick_mark.svg',
                        function: () async {
                          await uploadPhoto(widget.imagePath);
                          int a = Provider.of<AnimalProvider>(context,
                                  listen: false)
                              .increaseSize();
                          if (a == 1) {
                            //wait 2 seconds to show the animation of the animal becoming bigger then pop back to picture screen
                            //to eat more items
                            await Future.delayed(const Duration(seconds: 2));
                            Navigator.of(context).pop();
                          } else {
                            await Navigator.pushNamed(
                                context, MessageScreen.routeName);
                          }
                        })
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
