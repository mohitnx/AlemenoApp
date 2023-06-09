import 'dart:math';

import 'package:alemenotest/src/presentation/eating/screens/confirm_picture.dart';
import 'package:alemenotest/src/presentation/eating/states/animal_provider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:camera/camera.dart';

import 'package:alemenotest/src/presentation/eating/widgets/circular_button.dart';
import 'package:alemenotest/src/presentation/eating/widgets/circular_button_function.dart';
import 'package:alemenotest/src/constants/constants.dart';
import 'package:provider/provider.dart';

import '../widgets/border_widget.dart';

class PictureScreen extends StatefulWidget {
  final List<CameraDescription>? cameras;
  static const String routeName = '/picture-screen';
  const PictureScreen({
    super.key,
    this.cameras,
  });

  @override
  State<PictureScreen> createState() => _PictureScreenState();
}

class _PictureScreenState extends State<PictureScreen> {
  late CameraController controller;

  @override
  void initState() {
    super.initState();
    controller = CameraController(
      widget.cameras![0],
      ResolutionPreset.max,
    );
    controller.setFlashMode(FlashMode.off);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors.
            break;
          default:
            // Handle other errors.
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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
              child: SizedBox(
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
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 15.h),
                      width: double.infinity,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Center(
                            child: (!controller.value.isInitialized)
                                ? const CircularProgressIndicator()
                                : CircleAvatar(
                                    radius: 110.r,
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(200.0),
                                        topRight: Radius.circular(200.0),
                                        bottomRight: Radius.circular(200.0),
                                        bottomLeft: Radius.circular(200.0),
                                      ),
                                      child: AspectRatio(
                                        aspectRatio: 1,
                                        child: CameraPreview(
                                          controller,
                                        ),
                                      ),
                                    ),
                                  ),
                          ),

                          //cutlery and their shadows

                          Positioned(
                            left: 335.w,
                            right: 0.w,
                            top: 35.h,
                            bottom: 35.h,
                            child: Stack(
                              children: [
                                SvgPicture.asset(
                                  'assets/images/cutlery_spoon.svg',
                                ),
                                Positioned(
                                  left: 6.w,
                                  child: SvgPicture.asset(
                                    'assets/images/cutlery_spoon_shadow.svg',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            left: 20.w,
                            right: 100.w,
                            top: 35.h,
                            bottom: 35.h,
                            child: Stack(
                              children: [
                                SvgPicture.asset(
                                  'assets/images/cutlery_fork.svg',
                                ),
                                Positioned(
                                  top: 40.h,
                                  left: 5.w,
                                  child: SvgPicture.asset(
                                    'assets/images/cutlery_fork_shadow.svg',
                                  ),
                                ),
                              ],
                            ),
                          ),

                          //4 green cornered borders

                          Positioned(
                            left: 70.w,
                            top: 0.h,
                            child: borderLine(0.0),
                          ),
                          Positioned(
                            right: 70.w,
                            bottom: 0.h,
                            child: borderLine(pi),
                          ),
                          Positioned(
                            right: 70.w,
                            top: 0.h,
                            child: borderLine(pi / 2),
                          ),
                          Positioned(
                            left: 70.w,
                            bottom: 0.h,
                            child: borderLine(-pi / 2),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Text('Click your meal',
                        style: GoogleFonts.andika(
                            fontSize: 24.sp, color: darkTextColor)),
                    SizedBox(
                      height: 25.h,
                    ),
                    circularButton(
                        radius: 72,
                        iconPath: 'assets/images/camera.svg',
                        function: () async {
                          try {
                            final image = await controller.takePicture();
                            if (!mounted) return;

                            await Navigator.pushNamed(
                                context, ConfirmPicture.routeName,
                                arguments: image.path);
                          } catch (e) {
                            debugPrint(e.toString());
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
